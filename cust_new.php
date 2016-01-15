<!DOCTYPE HTML>
<?PHP	
	include 'functions.php';
	check_logon();
	connect();
	$timestamp = time();
	
	//CREATE-Button
	if (isset($_POST['create'])){
				
		//Sanitize user input
		$cust_name = sanitize($_POST['cust_name']);
		$cust_dob = strtotime(sanitize($_POST['cust_dob']));
		$cust_sex = sanitize($_POST['cust_sex']);
		$cust_address = sanitize($_POST['cust_address']);
		$cust_phone = sanitize($_POST['cust_phone']);
		$cust_email = sanitize($_POST['cust_email']);
		$cust_occup = sanitize($_POST['cust_occup']);
		$cust_married_id = sanitize($_POST['cust_married_id']);
		$cust_heir = sanitize($_POST['cust_heir']);
		$cust_heirrel = sanitize($_POST['cust_heirrel']);
		$cust_sick = sanitize($_POST['cust_sick']);
		$cust_since = strtotime(sanitize($_POST['cust_since']));
		$_SESSION['receipt_no'] = sanitize($_POST['receipt_no']);
		
		//Insert new Customer into CUSTOMER
		$sql_insert = "INSERT INTO customer (cust_name, cust_dob, cust_sex, cust_address, cust_phone, cust_email, cust_occup, cust_married_id, cust_heir, cust_heirrel, cust_since, cust_sick, cust_lastsub, cust_active, cust_lastupd, user_id) VALUES ('$cust_name', '$cust_dob', '$cust_sex', '$cust_address', '$cust_phone', '$cust_email', '$cust_occup', '$cust_married_id', '$cust_heir', '$cust_heirrel', '$cust_since', '$cust_sick', '$cust_since', '1', '$timestamp', '$_SESSION[log_id]')";
		$query_insert = mysql_query($sql_insert);
		check_sql($query_insert);
		
		//Get new Customer's ID from CUSTOMER
		$sql_maxid = "SELECT MAX(cust_id) FROM customer";
		$query_maxid = mysql_query ($sql_maxid);
		check_sql($query_maxid);
		$maxid = mysql_fetch_assoc($query_maxid);
		$_SESSION['cust_id'] = $maxid['MAX(cust_id)'];
		
		//Insert Entrance Fee into INCOMES
		$sql_insert_fee = "INSERT INTO incomes (cust_id, inctype_id, inc_amount, inc_date, inc_receipt, inc_created, user_id) VALUES ('$_SESSION[cust_id]', '1', $_SESSION[fee_entry], $cust_since, '$_SESSION[receipt_no]', $timestamp, '$_SESSION[log_id]')";
		$query_insert_fee = mysql_query ($sql_insert_fee);
		check_sql($query_insert_fee);
		
		//Insert Stationary Sales into INCOMES
		$sql_insert_sales = "INSERT INTO incomes (cust_id, inctype_id, inc_amount, inc_date, inc_receipt, inc_created, user_id) VALUES ('$_SESSION[cust_id]', '6', $_SESSION[fee_stationary], $cust_since, '$_SESSION[receipt_no]', $timestamp, '$_SESSION[log_id]')";
		$query_insert_sales = mysql_query ($sql_insert_sales);
		check_sql($query_insert_sales);
		
		//Refer to cust_new_pic.php
		header('Location: cust_new_pic.php');
	}
	
	//Select Marital Status for Drop-down-Menu
	$sql_mstat = "SELECT * FROM cust_married";
	$query_mstat = mysql_query($sql_mstat);

	//Determine new CUST_ID
	$sql_maxid = "SELECT MAX(cust_id) AS maxid FROM customer";
	$query_maxid = mysql_query($sql_maxid);
	check_sql($query_maxid);
	$result_maxid = mysql_fetch_array($query_maxid);
	$new_id = $result_maxid['maxid'];
	$new_id++;
?>

