<?PHP
/**
	* Establish Database Connection
	*/
	function connect() {
		require_once 'config/config.php';
		$connect = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
		if (!$connect) header('Location:setup.php');
		mysqli_set_charset($connect, 'utf8');
		return $connect;
	}

/**
	* Generate unique fingerprint for every user session
	* @return string fingerprint : Unique fingerprint generated from remote server address,
	* random string, and user agent
	*/
	function fingerprint(){
		return $fingerprint = md5($_SERVER['REMOTE_ADDR'].'jikI/20Y,!'.$_SERVER['HTTP_USER_AGENT']);
	}

/**
	* Check if current user is logged in
	*/
	function checkLogin() {
		$fingerprint = fingerprint();
		session_start();
		if (!isset($_SESSION['log_user']) || $_SESSION['log_fingerprint'] != $fingerprint) logout();
		session_regenerate_id();
	}

/**
	* Check if current user logged out properly last time
	*/
	function checkLogout(){
		if ($_SESSION['logrec_logout'] == 0){
			showMessage("You forgot to logout last time. Please remember to log out properly.");
			$_SESSION['logrec_logout'] = 1;
		}
	}

/**
	* Check if current user has Admin permission
	*/
	function checkPermissionAdmin() {
		if ($_SESSION['log_admin']!=='1'){
			header('Location: start.php');
			die();
		}
	}

/**
	* Check if current user has Delete permission
	*/
	function checkPermissionDelete() {
		if ($_SESSION['log_delete']!=='1'){
			header('Location: start.php');
			die();
		}
	}

/**
	* Check if current user has permission to access Reports
	*/
	function checkPermissionReport() {
		if ($_SESSION['log_report']!=='1'){
			header('Location: start.php');
			die();
		}
	}

	/**
	* Logout procedure: Delete session variables
	* and cookies, destroy user session.
	*/
	function logout(){
		/* Delete all Session Variables */
		$_SESSION = array();

		/* If a session cookie was used, delete it */
		if (ini_get("session.use_cookies")) {
			$params = session_get_cookie_params();
			setcookie(session_name(), '', time() - 86400, $params["path"], $params["domain"], $params["secure"], $params["httponly"]);
		}

		/* Finally, delete the Session */
		session_destroy();

		/* Forward to logout_success.php */
		header('Location: logout_success.php');
		die;
	}

/**
	* Check if an SQL statement has succeded
	*/
	function checkSQL($db_link, $sqlquery){
		if (!$sqlquery) die ('SQL-Statement failed: '.mysqli_error($db_link));
	}

/**
	* Pushing system settings into session variables
	*/
	function getSettings($db_link){
		$sql_settings = "SELECT * FROM settings";
		$query_settings = mysqli_query($db_link, $sql_settings);
		checkSQL($db_link, $query_settings, $db_link);
		while($row_settings = mysqli_fetch_assoc($query_settings)){

			switch ($row_settings['set_short']){
				case "SET_MSB":
					$_SESSION['set_msb'] = $row_settings['set_value'];
					break;
				case "SET_MLP":
					$_SESSION['set_minlp'] = $row_settings['set_value'];
					break;
				case "SET_XLP":
					$_SESSION['set_maxlp'] = $row_settings['set_value'];
					break;
				case "SET_CUR":
					$_SESSION['set_cur'] = $row_settings['set_value'];
					break;
				case "SET_AUF":
					$_SESSION['set_auf'] = $row_settings['set_value'];
					break;
				case "SET_DEA":
					$_SESSION['set_deact'] = $row_settings['set_value'];
					break;
				case "SET_DBL":
					$_SESSION['set_dashl'] = $row_settings['set_value'];
					break;
				case "SET_DBR":
					$_SESSION['set_dashr'] = $row_settings['set_value'];
					break;
				case "SET_ICL":
					$_SESSION['set_intcalc'] = $row_settings['set_value'];
					break;
				case "SET_GUA":
					$_SESSION['set_maxguar'] = $row_settings['set_value'];
					break;
				case "SET_MEM":
					$_SESSION['set_minmemb'] = $row_settings['set_value'];
					break;
				case "SET_PSR":
					$_SESSION['set_maxpsr'] = $row_settings['set_value'];
					break;
				case "SET_CNO":
					$_SESSION['set_cno'] = $row_settings['set_value'];
					break;
				case "SET_XL1":
					$_SESSION['set_xl1'] = $row_settings['set_value'];
					break;
				case "SET_ENO":
					$_SESSION['set_eno'] = $row_settings['set_value'];
					break;
				case "SET_SFX":
					$_SESSION['set_sfx'] = $row_settings['set_value'];
					break;
				case "SET_CSI":
					$_SESSION['set_csi'] = $row_settings['set_value'];
					break;
				case "SET_F4F":
					$_SESSION['set_f4f'] = $row_settings['set_value'];
					break;
			}
		}
	}

