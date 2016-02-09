<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	check_logon();
	connect();
	$timestamp = time();
	
	//NEW INCOME-Button
	if(isset($_POST['incnew'])){
		
		//Sanitize user input
		$inctype_id = sanitize($_POST['inctype_id']);
		$inc_amount = sanitize($_POST['inc_amount']);
		$inc_date = strtotime(sanitize($_POST['inc_date']));
		$inc_text = sanitize($_POST['inc_text']);
		$inc_recipient = sanitize($_POST['cust_id']);
		$inc_receipt = sanitize($_POST['inc_receipt']);
		
		//Insert into INCOMES
		$sql_incnew = "INSERT INTO incomes (inctype_id, inc_amount, inc_date, cust_id, inc_receipt, inc_text, inc_created, user_id) VALUES ('$inctype_id', '$inc_amount', '$inc_date', '$inc_recipient', '$inc_receipt', '$inc_text', '$timestamp', '$_SESSION[log_id]')";
		$query_incnew = mysql_query($sql_incnew);
		check_sql($query_incnew);
	}

	//Select current incomes from INCOMES
	$sixtydays = time() - 5184000;
	$sql_inccur = "SELECT * FROM incomes, inctype, customer WHERE incomes.inctype_id = inctype.inctype_id AND incomes.cust_id = customer.cust_id AND inc_date > $sixtydays ORDER BY inc_date DESC, inc_receipt DESC, incomes.cust_id";
	$query_inccur = mysql_query($sql_inccur);
	check_sql($query_inccur);
	
	//Select Types of Incomes from INCTYPE
	$sql_inctype = "SELECT * FROM inctype";
	$query_inctype = mysql_query($sql_inctype);
	check_sql ($query_inctype);
	
	//Select Customers from CUSTOMER
	$sql_custfrom = "SELECT * FROM customer WHERE cust_active = 1";
	$query_custfrom = mysql_query($sql_custfrom);
	check_sql($query_custfrom);
	$custfrom = array();
	while ($row_custfrom = mysql_fetch_assoc($query_custfrom)){
		$custfrom[] = $row_custfrom;
	};
?>

<html>
	<?PHP include_Head('Incomes',0) ?>	
		<script>
			function validate(form){
				fail = validateDate(form.inc_date.value)
				fail += validateAmount(form.inc_amount.value)
				fail += validateReceipt(form.inc_receipt.value)
				if (fail == "") return true
				else { alert(fail); return false }
			}
		</script>
		<script src="functions_validate.js"></script>
		<script src="function_randCheck.js"></script>
	</head>
	
	<body>
	
		<!-- MENU -->
		<?PHP 
				include_Menu(4);
		?>
	
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="start.php">Back</a>
			<a href="books_expense.php">Expenses</a>
			<a href="books_income.php" id="item_selected">Incomes</a>
			<a href="books_annual.php">Annual Accounts</a>
		</div>
		
			
		<!-- LEFT SIDE: Form for entering new expenditure -->
		<div class="content_left">
			
			<p class="heading_narrow">New Income</p>
			<form action="books_income.php" method="post" onSubmit="return validate(this)">
				
				<table id="tb_fields">
					<tr>
						<td>Date:</td>
						<td>
							<input type="text" name="inc_date" value="<?PHP echo date("d.m.Y",$timestamp); ?>"/>
						</td>
						<td>Type:</td>
						<td>
							<select name="inctype_id" />
								<?PHP
								while ($row_inctype = mysql_fetch_assoc($query_inctype)){
									echo '<option value="'.$row_inctype['inctype_id'].'">'.$row_inctype['inctype_type'].'</option>';
								}
								?>
							</select>
						</td>
					</tr>
					<tr>
						<td>Amount:</td>
						<td><input type="number" name="inc_amount" placeholder="<?PHP echo $_SESSION['set_cur']; ?>" /></td>
						<td>Receipt No:</td>
						<td><input type="text" name="inc_receipt" /></td>
					</tr>
					<tr>
						<td>Received from:</td>
						<td>
							<select name="cust_id">
								<option value="0" selected="selected">N/A</option>
								<?PHP
								foreach ($custfrom as $cf){
									echo '<option value="'.$cf['cust_id'].'">'.$cf['cust_no'].' '.$cf['cust_name'].'</option>';
								}
								?>
							</select>
						</td>
						<td>Details:</td>
						<td><input type="text" name="inc_text"/></td>
					</tr>
				</table>
				<input type="submit" name="incnew" value="New Entry" />
			</form>
		</div>
		
		<!-- RIGHT SIDE: Incomes of the current month -->
		<div class="content_right">
			
			<table id="tb_table">
				<colgroup>
					<col width="15%">
					<col width="15%">
					<col width="20%">
					<col width="25%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<tr>
					<th class="title" colspan="7">Current Incomes</th>
				</tr>
				<tr>
					<th>Date</th>
					<th>Type</th>
					<th>Amount</th>
					<th>From</th>
					<th>Receipt</th>
					<th>Details</th>
					<th>Delete</th>
				</tr>
			<?PHP
			$color=0;
			while ($row_inccur = mysql_fetch_assoc($query_inccur)){
				tr_colored($color); 		//Alternating row colors
				echo '	<td>'.date("d.m.Y",$row_inccur['inc_date']).'</a></td>
								<td>'.$row_inccur['inctype_type'].'</td>
								<td>'.number_format($row_inccur['inc_amount']).' '.$_SESSION['set_cur'].'</td>
								<td>'.$row_inccur['cust_name'].' ('.$row_inccur['cust_no'].')</td>
								<td>'.$row_inccur['inc_receipt'].'</td>
								<td>'.$row_inccur['inc_text'].'</td>
								<td>';
								if ($_SESSION['log_delete'] == 1 and ($row_inccur['inctype_id'] == 6 or $row_inccur['inctype_id'] == 7 or$row_inccur['inctype_id'] == 8 or $row_inccur['inctype_id'] == 9 or $row_inccur['inctype_id'] == 10 or $row_inccur['cust_id'] == 0)) echo '<a href="books_income_del.php?inc_id='.$row_inccur['inc_id'].'&inctype='.$row_inccur['inctype_id'].'&cust='.$row_inccur['cust_id'].'" onClick="return randCheck();"><i class="fa fa-remove fa-lg"></i></a>';
				echo '	</td>	
							</tr>';
			}
			?>
			</table>
		</div>
	</body>	
</html>