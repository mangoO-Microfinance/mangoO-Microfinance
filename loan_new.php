<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();
	check_custid();
	$timestamp = time();
	
	//Selections from Database
	
		//Select Customer from CUSTOMER
		$sql_cust = "SELECT cust_id, cust_name, cust_since FROM customer WHERE cust_id = '$_SESSION[cust_id]'";
		$query_cust = mysql_query($sql_cust);
		if (!$query_cust) die ('SELECT failed: '.mysql_error());
		$result_cust = mysql_fetch_assoc($query_cust);
		
		//Select Guarantors from CUSTOMER
		$sql_guarant = "SELECT cust_id, cust_name, cust_since FROM customer WHERE cust_active = 1 AND cust_id != '$_SESSION[cust_id]'";
		$query_guarant = mysql_query($sql_guarant);
		if (!$query_guarant) die ('SELECT failed: '.mysql_error());
		$guarantors = array();
		while ($row_guarant = mysql_fetch_assoc($query_guarant)){
			$guarantors[] = $row_guarant;
		};
				
		//Select Minimum Loan Principal from SETTINGS
		$sql_minLP = "SELECT set_value FROM settings WHERE set_short = 'MinLP'";
		$query_minLP = mysql_query($sql_minLP);
		check_sql($query_minLP);
		$minLP = mysql_fetch_row($query_minLP);
		
		//Select Maximum Loan Principal from SETTINGS
		$sql_maxLP = "SELECT set_value FROM settings WHERE set_short = 'MaxLP'";
		$query_maxLP = mysql_query($sql_maxLP);
		check_sql($query_maxLP);
		$maxLP = mysql_fetch_row($query_maxLP);
			
		//Select Loan Fee Rate
		$sql_feerate = "SELECT * FROM fees WHERE fee_id = 5";
		$query_feerate = mysql_query($sql_feerate);
		check_sql($query_feerate);
		$result_feerate = mysql_fetch_assoc($query_feerate);
		$loan_feerate = $result_feerate['fee_value'];
		
		//Select Loan Application Fee
		$sql_laf = "SELECT * FROM fees WHERE fee_id = 6";
		$query_laf = mysql_query($sql_laf);
		check_sql($query_laf);
		$result_laf = mysql_fetch_assoc($query_laf);
		$loan_appfee = $result_laf['fee_value'];
		
		//Select Loan Interest Rate
		$sql_intrate = "SELECT * FROM fees WHERE fee_id = 8";
		$query_intrate = mysql_query($sql_intrate);
		check_sql($query_intrate);
		$result_intrate = mysql_fetch_assoc($query_intrate);
		$loan_intrate = $result_intrate['fee_value'];
	
	//NEW LOAN-Button
	if (isset($_POST['newloan'])){
		
		//Calculate new Loan Number
		$sql_loanno = "SELECT loan_id FROM loans WHERE cust_id = '$_SESSION[cust_id]'";
		$query_loanno = mysql_query($sql_loanno);
		check_sql($query_loanno);
		$numberofloans = array();
		while ($row_loanno = mysql_fetch_array($query_loanno)) $numberofloans[] = $row_loanno;
		$loan_no = 'L '.$_SESSION['cust_id'].'-'.(count($numberofloans) + 1);
				
		//Sanitize user input
		$loan_date = strtotime(sanitize($_POST['loan_date']));
		$loan_principal = sanitize($_POST['loan_principal']);
		$loan_interest = sanitize($_POST['loan_interest']);
		$loan_period = sanitize($_POST['loan_period']);
		$loan_purpose = sanitize($_POST['loan_purpose']);
		$loan_sec1 = sanitize($_POST['loan_sec1']);
		$loan_sec2 = sanitize($_POST['loan_sec2']);;
		$loan_guarant1 = sanitize($_POST['loan_guarant1']);
		$loan_guarant2 = sanitize($_POST['loan_guarant2']);
		$loan_guarant3 = sanitize($_POST['loan_guarant3']);
		$loan_appfee_receipt = sanitize($_POST['loan_appfee_receipt']);
		
		//Calculate expected total interest, monthly rates, and loan fee
		$loan_interesttotal = ceil((($loan_principal / 100 * $loan_interest) * $loan_period)/50)*50;		
		$loan_principaldue = round($loan_principal / $loan_period);
		$loan_interestdue = round($loan_principal / 100 * $loan_interest);
		$loan_fee = $loan_principal / 100 * $loan_feerate;
		
		//Insert Loan into LOANS
		$loan_repaytotal = $loan_principal + $loan_interesttotal;
		$loan_rate = $loan_principaldue + $loan_interestdue;
		$sql_insert_loan = "INSERT INTO loans (cust_id, loanstatus_id, loan_no, loan_date, loan_issued, loan_principal, loan_interest, cur_id, loan_appfee_receipt, loan_fee, loan_rate, loan_period, loan_repaytotal, loan_purpose, loan_sec1, loan_sec2, loan_guarant1, loan_guarant2, loan_guarant3, loan_created, user_id) VALUES ('$_SESSION[cust_id]', '1', '$loan_no', '$loan_date', '0', '$loan_principal', '$loan_interest', '1', '$loan_appfee_receipt', '$loan_fee', '$loan_rate', '$loan_period', $loan_repaytotal, '$loan_purpose', '$loan_sec1', '$loan_sec2', '$loan_guarant1', '$loan_guarant2', '$loan_guarant3', $timestamp, '$_SESSION[log_id]')";
		$query_insert_loan = mysql_query($sql_insert_loan);
		check_sql($query_insert_loan);
		
		//Insert Loan Application Fee into INCOMES
		$sql_inc_laf = "INSERT INTO incomes (cust_id, inctype_id, inc_amount, inc_date, inc_receipt, inc_created, user_id) VALUES ('$_SESSION[cust_id]', '7', '$loan_appfee', '$loan_date', '$loan_appfee_receipt', $timestamp, '$_SESSION[log_id]')";
		$query_inc_laf = mysql_query($sql_inc_laf);
		check_sql($query_inc_laf);
		
		//Refer to CUSTOMER
		header('Location: customer.php?cust='.$_SESSION['cust_id']);
	}
