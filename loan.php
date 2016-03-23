<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	connect();
	getLoanID();
	$timestamp = time();
	
	// Select details of current loan from LOANS, LOANSTATUS, CUSTOMER
	$sql_loan = "SELECT * FROM loans JOIN loanstatus ON loans.loanstatus_id = loanstatus.loanstatus_id JOIN customer ON loans.cust_id = customer.cust_id WHERE loan_id = $_SESSION[loan_id]";
	$query_loan = mysql_query($sql_loan);
	checkSQL($query_loan);
	$result_loan = mysql_fetch_assoc($query_loan);
	$_SESSION['cust_id'] = $result_loan['cust_id'];
	
	// Get current customer's savings account balance
	$sav_balance = getSavingsBalance($_SESSION['cust_id']);
	
	/** UPDATE STATUS-Button **/
	if (isset($_POST['updatestatus'])){
		
		// Sanitize user input
		$loan_principal = $_SESSION['loan_principal'];
		$loan_interest = $_SESSION['loan_interest'];
		$loan_period = $_SESSION['loan_period'];
		$loan_issued = $_SESSION['loan_issued'];
		$loan_fee = $_SESSION['loan_fee'];
		$loan_fee_receipt = sanitize($_POST['loan_fee_receipt']);
		$loan_status = sanitize($_POST['loan_status']);
		$loan_dateout = strtotime(sanitize($_POST['loan_dateout']));
		
		if($loan_status == 2 AND $loan_issued == 0){
			
			//Include module for interest calculation method according to system settings
			include ($_SESSION['set_intcalc']);
			
			//Insert Loan Fee into INCOMES
			$sql_inc_lf = "INSERT INTO incomes (cust_id, loan_id, inctype_id, inc_amount, inc_date, inc_receipt, inc_created, user_id) VALUES ('$_SESSION[cust_id]', '$_SESSION[loan_id]', '3', '$loan_fee', '$loan_dateout', '$loan_fee_receipt', '$timestamp', '$_SESSION[log_id]')";
			$query_inc_lf = mysql_query($sql_inc_lf);
			checkSQL($query_inc_lf);
			
			//Update the Loan to "Approved" and "Issued"
			$sql_issue = "UPDATE loans SET loanstatus_id = '$loan_status', loan_issued = '1', loan_dateout = '$loan_dateout', loan_fee_receipt = '$loan_fee_receipt' WHERE loan_id = '$_SESSION[loan_id]'";
			$query_issue = mysql_query($sql_issue);
			checkSQL($query_issue);
		}
		
		else {		
			$sql_update = "UPDATE loans SET loanstatus_id = '$_POST[loan_status]' WHERE loan_id = $_SESSION[loan_id]";
			$query_update = mysql_query($sql_update);
			checkSQL($query_update);
		}
		header('Location: loan.php?lid='.$_SESSION['loan_id']);
	}
	
	/** MAKE REPAYMENT Button **/
	if(isset($_POST['repay'])){
		
		//Sanitize User Input
		$loan_repay_amount = sanitize($_POST['loan_repay_amount']);
		$loan_repay_receipt = sanitize($_POST['loan_repay_receipt']);
		$loan_repay_date = sanitize(strtotime($_POST['loan_repay_date']));
		$loan_repay_sav = sanitize($_POST['loan_repay_sav']);
		
	/** If the paid amount exceeds the total outstanding balance, 
		* the remaining principal and interest are served 
		* and the rest goes to savings. */
		if ($loan_repay_amount > $_SESSION['balance']){
			$loan_repay_interest = $_SESSION['i_balance'];
			$loan_repay_principal = $_SESSION['p_balance'];
			$loan_repay_savings = $loan_repay_amount - $loan_repay_interest - $loan_repay_principal;
		}
		
		/** If, however, the paid amount is smaller than the total outstanding balance... */
		else {
			
			// Check if total interest has been paid off.
			if ($_SESSION['i_balance'] <= 0 AND $_SESSION['p_balance'] > 0){
					$loan_repay_interest = 0;
					$loan_repay_principal = $loan_repay_amount;
			}
			
			// Check if total principal has been paid off.
			elseif ($_SESSION['i_balance'] > 0 AND $_SESSION['p_balance'] <= 0){
					$loan_repay_interest = $loan_repay_amount;
					$loan_repay_principal = 0;
			}
			
			// Otherwise, if principal AND interest both show an open balance...
			elseif ($_SESSION['i_balance'] > 0 AND $_SESSION['p_balance'] > 0){
				
				/**
					* Check if the paid amount is less than the interest due. 
					* In that case, everything goes to interest only.
					*/
				if ($loan_repay_amount < $_SESSION['interest_sum']){
					$loan_repay_interest = $loan_repay_amount;
					$loan_repay_principal = 0;
				}
				
			/** 
				* If, however, the paid amount exceeds 
				* the due interest PLUS the total outstanding balance, 
				* the excess money is used on interest.
				*/
				elseif ($loan_repay_amount > ($_SESSION['interest_sum'] + $_SESSION['p_balance'])){
					$loan_repay_principal = $_SESSION['p_balance'];
					$loan_repay_interest = $loan_repay_amount - $loan_repay_principal;
				}
				
				//Otherwise, the paid amount is split between interest and principal. This is probably the most common case!
				else {
					$loan_repay_interest = $_SESSION['interest_sum'];
					$loan_repay_principal = $loan_repay_amount - $loan_repay_interest;
				}
			}
		}
		
		// Check for smallest LTRANS_ID to determine whether an UPDATE or INSERT is needed
		$sql_ltransid = "SELECT MIN(ltrans_id) FROM ltrans WHERE loan_id = $_SESSION[loan_id] AND ltrans_date IS NULL AND ltrans_due IS NOT NULL";
		$query_ltransid = mysql_query($sql_ltransid);
		checkSQL($query_ltransid);
		$ltransid_result = mysql_fetch_assoc($query_ltransid);
		$ltransid = $ltransid_result['MIN(ltrans_id)'];
		
		if(!isset($ltransid)){
			$sql_insertrepay = "INSERT INTO ltrans (loan_id, ltrans_date, ltrans_principal, ltrans_interest, ltrans_receipt, ltrans_created, user_id) VALUES ($_SESSION[loan_id], $loan_repay_date, '$loan_repay_principal', '$loan_repay_interest', '$loan_repay_receipt', $timestamp, '$_SESSION[log_id]')";
			$query_insertrepay = mysql_query($sql_insertrepay);
			checkSQL($query_insertrepay);
			
			// Get LTRANS_ID of latest entry
			$sql_ltransid = "SELECT MAX(ltrans_id) FROM ltrans WHERE loan_id = '$_SESSION[loan_id]' AND ltrans_receipt = '$loan_repay_receipt' AND ltrans_created = '$timestamp'";
			$query_ltransid = mysql_query($sql_ltransid);
			checkSQL($query_ltransid);
			$ltransid_result = mysql_fetch_row($query_ltransid);
			$ltransid = $ltransid_result[0];
		}
		else {
			$sql_updaterepay = "UPDATE ltrans SET ltrans_date = $loan_repay_date, ltrans_principal = '$loan_repay_principal', ltrans_interest = '$loan_repay_interest', ltrans_receipt = '$loan_repay_receipt', ltrans_created = '$timestamp', user_id = '$_SESSION[log_id]' WHERE ltrans_id = $ltransid";
			$query_updaterepay = mysql_query($sql_updaterepay);
			checkSQL($query_updaterepay);
		}
		
		// If interest is paid, insert the amount into INCOMES
		if($loan_repay_interest > 0){
			$sql_incint = "INSERT INTO incomes (cust_id, inctype_id, ltrans_id, inc_amount, inc_date, inc_receipt, inc_created, user_id) VALUES ('$_SESSION[cust_id]', '4', '$ltransid', '$loan_repay_interest', '$loan_repay_date', '$loan_repay_receipt', $timestamp, '$_SESSION[log_id]')";
			$query_incint = mysql_query($sql_incint);
			checkSQL($query_incint);
		}
		
		// If Payment is made from savings, withdraw the amount from there
		if ($loan_repay_sav == 1) {
			$loan_repay_amount_sav = $loan_repay_amount * (-1);
			
			$sql_insert = "INSERT INTO savings (cust_id, ltrans_id, sav_date, sav_amount, savtype_id, sav_receipt, sav_created, user_id) VALUES ($_SESSION[cust_id], $ltransid, $loan_repay_date, $loan_repay_amount_sav, 8, $loan_repay_receipt, $timestamp, $_SESSION[log_id])";
			$query_insert = mysql_query($sql_insert);
			
			// Update savings account balance
			updateSavingsBalance($_SESSION['cust_id']);
		}
		
		//If amount paid exceeds the remaining balance for that loan, put the rest in SAVINGS.
		if(isset($loan_repay_savings)){
			$sql_restsav = "INSERT INTO savings (cust_id, ltrans_id, sav_date, sav_amount, savtype_id, sav_receipt, sav_created, user_id) VALUES ($_SESSION[cust_id], $ltransid, $loan_repay_date, $loan_repay_savings, '1', $loan_repay_receipt, $timestamp, '$_SESSION[log_id]')";
			$query_restsav = mysql_query($sql_restsav);
			checkSQL($query_restsav);
			
			// Update savings account balance
			updateSavingsBalance($_SESSION['cust_id']);
		}

		header('Location: loan.php?lid='.$_SESSION['loan_id']);
	}
	
	/** CHARGE DEFAULT FINE Button **/
	if(isset($_POST['fine'])){
		
		// Sanitize user input
		$fine_amount = sanitize($_POST['fine_amount']);
		$fine_receipt = sanitize($_POST['fine_receipt']);
		$fine_date = strtotime(sanitize($_POST['fine_date']));
		$fine_sav = sanitize($_POST['fine_sav']);
		
		// Get LTRANS_ID for chargable transaction 
		$sql_ltrans = "SELECT MIN(ltrans_id) FROM ltrans WHERE ltrans.loan_id = '$_SESSION[loan_id]' AND ltrans_due < '$timestamp' AND ltrans_fined = '0' AND ltrans_date IS NULL";
		$query_ltrans = mysql_query($sql_ltrans);
		checkSQL($query_ltrans);
		$ltrans = mysql_fetch_row($query_ltrans);
		
		// Flag loan transaction as 'fined'
		$sql_ltrans_fined = "UPDATE ltrans SET ltrans_fined = '1', ltrans_created = '$timestamp', user_id = '$_SESSION[log_id]' WHERE ltrans_id = '$ltrans[0]'";
		$query_ltrans_fined = mysql_query($sql_ltrans_fined);
		checkSQL($query_ltrans_fined);
		
		// Deduct fine from savings account if applicable
		if($fine_sav == 1){
			$fine_amount_sav = $fine_amount * (-1);
			
			$sql_fine_sav = "INSERT INTO savings (cust_id, ltrans_id, sav_date, sav_amount, savtype_id, sav_receipt, sav_created, user_id) VALUES ('$_SESSION[cust_id]', '$ltrans[0]', '$fine_date', '$fine_amount_sav', 6, '$fine_receipt', $timestamp, '$_SESSION[log_id]')";
			$query_fine_sav = mysql_query($sql_fine_sav);
			checkSQL($query_fine_sav);
			
			// Update savings account balance
			updateSavingsBalance($_SESSION['cust_id']);
			
			// Get SAV_ID for the latest entry
			$sql_savid = "SELECT MAX(sav_id) FROM savings WHERE ltrans_id = '$ltrans[0]' AND sav_receipt = '$fine_receipt' AND sav_created = '$timestamp'";
			$query_savid = mysql_query($sql_savid);
			checkSQL($query_savid);
			$sav_id = mysql_fetch_row($query_savid);
		}
		
		// Insert fine as income in INCOMES
		$sql_fine_inc = "INSERT INTO incomes (cust_id, ltrans_id, sav_id, inctype_id, inc_amount, inc_date, inc_receipt, inc_created, user_id) VALUES ('$_SESSION[cust_id]', '$ltrans[0]', $sav_id[0], '5', '$fine_amount', '$fine_date', '$fine_receipt', $timestamp, '$_SESSION[log_id]')";
		$query_fine_inc = mysql_query($sql_fine_inc);
		checkSQL($query_fine_inc);
		
		header('Location: loan.php?lid='.$_SESSION['loan_id']);
	}
	
	// Select Instalments from LTRANS
	$sql_duedates = "SELECT * FROM ltrans, user WHERE ltrans.user_id = user.user_id AND loan_id = $_SESSION[loan_id] ORDER BY ltrans_id";
	$query_duedates = mysql_query($sql_duedates);
	checkSQL($query_duedates);
	
	// Select Guarantors from CUSTOMER
	$sql_guarant = "SELECT cust_id, cust_name FROM customer";
	$query_guarant = mysql_query($sql_guarant);
	checkSQL($query_guarant);
	$guarantors = array();
	while ($row_guarant = mysql_fetch_assoc($query_guarant)) $guarantors[] = $row_guarant;
	
	// Select Securities from SECURITIES and get file paths for securities
	$sql_secur = "SELECT * FROM securities WHERE loan_id = $_SESSION[loan_id]";
	$query_secur = mysql_query($sql_secur);
	checkSQL($query_secur);
	$securities = array();
	while ($row_secur = mysql_fetch_assoc($query_secur)) $securities[] = $row_secur;
	foreach ($securities as $s){
		if ($s['sec_no'] == 1) $sec_path1 = $s['sec_path'];
		elseif ($s['sec_no'] == 2) $sec_path2 = $s['sec_path'];
	}
	
	//Prepare array data export
	$ltrans_exp_date = date("Y-m-d",time());
	$_SESSION['ltrans_export'] = array();
	$_SESSION['ltrans_exp_title'] = $_SESSION['cust_id'].'_loan_'.$ltrans_exp_date;
