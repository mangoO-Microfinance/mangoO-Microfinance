<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionDelete();
	$db_link = connect();

	//Delete Entry from INCOMES
	if (isset($_GET['inc_id'])){

		// Sanitize input
		$inc_id = sanitize($db_link, $_GET['inc_id']);

		// Get details about income to delete
		$sql_income = "SELECT inc_id, inctype_id, cust_id, loan_id, ltrans_id, sav_id FROM incomes WHERE inc_id = '$inc_id'";
		$query_income = mysqli_query($db_link, $sql_income);
		checkSQL($db_link, $query_income);
		$income = mysqli_fetch_row($query_income);

		// Delete from SAVINGS where SAV_ID exists
		if($income[5] != NULL){
			$sql_delsav = "DELETE FROM savings WHERE sav_id = '$income[5]'";
			$query_delsav = mysqli_query($db_link, $sql_delsav);
			checkSQL($db_link, $query_delsav);

			// Update savings account balance
			updateSavingsBalance($db_link, $income[2]);
		}

		// Delete from LTRANS where LTRANS_ID exists
		if($income[4] != NULL){
			$sql_delltrans = "DELETE FROM ltrans WHERE ltrans_id = '$income[4]'";
			$query_delltrans = mysqli_query($db_link, $sql_delltrans);
			checkSQL($db_link, $query_delltrans);
		}

		// If Loan Default Fine is deleted, flag loan transaction as not fined
		if ($income[1] == 5){
			$sql_revert_fined = "UPDATE ltrans SET ltrans_fined = 0 WHERE ltrans_id = '$income[4]'";
			$query_revert_fined = mysqli_query($db_link, $sql_revert_fined);
			checkSQL($db_link, $query_revert_fined);
		}

		// If Subscription Fee is deleted, revert date of last subscription by one year and five seconds
		if ($income[1] == 8){
			$sql_revert_subscr = "UPDATE customer SET cust_lastsub = (cust_lastsub - 31536005) WHERE cust_id = '$income[2]'";
			$query_revert_subscr = mysqli_query($db_link, $sql_revert_subscr);
			checkSQL($db_link, $query_revert_subscr);
		}

		// Delete income from INCOMES
		$sql_delinc = "DELETE FROM incomes WHERE inc_id = '$inc_id'";
		$query_delinc = mysqli_query($db_link, $sql_delinc);
		checkSQL($db_link, $query_delinc);
	}

	//Refer to books_income.php
	header('Location: books_income.php');
?>
