<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	$db_link = connect();
	getCustID($db_link);

	//Generate timestamp
	$timestamp = time();

	// Update savings balance for current customer and store into variable
	updateSavingsBalance ($db_link, $_SESSION['cust_id']);
	$sav_balance = getSavingsBalance($db_link, $_SESSION['cust_id']);

	// DEPOSIT-Button
	if (isset($_POST['deposit'])){

		// Sanitize user input
		$sav_date = strtotime(sanitize($db_link, $_POST['sav_date']));
		$sav_amount = sanitize($db_link, $_POST['sav_amount']);
		$sav_receipt = sanitize($db_link, $_POST['sav_receipt']);
		$sav_payer = sanitize($db_link, $_POST['sav_payer']);
		if($_POST['sav_fixed'] != "") $sav_fixed = strtotime(sanitize($db_link, $_POST['sav_fixed']));
		else $sav_fixed = NULL;
		$savtype_id = sanitize($db_link, $_POST['savtype_id']);

		// Insert savings transaction into SAVINGS
		$sql_insert = "INSERT INTO savings (savtype_id, cust_id, sav_date, sav_amount, sav_receipt, sav_payer, sav_fixed, sav_created, user_id) VALUES ('$savtype_id', '$_SESSION[cust_id]', '$sav_date', '$sav_amount', '$sav_receipt', '$sav_payer', '$sav_fixed', '$timestamp', '$_SESSION[log_id]')";
		$query_insert = mysqli_query($db_link, $sql_insert);
		checkSQL($db_link, $query_insert);

		// Update savings account balance
		updateSavingsBalance($db_link, $_SESSION['cust_id']);

		// Include Expense, if transaction was Savings Interest
		if ($savtype_id == 3){
			$sql_expense = "INSERT INTO expenses (cust_id, exptype_id, exp_amount, exp_date, exp_voucher, exp_created, user_id) VALUES ('$_SESSION[cust_id]', '19', '$sav_amount', '$sav_date', '$sav_receipt', '$timestamp', '$_SESSION[log_id]')";
			$query_expense = mysqli_query($db_link, $sql_expense);
			checkSQL($db_link, $query_expense);
		}

		//Refer to acc_sav_depos.php
		header('Location: acc_sav_depos.php?cust='.$_SESSION['cust_id']);
	}

	//Get current customer's details
	$result_cust = getCustomer($db_link, $_SESSION['cust_id']);
?>

<html>
	<?PHP includeHead('Savings Deposit',0) ?>
		<script>
			function validate(form){
				fail = validateDate(form.sav_date.value)
				fail += validateReceipt(form.sav_receipt.value)
				fail += validateAmount(form.sav_amount.value)
				if (fail == "") return true
				else { alert(fail); return false }
			}
		</script>
		<script src="functions_validate.js"></script>
		<script src="function_randCheck.js"></script>
	</head>

	<body>
		<!-- MENU -->
		<?PHP includeMenu(2); ?>
		<div id="menu_main">
			<a href="customer.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Back</a>
			<a href="cust_search.php">Search</a>
			<a href="acc_sav_depos.php?cust=<?PHP echo $_SESSION['cust_id'] ?>" id="item_selected">Deposit</a>
			<a href="acc_sav_withd.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Withdrawal</a>
			<a href="acc_share_buy.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Share Buy</a>
			<a href="acc_share_sale.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Share Sale</a>
			<a href="loan_new.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">New Loan</a>
			<a href="cust_new.php">New Customer</a>
			<a href="cust_act.php">Active Cust.</a>
			<a href="cust_inact.php">Inactive Cust.</a>
		</div>

		<!-- LEFT SIDE: Input for new Deposit -->
		<div class="content_left" style="width:35%;">

			<p class="heading_narrow">Deposit for <?PHP echo $result_cust['cust_name'].' ('.$result_cust['cust_no'].')'; ?></p>

			<form action="acc_sav_depos.php" method="post" onsubmit="return validate(this);">
				<table id="tb_fields">
					<tr>
						<td>Date:</td>
						<td><input type="text" id="datepicker" name="sav_date" value="<?PHP echo date("d.m.Y",$timestamp); ?>" placeholder="DD.MM.YYYY" tabindex="1" required="required" /></td>
					</tr>
					<?PHP
					if ($_SESSION['set_sfx'] == 1)
						echo '
						<tr>
							<td>Transaction Type:</td>
							<td>
								<select name="savtype_id">
									<option value="1">Deposit</option>
									<option value="3">Savings Interest</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Fix Deposit until:</td>
							<td><input type="text" id="datepicker2" name="sav_fixed" placeholder="DD.MM.YYYY" tabindex="2" /></td>
						</tr>';
					else echo '<input type="hidden" name="savtype_id" value="1" />';
					?>
					<tr>
						<td>Amount:</td>
						<td><input type="number" name="sav_amount" placeholder="<?PHP echo $_SESSION['set_cur']; ?>" class="defaultnumber" min=1 tabindex="3" required="required" /></td>
					</tr>
					<tr>
						<td>Receipt No:</td>
						<td><input type="number" name="sav_receipt" placeholder="for Deposit Transaction" class="defaultnumber" tabindex="4" required="required" /></td>
					</tr>
					<tr>
						<td>Depositor:</td>
						<td><input type="text" name="sav_payer" placeholder="if not account holder" tabindex="5" /></td>
					</tr>
					<tr>
						<td colspan="2" class="center"><input type="submit" name="deposit" value="Deposit" tabindex="6" /></td>
					</tr>
				</table>
			</form>
		</div>

		<!-- RIGHT SIDE: Statement for Savings Account -->
		<div class="content_right" style="width:65%;">

			<?PHP include 'acc_sav_list.php'; ?>

		</div>
	</body>
</html>
