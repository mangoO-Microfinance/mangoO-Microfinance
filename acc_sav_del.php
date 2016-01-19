<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_delete();
	connect();

	//DELETE-Button
	if (isset($_GET['sav_id'])){
		
		//Sanitize input
		$sav_id = sanitize($_GET['sav_id']);
		
		//Select information on transaction from SAVINGS
		$sql_savtransaction = "SELECT sav_date, sav_receipt, savtype_id, cust_id FROM savings WHERE sav_id = $sav_id";
		$query_savtransaction = mysql_query($sql_savtransaction);
		check_sql($query_savtransaction);
		$savtransaction = mysql_fetch_row($query_savtransaction);
		
		//Delete related incomes from INCOMES where applicable
		$sql_delinc = "DELETE FROM incomes WHERE inc_date = $savtransaction[0] AND inc_receipt = $savtransaction[1]";
		$query_delinc = mysql_query($sql_delinc);
		check_sql($query_delinc);
		
		//Delete entri(es) from SAVINGS
		$sql_delsav = "DELETE FROM savings WHERE sav_receipt = $savtransaction[1]";
		$query_delsav = mysql_query($sql_delsav);
		check_sql($query_delsav);
		
		//If Subscription Fee is deleted, revert date of last subscription by one year (and five seconds)
		if ($savtransaction[2] == 5){
			$sql_revert_subscr = "UPDATE customer SET cust_lastsub = (cust_lastsub - 31536005) WHERE cust_id = $savtransaction[3]";
			$query_revert_subscr = mysql_query($sql_revert_subscr);
			check_sql($query_revert_subscr);
		}
	}
	
	//Refer back to ACC_SAV_DEPOS.PHP
	header('Location: acc_sav_depos.php?cust='.$_SESSION['cust_id']);
?>