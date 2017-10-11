<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionDelete();
	$db_link = connect();

	//DELETE-Button
	if (isset($_GET['lt_id'])){

		$ltrans_id = sanitize($db_link, $_GET['lt_id']);

		//Select due date for transaction from LTRANS
		$sql_ltransaction = "SELECT ltrans_due, loans.cust_id FROM ltrans, loans WHERE ltrans.loan_id = loans.loan_id AND ltrans_id = $ltrans_id";
		$query_ltransaction = mysqli_query($db_link, $sql_ltransaction);
		checkSQL($db_link, $query_ltransaction);
		$ltransaction = mysqli_fetch_row($query_ltransaction);

		//Delete related incomes from INCOMES where applicable
		$sql_del_inc = "DELETE FROM incomes WHERE ltrans_id = $ltrans_id";
		$query_del_inc = mysqli_query($db_link, $sql_del_inc);
		checkSQL($db_link, $query_del_inc);

		//Delete related savings from SAVINGS where applicable
		$sql_del_sav = "DELETE FROM savings WHERE ltrans_id = $ltrans_id";
		$query_del_sav = mysqli_query($db_link, $sql_del_sav);
		checkSQL($db_link, $query_del_sav);

		// Update savings account balance
		updateSavingsBalance($db_link, $ltransaction[1]);

	/**
		* If respective transaction was pre-planned, the entry must remain.
		* Only if this was an additional line, it can be safely deleted.
		*/
		if($ltransaction[0] == null){
			$sql_delltrans = "DELETE FROM ltrans WHERE ltrans_id = $ltrans_id";
		}
		else{
			$sql_delltrans = "UPDATE ltrans SET ltrans_date = NULL, ltrans_principal = NULL, ltrans_interest = NULL, ltrans_fined = 0, ltrans_receipt = NULL, user_id = '$_SESSION[log_id]' WHERE ltrans_id = $ltrans_id";
		}
		$query_delltrans = mysqli_query($db_link, $sql_delltrans);
		checkSQL($db_link, $query_delltrans);
	}

	//Refer back to LOAN.PHP
	header('Location: loan.php?lid='.$_SESSION['loan_id']);
?>
