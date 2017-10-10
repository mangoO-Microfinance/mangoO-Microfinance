<?PHP
/**
	*	Update Loan Status
	*/
	function updateStatus($db_link){
	}

/**
	* Charge Loan Default Fine
	*/
	function chargeFine($db_link, $loanID, $fine_amount, $fine_receipt, $fine_date, $fine_sav, $logID){
	}

/**
	* Make Loan Repayment
	*/
	function makeRepayment($db_link){
	}

/**
	* Re-calculate due payments
	*/
	function updateInterFloat($db_link, $loanID, $principal, $interRate){

		$sql_instalments = "SELECT ltrans_id FROM ltrans WHERE ltrans_date IS NULL AND ltrans.loan_id = '$loanID'";
		$query_instalments = mysqli_query($db_link, $sql_instalments);
		checkSQL($db_link, $query_instalments);
		$instalments = array();
		while($row_inst = mysqli_fetch_assoc($query_instalments)) $instalments [] = $row_inst;
		$instalCount = count($instalments);

		// Re-calculate monthly rate
		$pDue = round($principal / $instalCount, -3);

		// Check if monthly rate multiplied by number of instalments sums up to the expected remaining balance exactly. Calculate difference.
		$difference_principal = $principal - ($pDue * $instalCount);

		// Re-calculate due payments and update LTRANS
		$ltrans_pDue = $pDue;
		$ltrans_pRemain = $principal;

		$i = 1;
		foreach($instalments as $inst){

			$ltrans_iDue = ($ltrans_pRemain / 100 * $interRate);

			//Add differences on principal on first iteration.
			if ($i == 1) $ltrans_pDue = $ltrans_pDue + $difference_principal;

			//Update LTRANS
			$sql_update_ltrans = "UPDATE ltrans SET ltrans_principaldue = '$ltrans_pDue', ltrans_interestdue = '$ltrans_iDue' WHERE ltrans_id = '$inst[ltrans_id]'";
			$query_update_ltrans = mysqli_query($db_link, $sql_update_ltrans);
			checkSQL($db_link, $query_update_ltrans);

			//Reduce remaining principal by paid amount
			$ltrans_pRemain = $ltrans_pRemain - $ltrans_pDue;

			//Reset principal amount to default value after first iteration
			if ($i == 1) $ltrans_pDue = $pDue;

			$i++;
		}

	}
?>
