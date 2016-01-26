<?PHP
//Select Loan Default Fine from FEES
$sql_ld = "SELECT fee_value FROM fees WHERE fee_id = 7";
$query_ld = mysql_query($sql_ld);
check_sql($query_ld);
$result_fees = mysql_fetch_assoc($query_ld);
$loandefault_sav = ($result_fees['fee_value']) * (-1);
$loandefault_inc = $result_fees['fee_value'];

//Calculate grace period in days
$graceperiod = $_SESSION['set_auf'] * 86400;
$timestamp = time();

//Automatically charge Loan Default Fine if Customer has defaulted for more than 30 days										
if($row_overd['ltrans_due'] < ($timestamp - $graceperiod) AND $row_overd['ltrans_fined'] != 1){
	
	//Withdraw Fine from SAVINGS
	$sql_fine_sav = "INSERT INTO savings (cust_id, sav_date, sav_amount, cur_id, savtype_id, sav_receipt) VALUES ('$row_overd[cust_id]', '$timestamp', '$loandefault_sav', '1', '6', '')";
	$query_fine_sav = mysql_query($sql_fine_sav);
	check_sql($query_fine_sav);
	
	//Insert Fine into INCOMES
	$sql_fine_inc = "INSERT INTO incomes (cust_id, inctype_id, inc_amount, inc_date, inc_receipt) VALUES ('$row_overd[cust_id]', '5', '$loandefault_inc', '$timestamp', '')";
	$query_fine_inc = mysql_query($sql_fine_inc);
	check_sql($query_fine_inc);
	
	//Set Flag in LTRANS for Fine charged
	$sql_update_ltrans = "UPDATE ltrans SET ltrans_fined = '1' WHERE ltrans_id = '$row_overd[ltrans_id]'";
	$query_update_ltrans = mysql_query($sql_update_ltrans);
}
?>