/**
	* Pushing fee settings into session variables
	*/
	function getFees($db_link){
		$sql_fees = "SELECT * FROM fees";
		$query_fees = mysqli_query($db_link, $sql_fees);
		checkSQL($db_link, $query_fees, $db_link);
		while ($row_fees = mysqli_fetch_assoc($query_fees)){
			switch ($row_fees['fee_short']){
				case "FEE_ENT":
					$_SESSION['fee_entry'] = $row_fees['fee_value'];
					break;
				case "FEE_WDL":
					$_SESSION['fee_withdraw'] = $row_fees['fee_value'];
					break;
				case "FEE_STS":
					$_SESSION['fee_stationary'] = $row_fees['fee_value'];
					break;
				case "FEE_ASB":
					$_SESSION['fee_subscr'] = $row_fees['fee_value'];
					break;
				case "FEE_LOF":
					$_SESSION['fee_loan'] = $row_fees['fee_value'];
					break;
				case "FEE_LAP":
					$_SESSION['fee_loanappl'] = $row_fees['fee_value'];
					break;
				case "FEE_LDF":
					$_SESSION['fee_loanfine'] = $row_fees['fee_value'];
					break;
				case "FEE_LIR":
					$_SESSION['fee_loaninterestrate'] = $row_fees['fee_value'];
					break;
				case "FEE_INS":
					$_SESSION['fee_loaninsurance'] = $row_fees['fee_value'];
					break;
				case "FEE_XL1":
					$_SESSION['fee_xl1_name'] = $row_fees['fee_name'];
					$_SESSION['fee_xl1'] = $row_fees['fee_value'];
					break;
			}
		}
	}

/**
	* Pushing current share value into a session variable
	*/
	function getShareValue($db_link){
		$sql_shareval = "SELECT shareval_value FROM shareval WHERE shareval_id IN (SELECT MAX(shareval_id) FROM shareval)";
		$query_shareval = mysqli_query($db_link, $sql_shareval);
		checkSQL($db_link, $query_shareval, $db_link);
		$result_shareval = mysqli_fetch_assoc($query_shareval);
		$_SESSION['share_value'] = $result_shareval['shareval_value'];
	}

/**
	* Sanitize and secure user input
	* @param string var : User Input
	* @return string var : Secured and sanitized User Input
	*/
	function sanitize($db_link, $var) {
		if(get_magic_quotes_gpc()) $var = stripslashes($var);
		$var = htmlentities($var);
		$var = strip_tags($var);
		$var = mysqli_real_escape_string($db_link, $var);
		return $var;
	}

/**
	* Convert a number of days into UNIX timestamp seconds
	* @param int days : Number of days
	* @return int seconds : Lenght of number of days in seconds
	*/
	function convertDays($days){
		return $seconds = $days * 86400;
	}

/**
	* Convert a number of months into UNIX timestamp seconds
	* @param int months : Number of months
	* @return int seconds : Lenght of number of days in seconds
	*/
	function convertMonths($months){
		return $seconds = $months * 2635200; // Seconds for 30.5 days
	}

/**
	* Check if a GET parameter with a Customer ID has been set
	* If not, return to start page.
	*/
	function getCustID($db_link){
		if (isset($_GET['cust'])) $_SESSION['cust_id'] = sanitize($db_link, $_GET['cust']);
		else header('Location: start.php');
	}

/**
	* Check if a GET parameter with a Loan ID has been set
	* If not, return to customer page.
	*/
	function getLoanID($db_link){
		if (isset($_GET['lid'])) $_SESSION['loan_id'] = sanitize($db_link, $_GET['lid']);
		else header('Location: customer.php?cust='.$_SESSION['cust_id']);
	}

