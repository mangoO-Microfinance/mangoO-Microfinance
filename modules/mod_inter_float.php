<?PHP
//Calculate monthly rate
$loan_princp_due = round($loan_princp_approved / $loan_period, -3);

//Check if monthly rate multiplied by number of months sums up to the expected total repay amounts exactly. Calculate difference.
$difference_principal = $loan_princp_approved - ($loan_princp_due * $loan_period);

//Calculate Due Dates & Due Payments and insert them into LTRANS
//$ltrans_due = $loan_dateout + convertDays(31);
$ltrans_due = $loan_dateout + convertDays(31);
$ltrans_princp_due = $loan_princp_due;
$ltrans_princp_remain = $loan_princp_approved;
$i = 1;
while ($i <= $loan_period){
	
	$ltrans_inter_due = ($ltrans_princp_remain / 100 * $loan_interest);
	
	//Add differences on principal on first iteration. 
	if ($i == 1) {
		$ltrans_princp_due = $ltrans_princp_due + $difference_principal;
	}
	
	//Insert into LTRANS
	$sql_insert_ltrans = "INSERT INTO ltrans (loan_id, ltrans_due, ltrans_principaldue, ltrans_interestdue, user_id) VALUES ('$_SESSION[loan_id]', '$ltrans_due', '$ltrans_princp_due', '$ltrans_inter_due', '$_SESSION[log_id]')";
	$query_insert_ltrans = mysqli_query($db_link, $sql_insert_ltrans);
	checkSQL($db_link, $query_insert_ltrans);
	
	//Reduce remaining principal by paid amount 
	$ltrans_princp_remain = $ltrans_princp_remain - $ltrans_princp_due;
	
	//Reset principal amount to standard value after first iteration
	if ($i == 1) {
		$ltrans_princp_due = $loan_princp_due;
	}
	
	// Add seconds for 31 days
	$ltrans_due = $ltrans_due + convertDays(31);	
	
	$i++;
}
?>