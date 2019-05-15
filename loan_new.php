<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	$db_link = connect();
	getCustID($db_link);
	$timestamp = time();

	// Get current customer's details
	$result_cust = getCustomer($db_link, $_SESSION['cust_id']);
	$savbalance = getSavingsBalance($db_link, $_SESSION['cust_id']);

	//NEW LOAN-Button
	if (isset($_POST['newloan'])){

		//Calculate new Loan Number
		$sql_loanno = "SELECT loan_id FROM loans WHERE cust_id = '$_SESSION[cust_id]'";
		$query_loanno = mysqli_query($db_link, $sql_loanno);
		checkSQL($db_link, $query_loanno);
		$numberofloans = array();
		while ($row_loanno = mysqli_fetch_array($query_loanno)) $numberofloans[] = $row_loanno;
		$loan_no = 'L-'.$result_cust['cust_no'].'-'.(count($numberofloans) + 1);

		//Sanitize user input
		$loan_date = strtotime(sanitize($db_link, $_POST['loan_date']));
		$loan_principal = sanitize($db_link, $_POST['loan_principal']);
		$loan_interest = sanitize($db_link, $_POST['loan_interest']);
		$loan_period = sanitize($db_link, $_POST['loan_period']);
		$loan_purpose = sanitize($db_link, $_POST['loan_purpose']);
		$loan_sec1 = sanitize($db_link, $_POST['loan_sec1']);
		$loan_sec2 = sanitize($db_link, $_POST['loan_sec2']);;
		$loan_guarant1 = sanitize($db_link, $_POST['loan_guarant1']);
		$loan_guarant2 = sanitize($db_link, $_POST['loan_guarant2']);
		$loan_guarant3 = sanitize($db_link, $_POST['loan_guarant3']);
		$loan_appfee_receipt = sanitize($db_link, $_POST['loan_appfee_receipt']);
		if($_SESSION['set_xl1'] != "") $loan_xtra1 = sanitize($db_link, $_POST['loan_xtra1']);
		else $loan_xtra1 = NULL;
		if($_SESSION['fee_xl1'] != 0) $loan_xtraFee1 = $_SESSION['fee_xl1'];
		else $loan_xtraFee1 = NULL;

		//Calculate expected total interest, monthly rates, and fees
		$loan_principaldue = round($loan_principal / $loan_period, -3);
		$loan_interesttotal = ceil((($loan_principal / 100 * $loan_interest) * $loan_period)/50)*50;
		$loan_interestdue = round($loan_principal / 100 * $loan_interest);
		$loan_repaytotal = $loan_principal + $loan_interesttotal;
		$loan_rate = $loan_principaldue + $loan_interestdue;
		$loan_fee = $loan_principal / 100 * $_SESSION['fee_loan'];
		$loan_insurance = $loan_principal / 100 * $_SESSION['fee_loaninsurance'];

		//Insert Loan into LOANS
		$sql_insert_loan = "INSERT INTO loans (cust_id, loanstatus_id, loan_no, loan_date, loan_issued, loan_principal, loan_interest, loan_appfee_receipt, loan_fee, loan_insurance, loan_rate, loan_period, loan_repaytotal, loan_purpose, loan_guarant1, loan_guarant2, loan_guarant3, loan_created, loan_xtra1, loan_xtraFee1, user_id) VALUES ('$_SESSION[cust_id]', '1', '$loan_no', '$loan_date', '0', '$loan_principal', '$loan_interest', '$loan_appfee_receipt', '$loan_fee', '$loan_insurance', '$loan_rate', '$loan_period', $loan_repaytotal, '$loan_purpose', '$loan_guarant1', '$loan_guarant2', '$loan_guarant3', $timestamp, '$loan_xtra1', '$loan_xtraFee1', '$_SESSION[log_id]')";
		$query_insert_loan = mysqli_query($db_link, $sql_insert_loan);
		checkSQL($db_link, $query_insert_loan);

		//Retrieve LOAN_ID of newly created loan from LOANS and pass to SESSION variable
		$sql_newloanid = "SELECT MAX(loan_id) FROM loans WHERE cust_id = '$_SESSION[cust_id]'";
		$query_newloanid = mysqli_query($db_link, $sql_newloanid);
		checkSQL($db_link, $query_newloanid);
		$result_newloanid = mysqli_fetch_assoc($query_newloanid);
		$_SESSION['loan_id'] = $result_newloanid['MAX(loan_id)'];

		//Insert loan securities into SECURITIES
		if($loan_sec1 != ""){
			$sql_insert_sec1 = "INSERT INTO securities (cust_id, loan_id, sec_no, sec_name, sec_value, sec_path, sec_returned) VALUES ($_SESSION[cust_id], $_SESSION[loan_id], '1', '$loan_sec1', 0, '', 0)";
			$query_insert_sec1 = mysqli_query($db_link, $sql_insert_sec1);
			checkSQL($db_link, $query_insert_sec1);
		}
		if($loan_sec2 != ""){
			$sql_insert_sec2 = "INSERT INTO securities (cust_id, loan_id, sec_no, sec_name, sec_value, sec_path, sec_returned) VALUES ($_SESSION[cust_id], $_SESSION[loan_id], '2', '$loan_sec2', 0, '', 0)";
			$query_insert_sec2 = mysqli_query($db_link, $sql_insert_sec2);
			checkSQL($db_link, $query_insert_sec2);
		}

		//Insert Loan Application Fee into INCOMES
		$sql_inc_laf = "INSERT INTO incomes (cust_id, loan_id, inctype_id, inc_amount, inc_date, inc_receipt, inc_created, user_id) VALUES ('$_SESSION[cust_id]', '$_SESSION[loan_id]', '7', '$_SESSION[fee_loanappl]', '$loan_date', '$loan_appfee_receipt', $timestamp, '$_SESSION[log_id]')";
		$query_inc_laf = mysqli_query($db_link, $sql_inc_laf);
		checkSQL($db_link, $query_inc_laf);

		//Refer to LOAN_SEC.PHP
		header('Location: loan_sec.php?lid='.$_SESSION['loan_id']);
	}

	/* SELECT LEGITIMATE GUARANTORS FROM CUSTOMER */

	//Select all customers except current one
	$query_cust = getCustOther($db_link);

	$guarantors = array();
	if ($_SESSION['set_maxguar'] == ""){
		while ($row_cust = mysqli_fetch_assoc($query_cust)){
			if ($row_cust['cust_active'] == 1) $guarantors[] = $row_cust;
		}
	}
	else {
		//Select all guarantors of active loans
		$sql_guarantact = "SELECT loan_guarant1, loan_guarant2, loan_guarant3 FROM loans WHERE loanstatus_id = 2";
		$query_guarantact = mysqli_query($db_link, $sql_guarantact);
		checkSQL($db_link, $query_guarantact);
		$guarantact = array();
		while($row_guarantact = mysqli_fetch_assoc($query_guarantact)){
			$guarantact[] = $row_guarantact;
		}

		//Choose only those customers as legitimate guarantors who are not guarantors for more than a specified number of active loans

		while ($row_cust = mysqli_fetch_assoc($query_cust)){
			$guarant_count = 0;

			foreach($guarantact as $ga){
				if ($ga['loan_guarant1'] == $row_cust['cust_id']) $guarant_count = $guarant_count + 1;
				if ($ga['loan_guarant2'] == $row_cust['cust_id']) $guarant_count = $guarant_count + 1;
				if ($ga['loan_guarant3'] == $row_cust['cust_id']) $guarant_count = $guarant_count + 1;
			}

			if ($guarant_count < $_SESSION['set_maxguar']) $guarantors[] = $row_cust;
		}
	}

	// Compute Maximum and Minimum principal amount
	if ($_SESSION['set_maxlp'] != "" AND $_SESSION['set_maxpsr'] != ""){
		if(($savbalance * ($_SESSION['set_maxpsr']/100)) < $_SESSION['set_maxlp'])
			$maxlp = ($savbalance * ($_SESSION['set_maxpsr']/100));
		else
			$maxlp = $_SESSION['set_maxlp'];
	}
	elseif ($_SESSION['set_maxlp'] == "" AND $_SESSION['set_maxpsr'] != "")
		$maxlp = ($savbalance * ($_SESSION['set_maxpsr']/100));
	elseif ($_SESSION['set_maxlp'] != "" AND $_SESSION['set_maxpsr'] == "")
		$maxlp = $_SESSION['set_maxlp'];
	else $maxlp = "";

	if ($_SESSION['set_minlp'] != "") $minlp = $_SESSION['set_minlp'];
	else $minlp = 1;
