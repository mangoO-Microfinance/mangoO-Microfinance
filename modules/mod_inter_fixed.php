<?PHP
//Calculate expected total interest and monthly rates
$loan_inter_total = ceil((($loan_princp_approved / 100 * $loan_interest) * $loan_period)/50)*50;		
$loan_princp_due = round($loan_princp_approved / $loan_period, -3);
$loan_inter_due = round($loan_princp_approved / 100 * $loan_interest);

//Check if monthly rates multiplied by number of months sums up to the expected total repay amounts exactly. Calculate difference.
$difference_principal = $loan_princp_approved - ($loan_princp_due * $loan_period);
$difference_interest = $loan_inter_total - ($loan_inter_due * $loan_period);

//Calculate Due Dates & Due Payments and insert them into LTRANS
$ltrans_due = $loan_dateout + convertDays(31);
$ltrans_princp_due = $loan_princp_due;
$ltrans_inter_due = $loan_inter_due;
$i = 1;
while ($i <= $loan_period){
	
	//Add differences on first iteration. 
	if ($i == 1) {
		$ltrans_princp_due = $ltrans_princp_due + $difference_principal;
		$ltrans_inter_due = $ltrans_inter_due + $difference_interest;
	}
	
	//Insert into LTRANS
	$sql_insert_ltrans = "INSERT INTO ltrans (loan_id, ltrans_due, ltrans_principaldue, ltrans_interestdue, user_id) VALUES ('$_SESSION[loan_id]', '$ltrans_due', '$ltrans_princp_due', '$ltrans_inter_due', '$_SESSION[log_id]')";
	$query_insert_ltrans = mysqli_query($db_link, $sql_insert_ltrans);
	checkSQL($db_link, $query_insert_ltrans);
	
	//Reset both due amounts to standard value after first iteration
	if ($i == 1) {
		$ltrans_princp_due = $loan_princp_due;
		$ltrans_inter_due = $loan_inter_due;
	}
	$ltrans_due = $ltrans_due + convertDays(31);	/* Add seconds for 31 days */
	$i++;
}
?>