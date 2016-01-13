<?PHP	
	//Establish Server & Database Connection
	function connect() {
		$connect_srv = mysql_connect('127.0.0.1', 'root', '');
		if (!$connect_srv) die ('DB connection failed: '.mysql_error());
		$connect_db = mysql_select_db('mangoo', $connect_srv);
		if (!$connect_db) die ('Database "mangoo" cannot be selected: '.mysql_error());
	}

	//Sanitize and secure user input	
	function sanitize($var) {
		if(get_magic_quotes_gpc()) $var = stripslashes($var);
		$var = htmlentities($var);
		$var = strip_tags($var);
		$var = mysql_real_escape_string($var);
		return $var;
	}
	
	//Check for Logon
	function check_logon() {
		$fingerprint = md5($_SERVER['REMOTE_ADDR'].'dh(6Km4$X*'.$_SERVER['HTTP_USER_AGENT']);
		session_start();
		if 	(
					!isset($_SESSION['log_user']) 
					|| 
					$_SESSION['log_fingerprint'] != $fingerprint
				)
				logout();
		session_regenerate_id();
	}
	
	//Check for Administrator Permissions
	function check_admin() {
		if ($_SESSION['log_admin']!=='1'){
			header('Location: start.php');
			die();
		}
	}
	
	//Check for Permission to access Reports
	function check_report() {
		if ($_SESSION['log_report']!=='1'){
			header('Location: start.php');
			die();
		}
	}
	
	//Logout User and destroy his session
	function logout(){
		$_SESSION = array();												//Delete all Session Variables
		if (ini_get("session.use_cookies")) {				//If a Session-Cookie is used, delete it
			$params = session_get_cookie_params();
			setcookie(session_name(), '', time() - 86400, $params["path"], $params["domain"], $params["secure"], $params["httponly"]);
		}
		session_destroy();													//Finally, delete the Session
		header('Location: logout_success.php');			//Forward to logout_success.php
		die;
	}	
	
	//Check for CUST_ID
	function check_custid(){
		if (isset($_GET['cust'])) $_SESSION['cust_id'] = sanitize($_GET['cust']);
		else header('Location: start.php');
	}
	
	//Check for LOAN_ID
	function check_loanid(){
		if (isset($_GET['lid'])) $_SESSION['loan_id'] = sanitize($_GET['lid']);
		else header('Location: customer.php?cust='.$_SESSION['cust_id']);
	}
	
	//Check Success for SQL Queries
	function check_sql($sqlquery){
		if (!$sqlquery) die ('SQL-Statement failed: '.mysql_error());
	}
	
	//Include HTML <head>
	function htmlHead($title,$endFlag) {
		echo '<head>
			<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
			<meta http-equiv="Content-Script-Type" content="text/javascript">
			<meta http-equiv="Content-Style-Type" content="text/css">
			<meta name="robots" content="noindex, nofollow">
			<title>mangoO | '.$title.'</title>
			<link rel="stylesheet" type="text/css" href="mangoo.css" />
			<link rel="shortcut icon" href="ico/favicon.ico" type="image/x-icon">';
		if ($endFlag == 1) echo '</head>';
	}
	
	//Include Menu Tabs
	function menu_Tabs($tab_no){
		echo '
		<div id="menu_tabs"> 
			<ul>
				<li'; 
				if ($tab_no == 1) echo ' id="tab_selected"';
				echo '><a href="start.php">Start</a></li>
				<li';
				if ($tab_no == 2) echo ' id="tab_selected"';
				echo '><a href="cust_search.php">Customers</a></li>
				<li';
				if ($tab_no == 3) echo ' id="tab_selected"';
				echo '><a href="loan_search.php">Loans</a></li>
				<li';
				if ($tab_no == 4) echo ' id="tab_selected"';
				echo '><a href="expendit_new.php">Accounting</a></li>';
				
				if ($_SESSION['log_report'] == 1 && $tab_no == 5) echo '<li id="tab_selected"><a href="rep_incomes.php">Reports</a></li>';
				elseif ($_SESSION['log_report'] == 1) echo '<li><a href="rep_incomes.php">Reports</a></li>';
				
				if ($_SESSION['log_admin'] == 1 && $tab_no == 6) echo '<li id="tab_selected"><a href="set_logrec.php">Settings</a></li>';
				elseif ($_SESSION['log_admin'] == 1) echo '<li><a href="set_logrec.php">Settings</a></li>';
		echo '</ul>
		</div>';
	}
	
	//Alternating Colors for Table Rows
	function tr_colored(&$row_color) {
		if ($row_color == 0){ 
			echo '<tr>';
			$row_color = 1;
		}
		else {
			echo '<tr class="alt">'; 
			$row_color = 0;
		}
	}
	
	//Calculate Savings Balance
	function sav_balance(){
		$sql_sav = "SELECT * FROM savings, savtype WHERE savings.savtype_id = savtype.savtype_id AND cust_id = '$_SESSION[cust_id]' ORDER BY sav_date, sav_id";
		$query_sav = mysql_query($sql_sav);
		check_sql($query_sav);
		$sav_balance = 0;
		while($row_query_sav = mysql_fetch_assoc($query_sav)){
			$row_sav[] = $row_query_sav;
			$sav_balance = $sav_balance + $row_query_sav['sav_amount'];
		}
		return $sav_balance;
	}
	
	//Error-Message
	function error_alert($text) {
		echo '<script language=javascript>alert(\''.$text.'\')</script>';
	}
	
	function resize_img($width, $height){
		/* Get original image x y*/		
		list($w, $h) = getimagesize($_FILES['image']['tmp_name']);
		
		/* Calculate new image size with ratio */
		$ratio = max($width/$w, $height/$h);
		$h = ceil($height / $ratio);
		$x = ($w - $width / $ratio) / 2;
		$w = ceil($width / $ratio);
		
		/* New file name */
		$basename = strtolower(pathinfo($_FILES['image']['name'], PATHINFO_FILENAME));
		$path = 'uploads/photos/cust'.$_SESSION['cust_id'].'_'.$width.'x'.$height.'.jpg';
		
		/* Read binary data from image file */
		$imgString = file_get_contents($_FILES['image']['tmp_name']);
		
		/* Create Image from String */
		$image = imagecreatefromstring($imgString);
		$tmp_img = imagecreatetruecolor($width, $height);
		imagecopyresampled(
			$tmp_img, $image,
			0, 0,
			$x, 0,
			$width, $height,
			$w, $h);
		imagejpeg($tmp_img, $path, 95);
		
		return $path;
		
		/* Cleanup Memory */
		imagedestroy($image);
		imagedestroy($tmp_img);
	}
?>