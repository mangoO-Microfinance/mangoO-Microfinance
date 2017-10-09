<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	$db_link = connect();
	$timestamp = time();
	
	//NEW INCOME-Button
	if(isset($_POST['incnew'])){
		
		//Sanitize user input
		$inctype_id = sanitize($db_link, $_POST['inctype_id']);
		$inc_amount = sanitize($db_link, $_POST['inc_amount']);
		$inc_date = strtotime(sanitize($db_link, $_POST['inc_date']));
		$inc_text = sanitize($db_link, $_POST['inc_text']);
		$inc_recipient = sanitize($db_link, $_POST['cust_id']);
		$inc_loan = sanitize($db_link, $_POST['loan_id']);
		$inc_receipt = sanitize($db_link, $_POST['inc_receipt']);
		if($inc_recipient == 0) $inc_recipient = NULL;
		if($inc_loan == 0) $inc_loan = NULL;
		
		//Insert into INCOMES
		$sql_incnew = "INSERT INTO incomes (cust_id, loan_id, inctype_id, inc_amount, inc_date, inc_receipt, inc_text, inc_created, user_id) VALUES ('$inc_recipient', '$inc_loan', '$inctype_id', '$inc_amount', '$inc_date', '$inc_receipt', '$inc_text', '$timestamp', '$_SESSION[log_id]')";
		$query_incnew = mysqli_query($db_link, $sql_incnew);
		checkSQL($db_link, $query_incnew);
	}

	//Select recent incomes from INCOMES
	$sixtydays = time() - convertDays(60);
	$sql_inccur = "SELECT * FROM incomes LEFT JOIN inctype ON incomes.inctype_id = inctype.inctype_id LEFT JOIN customer ON incomes.cust_id = customer.cust_id WHERE inc_date > $sixtydays ORDER BY inc_date DESC, inc_receipt DESC, incomes.cust_id";
	$query_inccur = mysqli_query($db_link, $sql_inccur);
	checkSQL($db_link, $query_inccur);
	
	//Select Types of Incomes from INCTYPE
	$sql_inctype = "SELECT * FROM inctype ORDER BY inctype_type";
	$query_inctype = mysqli_query($db_link, $sql_inctype);
	checkSQL($db_link, $query_inctype);
	
	//Select Customers from CUSTOMER
	$sql_custfrom = "SELECT * FROM customer WHERE cust_active = 1";
	$query_custfrom = mysqli_query($db_link, $sql_custfrom);
	checkSQL($db_link, $query_custfrom);
	$custfrom = array();
	while ($row_custfrom = mysqli_fetch_assoc($query_custfrom)){
		$custfrom[] = $row_custfrom;
	};
	
	//Select Loans from LOANS
	$sql_loans = "SELECT * FROM loans INNER JOIN customer ON loans.cust_id = customer.cust_id WHERE loanstatus_id IN (1,2) ORDER BY cust_no, loan_no";
	$query_loans = mysqli_query($db_link, $sql_loans);
	checkSQL($db_link, $query_loans);
	$loans = array();
	while ($row_loans = mysqli_fetch_assoc($query_loans)){
		$loans[] = $row_loans;
	};
?>

<html>
	<?PHP includeHead('Incomes',0) ?>	
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
		<?PHP includeMenu(4); ?>
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
							<input type="text" id="datepicker" name="inc_date" value="<?PHP echo date("d.m.Y",$timestamp); ?>"/>
						</td>
						<td>Type:</td>
						<td>
							<select name="inctype_id" />
								<?PHP
								$no_show = array(2,4,5);	// Do not allow to choose one of the following income types
								while ($row_inctype = mysqli_fetch_assoc($query_inctype)){
									if(!in_array($row_inctype['inctype_id'], $no_show)){
										echo '<option value="'.$row_inctype['inctype_id'].'">'.$row_inctype['inctype_type'].'</option>';
									}
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
						<td>Loan:</td>
						<td>
							<select name="loan_id">
								<option value="0" selected="selected">N/A</option>
								<?PHP
								foreach ($loans as $ln){
									echo '<option value="'.$ln['loan_id'].'">'.$ln['loan_no'].' ('.$ln['cust_name'].')</option>';
								}
								?>
							</select>
						</td>
					</tr>
					<tr>
						<td>Details:</td>
						<td><input type="text" name="inc_text"/></td>
					</tr>
				</table>
				<input type="submit" name="incnew" value="New Entry" />
			</form>
		</div>
		
		<!-- RIGHT SIDE: Recent Incomes -->
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
					<th class="title" colspan="7">Recent Incomes</th>
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
			$no_delete = array(2,4,5);	// Do not allow to delete one of the following income types
			while ($row_inccur = mysqli_fetch_assoc($query_inccur)){
				echo '<tr>	
								<td>'.date("d.m.Y",$row_inccur['inc_date']).'</a></td>
								<td>'.$row_inccur['inctype_type'].'</td>
								<td>'.number_format($row_inccur['inc_amount']).' '.$_SESSION['set_cur'].'</td>
								<td>'.$row_inccur['cust_name'].' ('.$row_inccur['cust_no'].')</td>
								<td>'.$row_inccur['inc_receipt'].'</td>
								<td>'.$row_inccur['inc_text'].'</td>
								<td>';
								if ($_SESSION['log_delete'] == 1 and (!in_array($row_inccur['inctype_id'], $no_delete) or $row_inccur['cust_id'] == 0)) echo '<a href="books_income_del.php?inc_id='.$row_inccur['inc_id'].'" onClick="return randCheck();"><i class="fa fa-remove fa-lg"></i></a>';
				echo '	</td>	
							</tr>';
			}
			?>
			</table>
		</div>
	</body>	
</html>