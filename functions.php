<?PHP	
/**
	* Establish Server & Database Connection
	*/
	function connect() {
		require_once 'config/config.php';
		
		// Server connection
		$connect_srv = mysql_connect(DB_HOST, DB_USER, DB_PASS);
		//if (!$connect_srv) die ('Could not connect to host '.DB_HOST.': '.mysql_error());
		if (!$connect_srv) header('Location:setup.php');
		
		// Database connection
		$connect_db = mysql_select_db(DB_NAME, $connect_srv);
		//if (!$connect_db) die ('Could not select database '.DB_NAME.': '.mysql_error());
		if (!$connect_db) header('Location:setup.php');
	}

/**
	* Logout User and destroy his session
	*/
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
	
/**
	* Check if current user is logged in
	*/
	function check_logon() {
		$fingerprint = fingerprint();
		session_start();
		if (!isset($_SESSION['log_user']) || $_SESSION['log_fingerprint'] != $fingerprint) logout();
		session_regenerate_id();
	}
	
/**
	* Generate unique fingerprint for every user session
	* @return string fingerprint : Unique fingerprint generated from remote server address, random string, and user agent
	*/
	function fingerprint(){
		return $fingerprint = md5($_SERVER['REMOTE_ADDR'].'jikI/20Y,!'.$_SERVER['HTTP_USER_AGENT']);
	}
	
/**
	* Check if current user logged out properly last time
	*/
	function check_logout(){
		if ($_SESSION['logrec_logout'] == 0){
			error("You forgot to logout last time. Please remember to log out properly.");
			$_SESSION['logrec_logout'] = 1;
		}
	}

/**
	* Check if current user has Admin permission
	*/
	function check_admin() {
		if ($_SESSION['log_admin']!=='1'){
			header('Location: start.php');
			die();
		}
	}
	
/**
	* Check if current user has Delete permission
	*/
	function check_delete() {
		if ($_SESSION['log_delete']!=='1'){
			header('Location: start.php');
			die();
		}
	}
	
/**
	* Check if current user has permission to access Reports
	*/
	function check_report() {
		if ($_SESSION['log_report']!=='1'){
			header('Location: start.php');
			die();
		}
	}

/**
	* Sanitize and secure user input
	* @param string var : User Input
	* @return string var : Secured and sanitized User Input
	*/
	function sanitize($var) {
		if(get_magic_quotes_gpc()) $var = stripslashes($var);
		$var = htmlentities($var);
		$var = strip_tags($var);
		$var = mysql_real_escape_string($var);
		return $var;
	}
	
	
/**
	* Check if a GET parameter with a Customer ID has been set
	* If not, return to start page.
	*/
	function check_custid(){
		if (isset($_GET['cust'])) $_SESSION['cust_id'] = sanitize($_GET['cust']);
		else header('Location: start.php');
	}
	
/**
	* Check if a GET parameter with a Loan ID has been set
	* If not, return to customer page.
	*/
	function check_loanid(){
		if (isset($_GET['lid'])) $_SESSION['loan_id'] = sanitize($_GET['lid']);
		else header('Location: customer.php?cust='.$_SESSION['cust_id']);
	}
	
/**
	* Check if an SQL statement has succeded
	*/
	function check_sql($sqlquery){
		if (!$sqlquery) die ('SQL-Statement failed: '.mysql_error());
	}
	
/**
	* Generate HTML Header Section
	* @param string title : Page title
	* @param int endFlag : Flag to indicate whether or not to end header section.
	*/
	function include_Head($title, $endFlag = 1) {
		echo '<head>
			<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
			<meta http-equiv="Content-Script-Type" content="text/javascript">
			<meta http-equiv="Content-Style-Type" content="text/css">
			<meta name="robots" content="noindex, nofollow">
			<title>mangoO | '.$title.'</title>
			<link rel="stylesheet" type="text/css" href="css/mangoo.css" />
			<link rel="stylesheet" href="ico/font-awesome/css/font-awesome.min.css">
			<link rel="shortcut icon" href="ico/favicon.ico" type="image/x-icon">';
		if ($endFlag == 1) echo '</head>';
	}

