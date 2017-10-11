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

	//BUY SHARE-Button
	if (isset($_POST['sharebuy'])){

		//Sanitize user input
		$share_date = strtotime(sanitize($db_link, $_POST['share_date']));
		$share_receipt = sanitize($db_link, $_POST['share_receipt']);
		$share_amount = sanitize($db_link, $_POST['share_amount']);
		$share_value = $_SESSION['share_value'] * $share_amount;

		//Insert into SHARES
		$sql_insert_sh = "INSERT INTO shares (cust_id, share_date, share_amount, share_value, share_receipt, share_created, user_id) VALUES ('$_SESSION[cust_id]', '$share_date', '$share_amount', '$share_value', '$share_receipt', $timestamp, '$_SESSION[log_id]')";
		$query_insert_sh = mysqli_query($db_link, $sql_insert_sh);
		checkSQL($db_link, $query_insert_sh);

		header('Location: acc_share_buy.php?cust='.$_SESSION['cust_id']);
	}

	//TRANSFER-Button
	if (isset($_POST['shtrans'])){
		$shtrans_cust = sanitize($db_link, $_POST['shtrans_cust']);

		$sql_shfrom = "SELECT * FROM shares WHERE cust_id = '$shtrans_cust'";
		$query_shfrom = mysqli_query($db_link, $sql_shfrom);
		checkSQL($db_link, $query_shfrom);

		$shfrom_amount = 0;
		$shfrom_value = 0;
		while($row_shfrom = mysqli_fetch_assoc($query_shfrom)){
			$shfrom_amount = $shfrom_amount + $row_shfrom['share_amount'];
			$shfrom_value = $shfrom_value + $row_shfrom['share_value'];
		}

		//Insert into SHARES for Target Customer
		$sql_shto = "INSERT INTO shares (cust_id, share_date, share_amount, share_value, share_trans, share_transfrom, share_created, user_id) VALUES ('$_SESSION[cust_id]', '$timestamp', '$shfrom_amount', '$shfrom_value', '1', '$shtrans_cust', $timestamp, '$_SESSION[log_id]')";
		$query_shto = mysqli_query($db_link, $sql_shto);
		checkSQL($db_link, $query_shto);

		//Empty Share Account for Source Customer
		$shfrom_amount_del = $shfrom_amount * (-1);
		$shfrom_value_del = $shfrom_value * (-1);
		$sql_shdel = "INSERT INTO shares (cust_id, share_date, share_amount, share_value, share_trans, share_created, user_id) VALUES ('$shtrans_cust', '$timestamp', '$shfrom_amount_del', '$shfrom_value_del', '1', $timestamp, '$_SESSION[log_id]')";
		$query_shdel = mysqli_query($db_link, $sql_shdel);
		checkSQL($db_link, $query_shdel);

		//Set Source Customer inactive
		$sql_inactive = "UPDATE customer SET cust_active = '0', cust_lastupd = '$timestamp', user_id = '$_SESSION[log_id]' WHERE cust_id = '$shtrans_cust'";
		$query_inactive = mysqli_query($db_link, $sql_inactive);

		header('Location: customer.php?cust='.$_SESSION['cust_id']);
	}

	//Get current customer's details
	$result_cust = getCustomer($db_link, $_SESSION['cust_id']);

	//Get all other customers
	$query_custother = getCustOther($db_link);
?>

<html>
<?PHP includeHead('Buying Shares',0) ?>
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
			<a href="acc_share_buy.php?cust=<?PHP echo $_SESSION['cust_id'] ?>" id="item_selected">Share Buy</a>
			<a href="acc_share_sale.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Share Sale</a>
			<a href="loan_new.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">New Loan</a>
			<a href="cust_new.php">New Customer</a>
			<a href="cust_act.php">Active Cust.</a>
			<a href="cust_inact.php">Inactive Cust.</a>
		</div>

		<!-- Left Side: Input for Share Addition -->
		<div class="content_left">

			<p class="heading_narrow">Share Buy for <?PHP echo $result_cust['cust_name'].' ('.$result_cust['cust_no'].')'; ?></p>

			<form action="acc_share_buy.php" method="post" onSubmit="return validate(this)">

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
								for ($i = 1; $i <= 10; $i++) {
									echo '<option value="'.$i.'">'.$i.' @ '.number_format($_SESSION['share_value'] * $i).' '.$_SESSION['set_cur'].'</option>';
								}
								?>
							</select>
						</td>
					</tr>
					<tr>
						<td class="center" colspan="2">
							<input type="submit" name="sharebuy" value="Buy Shares" />
							<input type="button" name="sh_transfer" value="Transfer" onclick="setVisibility('content_hidden', 'block');" />
						</td>
					</tr>
				</table>
			</form>

			<!-- HIDDEN SECTION: Transfer Shares from other Customer -->
			<div id="content_hidden">
				<form name="share_transfer" action="acc_share_buy.php" method="post">
					<p>Transfer all Shares from</p>
					<br/>
					<select name="shtrans_cust">
						<?PHP
						while ($row_custother = mysqli_fetch_assoc($query_custother)){
							echo '<option value="'.$row_custother['cust_id'].'">'.
											$row_custother['cust_no'].' '.$row_custother['cust_name'].
										'</option>';
						}
						?>
					</select>
					<br/><br/>
					<p>to this Customer.</p>
					<br/>
					<input type="submit" name="shtrans" value="Transfer Shares" />
				</form>
			</div>
		</div>

		<!-- RIGHT SIDE: Share Account Details -->
		<div class="content_right">
			<?PHP include 'acc_share_list.php'; ?>
		</div>
	</body>
</html>
