<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	$db_link = connect();

	getCustID($db_link);

	//Generate timestamp
	$timestamp = time();

	//Get current share value
	getShareValue($db_link);

	//Get current customer's details
	$result_cust = getCustomer($db_link, $_SESSION['cust_id']);

	//Get current customer's share balance
	$share_balance = getShareBalance($db_link, $_SESSION['cust_id']);

	//Get all other customers
	$query_custother = getCustOther($db_link);

	//SELL SHARE-Button
	if (isset($_POST['sharesell'])){

		//Sanitize user input
		$share_date = strtotime(sanitize($db_link, $_POST['share_date']));
		$share_receipt = sanitize($db_link, $_POST['share_receipt']);
		$share_amount = (sanitize($db_link, $_POST['share_amount'])) * (-1);
		$share_value = $_SESSION['share_value'] * $share_amount;

		//Insert into SHARES
		$sql_insert_sh = "INSERT INTO shares (cust_id, share_date, share_amount, share_value, share_receipt, share_created, user_id) VALUES ('$_SESSION[cust_id]', '$share_date', '$share_amount', '$share_value', '$share_receipt', $timestamp, '$_SESSION[log_id]')";
		$query_insert_sh = mysqli_query($db_link, $sql_insert_sh);
		checkSQL($db_link, $query_insert_sh);

		header('Location: acc_share_sale.php?cust='.$_SESSION['cust_id']);
	}
?>

<html>
<?PHP includeHead('Sell Shares',0) ?>
	<script>
		function validate(form){
			fail = validateDate(form.share_date.value)
			fail += validateReceipt(form.share_receipt.value)
			if (fail == "") return true
			else { alert(fail); return false }
		}

		function setVisibility(id, visibility) {
			document.getElementById(id).style.display = visibility;
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
			<a href="acc_sav_withd.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Withdrawal</a>
			<a href="acc_share_buy.php?cust=<?PHP echo $_SESSION['cust_id'] ?>" >Share Buy</a>
			<a href="acc_share_sale.php?cust=<?PHP echo $_SESSION['cust_id'] ?>" id="item_selected">Share Sale</a>
			<a href="loan_new.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">New Loan</a>
			<a href="cust_new.php">New Customer</a>
			<a href="cust_act.php">Active Cust.</a>
			<a href="cust_inact.php">Inactive Cust.</a>
		</div>

		<!-- Left Side: Input for Share Addition -->
		<div class="content_left">

			<p class="heading_narrow">Share Sale for <?PHP echo $result_cust['cust_name'].' ('.$result_cust['cust_no'].')'; ?></p>

			<form action="acc_share_sale.php" method="post" onSubmit="return validate(this)">

				<table id="tb_fields">
					<tr>
						<td>Date:</td>
						<td>
							<input type="text" id="datepicker" name="share_date" <?PHP echo 'value="'.date("d.m.Y", $timestamp).'"' ?> />
						</td>
					</tr>
					<tr>
						<td>Receipt No:</td>
						<td>
							<input type="number" name="share_receipt" <?PHP if(isset($_GET['rec'])) echo 'value="'.$_GET['rec'].'"' ?> />
						</td>
					</tr>
					<tr>
						<td>Number of Shares:</td>
						<td>
							<select name="share_amount">
								<?PHP
								for ($i = 1; $i <= $share_balance['amount']; $i++) {
									echo '<option value="'.$i.'">'.$i.' @ '.number_format($_SESSION['share_value'] * $i).' '.$_SESSION['set_cur'].'</option>';
								}
								?>
							</select>
						</td>
					</tr>
					<tr>
						<td class="center" colspan="2">
							<input type="submit" name="sharesell" value="Sell Shares" />
						</td>
					</tr>
				</table>
			</form>
		</div>

		<!-- RIGHT SIDE: Share Account Details -->
		<div class="content_right">
			<?PHP include 'acc_share_list.php'; ?>
		</div>
	</body>
</html>
