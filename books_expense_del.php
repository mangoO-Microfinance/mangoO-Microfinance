<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionDelete();
	$db_link = connect();

	//DELETE-Button
	if (isset($_GET['exp_id'])){

		// Sanitize input
		$exp_id = sanitize($db_link, $_GET['exp_id']);

		// Get details about expense to delete
		$sql_expense = "SELECT exp_id, exptype_id, exp_date, exp_created FROM expenses WHERE exp_id = '$exp_id'";
		$query_expense = mysqli_query($db_link, $sql_expense);
		checkSQL($db_link, $query_expense);
		$expense = mysqli_fetch_row($query_expense);

		// If expense is Annual Share Dividend, delete from SAVINGS
		if($expense[1] == 18){
			$sql_delsav = "DELETE FROM savings WHERE savtype_id = 9 AND sav_date = '$expense[2]' AND sav_created = '$expense[3]'";
			$query_delsav = mysqli_query($db_link, $sql_delsav);
			checkSQL($db_link, $query_delsav);

			// Update balances of all savings acccounts
			updateSavingsBalanceAll($db_link);
		}

		// If expense is Annual Savings Interest, delete from SAVINGS
		if($expense[1] == 19){
			$sql_delsav = "DELETE FROM savings WHERE savtype_id = 3 AND sav_date = '$expense[2]' AND sav_created = '$expense[3]'";
			$query_delsav = mysqli_query($db_link, $sql_delsav);
			checkSQL($db_link, $query_delsav);

			// Update balances of all savings acccounts
			updateSavingsBalanceAll($db_link);
		}

		// Delete expense from EXPENSES
		$sql_delexp = "DELETE FROM expenses WHERE exp_id = $exp_id";
		$query_delexp = mysqli_query($db_link, $sql_delexp);
		checkSQL($db_link, $query_delexp);
	}

	//Refer to books_expense.php
	header('Location: books_expense.php');
?>