?>

<html>
	<?PHP includeHead('Loan Details',0) ?>	
		<script type="text/javascript">				
			function firstIssue(form){
				status = form.loan_status.value;
				issued = form.loan_issued.value;
				
				if (status == 2 && issued == 0) {
					
					fail = validateDate(form.loan_dateout.value)
					if (fail != "") {
						alert(fail); 
						return false;
					}
					
					loan_fee_receipt = prompt('Please enter Receipt No. for Loan Fee:')
					if (loan_fee_receipt == "" || loan_fee_receipt == null) { 
						alert("You have not specified the Receipt No. The Loan's Status remains unchanged."); 
						return false;
					}
					else {
						document.getElementById("loan_fee_receipt").value = loan_fee_receipt; 
						return true;
					}
				}
				else return true;				
			}
			
			function validate(form){
				fail = validateDate(form.loan_repay_date.value)
				fail += validateAmount(form.loan_repay_amount.value)
				fail += validateReceipt(form.loan_repay_receipt.value)
				if (form.loan_repay_sav.checked){
					fail += validateOverdraft(form.loan_repay_amount.value, <?PHP echo $sav_balance; ?>, 0, <?PHP echo $_SESSION['set_msb']; ?>)
				}
				if (fail == "") return true
				else {alert(fail); return false}
			}
			
			function validateFine(form){
				fail = validateDate(form.fine_date.value)
				fail += validateAmount(form.fine_amount.value)
				if (form.fine_sav.checked){
					fail += validateOverdraft(form.fine_amount.value, <?PHP echo $sav_balance; ?>, 0, <?PHP echo $_SESSION['set_msb']; ?>)
				}
				fail += validateReceipt(form.fine_receipt.value)
				if (fail == "") return true
				else {alert(fail); return false}
			}
		</script>
		<script src="functions_validate.js"></script>
		<script src="function_randCheck.js"></script>
	</head>
	
	<body>
		<!-- MENU -->
		<?PHP 
				includeMenu(3);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="customer.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Back</a>
			<a href="loan_search.php">Search</a>
			<a href="loans_act.php">Active Loans</a>
			<a href="loans_pend.php">Pending Loans</a>
		</div>
			
		<!-- LEFT SIDE: Loan Details -->
		<div class="content_left">	
			
			<p class="heading_narrow">Loan No. <?PHP echo $result_loan['loan_no'] ?></p>
			
			<form name="loaninfo" action="loan.php" method="post" onSubmit="return firstIssue(this)">
				<table id="tb_fields">
					<colgroup>
						<col width="15%">
						<col width="35%">
						<col width="15%">
						<col width="35%">
					</colgroup>
					<tr>
						<td>Customer:</td>
						<td><input type="text" name="cust_name" disabled="disabled" value="<?PHP echo $result_loan['cust_name']?>" /></td>
						<td>Purpose:</td>
						<td><input type="text" name="loan_purpose" disabled="disabled" value="<?PHP echo $result_loan['loan_purpose']?>" /></td>
					</tr>
					<tr>
						<td>Principal:</td>
						<td><input type="text" name="loan_principal" disabled="disabled" value="<?PHP echo number_format($result_loan['loan_principal']).' '.$_SESSION['set_cur'] ?>" /></td>
						<td>Period:</td>
						<td><input type="text" name="loan_period" disabled="disabled" value="<?PHP echo $result_loan['loan_period']?>" /></td>
					</tr>
					<tr>
						<td>Interest:</td>
						<td><input type="text" name="loan_interest" disabled="disabled" value="<?PHP echo $result_loan['loan_interest'].'% per Month'?>" /></td>
						<td>Loan Fee:</td>
						<td><input type="text" name="loan_fee" disabled="disabled" value="<?PHP echo number_format($result_loan['loan_fee']).' '.$_SESSION['set_cur'] ?>" /></td>
					</tr>
					<tr>
						<td>Monthly Rate:</td>
						<td><input type="text" name="loan_rate" disabled="disabled" value="<?PHP echo number_format($result_loan['loan_rate']).' '.$_SESSION['set_cur'] ?>" /></td>
						<td>Repay Total:</td>
						<td><input type="text" name="loan_repaytotal" disabled="disabled" value="<?PHP echo number_format($result_loan['loan_repaytotal']).' '.$_SESSION['set_cur'] ?>"/></td>
					</tr>
					<tr>
						<td>Secur. 1:</td>
						<td>
							<?PHP 
							if (isset($sec_path1)) echo '<a href="'.$sec_path1.'" target=_blank>'.$result_loan['loan_sec1'].' <i class="fa fa-eye"></i></a>';
							elseif ($result_loan['loan_sec1'] != "") echo '<a href="loan_sec.php?lid='.$_SESSION['loan_id'].'">'.$result_loan['loan_sec1'].' <i class="fa fa-upload"></i></a>';
							?>
						</td>
						<td>Secur. 2:</td>
						<td>
							<?PHP
							if (isset($sec_path2)) echo '<a href="'.$sec_path2.'" target=_blank>'.$result_loan['loan_sec2'].' <i class="fa fa-eye"></i></a>';
							elseif ($result_loan['loan_sec2'] != "") echo '<a href="loan_sec.php?lid='.$_SESSION['loan_id'].'">'.$result_loan['loan_sec2'].' <i class="fa fa-upload"></i></a>';
							?>
						</td>
					</tr>
					<tr>
						<td>Guarant.1:</td>
						<?PHP 
						echo '<td><input type="text" name="loan_guarant1" disabled="disabled" ';
						foreach ($guarantors as $g1){
							if ($g1['cust_id'] == $result_loan['loan_guarant1'])
								echo 'value="'.$g1['cust_id'].' '.$g1['cust_name'].'"';
						}
						echo ' /></td>';
						?>
						<td>Guarant.2:</td>
						<?PHP 
						echo '<td><input type="text" name="loan_guarant2" disabled="disabled" ';
						foreach ($guarantors as $g2){
							if ($g2['cust_id'] == $result_loan['loan_guarant2'])
								echo 'value="'.$g2['cust_id'].' '.$g2['cust_name'].'"';
						}
						echo ' /></td>';
						?>
					</tr>
					<tr>
						<td>Guarant.3:</td>
						<?PHP 
						echo '<td><input type="text" name="loan_guarant3" disabled="disabled" ';
						foreach ($guarantors as $g3){
							if ($g3['cust_id'] == $result_loan['loan_guarant3'])
								echo 'value="'.$g3['cust_id'].' '.$g3['cust_name'].'"';
						}
						echo ' /></td>';
						?>
						<td>Application Date:</td>
						<td>
							<input type="text" value="<?PHP echo date("d.m.Y", $result_loan['loan_date']) ?>" disabled="disabled" />
						</td>
					</tr>
					<tr>
						<td>Issued on:</td>
						<td>
							<input type="text" id="datepicker" name="loan_dateout"
								<?PHP 
								if($result_loan['loan_issued'] == 1) {
									echo ' disabled="disabled"';
									echo ' value="'.date("d.m.Y", $result_loan['loan_dateout']).'" ';
								}
								?>
							placeholder="DD.MM.YYYY" />
						</td>
						<td>Status:</td>
						<td>
							<select name="loan_status" id="loan_status" size="1">
								<?PHP
								//Select Loanstatus from LOANSTATUS
								$sql_loanstatus = "SELECT * FROM loanstatus";
								$query_loanstatus = mysql_query($sql_loanstatus);
								while ($row_status = mysql_fetch_assoc($query_loanstatus)){
									echo '<option value="'.$row_status['loanstatus_id'].'"';
									if ($row_status['loanstatus_id'] == $result_loan['loanstatus_id']) echo ' selected="selected" ';
									echo '>'.$row_status['loanstatus_status'].'</option>';
								}
								?>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan=4 style="text-align:center">
							<input type="hidden" name="loan_issued" id="loan_issued" value="<?PHP echo $result_loan['loan_issued']?>" />
							<input type="hidden" name="loan_fee_receipt" id="loan_fee_receipt" value="" />
							<input type="submit" name="updatestatus" value="Update Status" />
						</td>
					</tr>
				</table>
				<?PHP
				//Pass relevant data to SESSION
				$_SESSION['loan_principal'] = $result_loan['loan_principal'];
				$_SESSION['loan_interest'] = $result_loan['loan_interest'];
				$_SESSION['loan_period'] = $result_loan['loan_period'];
				$_SESSION['loan_fee'] = $result_loan['loan_fee'];
				$_SESSION['loan_issued'] = $result_loan['loan_issued'];
				?>
			</form>
		</div>
			
		<!-- RIGHT SIDE: Payment Transactions -->
		<div class="content_right">
		
			<table id="tb_table">
				<tr>
					<form class="export" action="ltrans_export.php" method="post">
						<th class="title" colspan="10">Loan Payment Transactions
						<!-- Export Button -->
						<input type="submit" name="export_rep" value="Export" />
						</th>
					</form>
				</tr>
				<tr>
					<th>Date due</th>
					<th>Date paid</th>
					<th>Princ. due</th>
					<th>Princ. paid</th>
					<th>Inter. due</th>
					<th>Inter. paid</th>
					<th>Receipt</th>
					<th>Fined</th>
					<th>Updated</th>
					<th>Delete</th>
				</tr>
				<?PHP
				$p_due = 0;
				$p_paid = 0;
				$i_due = 0;
				$i_paid = 0;
				$loan_default = 0;
				$int_sum_set = 0;
				while ($row_duedates = mysql_fetch_assoc($query_duedates)){
					echo '<tr>';
					if ($row_duedates['ltrans_due'] === NULL) echo '<td></td>';
						elseif ($row_duedates['ltrans_due'] < $timestamp AND $row_duedates['ltrans_date'] === NULL AND $row_duedates['ltrans_fined'] == 0) echo '<td class="warn">'.date("d.m.Y",$row_duedates['ltrans_due']).'</td>';
						else echo '<td>'.date("d.m.Y",$row_duedates['ltrans_due']).'</td>';
					if ($row_duedates['ltrans_date'] === NULL) echo '<td></td>';
						else echo '<td>'.date("d.m.Y", $row_duedates['ltrans_date']).'</td>';
					if ($row_duedates['ltrans_principaldue'] === NULL) echo '<td></td>';
						else echo '<td>'.number_format($row_duedates['ltrans_principaldue']).'</td>';
					if ($row_duedates['ltrans_principal'] === NULL) echo '<td></td>';
						else echo '<td>'.number_format($row_duedates['ltrans_principal']).'</td>';
					if ($row_duedates['ltrans_interestdue'] === NULL) echo '<td></td>';
						else echo '<td>'.number_format($row_duedates['ltrans_interestdue']).'</td>';
					if ($row_duedates['ltrans_interest'] === NULL) echo '<td></td>';
						else echo '<td>'.number_format($row_duedates['ltrans_interest']).'</td>';
					echo '<td>'.$row_duedates['ltrans_receipt'].'</td>';
					
					echo '<td><input type="checkbox" name="ltrans_fined" value="'.$row_duedates['ltrans_id'].'"';
						if ($row_duedates['ltrans_fined'] == 1) echo ' checked="checked" ';
						echo 'disabled="disabled" /></td>';
						
					echo '<td>'.$row_duedates['user_name'].'</td>
								<td>';
					if ($_SESSION['log_delete'] == 1) 
						echo '<a href="ltrans_del.php?lt_id='.$row_duedates['ltrans_id'].'" onClick="return randCheck();"><i class="fa fa-remove fa-lg"></i></a>';
					echo '</td>
							</tr>';

					$p_due = $p_due + $row_duedates['ltrans_principaldue'];
					$p_paid = $p_paid + $row_duedates['ltrans_principal'];
					$i_due = $i_due + $row_duedates['ltrans_interestdue'];
					$i_paid = $i_paid + $row_duedates['ltrans_interest'];
					if ($row_duedates['ltrans_date'] === NULL && $int_sum_set == 0){
						$_SESSION['interest_sum'] = $row_duedates['ltrans_interestdue'];
						$int_sum_set = 1;
					}
					elseif ($int_sum_set == 0) $_SESSION['interest_sum'] = 0;
					if ($row_duedates['ltrans_date'] == NULL &&
							$row_duedates['ltrans_due'] != NULL &&
							$row_duedates['ltrans_due'] < $timestamp && 
							$row_duedates['ltrans_fined'] == 0)
						$loan_default++;
					
					if ($row_duedates['ltrans_fined'] == 0) $exp_fined='No';
						else $exp_fined='Yes';
					
					//Prepare data for export to Excel file
					array_push($_SESSION['ltrans_export'], array("Date due" => date("d.m.Y",$row_duedates['ltrans_due']), "Date paid" => date("d.m.Y",$row_duedates['ltrans_date']), "Principial due" => $row_duedates['ltrans_principaldue'], "Principal paid" => $row_duedates['ltrans_principal'], "Interest due" => $row_duedates['ltrans_interestdue'], "Interest paid" => $row_duedates['ltrans_interest'], "Receipt" => $row_duedates['ltrans_receipt'], "Fined" => $exp_fined));
				}
				
				//Pass relevant data to SESSION
				$_SESSION['p_due'] = $p_due;
				$_SESSION['p_paid'] = $p_paid;
				$_SESSION['i_due'] = $i_due;
				$_SESSION['i_paid'] = $i_paid;
				$_SESSION['p_balance'] = $p_due - $p_paid;					
				$_SESSION['i_balance'] = $i_due - $i_paid;					
				$_SESSION['balance'] = $p_due - $p_paid + $i_due - $i_paid;					
				if (isset($_SESSION['interest_sum']) AND $_SESSION['interest_sum'] == 0) $_SESSION['interest_sum'] = $_SESSION['i_balance'];
				?>
				
				<tr class="balance">
					<td>Total:</td>
					<td></td>
					<td><?PHP echo number_format($p_due); ?></td>
					<td><?PHP echo number_format($p_paid); ?></td>
					<td><?PHP echo number_format($i_due); ?></td>
					<td><?PHP echo number_format($i_paid); ?></td>
					<td colspan="4"></td>
				</tr>
				<tr>
					<td>Remaining:</td>
					<td></td>
					<td><?PHP echo number_format($p_due - $p_paid); ?></td>
					<td></td>
					<td><?PHP echo number_format($i_due - $i_paid); ?></td>
					<td colspan="5"></td>
				</tr>
			</table>

			<!-- MAKE REPAYMENT Form -->
			<?PHP
			if ($result_loan['loanstatus_id'] == 2 && $_SESSION['balance'] > 0) echo '
			<form name="loan_repay" action="loan.php" method="post" onSubmit="return validate(this)">
				<table id="tb_fields" style="width:75%">
					<tr>
						<td>Date Paid:</td>
						<td><input type="text" id="datepicker2" name="loan_repay_date" value="'.date("d.m.Y", $timestamp).'" placeholder="DD.MM.YYYY" /></td>
						<td>Amount Paid:</td>
						<td><input type="number" name="loan_repay_amount" class="defaultnumber" placeholder="'.$_SESSION['set_cur'].'" /></td>
					</tr>
					<tr>
						<td>Receipt No:</td>
						<td><input type="number" min="1" name="loan_repay_receipt" class="defaultnumber" placeholder="for Loan Repayment" /></td>
						<td></td>
						<td><input type="checkbox" name="loan_repay_sav" value="1" /> deduct from Savings</td>
					</tr>
					<tr>
						<td class="center" colspan=4>
							<input type="submit" name="repay" value="Make Repayment" />
						</td>
					</tr>
				</table>	
			</form>';
			?>
			
			<!-- CHARGE DEFAULT FINE Form -->
			<form name="default_fine" method="post" action="loan.php" onSubmit="return validateFine(this)">
				<?PHP
				if ($result_loan['loanstatus_id'] == 2 && $loan_default != 0) 
					echo '<table id="tb_fields" style="width:75%; background:#a7dbd8">
									<tr>
										<td>Date:</td>
										<td>
											<input type="text" id="datepicker3" name="fine_date" value="'.date("d.m.Y", $timestamp).'" placeholder="DD.MM.YYYY" />
										</td>
										<td>Amount fined:</td>
										<td>
											<input type="number" name="fine_amount" class="defaultnumber" placeholder="'.$_SESSION['set_cur'].'" value="'.$_SESSION['fee_loanfine'].'" />
										</td>
									</tr>
									<tr>
										<td>Receipt No:</td>
										<td>
											<input type="number" name="fine_receipt" class="defaultnumber" placeholder="for Default Fine" />
										</td>
										<td></td>
										<td>
											<input type="checkbox" name="fine_sav" value="1" checked="checked" /> deduct from Savings
										</td>
									</tr>
									<tr>
										<td colspan=4 class="center">
											<input type="submit" name="fine" value="Charge Default Fine" />
										</td>
									</tr>
								</table>';
				?>
			</form>
			
		</div>
	</body>
</html>