?>

<html>
	<?PHP includeHead('New Loan',0) ?>
		<script type="text/javascript">
			function calc_rate(feerate){
				var amount, interest, instal, rate;
				amount = (document.getElementById("loan_principal").value * 1);
				interest = (document.getElementById("loan_interest").value * 1);
				instal = (document.getElementById("loan_period").value * 1);
				/*
				repaytotal = Math.ceil((amount + (amount/100*interest*instal)) / 50) * 50;
				rate = Math.round(repaytotal / instal);
				document.getElementById("loan_repaytotal").value = repaytotal;
				document.getElementById("loan_rate").value = rate;
				*/
				fee = (amount/100*feerate);
				insurance=(amount/100*<?PHP echo $_SESSION['fee_loaninsurance']; ?>);
				document.getElementById("loan_fee").value = fee;
				document.getElementById("loan_insurance").value = insurance;
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
		<!-- MENU -->
		<?PHP includeMenu(2); ?>
		<div id="menu_main">
			<a href="customer.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Back</a>
			<a href="cust_search.php">Search</a>
			<a href="acc_sav_depos.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Deposit</a>
			<a href="acc_sav_withd.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Withdrawal</a>
			<a href="acc_share_buy.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Share Buy</a>
			<a href="loan_new.php?cust=<?PHP echo $_SESSION['cust_id'] ?>" id="item_selected">New Loan</a>
			<a href="cust_new.php">New Customer</a>
			<a href="cust_act.php">Active Cust.</a>
			<a href="cust_inact.php">Inactive Cust.</a>
		</div>

		<div class="content_center">
			<p class="heading">New Loan Application for <?PHP echo $result_cust['cust_name'].' ('.$result_cust['cust_no'].')'; ?></p>
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
						<td><input type="number" class="defaultnumber" name="loan_principal" id="loan_principal" placeholder="Loan Sum in <?PHP echo $_SESSION['set_cur']; ?>" min="<?PHP echo $minlp; ?>" max="<?PHP echo $maxlp; ?>" onChange="calc_rate(<?PHP echo $_SESSION['fee_loan']; ?>)" /></td>
						<td style="font-weight:bold;">Period:</td>
						<td><input type="number" class="defaultnumber" name="loan_period" id="loan_period" placeholder="Number of Months" onChange="calc_rate(<?PHP echo $_SESSION['fee_loan']; ?>)" /></td>
					</tr>
					<tr>
						<td style="font-weight:bold;">Interest Rate:</td>
						<td><input type="text" name="loan_interest" id="loan_interest" value="<?PHP echo $_SESSION['fee_loaninterestrate']; ?>" placeholder="% per month" onChange="calc_rate(<?PHP echo $_SESSION['fee_loan']; ?>)" /></td>
						<td style="font-weight:bold;">Purpose:</td>
						<td><input type="text" name="loan_purpose" placeholder="Purpose for the Loan" /></td>
					</tr>
					<tr>
						<td style="font-weight:bold;">Security 1:</td>
						<td><input type="text" name="loan_sec1" placeholder="First Security" /></td>
						<td>Security 2:</td>
						<td><input type="text" name="loan_sec2" placeholder="Second Security" /></td>
					</tr>
					<?PHP
					for($i=1; $i<=$_SESSION['set_maxguar']; $i++){ ?>
						<tr>
						<td style="font-weight:bold;">Guarantor <?PHP echo $i ?>:</td>
						<td>
							<select name="loan_guarant<?PHP echo $i ?>" style="width:158px;">
								<option selected="selected"></option>
								<?PHP
								foreach ($guarantors as $g){
									echo '<option value="'.$g['cust_id'].'">'.$g['cust_no'].' '.$g['cust_name'].'</option>';
								}
								?>
							</select>
						</td>
					<?PHP } ?>
						<td><?PHP if($_SESSION['set_xl1'] != "") echo $_SESSION['set_xl1'].':'; ?></td>
						<td><?PHP if($_SESSION['set_xl1'] != "") echo '<input type="text" name="loan_xtra1" id="loan_xtra1" />'; ?></td>
					</tr>

					<!--
					<tr>
						<td>Monthly Rate:</td>
						<td><input type="text" name="loan_rate" id="loan_rate" disabled="disabled" /></td>
						<td>Repay Total:</td>
						<td><input type="text" name="loan_repaytotal" id="loan_repaytotal" disabled="disabled" /></td>
					</tr>
					-->

					<tr>
						<td>Loan Fee:</td>
						<td><input type="text" name="loan_fee" id="loan_fee" disabled="disabled" /></td>
						<td>Loan Insurance:</td>
						<td><input type="text" name="loan_insurance" id="loan_insurance" disabled="disabled" /></td>
					</tr>

					<tr>
						<td style="font-weight:bold;">Date of Applic.:</td>
						<td>
							<input type="text" id="datepicker" name="loan_date" placeholder="DD.MM.YYYY" value="<?PHP echo date("d.m.Y",$timestamp) ?>" />
						</td>
						<td style="font-weight:bold;">Receipt No:</td>
						<td>
							<input type="number" class="defaultnumber" name="loan_appfee_receipt" placeholder="for Loan Appl. Fee" />
						</td>
					</tr>

					<tr>
						<td class="center" colspan="4">
							<input type="submit" name="newloan" value="Continue" />
						</td>
					</tr>

				</table>
			</form>
		</div>
	</body>
</html>
