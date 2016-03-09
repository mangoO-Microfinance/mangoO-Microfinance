<?PHP

//Calculate expected total interest and monthly rates
$loan_interesttotal = ceil((($loan_principal / 100 * $loan_interest) * $loan_period)/50)*50;		
$loan_principaldue = round($loan_principal / $loan_period, -3);
$loan_interestdue = round($loan_principal / 100 * $loan_interest);

//Check if monthly rates multiplied by number of months sums up to the expected total repay amounts exactly. Calculate difference.
$difference_principal = $loan_principal - ($loan_principaldue * $loan_period);
$difference_interest = $loan_interesttotal - ($loan_interestdue * $loan_period);

//Calculate Due Dates & Due Payments and insert them into LTRANS
$ltrans_due = $loan_dateout + convertDays(31);
$ltrans_principaldue = $loan_principaldue;
$ltrans_interestdue = $loan_interestdue;
$i = 1;

while ($i <= $loan_period){
	
	//Add differences on first iteration. 
	if ($i == 1) {
		$ltrans_principaldue = $ltrans_principaldue + $difference_principal;
		$ltrans_interestdue = $ltrans_interestdue + $difference_interest;
	}
	
	//Insert into LTRANS
	$sql_insert_ltrans = "INSERT INTO ltrans (loan_id, ltrans_due, ltrans_principaldue, ltrans_interestdue, user_id) VALUES ('$_SESSION[loan_id]', '$ltrans_due', '$ltrans_principaldue', '$ltrans_interestdue', '$_SESSION[log_id]')";
	$query_insert_ltrans = mysql_query ($sql_insert_ltrans);
	checkSQL($query_insert_ltrans);
	
	//Reset both due amounts to standard value after first iteration
	if ($i == 1) {
		$ltrans_principaldue = $loan_principaldue;
		$ltrans_interestdue = $loan_interestdue;
	}
	$ltrans_due = $ltrans_due + convertDays(31);	/* Add seconds for 31 days */
	$i++;
}
?>