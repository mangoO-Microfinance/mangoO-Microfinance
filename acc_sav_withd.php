<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	$db_link = connect();
	getCustID($db_link);

	//Generate Timestamp
	$timestamp = time();

	// Update savings balance for current customer and store into variable
	updateSavingsBalance ($db_link, $_SESSION['cust_id']);
	$sav_balance = getSavingsBalance($db_link, $_SESSION['cust_id']);
	$sav_fixed = getSavingsFixed($db_link, $_SESSION['cust_id']);

	// WITHDRAW-Button
	if (isset($_POST['withdraw'])){

		//Sanitize user input
		$sav_amount = sanitize($db_link, $_POST['sav_amount'])*(-1);
		$sav_slip = sanitize($db_link, $_POST['sav_slip']);
		$sav_receipt = sanitize($db_link, $_POST['sav_receipt']);
		$sav_date = strtotime(sanitize($db_link, $_POST['sav_date']));
		$sav_deduct = sanitize($db_link, $_POST['sav_deduct']);

		// Insert into SAVINGS
		$sql_insert = "INSERT INTO savings (cust_id, sav_date, sav_amount, savtype_id, sav_receipt, sav_slip, sav_created, user_id) VALUES ('$_SESSION[cust_id]', '$sav_date', $sav_amount, '2', '$sav_receipt', '$sav_slip', '$timestamp', '$_SESSION[log_id]')";
		$query_insert = mysqli_query($db_link, $sql_insert);
		checkSQL($db_link, $query_insert);

		// Update savings account balance
		updateSavingsBalance($db_link, $_SESSION['cust_id']);

		// Get SAV_ID for the latest entry
		$sql_savid = "SELECT MAX(sav_id) FROM savings WHERE cust_id = '$_SESSION[cust_id]' AND sav_receipt = '$sav_receipt' AND sav_created = '$timestamp'";
		$query_savid = mysqli_query($db_link, $sql_savid);
		checkSQL($db_link, $query_savid);
		$sav_id = mysqli_fetch_row($query_savid);

		// Insert Fee into INCOMES
		$sql_insert_income = "INSERT INTO incomes (cust_id, inctype_id, sav_id, inc_amount, inc_date, inc_receipt, inc_created, user_id) VALUES ('$_SESSION[cust_id]', '2', '$sav_id[0]', '$_SESSION[fee_withdraw]', '$sav_date', '$sav_receipt', '$timestamp', '$_SESSION[log_id]')";
		$query_insert_income = mysqli_query($db_link, $sql_insert_income);
		checkSQL($db_link, $query_insert_income);

		// Insert Fee into SAVINGS, if applicable
		if($sav_deduct == 1){
			$fee_withdraw_neg = ($_SESSION['fee_withdraw'] * -1);

			$sql_insert_fee = "INSERT INTO savings (sav_mother, cust_id, sav_date, sav_amount, savtype_id, sav_receipt, sav_slip, sav_created, user_id) VALUES ('$sav_id[0]', '$_SESSION[cust_id]', '$sav_date', '$fee_withdraw_neg', '4', '$sav_receipt', '$sav_slip', '$timestamp', '$_SESSION[log_id]')";
			$query_insert_fee = mysqli_query($db_link, $sql_insert_fee);
			checkSQL($db_link, $query_insert_fee);

			// Update savings account balance
			updateSavingsBalance($db_link, $_SESSION['cust_id']);
		}

		// Forward to acc_sav_withd.php
		header('Location: acc_sav_withd.php?cust='.$_SESSION['cust_id']);
	}

	// Get current customer's details
	$result_cust = getCustomer($db_link, $_SESSION['cust_id']);
?>

<html>
	<?PHP includeHead('Savings Withdrawal',0) ?>
		<script>
			function validate(form){
				var savbalance = <?PHP echo $sav_balance; ?>;
				var savfixed = <?PHP echo $sav_fixed; ?>;
				var minsavbal = <?PHP echo $_SESSION['set_msb']; ?>;
				if (document.getElementById('sav_deduct').checked) var wd_fee = <?PHP echo $_SESSION['fee_withdraw']; ?>;
					else var wd_fee = 0;
				fail = validateDate(form.sav_date.value)
				fail += validateSlip(form.sav_slip.value)
				fail += validateAmount(form.sav_amount.value)
				fail += validateOverdraft(form.sav_amount.value, savbalance, wd_fee, minsavbal, savfixed)
				fail += validateReceipt(form.sav_receipt.value)
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
			<a href="acc_sav_depos.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Deposit</a>
			<a href="acc_sav_withd.php?cust=<?PHP echo $_SESSION['cust_id'] ?>" id="item_selected">Withdrawal</a>
			<a href="acc_share_buy.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Share Buy</a>
			<a href="acc_share_sale.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Share Sale</a>
			<a href="loan_new.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">New Loan</a>
			<a href="cust_new.php">New Customer</a>
			<a href="cust_act.php">Active Cust.</a>
			<a href="cust_inact.php">Inactive Cust.</a>
		</div>

		<!-- LEFT SIDE: Input for new Withdrawal -->
		<div class="content_left" style="width:35%;">
			<p class="heading_narrow">Withdrawal for <?PHP echo $result_cust['cust_name'].' ('.$result_cust['cust_no'].')'; ?> </p>

			<form action="acc_sav_withd.php" method="post" onsubmit="return validate(this);">
				<table id="tb_fields">
					<tr>
						<td>Date:</td>
						<td><input type="text" id="datepicker" name="sav_date" value="<?PHP echo date("d.m.Y",$timestamp); ?>" tabindex="1" required="required" /></td>
					</tr>
					<tr>
						<td>Amount:</td>
						<td><input type="number" name="sav_amount" placeholder="<?PHP echo $_SESSION['set_cur'] ?>" class="defaultnumber" min=1 tabindex="2" required="required" /></td>
					</tr>
					<tr>
						<td>W/drawal Slip:</td>
						<td><input type="number" name="sav_slip" placeholder="Slip No." class="defaultnumber" tabindex="3" required="required" /></td>
					</tr>
					<tr>
						<td>Receipt No:</td>
						<td><input type="number" name="sav_receipt" placeholder="for Withdrawal Fee" class="defaultnumber" tabindex="4" required="required" /></td>
					</tr>
					<tr>
						<td>W/drawal Fee:</td>
						<td><input type="checkbox" name="sav_deduct" id="sav_deduct" value="1" tabindex="5" /> deduct from Savings</td>
					</tr>
					<tr>
						<td colspan="2" class="center"><input type="submit" name="withdraw" value="Withdraw" tabindex="6"  /></td>
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
