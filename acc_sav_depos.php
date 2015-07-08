<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();
	check_custid();
	$timestamp = time();

	//DEPOSIT-Button
	if (isset($_POST['deposit'])){
		
		//Sanitize user input
		$sav_amount = sanitize($_POST['sav_amount']);
		$sav_receipt = sanitize($_POST['sav_receipt']);
		$sav_date = strtotime(sanitize($_POST['sav_date']));
		$timestamp = time();
		
		//Insert into SAVINGS
		$sql_insert = "INSERT INTO savings (cust_id, sav_date, sav_amount, cur_id, savtype_id, sav_receipt, sav_created, user_id) VALUES ('$_SESSION[cust_id]', '$sav_date', '$sav_amount', '1', '1', '$sav_receipt', '$timestamp', '$_SESSION[log_id]')";
		$query_insert = mysql_query($sql_insert);
		if (!$query_insert) die ('INSERT failed: '.mysql_error());
		
		//Refer to acc_sav_depos.php
		header('Location: acc_sav_depos.php?cust='.$_SESSION['cust_id']);
	}
	
	/*
	//Select Currencies from database
	$sql_cur = "SELECT * FROM currency";
	$query_cur = mysql_query($sql_cur);
	if (!$query_cur) die ('SELECT failed: '.mysql_error());
	*/
	
	//Select Customer from CUSTOMER
	$sql_cust = "SELECT cust_id, cust_name, cust_since FROM customer WHERE cust_id = '$_SESSION[cust_id]'";
	$query_cust = mysql_query($sql_cust);
	if (!$query_cust) die('SELECT failed: ' . mysql_error());
	$result_cust = mysql_fetch_assoc($query_cust);
	
	//Select Savings Transactions from SAVINGS
	$sql_sav = "SELECT * FROM savings, savtype, currency, user WHERE savings.savtype_id = savtype.savtype_id AND savings.cur_id = currency.cur_id AND savings.user_id = user.user_id AND cust_id = '$_SESSION[cust_id]' ORDER BY sav_date, sav_id";
	$query_sav = mysql_query($sql_sav);
	check_sql($query_sav);
	
	//Make array for exporting data
	$sav_exp_date = date("Y-m-d",time());
	$_SESSION['sav_export'] = array();
	$_SESSION['sav_exp_title'] = $_SESSION['cust_id'].'_savings_'.$sav_exp_date;
?>

<html>
	<?PHP htmlHead('Savings Deposit',0) ?>	
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
		<!-- MENU HEADER & TABS -->
		<?PHP 
		include 'menu_header.php';
		menu_Tabs(2);
		?>
		
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="customer.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Back</a>
			<a href="cust_search.php">Search</a>
			<a href="acc_sav_depos.php?cust=<?PHP echo $_SESSION['cust_id'] ?>" id="item_selected">Deposit</a>
			<a href="acc_sav_withd.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Withdrawal</a>
			<a href="acc_share.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Add Shares</a>
			<a href="loan_new.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">New Loan</a>
			<a href="cust_new.php">New Customer</a>
			<a href="cust_act.php">Active Cust.</a>
			<a href="cust_inact.php">Inactive Cust.</a>
		</div>
				
		<!-- LEFT SIDE: Input for new Deposit -->
		<div class="content_left">
			
			<p class="heading_narrow">Deposit for <?PHP echo $result_cust['cust_name'].' ('.$result_cust['cust_id'].'/'.date("Y",$result_cust['cust_since']).')' ?></p>
			
			<form action="acc_sav_depos.php" method="post" onsubmit="return validate(this);">
				<table id="tb_fields">
					<tr>
						<td>Date:</td>
						<td><input type="text" name="sav_date" value="<?PHP echo date("d.m.Y",$timestamp); ?>" required="required" /></td>
					</tr>
					<tr>
						<td>Receipt No:</td>
						<td><input type="number" name="sav_receipt" placeholder="for Deposit" class="defaultnumber" required="required" /></td>
					</tr>
					<tr>
						<td>Amount:</td>
						<td><input type="number" name="sav_amount" placeholder="UGX" class="defaultnumber" min=1 required="required" /></td>
					</tr>
					<tr>
						<td colspan="2" class="center"><input type="submit" name="deposit" value="Deposit" /></td>
					</tr>
				</table>
			</form>
		</div>
			
		<!-- RIGHT SIDE: Statement for Savings Account -->
		<div class="content_right">			
			<table id="tb_table">
				<colgroup>
					<col width="15%">
					<col width="20%">
					<col width="20%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<tr>
					<th class="title" colspan="6">Savings Account</th>
				</tr>
				<tr>
					<th>Date</th>
					<th>Transaction Type</th>
					<th>Amount</th>
					<th>Receipt</th>
					<th>W/draw Slip</th>
					<th>Authorised by</th>
				</tr>
			 <?PHP
				$balance = 0;
				while($row_sav = mysql_fetch_assoc($query_sav)){
					tr_colored($color);
					echo '<td>'.date("d.m.Y",$row_sav['sav_date']).'</td>';
					echo '<td>'.$row_sav['savtype_type'].'</td>';
					echo '<td>'.number_format($row_sav['sav_amount']).' '.$row_sav['cur_short'].'</td>';
					echo '<td>'.$row_sav['sav_receipt'].'</td>';
					echo '<td>'.$row_sav['sav_slip'].'</td>';
					echo '<td>'.$row_sav['user_name'].'</td>';
					$balance = $balance + ($row_sav['sav_amount']*$row_sav['cur_rate']);
					echo '</tr>';
					
					//Prepare data for export to Excel file
					array_push($_SESSION['sav_export'], array("Date" => date("d.m.Y",$row_sav['sav_date']), "Transaction Type" => $row_sav['savtype_type'], "Amount" => $row_sav['sav_amount'], "Receipt" => $row_sav['sav_receipt'], "W/draw Slip" => $row_sav['sav_slip']));
				}
				echo '<tr class="balance">
								<td colspan="6">Balance: '.number_format($balance).' UGX</td>
							</tr>';
			 ?>
			</table>
			
			<!-- Delete Button -->
			<form action="acc_sav_del.php" method="post" style="margin-top:5%">
				<input type="submit" name="del_sav" value="Delete Last Entry" onClick="return randCheck()"/>
				<input type="hidden" name="origin" value="d" />
			</form>
			
			<!-- Export Button -->
			<form class="export" action="acc_sav_export.php" method="post" style="margin-top:3%">
				<input type="submit" name="export_rep" value="Export Statement" />
			</form>
			
		</div>
	</body>
</html>