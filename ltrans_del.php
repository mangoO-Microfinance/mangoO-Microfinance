<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_delete();
	connect();

	//DELETE-Button
	if (isset($_GET['lt_id'])){
		
		$lt_id = sanitize($_GET['lt_id']);
		
		//Select information on transaction from LTRANS
		$sql_ltransaction = "SELECT ltrans_due, ltrans_receipt, ltrans_date FROM ltrans WHERE ltrans_id = $lt_id";
		$query_ltransaction = mysql_query($sql_ltransaction);
		check_sql($query_ltransaction);
		$ltransaction = mysql_fetch_row($query_ltransaction);
		
		//Delete related incomes from INCOMES where applicable
		$sql_del_inc = "DELETE FROM incomes WHERE inc_receipt = $ltransaction[1] AND inc_date = $ltransaction[2]";
		$query_del_inc = mysql_query($sql_del_inc);
		check_sql($query_del_inc);
		
		//Delete related savings entries from SAVINGS where applicable
		$sql_del_sav = "DELETE FROM savings WHERE sav_receipt = $ltransaction[1] AND sav_date = $ltransaction[2]";
		$query_del_sav = mysql_query($sql_del_sav);
		check_sql($query_del_sav);
		
		//If respective transaction was pre-planned, the entry must remain. Only if this was an extra line, it can be safely deleted.
		if($ltransaction[0] == null){			
			$sql_delltrans = "DELETE FROM ltrans WHERE ltrans_id = $lt_id";
		}
		else{
			$sql_delltrans = "UPDATE ltrans SET ltrans_date = NULL, ltrans_principal = NULL, ltrans_interest = NULL, ltrans_receipt = NULL, user_id = '$_SESSION[log_id]' WHERE ltrans_id = $lt_id";
		}
		$query_delltrans = mysql_query($sql_delltrans);
		check_sql($query_delltrans);
	}
	
	//Refer back to LOAN.PHP
	header('Location: loan.php?lid='.$_SESSION['loan_id']);
?>