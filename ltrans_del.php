<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();

	//DELETE-Button
	if (isset($_POST['del_ltrans'])){
		
		//Select information on transaction from LTRANS
		$sql_ltransaction = "SELECT ltrans_id, ltrans_due, ltrans_receipt FROM ltrans WHERE ltrans.loan_id = '$_SESSION[loan_id]' AND ltrans_date != '' ORDER BY ltrans_id DESC LIMIT 1";
		$query_ltransaction = mysql_query($sql_ltransaction);
		check_sql($query_ltransaction);
		$ltransaction = mysql_fetch_row($query_ltransaction);
		if ($ltransaction[0] == '') header('Location: loan.php?lid='.$_SESSION['loan_id']);
		
		//Delete Interest from INCOMES
		$sql_delinc = "DELETE FROM incomes WHERE inc_receipt = '$ltransaction[2]'";
		$query_delinc = mysql_query($sql_delinc);
		check_sql($query_delinc);
		
		//If the 
		if($ltransaction[1] == null){			
			$sql_delltrans = "DELETE FROM ltrans WHERE ltrans_id = $ltransaction[0]";
		}
		else{
			$sql_delltrans = "UPDATE ltrans SET ltrans_date = NULL, ltrans_principal = NULL, ltrans_interest = NULL, ltrans_receipt = NULL, user_id = '$_SESSION[log_id]' WHERE ltrans_id = $ltransaction[0]";
		}
		$query_delltrans = mysql_query($sql_delltrans);
		check_sql($query_delltrans);
		
		//Refer to customer.php
		header('Location: loan.php?lid='.$_SESSION['loan_id']);
	}
?>