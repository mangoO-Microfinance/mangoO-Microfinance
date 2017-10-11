<?PHP
// Calculate grace period in days
$graceperiod = convertDays($_SESSION['set_auf']);
$timestamp = time();

// Automatically charge Loan Default Fine if Customer has defaulted payment beyond graceperiod
if($row_overd['ltrans_due'] < ($timestamp - $graceperiod) AND $row_overd['ltrans_fined'] != 1){

	// Get Loan Default Fine from FEES
	getFees($db_link);
	$loandefault_inc = $_SESSION['fee_loanfine'];
	$loandefault_sav = ($_SESSION['fee_loanfine']) * (-1);

	// Get current savings balance
	$sav_balance = getSavingsBalance($db_link, $row_overd['cust_id']);

	if($loandefault_inc < ($sav_balance - $_SESSION['set_msb'])){

		//Withdraw Fine from SAVINGS
		$sql_fine_sav = "INSERT INTO savings (cust_id, ltrans_id, sav_date, sav_amount, savtype_id, sav_receipt, sav_created, user_id) VALUES ('$row_overd[cust_id]', '$row_overd[ltrans_id]', '$timestamp', '$loandefault_sav', '6', '', '$timestamp', '$_SESSION[log_id]')";
		$query_fine_sav = mysqli_query($db_link, $sql_fine_sav);
		checkSQL($db_link, $query_fine_sav);

		// Update savings account balance
		updateSavingsBalance($db_link, $row_overd['cust_id']);

		//Insert Fine into INCOMES
		$sql_fine_inc = "INSERT INTO incomes (cust_id, loan_id, ltrans_id, inctype_id, inc_amount, inc_date, inc_receipt, inc_created, user_id) VALUES ('$row_overd[cust_id]', '$row_overd[loan_id]', '$row_overd[ltrans_id]', '5', '$loandefault_inc', '$timestamp', '', '$timestamp', '$_SESSION[log_id]')";
		$query_fine_inc = mysqli_query($db_link, $sql_fine_inc);
		checkSQL($db_link, $query_fine_inc);

		//Set Flag in LTRANS for Fine charged
		$sql_update_ltrans = "UPDATE ltrans SET ltrans_fined = '1' WHERE ltrans_id = '$row_overd[ltrans_id]'";
		$query_update_ltrans = mysqli_query($db_link, $sql_update_ltrans);
		checkSQL($db_link, $query_update_ltrans);

		showMessage('Default Fine was charged for Loan '.$row_overd['loan_no'].'.');
	}
	else showMessage('Savings account balance too low\nto charge Default Fine for Loan '.$row_overd['loan_no'].'.');
}
?>