/**
	* Generate HTML Header Section
	* @param string title : Page title
	* @param int endFlag : Flag to indicate whether or not to end header section.
	*/
	function includeHead($title, $endFlag = 1) {
		echo '<head>
			<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
			<meta http-equiv="Content-Script-Type" content="text/javascript">
			<meta http-equiv="Content-Style-Type" content="text/css">
			<meta name="robots" content="noindex, nofollow">
			<title>mangoO | '.$title.'</title>
			<link rel="shortcut icon" href="ico/favicon.ico" type="image/x-icon">
			<link rel="stylesheet" href="css/mangoo.css" />
			<link rel="stylesheet" href="ico/font-awesome/css/font-awesome.min.css">
			<link rel="stylesheet" href="jquery/jquery-ui-1.11.4/jquery-ui.min.css">
			<script src="jquery/jquery-2.2.1.min.js"></script>
			<script src="jquery/jquery-ui-1.11.4/jquery-ui.min.js"></script>
			<script>
				$(function() {
					$("#datepicker, #datepicker2, #datepicker3").datepicker({
						showOtherMonths: true,
						selectOtherMonths: true,
						dateFormat: \'dd.mm.yy\',
						changeMonth: true,
						changeYear: true
					});
				});
			</script>
			';
		if ($endFlag == 1) echo '</head>';
	}

/**
	* Generate Menu bar
	* @param int tab_no : Number of currently selected menu tab.
	*/
	function includeMenu($tab_no){
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
				echo '><a href="start.php"><i class="fa fa-tachometer fa-fw"></i> Dashboard</a></li>
				<li';
				if ($tab_no == 2) echo ' id="tab_selected"';
				echo '><a href="cust_search.php"><i class="fa fa-group fa-fw"></i> Customers</a></li>
				<li';
				if ($tab_no == 3) echo ' id="tab_selected"';
				echo '><a href="loans_search.php"><i class="fa fa-percent fa-fw"></i> Loans</a></li>
				<li';
				if ($tab_no == 4) echo ' id="tab_selected"';
				echo '><a href="books_expense.php"><i class="fa fa-calculator fa-fw"></i> Accounting</a></li>
				<li';
				if ($tab_no == 7) echo ' id="tab_selected"';
				echo '><a href="empl_curr.php"><i class="fa fa-male fa-fw"></i> Employees</a></li>';

				if ($_SESSION['log_report'] == 1){
					echo '<li';
					if ($tab_no == 5) echo ' id="tab_selected"';
					echo '><a href="rep_incomes.php"><i class="fa fa-line-chart fa-fw"></i> Reports</a></li>';
				}

				if ($_SESSION['log_admin'] == 1){
					echo '<li';
					if ($tab_no == 6) echo ' id="tab_selected"';
					echo '><a href="set_basic.php"><i class="fa fa-wrench fa-fw"></i> Settings</a></li>';
				}
			echo '</ul>
		</div>';
	}