?>

<html>
	<?PHP htmlHead('New Loan',0) ?>	
		<script type="text/javascript">
			function calc_rate(feerate){
				var amount, interest, instal, rate;
				amount = (document.getElementById("loan_principal").value * 1);
				interest = (document.getElementById("loan_interest").value * 1);
				instal = (document.getElementById("loan_period").value * 1);
				repaytotal = Math.ceil((amount + (amount/100*interest*instal)) / 50) * 50;
				rate = repaytotal / instal;
				fee = (amount/100*feerate);
				document.getElementById("loan_repaytotal").value = repaytotal;
				document.getElementById("loan_rate").value = Math.round(rate);
				document.getElementById("loan_fee").value = fee;
			}
			
			function validate(form){
				fail = validatePrincipal(form.loan_principal.value)
				fail += validateInstalment(form.loan_period.value)
				fail += validateInterest(form.loan_interest.value)
				fail += validatePurpose(form.loan_purpose.value)
				fail += validateSecurity(form.loan_sec1.value)
				fail += validateGuarantors(form.loan_guarant1.value, form.loan_guarant2.value, form.loan_guarant3.value)
				fail += validateDate(form.loan_date.value)
				fail += validateReceipt(form.loan_appfee_receipt.value)
				if (fail == "") return true
				else { alert(fail); return false }
			}
		</script>
		<script src="functions_validate.js"></script>
	</head>
	
	<body>
		<!-- MENU HEADER & TABS -->
		<?PHP 
		include 'menu_header.php';
		menu_Tabs(2);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="customer.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Back</a>
			<a href="cust_search.php">Search</a>
			<a href="acc_sav_depos.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Deposit</a>
			<a href="acc_sav_withd.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Withdrawal</a>
			<a href="acc_share.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Add Shares</a>
			<a href="loan_new.php?cust=<?PHP echo $_SESSION['cust_id'] ?>" id="item_selected">New Loan</a>
			<a href="cust_new.php">New Customer</a>
			<a href="cust_act.php">Active Cust.</a>
			<a href="cust_inact.php">Inactive Cust.</a>
		</div>
			
		<div class="content_center">
			<p class="heading">New Loan Application for <?PHP echo $result_cust['cust_name'].' ('.$result_cust['cust_id'].')'?></p>
			<form action="loan_new.php" method="post" onSubmit="return validate(this)">
				<table id ="tb_fields" style="width:85%;">
					<colgroup>
						<col width="15%">
						<col width="35%">
						<col width="15%">
						<col width="35%">
					</colgroup>

					<tr>
						<td style="font-weight:bold;">Principal:</td>
						<td><input type="number" class="defaultnumber" name="loan_principal" id="loan_principal" placeholder="Loan Sum in UGX" min="<?PHP echo $minLP[0]; ?>" max="<?PHP echo $maxLP[0]; ?>" onChange="calc_rate(<?PHP echo $loan_feerate ?>)" /></td>
						<td style="font-weight:bold;">Period:</td>
						<td><input type="number" class="defaultnumber" name="loan_period" id="loan_period" placeholder="Number of Months" onChange="calc_rate(<?PHP echo $loan_feerate ?>)" /></td>
					</tr>
					<tr>
						<td style="font-weight:bold;">Interest Rate:</td>
						<td><input type="text" name="loan_interest" id="loan_interest" value="<?PHP echo $loan_intrate; ?>" placeholder="% per month" onChange="calc_rate(<?PHP echo $loan_feerate ?>)" /></td>
						<td style="font-weight:bold;">Purpose:</td>
						<td><input type="text" name="loan_purpose" placeholder="Purpose for the Loan" /></td>
					</tr>
					<tr>
						<td style="font-weight:bold;">Security 1:</td>
						<td><input type="text" name="loan_sec1" placeholder="First Security" /></td>
						<td>Security 2:</td>
						<td><input type="text" name="loan_sec2" placeholder="Second Security" /></td>
					</tr>
					<tr>
						<td style="font-weight:bold;">Guarantor 1:</td>
						<td>
							<select name="loan_guarant1" style="width:158px;">
								<option selected="selected"></option>
								<?PHP
								foreach ($guarantors as $g){
									echo '<option value="'.$g['cust_id'].'">'.$g['cust_id'].' '.$g['cust_name'].'</option>';
								}
								?>
							</select>
						</td>
						<td style="font-weight:bold;">Guarantor 2:</td>
						<td>
							<select name="loan_guarant2" style="width:158px;">
								<option selected="selected"></option>
								<?PHP
								foreach ($guarantors as $g){
									echo '<option value="'.$g['cust_id'].'">'.$g['cust_id'].' '.$g['cust_name'].'</option>';
								}
								?>
							</select>
						</td>
					</tr>
					<tr>
						<td style="font-weight:bold;">Guarantor 3:</td>
						<td>
							<select name="loan_guarant3" style="width:158px;">
								<option selected="selected"></option>
								<?PHP
								foreach ($guarantors as $g){
									echo '<option value="'.$g['cust_id'].'">'.$g['cust_id'].' '.$g['cust_name'].'</option>';
								}
								?>
							</select>
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Monthly Rate:</td>
						<td><input name="loan_rate" id="loan_rate" disabled="disabled" /></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Repay Total:</td>
						<td><input name="loan_repaytotal" id="loan_repaytotal" disabled="disabled" /></td>
						<td>Loan Fee:</td>
						<td><input name="loan_fee" id="loan_fee" disabled="disabled" /></td>
					</tr>
					
					<tr>
						<td style="font-weight:bold;">Date of Applic.:</td>
						<td>
							<input type="text" name="loan_date" id="loan_date" placeholder="DD.MM.YYYY" value="<?PHP echo date("d.m.Y",$timestamp) ?>" />
						</td>
						<td style="font-weight:bold;">Receipt No:</td>
						<td>
							<input type="number" class="defaultnumber" name="loan_appfee_receipt" id="loan_appfee_receipt" placeholder="for Loan Appl. Fee" />
						</td>
					</tr>
				
					<tr>
						<td class="center" colspan="4">
							<input type="submit" name="newloan" value="New Loan" />
						</td>
					</tr>
				
				</table>
			</form>
		</div>
	</body>
</html>