/**
	* Generate Menu bar
	* @param int tab_no : Number of currently selected menu tab.
	*/
	function include_Menu($tab_no){
		echo '		
		<!-- MENU HEADER -->
		<div id="menu_header">
			<img src="ico/mangoo_logo_m.png" style="margin: 1em 0 0 .75em;"/>
			<div id="menu_logout">
				<ul>
					<li>'.$_SESSION['log_user'].'
						<ul>
							<li><a href="logout.php"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>';
		
		echo '
		<!-- MENU TABS -->
		<div id="menu_tabs"> 
			<ul>
				<li'; 
				if ($tab_no == 1) echo ' id="tab_selected"';
				echo '><a href="start.php"><i class="fa fa-home fa-fw"></i> Start</a></li>
				<li';
				if ($tab_no == 2) echo ' id="tab_selected"';
				echo '><a href="cust_search.php"><i class="fa fa-user fa-fw"></i> Customers</a></li>
				<li';
				if ($tab_no == 3) echo ' id="tab_selected"';
				echo '><a href="loan_search.php"><i class="fa fa-percent fa-fw"></i> Loans</a></li>
				<li';
				if ($tab_no == 4) echo ' id="tab_selected"';
				echo '><a href="books_expense.php"><i class="fa fa-calculator fa-fw"></i> Accounting</a></li>';
				
				if ($_SESSION['log_report'] == 1){
					echo '<li';
					if ($tab_no == 5) echo ' id="tab_selected"';
					echo '><a href="rep_incomes.php"><i class="fa fa-line-chart fa-fw"></i> Reports</a></li>';
				}
				
				if ($_SESSION['log_admin'] == 1){
					echo '<li';
					if ($tab_no == 6) echo ' id="tab_selected"';
					echo '><a href="set_basic.php"><i class="fa fa-cog fa-fw"></i> Settings</a></li>';
				}
			echo '</ul>
		</div>';
	}
	
/**
	* Alternate table rows background color for improved readability
	* @param int row_color : Indicator for row color
	*/
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
	
