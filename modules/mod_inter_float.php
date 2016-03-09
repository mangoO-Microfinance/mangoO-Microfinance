
<?PHP

//Calculate monthly rate
$loan_principaldue = round($loan_principal / $loan_period, -3);

//Check if monthly rate multiplied by number of months sums up to the expected total repay amounts exactly. Calculate difference.
$difference_principal = $loan_principal - ($loan_principaldue * $loan_period);

//Calculate Due Dates & Due Payments and insert them into LTRANS
$ltrans_due = $loan_dateout + convertDays(31);
$ltrans_principaldue = $loan_principaldue;
$ltrans_principalremain = $loan_principal;

$i = 1;
while ($i <= $loan_period){
	
	$ltrans_interestdue = ($ltrans_principalremain / 100 * $loan_interest);
	
	//Add differences on principal on first iteration. 
	if ($i == 1) {
		$ltrans_principaldue = $ltrans_principaldue + $difference_principal;
	}
	
	//Insert into LTRANS
	$sql_insert_ltrans = "INSERT INTO ltrans (loan_id, ltrans_due, ltrans_principaldue, ltrans_interestdue, user_id) VALUES ('$_SESSION[loan_id]', '$ltrans_due', '$ltrans_principaldue', '$ltrans_interestdue', '$_SESSION[log_id]')";
	$query_insert_ltrans = mysql_query ($sql_insert_ltrans);
	checkSQL($query_insert_ltrans);
	
	//Reset principal amount to standard value after first iteration
	if ($i == 1) {
		$ltrans_principaldue = $loan_principaldue;
	}
	
	//Reduce remaining principal by paid amount 
	$ltrans_principalremain = $ltrans_principalremain - $ltrans_principaldue;
	
	// Add seconds for 31 days
	$ltrans_due = $ltrans_due + convertDays(31);	
	
	$i++;
}
?>