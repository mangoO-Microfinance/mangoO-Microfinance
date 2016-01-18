<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();

	//DELETE-Button
	if (isset($_GET['lt_id'])){
		
		$lt_id = sanitize($_GET['lt_id']);
		
		//Select information on transaction from LTRANS
		$sql_ltransaction = "SELECT ltrans_due, ltrans_receipt FROM ltrans WHERE ltrans_id = $lt_id";
		$query_ltransaction = mysql_query($sql_ltransaction);
		check_sql($query_ltransaction);
		$ltransaction = mysql_fetch_row($query_ltransaction);
		
		//Delete Interest from INCOMES
		$sql_delinc = "DELETE FROM incomes WHERE inc_receipt = '$ltransaction[1]'";
		$query_delinc = mysql_query($sql_delinc);
		check_sql($query_delinc);
		
		//If respective transaction was pre-planned, the entry must remain. Only if this was an extra line, it can be safely deleted.
		if($ltransaction[0] == null){			
			$sql_delltrans = "DELETE FROM ltrans WHERE ltrans_id = $lt_id";
		}
		else{
			$sql_delltrans = "UPDATE ltrans SET ltrans_date = NULL, ltrans_principal = NULL, ltrans_interest = NULL, ltrans_receipt = NULL, user_id = '$_SESSION[log_id]' WHERE ltrans_id = $lt_id";
		}
		$query_delltrans = mysql_query($sql_delltrans);
		check_sql($query_delltrans);
		
		//Refer to customer.php
		header('Location: loan.php?lid='.$_SESSION['loan_id']);
	}
	
	else header('Location: loan.php?lid='.$_SESSION['loan_id']);
?>