/**
	* Generate a Javascript alert message
	* @param string text : Message text
	*/
	function error($text) {
		echo '<script language=javascript>
						alert(\''.$text.'\')
					</script>';
	}
	
/**
	* Resizing uploaded image files
	* @param int width : Target width dimension
	* @param int height : Target height dimension
	* @return string path : Storage path for newly created image file
	*/
	function resize_img($width, $height){
		
		// Get original image dimensions
		list($w, $h) = getimagesize($_FILES['image']['tmp_name']);
		
		// Calculate new image size with ratio
		$ratio = max($width/$w, $height/$h);
		$h = ceil($height / $ratio);
		$x = ($w - $width / $ratio) / 2;
		$w = ceil($width / $ratio);
		
		// New file name
		$basename = strtolower(pathinfo($_FILES['image']['name'], PATHINFO_FILENAME));
		$path = 'uploads/photos/cust'.$_SESSION['cust_id'].'_'.$width.'x'.$height.'.jpg';
		
		// Read binary data from image file
		$imgString = file_get_contents($_FILES['image']['tmp_name']);
		
		// Create image from string
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
		
		// Cleanup memory
		imagedestroy($image);
		imagedestroy($tmp_img);
	}

/**
	* Pushing system settings into session variables
	*/	
	function get_settings(){
		$sql_settings = "SELECT * FROM settings";
		$query_settings = mysql_query($sql_settings);
		check_sql($query_settings);
		while($row_settings = mysql_fetch_assoc($query_settings)){
			
			switch ($row_settings['set_id']){
				case 1:
					$_SESSION['set_msb'] = $row_settings['set_value'];
					break;
				case 2:
					$_SESSION['set_minlp'] = $row_settings['set_value'];
					break;
				case 3:
					$_SESSION['set_maxlp'] = $row_settings['set_value'];
					break;
				case 4:
					$_SESSION['set_cur'] = $row_settings['set_value'];
					break;
				case 5:
					$_SESSION['set_auf'] = $row_settings['set_value'];
					break;
				case 6:
					$_SESSION['set_deact'] = $row_settings['set_value'];
					break;
				case 7:
					$_SESSION['set_dashl'] = $row_settings['set_value'];
					break;
				case 8:
					$_SESSION['set_dashr'] = $row_settings['set_value'];
					break;
				case 9:
					$_SESSION['set_intcalc'] = $row_settings['set_value'];
					break;
				case 10:
					$_SESSION['set_maxguar'] = $row_settings['set_value'];
					break;
				case 11:
					$_SESSION['set_minmemb'] = $row_settings['set_value'];
					break;
				case 12:
					$_SESSION['set_maxpsr'] = $row_settings['set_value'];
					break;
			}
		}
	}
	
/**
	* Pushing fee settings into session variables
	*/
	function get_fees(){
		$sql_fees = "SELECT * FROM fees";
		$query_fees = mysql_query($sql_fees);
		check_sql($query_fees);
		while ($row_fees = mysql_fetch_assoc($query_fees)){
			switch ($row_fees['fee_id']){
				case 1:
					$_SESSION['fee_entry'] = $row_fees['fee_value'];
					break;
				case 2:
					$_SESSION['fee_withdraw'] = $row_fees['fee_value'];
					break;
				case 3:
					$_SESSION['fee_stationary'] = $row_fees['fee_value'];
					break;
				case 4:
					$_SESSION['fee_subscr'] = $row_fees['fee_value'];
					break;
				case 5:
					$_SESSION['fee_loan'] = $row_fees['fee_value'];
					break;
				case 6:
					$_SESSION['fee_loanappl'] = $row_fees['fee_value'];
					break;
				case 7:
					$_SESSION['fee_loanfine'] = $row_fees['fee_value'];
					break;
				case 8:
					$_SESSION['fee_loaninterestrate'] = $row_fees['fee_value'];
					break;
			}
		}
	}
	
/**
	* Pushing current share value into a session variable
	*/
	function get_sharevalue(){
		$sql_shareval = "SELECT shareval_value FROM shareval WHERE shareval_id IN (SELECT MAX(shareval_id) FROM shareval)";
		$query_shareval = mysql_query($sql_shareval);
		check_sql($query_shareval);
		$result_shareval = mysql_fetch_assoc($query_shareval);
		$_SESSION['share_value'] = $result_shareval['shareval_value'];
	}
	
/**	
	* Calculate current customer's savings account balance
	* @return int sav_balance : Current savings account balance
	*/
	function get_savbalance(){
		$sql_savbal = "SELECT sav_amount FROM savings WHERE cust_id = '$_SESSION[cust_id]'";
		$query_savbal = mysql_query($sql_savbal);
		check_sql($query_savbal);
		$sav_balance = 0;
		while($row_savbal = mysql_fetch_assoc($query_savbal)){
			$sav_balance = $sav_balance + $row_savbal['sav_amount'];
		}
		return $sav_balance;
	}
	
/**
	* Calculate current customer's share account balance
	* @return int share_balace : Current share account balance
	*/
	function get_sharebalance(){
		$sql_sharebal = "SELECT share_amount, share_value FROM shares WHERE cust_id = '$_SESSION[cust_id]'";
		$query_sharebal = mysql_query($sql_sharebal);
		check_sql($query_sharebal);
		$share_balance = array("amount" => "0", "value" => "0");
		while($row_sharebal = mysql_fetch_assoc($query_sharebal)){
			$share_balance['amount'] = $share_balance['amount'] + $row_sharebal['share_amount'];
			$share_balance['value'] = $share_balance['value'] + $row_sharebal['share_value'];
		}
		return $share_balance;
	}
	
/**
	* Get current customer's details
	* @return array result_cust : Associative array with all current customer' details
	*/
	function get_customer(){
		$sql_cust = "SELECT * FROM customer, custsick, custmarried, custsex, user WHERE customer.custsick_id = custsick.custsick_id AND customer.custmarried_id = custmarried.custmarried_id AND custsex.custsex_id = customer.custsex_id AND cust_id = '$_SESSION[cust_id]' AND customer.user_id = user.user_id";
		$query_cust = mysql_query($sql_cust);
		check_sql($query_cust);
		return $result_cust = mysql_fetch_assoc($query_cust);
	}
	
/**
	* Get all customers except current one
	* @return array query_custother : Array with the result of the SQL query
	*/
	function get_custother(){
		$sql_custother = "SELECT * FROM customer, custsex WHERE custsex.custsex_id = customer.custsex_id AND cust_id NOT IN (0, $_SESSION[cust_id]) ORDER BY cust_id";
		$query_custother = mysql_query($sql_custother);
		check_sql($query_custother);
		
		return $query_custother;
	}

/**
	* Get all active customers
	* @return array query_custact : Array with the result of the SQL query
	*/
	function get_custact(){
		$sql_custact = "SELECT * FROM customer, custsex WHERE custsex.custsex_id = customer.custsex_id AND cust_active = 1 ORDER BY cust_id";
		$query_custact = mysql_query($sql_custact);
		check_sql($query_custact);
		
		return $query_custact;
	}

/**
	* Get all inactive customers
	* @return array query_custinact : Array with the result of the SQL query
	*/
	function get_custinact(){
		$sql_custinact = "SELECT * FROM customer, custsex WHERE custsex.custsex_id = customer.custsex_id AND cust_active != 1 ORDER BY cust_id";
		$query_custinact = mysql_query($sql_custinact);
		check_sql($query_custinact);
		
		return $query_custinact;
	}
	
/**
	* Convert a number of days into UNIX timestamp seconds
	* @param int days : Number of days
	* @return int seconds : Lenght of number of days in seconds
	*/
	function days($days){
		return $seconds = $days * 86400;
	}

/**
	* Convert a number of months into UNIX timestamp seconds
	* @param int months : Number of months
	* @return int seconds : Lenght of number of days in seconds
	*/	
	function months($months){
		return $seconds = $months * 2635200; // Seconds for 30.5 days
	}
?>