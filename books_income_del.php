<?PHP
	require 'functions.php';
	check_logon();
	check_delete();
	connect();
	
	//Delete Entry from INCOMES
	if (isset($_GET['inc_id'])){
		
		//Sanitize input
		$inc_id = sanitize($_GET['inc_id']);
		$inctype = sanitize($_GET['inctype']);
		$cust_id = sanitize($_GET['cust']);
		
		//Delete income from INCOMES
		$sql_delinc = "DELETE FROM incomes WHERE inc_id = $inc_id";
		$query_delinc = mysql_query($sql_delinc);
		check_sql($query_delinc);
		
		//If Subscription Fee is deleted, revert date of last subscription by one year (and five seconds)
		if ($inctype == 8){
			$sql_revert_subscr = "UPDATE customer SET cust_lastsub = (cust_lastsub - 31536005) WHERE cust_id = $cust_id";
			$query_revert_subscr = mysql_query($sql_revert_subscr);
			check_sql($query_revert_subscr);
		}
	}
	
	//Refer to books_income.php
	header('Location: books_income.php');
?>