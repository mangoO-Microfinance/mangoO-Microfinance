<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();
	$timestamp = time();
	
	//NEW EXPENDITURE-Button
	if(isset($_POST['expnew'])){
		
		//Sanitize user input
		$exptype_id = sanitize($_POST['exptype_id']);
		$exp_amount = sanitize($_POST['exp_amount']);
		$exp_date = strtotime(sanitize($_POST['exp_date']));
		$exp_text = sanitize($_POST['exp_text']);
		$exp_recipient = sanitize($_POST['exp_recipient']);
		$exp_receipt = sanitize($_POST['exp_receipt']);
		$exp_voucher = sanitize($_POST['exp_voucher']);
		
		//Insert into EXPENDITURES
		$sql_expnew = "INSERT INTO expenditures (exptype_id, exp_amount, exp_date, exp_text, exp_recipient, exp_receipt, exp_voucher, exp_created, user_id) VALUES ('$exptype_id', '$exp_amount', '$exp_date','$exp_text', '$exp_recipient', '$exp_receipt', '$exp_voucher', '$timestamp', '$_SESSION[log_id]')";
		$query_expnew = mysql_query($sql_expnew);
		check_sql($query_expnew);
	}

	//Calculate UNIX TIMESTAMP for first and last day of current month
	$cur_month = date("m",time());
	$cur_year = date("Y",time());
	$firstDay = mktime(0, 0, 0, $cur_month, 1, $cur_year);
	$lastDay = mktime(0, 0, 0, ($cur_month+1), 0, $cur_year);
			
	//Select current expenditures from EXPENDITURES
	$sql_expcur = "SELECT * FROM expenditures, exptype WHERE expenditures.exptype_id = exptype.exptype_id AND exp_date BETWEEN $firstDay AND $lastDay ORDER BY exp_date, exp_voucher";
	$query_expcur = mysql_query($sql_expcur);
	check_sql($query_expcur);
	
	//Select Types of Expenditures from EXPTYPE
	$sql_exptype = "SELECT * FROM exptype";
	$query_exptype = mysql_query($sql_exptype);
	check_sql($query_exptype);
?>

<html>
	<?PHP htmlHead('Expenditures',0) ?>	
		<script>
			function validate(form){
				fail = validateDate(form.exp_date.value)
				fail += validateAmount(form.exp_amount.value)
				fail += validateRecipient(form.exp_recipient.value)
				fail += validateVoucher(form.exp_voucher.value)
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
		menu_Tabs(4);
		?>
	
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="start.php">Back</a>
			<a href="expendit_new.php" id="item_selected">New Expenditure</a>
			<a href="income_new.php">New Income</a>
		</div>
		
			
		<!-- LEFT SIDE: Form for entering new expenditure -->
		<div class="content_left">
			
			<p class="heading_narrow">New Expenditure</p>
			<form action="expendit_new.php" method="post" onSubmit="return validate(this)">
				
				<table id="tb_fields">
					<tr>
						<td>Date:</td>
						<td><input type="text" name="exp_date" value="<?PHP echo date("d.m.Y", $timestamp); ?>"/></td>
						<td>Type:</td>
						<td>
							<select name="exptype_id">
								<?PHP
								while ($row_exptype = mysql_fetch_assoc($query_exptype)){
									echo '<option value="'.$row_exptype['exptype_id'].'">'.$row_exptype['exptype_type'].'</option>';
								}
								?>
							</select>
						</td>
					</tr>
					<tr>
						<td>Amount:</td>
						<td><input type="number" name="exp_amount" placeholder="UGX" /></td>
						<td>Recipient:</td>
						<td><input type="text" name="exp_recipient"/></td>
					</tr>
					<tr>
						<td>Voucher No:</td>
						<td><input type="text" name="exp_voucher"/></td>
						<td>Receipt No:</td>
						<td><input type="text" name="exp_receipt" placeholder="if any"/></td>
					</tr>
					<tr>
						<td>Details:</td>
						<td><input type="text" name="exp_text"/></td>
					</tr>
				</table>
				<input type="submit" name="expnew" value="New Expenditure" />
			</form>
		</div>
		
		<!-- RIGHT SIDE: Expenditures of the current month -->
		<div class="content_right">
			
			<table id="tb_table">
				<tr>
					<th class="title" colspan="6">Expenditures for Current Month</th>
				</tr>
				<tr>
					<th>Date</th>
					<th>Type</th>
					<th>Amount</th>
					<th>Recipient</th>
					<th>Details</th>
					<th>Voucher</th>
				</tr>
			<?PHP
			$color=0;
			while ($row_expcur = mysql_fetch_assoc($query_expcur)){
				tr_colored($color); 		//Alternating row colors
				echo '	<td>'.date("d.m.Y",$row_expcur['exp_date']).'</td>
								<td>'.$row_expcur['exptype_type'].'</td>
								<td>'.number_format($row_expcur['exp_amount']).'/=</td>
								<td>'.$row_expcur['exp_recipient'].'</td>
								<td>'.$row_expcur['exp_text'].'</td>
								<td>'.$row_expcur['exp_voucher'].'</td>
							</tr>';
			}
			?>
			</table>
			<form action="expendit_del.php" method="post" style="margin-top:5%">
				<input type="submit" name="del_exp" value="Delete Last Expenditure" onClick="return randCheck()"/>
			</form>
		</div>
	</body>	
</html>