<html>
	<?PHP htmlHead('New Customer',0) ?>	
		<script>
			function validate(form){
				fail = validateName(form.cust_name.value)
				fail += validateDob(form.cust_dob.value)
				fail += validateAddress(form.cust_address.value)
				fail += validatePhone(form.cust_phone.value)
				fail += validateEmail(form.cust_email.value)
				fail += validateReceipt(form.receipt_no.value)
				if (fail == "") return true
				else { alert(fail); return false }
			}
		</script>
		<script src="functions_validate.js"></script>
	</head>
	<body>
		<!-- MENU -->
		<?PHP 
				menu_Tabs(2);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="cust_search.php">Search</a>
			<a href="cust_new.php" id="item_selected">New Customer</a>
			<a href="cust_act.php">Active Customers</a>
			<a href="cust_inact.php">Inactive Customers</a>
		</div>
		
		<!-- PAGE HEADING -->
		<p class="heading">New Customer (<?PHP echo $new_id.'/'.date("Y",time())?>)</p> 
		
		<!-- CONTENT -->
		<div class="content_center">
			<form action="cust_new.php" method="post" onSubmit="return validate(this)" enctype="multipart/form-data">
				
				<table id ="tb_fields">
					<tr>
						<td>Name:</td>
						<td><input type="text" name="cust_name" placeholder="Full Name" tabindex="1" /></td>
						<td>Residence:</td>
						<td><input type="text" name="cust_address" placeholder="Place of Residence" tabindex="6" /></td>
						<td>Sickness:</td>
						<td>
							<select name="cust_sick" class="defaultfield" size="1" tabindex="11">
								<option value="0" selected="selected">None</option>
								<option value="1">Heart Attack</option>
								<option value="2">Stroke</option>
								<option value="3">Cancer</option>
								<option value="4">HIV/AIDS</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Gender:</td>
						<td>
							<input type="radio" name="cust_sex" value="1" checked="checked" tabindex="2" /> Male
							<input type="radio" name="cust_sex" value="2"> Female
							<input type="radio" name="cust_sex" value="3"> Instit.
						</td>
						<td>Phone No:</td>
						<td><input type="text" name="cust_phone" tabindex="7"/></td>
						<td>Member since:</td>
						<td><input type="text" name="cust_since" value="<?PHP echo date("d.m.Y", $timestamp) ?>" tabindex="12" /></td>
					</tr>
					<tr>
						<td>DoB:</td>
						<td><input type="text" name="cust_dob" placeholder="DD.MM.YYYY" tabindex="3" /></td>
						<td>E-Mail:</td>
						<td><input type="text" name="cust_email" placeholder="abc@xyz.com" tabindex="8"/></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Marital Status:</td>			
						<td>
							<select name="cust_married_id" class="defaultfield" size="1" tabindex="4">';
								<?PHP
								while ($row_mstat = mysql_fetch_assoc($query_mstat)){
									echo '<option value="'.$row_mstat['cust_married_id'].'">'.$row_mstat['cust_married_status'].'</option>';
								}
								?>
							</select>
						</td>
						<td>Representative:</td>
						<td><input type="text" name="cust_heir" tabindex="9" /></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Occupation:</td>
						<td><input type="text" name="cust_occup" tabindex="5" /></td>
						<td>Relation:</td>
						<td><input type="text" name="cust_heirrel" placeholder="e.g. Wife, Secretary..." tabindex="10" /></td>
						<td>Active:</td>
						<td>
							<input type="checkbox" name="cust_active" value="1" checked="checked" disabled="disabled" />
						</td>
					</tr>
					<!-- Input for Receipt No and "Create"-Button -->
					<tr>
						<td colspan="2"></td>
						<td style="padding-top:2em;">Receipt No:</td>
						<td style="padding-top:2em;">
							<input type="number" name="receipt_no" placeholder="for Entrance Fee" tabindex="13" />
						</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td colspan="6" class="center">
							<input type="submit" name="create" value="Continue" tabindex="15" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>