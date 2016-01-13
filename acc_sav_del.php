<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();

	//DELETE-Button
	if (isset($_POST['del_sav'])){
		
		//Select information on transaction from SAVINGS
		$sql_savtransaction = "SELECT sav_id, sav_date, sav_receipt FROM savings WHERE cust_id = '$_SESSION[cust_id]' ORDER BY sav_id DESC LIMIT 1";
		$query_savtransaction = mysql_query($sql_savtransaction);
		check_sql($query_savtransaction);
		$savtransaction = mysql_fetch_row($query_savtransaction);
		
		//Delete Withdrawal Fee from INCOMES where applicable
		$sql_delinc = "DELETE FROM incomes WHERE inc_date = '$savtransaction[1]' AND inc_receipt = '$savtransaction[2]'";
		$query_delinc = mysql_query($sql_delinc);
		check_sql($query_delinc);
		
		//Delete entry from SAVINGS
		$sql_delsav = "DELETE FROM savings WHERE sav_id = '$savtransaction[0]'";
		$query_delsav = mysql_query($sql_delsav);
		check_sql($query_delsav);
		
		//Refer back
		if ($_POST['origin'] == 'w')	header('Location: acc_sav_withd.php?cust='.$_SESSION['cust_id']);
		elseif ($_POST['origin'] == 'd')	header('Location: acc_sav_depos.php?cust='.$_SESSION['cust_id']);
		else header('Location: customer.php?cust='.$_SESSION['cust_id']);
	}
?>