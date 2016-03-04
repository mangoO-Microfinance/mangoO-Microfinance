<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionDelete();
	connect();

	//DELETE-Button
	if (isset($_GET['sav_id'])){
		
		//Sanitize input
		$sav_id = sanitize($_GET['sav_id']);
		
		//Delete related incomes from INCOMES where applicable
		$sql_delinc = "DELETE FROM incomes WHERE sav_id = '$sav_id'";
		$query_delinc = mysql_query($sql_delinc);
		checkSQL($query_delinc);
		
		//Delete entri(es) from SAVINGS
		$sql_delsav = "DELETE FROM savings WHERE sav_id = '$sav_id' OR sav_mother = '$sav_id'";
		$query_delsav = mysql_query($sql_delsav);
		checkSQL($query_delsav);
		
		// Update savings account balance
		updateSavingsBalance($_SESSION['cust_id']);
		
		//If Subscription Fee is deleted, revert date of last subscription by one year (and five seconds)
		if ($savtransaction[2] == 5){
			$sql_revert_subscr = "UPDATE customer SET cust_lastsub = (cust_lastsub - 31536005) WHERE cust_id = $savtransaction[3]";
			$query_revert_subscr = mysql_query($sql_revert_subscr);
			checkSQL($query_revert_subscr);
		}
	}
	
	//Refer back to ACC_SAV_DEPOS.PHP
	header('Location: acc_sav_depos.php?cust='.$_SESSION['cust_id']);
?>