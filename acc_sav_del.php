<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();

	//DELETE-Button
	if (isset($_GET['sav_id'])){
		
		$sav_id = sanitize($_GET['sav_id']);
		
		//Select information on transaction from SAVINGS
		$sql_savtransaction = "SELECT sav_date, sav_receipt FROM savings WHERE sav_id = $sav_id";
		$query_savtransaction = mysql_query($sql_savtransaction);
		check_sql($query_savtransaction);
		$savtransaction = mysql_fetch_row($query_savtransaction);
		
		//Delete Withdrawal Fee from INCOMES where applicable
		$sql_delinc = "DELETE FROM incomes WHERE inc_date = '$savtransaction[1]' AND inc_receipt = '$savtransaction[2]'";
		$query_delinc = mysql_query($sql_delinc);
		check_sql($query_delinc);
		
		//Delete entry from SAVINGS
		$sql_delsav = "DELETE FROM savings WHERE sav_id = $sav_id";
		$query_delsav = mysql_query($sql_delsav);
		check_sql($query_delsav);
		
		//Refer back
		header('Location: acc_sav_depos.php?cust='.$_SESSION['cust_id']);
	}
	
	else header('Location: acc_sav_depos.php?cust='.$_SESSION['cust_id']);
?>