/**
	* Generate a Javascript alert message
	* @param string text : Message text
	*/
	function showMessage($text) {
		echo '<script language=javascript>
						alert(\''.$text.'\')
					</script>';
	}

/**
	* Calculate a given customer's savings account balance
	* @return int savbal : Current savings account balance for given customer
	*/
	function getSavingsBalance($db_link, $cust_id){
		$sql_savbal = "SELECT savbal_balance FROM savbalance WHERE cust_id = $cust_id";
		$query_savbal = mysqli_query($db_link, $sql_savbal);
		checkSQL($db_link, $query_savbal);

		$savbal = mysqli_fetch_assoc($query_savbal);

		return $savbal['savbal_balance'];
	}

	/**
		* Calculate a given customer's fixed savings
		* @return int savfixed : Balance of currently fixed savings for given customer
		*/
		function getSavingsFixed($db_link, $cust_id){
			$sql_savfixed = "SELECT savbal_fixed FROM savbalance WHERE cust_id = $cust_id";
			$query_savfixed = mysqli_query($db_link, $sql_savfixed);
			checkSQL($db_link, $query_savfixed);

			$savfixed = mysqli_fetch_assoc($query_savfixed);

			return $savfixed['savbal_fixed'];
		}

/**
	* Update savings account balance for SPECIFIC customer
	*/
	function updateSavingsBalance($db_link, $cust_id){
		$timestamp = time();
		$sql_savbal_upd = "UPDATE savbalance SET savbal_balance = (SELECT SUM(sav_amount) FROM savings WHERE cust_id = $cust_id), savbal_fixed = (SELECT SUM(sav_amount) FROM savings WHERE cust_id = $cust_id and sav_fixed > $timestamp) WHERE cust_id = $cust_id";
		$query_savbal_upd = mysqli_query($db_link, $sql_savbal_upd);
		checkSQL($db_link, $query_savbal_upd, $db_link);
	}

/**
	* Update savings account balance for ALL customers
	*/
	function updateSavingsBalanceAll($db_link){
		$sql_savbal_upd_all = "UPDATE savbalance SET savbalance.savbal_balance = (SELECT SUM(savings.sav_amount) FROM savings WHERE savings.cust_id = savbalance.cust_id)";
		$query_savbal_upd_all = mysqli_query($db_link, $sql_savbal_upd_all);
		checkSQL($db_link, $query_savbal_upd_all, $db_link);
	}

/**
	* Calculate balances for a specific loan
	* @return array $loanbal : Array with principal balance,
	*/
	function getLoanBalance($db_link, $loan_id){
		//Select Loan Balance from LTRANS
		$sql_balances = "SELECT ltrans_principaldue, ltrans_interestdue, ltrans_principal, ltrans_interest FROM ltrans WHERE ltrans.loan_id = '$loan_id'";
		$query_balances = mysqli_query($db_link, $sql_balances);
		checkSQL($db_link, $query_balances, $db_link);

		//Calculate outstanding balances
		$loan_balances = array(
			"pdue" => 0,
			"idue" => 0,
			"ppaid" => 0,
			"ipaid" => 0,
			"balance" => 0
		);
		while ($row_balances = mysqli_fetch_assoc($query_balances)){
			$loan_balances['pdue'] = $loan_balances['pdue'] + $row_balances['ltrans_principaldue'];
			$loan_balances['idue'] = $loan_balances['idue'] + $row_balances['ltrans_interestdue'];
			$loan_balances['ppaid'] = $loan_balances['ppaid'] + $row_balances['ltrans_principal'];
			$loan_balances['ipaid'] = $loan_balances['ipaid'] + $row_balances['ltrans_interest'];
		}
		$loan_balances['balance'] = ($loan_balances['pdue'] + $loan_balances['idue']) - ($loan_balances['ppaid'] + $loan_balances['ipaid']);

		return $loan_balances;
	}

/**
	* Calculate current customer's share account balance
	* @return int share_balace : Current share account balance
	*/
	function getShareBalance($db_link, $cust_id){
		$sql_sharebal = "SELECT share_amount, share_value FROM shares WHERE cust_id = $cust_id";
		$query_sharebal = mysqli_query($db_link, $sql_sharebal);
		checkSQL($db_link, $query_sharebal, $db_link);
		$sharebal = array("amount" => "0", "value" => "0");
		while($row_sharebal = mysqli_fetch_assoc($query_sharebal)){
			$sharebal['amount'] = $sharebal['amount'] + $row_sharebal['share_amount'];
			$sharebal['value'] = $sharebal['value'] + $row_sharebal['share_value'];
		}
		return $sharebal;
	}

/**
	* Get current customer's details
	* @return array result_cust : Associative array with the details of the current customer
	*/
	function getCustomer($db_link, $custID){
		$sql_cust = "SELECT * FROM customer LEFT JOIN custsex ON customer.custsex_id = custsex.custsex_id LEFT JOIN custmarried ON customer.custmarried_id = custmarried.custmarried_id LEFT JOIN custsick ON customer.custsick_id = custsick.custsick_id LEFT JOIN user ON customer.user_id = user.user_id WHERE cust_id = '$custID'";
		$query_cust = mysqli_query($db_link, $sql_cust);
		checkSQL($db_link, $query_cust, $db_link);
		$result_cust = mysqli_fetch_assoc($query_cust);

		return $result_cust;
	}

/**
	* Get all customers except current one
	* @return array query_custother : Array with the result of the SQL query
	*/
	function getCustOther($db_link){
		$sql_custother = "SELECT * FROM customer LEFT JOIN custsex ON custsex.custsex_id = customer.custsex_id WHERE cust_id NOT IN (0, $_SESSION[cust_id]) ORDER BY cust_id";
		$query_custother = mysqli_query($db_link, $sql_custother);
		checkSQL($db_link, $query_custother, $db_link);

		return $query_custother;
	}

/**
	* Get all active customers
	* @return array query_custact : Array with the result of the SQL query
	*/
	function getCustAct($db_link){
		$sql_custact = "SELECT * FROM customer LEFT JOIN custsex ON custsex.custsex_id = customer.custsex_id WHERE cust_id != 0 AND cust_active = 1 ORDER BY cust_id";
		$query_custact = mysqli_query($db_link, $sql_custact);
		checkSQL($db_link, $query_custact, $db_link);

		return $query_custact;
	}

/**
	* Get all inactive customers
	* @return array query_custinact : Array with the result of the SQL query
	*/
	function getCustInact($db_link){
		$sql_custinact = "SELECT * FROM customer LEFT JOIN custsex ON custsex.custsex_id = customer.custsex_id WHERE cust_id != 0 AND cust_active != 1 ORDER BY cust_id";
		$query_custinact = mysqli_query($db_link, $sql_custinact);
		checkSQL($db_link, $query_custinact, $db_link);

		return $query_custinact;
	}

/**
	* Get all customers
	* @return array query_custall : Array with the result of the SQL query
	*/
	function getCustAll($db_link){
		$sql_custall = "SELECT * FROM customer LEFT JOIN custsex ON custsex.custsex_id = customer.custsex_id WHERE cust_id !=0";
		$query_custall = mysqli_query($db_link, $sql_custall);
		checkSQL($db_link, $query_custall, $db_link);

		return $query_custall;
	}

/**
	* Get customers with overdue subscription fee
	* @return array query_custoverdue : Array with the result of the SQL query
	*/
	function getCustOverdue($db_link){
		$last_subscr = time() - convertDays(365); //Seconds for 365 days
		$sql_custoverdue = "SELECT * FROM customer WHERE cust_active = 1 AND cust_lastsub < $last_subscr ORDER BY cust_lastsub, cust_id";
		$query_custoverdue = mysqli_query($db_link, $sql_custoverdue);
		checkSQL($db_link, $query_custoverdue, $db_link);

		return $query_custoverdue;
	}

/**
	* Build new customer number
	* @return varchar custNo :  Newly build customer number
	*/
	function buildCustNo($db_link){
		// Determine biggest customer ID
		$sql_maxID = "SELECT MAX(cust_id) AS maxid FROM customer";
		$query_maxID = mysqli_query($db_link, $sql_maxID);
		checkSQL($db_link, $query_maxID);
		$result_maxID = mysqli_fetch_array($query_maxID);

		// Read customer number format
		$cnParts = explode("%", $_SESSION['set_cno']);
		$cnCount = count($cnParts);

		// Build customer number
		$i = 0;
		$custNo = "";
		for ($i = 1; $i < $cnCount; $i++) {
			switch($cnParts[$i]){
				case "N":
					$custNo = $custNo.($result_maxID['maxid'] + 1);
					break;
				case "Y":
					$custNo = $custNo.date("Y",time());
					break;
				case "M":
					$custNo = $custNo.date("m",time());
					break;
				case "D":
					$custNo = $custNo.date("d",time());
					break;
				default:
					$custNo = $custNo.$cnParts[$i];
			}
		}

		// Return customer number
		return $custNo;
	}

/**
	* Get current employee
	* @return array result_empl :  Associative array with the details of the current employee
	*/
	function getEmployee($db_link, $empl_id){
		$sql_empl = "SELECT * FROM employee LEFT JOIN user ON employee.empl_id = user.empl_id WHERE employee.empl_id = $empl_id";
		$query_empl = mysqli_query($db_link, $sql_empl);
		checkSQL($db_link, $query_empl, $db_link);
		$result_empl = mysqli_fetch_assoc($query_empl);

		return $result_empl;
	}

/**
	* Get all current employees
	* @return array query_emplcurr : Array with the result of the SQL query
	*/
	function getEmplCurr($db_link){
		$timestamp = time();
		$sql_emplcurr = "SELECT * FROM employee LEFT JOIN emplsex ON employee.emplsex_id = emplsex.emplsex_id LEFT JOIN emplmarried ON employee.emplmarried_id = emplmarried.emplmarried_id WHERE empl_id != 0 AND (empl_out > $timestamp OR empl_out IS NULL) ORDER BY empl_id";
		$query_emplcurr = mysqli_query($db_link, $sql_emplcurr);
		checkSQL($db_link, $query_emplcurr, $db_link);

		return $query_emplcurr;
	}

/**
	* Get all past employees
	* @return array query_emplpast : Array with the result of the SQL query
	*/
	function getEmplPast($db_link){
		$timestamp = time();
		$sql_emplpast = "SELECT * FROM employee LEFT JOIN emplsex ON employee.emplsex_id = emplsex.emplsex_id LEFT JOIN emplmarried ON employee.emplmarried_id = emplmarried.emplmarried_id WHERE empl_id != 0 AND empl_out < $timestamp ORDER BY empl_id";
		$query_emplpast = mysqli_query($db_link, $sql_emplpast);
		checkSQL($db_link, $query_emplpast, $db_link);

		return $query_emplpast;
	}

/**
	* Build new employee number
	* @return varchar emplNo :  Newly build employee number
	*/
	function buildEmplNo($db_link){
		// Determine biggest employee ID
		$sql_maxID = "SELECT MAX(empl_id) AS maxid FROM employee";
		$query_maxID = mysqli_query($db_link, $sql_maxID);
		checkSQL($db_link, $query_maxID, $db_link);
		$result_maxID = mysqli_fetch_array($query_maxID);

		// Read employee number format
		$enParts = explode("%", $_SESSION['set_eno']);
		$enCount = count($enParts);

		// Build customer number
		$i = 0;
		$emplNo = "";
		for ($i = 1; $i < $enCount; $i++) {
			switch($enParts[$i]){
				case "N":
					$emplNo = $emplNo.($result_maxID['maxid'] + 1);
					break;
				case "Y":
					$emplNo = $emplNo.date("Y",time());
					break;
				case "M":
					$emplNo = $emplNo.date("m",time());
					break;
				case "D":
					$emplNo = $emplNo.date("d",time());
					break;
				default:
					$emplNo = $emplNo.$enParts[$i];
			}
		}

		// Return employee number
		return $emplNo;
	}

/**
	* Get all overdue Loan Instalments
	* @return array query_overdue : Array with the result of the SQL query
	*/
	function getLtransOverdue($db_link){
		$timestamp = time();
		$sql_overdue = "SELECT * FROM ltrans LEFT JOIN loans ON ltrans.loan_id = loans.loan_id LEFT JOIN customer ON loans.cust_id = customer.cust_id WHERE ltrans_due <= $timestamp AND ltrans_date IS NULL AND loanstatus_id = 2 ORDER BY ltrans_due";
		$query_overdue = mysqli_query($db_link, $sql_overdue);
		checkSQL($db_link, $query_overdue, $db_link);
		return $query_overdue;
	}

/**
	* Get all securities which belong to a given loan
	* @return array securities : Array with the result of the SQL query
	*/
	function getLoanSecurities($db_link, $loan_id){
		$sql_secur = "SELECT * FROM securities WHERE loan_id = $loan_id";
		$query_secur = mysqli_query($db_link, $sql_secur);
		checkSQL($db_link, $query_secur);
		$securities = array();
		while ($row_secur = mysqli_fetch_assoc($query_secur)) $securities[] = $row_secur;
		return $securities;
	}

/**
	* Get details of a given loan security
	* @return array result_sec : Array with the result of the SQL query
	*/
	function getSecurity($db_link, $sec_id){
		$sql_sec = "SELECT * FROM securities LEFT JOIN loans ON securities.loan_id = loans.loan_id LEFT JOIN customer ON securities.cust_id = customer.cust_id WHERE sec_id = $sec_id";
		$query_sec = mysqli_query($db_link, $sql_sec);
		checkSQL($db_link, $query_sec);
		$result_sec = mysqli_fetch_assoc($query_sec);
		return $result_sec;
	}

?>
