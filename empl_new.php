<!DOCTYPE HTML>
<?PHP	
	require 'functions.php';
	check_logon();
	connect();
	
	//Generate timestamp
	$timestamp = time();
	
	//CREATE-Button
	if (isset($_POST['create'])){
				
		//Sanitize user input
		$empl_no = sanitize($_POST['empl_no']);
		$empl_name = sanitize($_POST['empl_name']);
		$empl_dob = strtotime(sanitize($_POST['empl_dob']));
		$emplsex_id = sanitize($_POST['emplsex_id']);
		$empl_address = sanitize($_POST['empl_address']);
		$empl_phone = sanitize($_POST['empl_phone']);
		$empl_email = sanitize($_POST['empl_email']);
		$empl_in = strtotime(sanitize($_POST['empl_in']));
		if(isset($_POST['empl_active'])) $empl_active = 1;
		else $empl_active = 0;
		$user_id = sanitize($_POST['user_id']);
		
		//Insert new employee into EMPLOYEE
		$sql_insert = "INSERT INTO employee (empl_no, empl_name, empl_dob, emplsex_id, empl_address, empl_phone, empl_email, empl_in, empl_lastupd, empl_active, user_id) VALUES ('$empl_no', '$empl_name', '$empl_dob', '$emplsex_id', '$empl_address', '$empl_phone', '$empl_email', $empl_in, $empl_in, $empl_active, '$user_id')";
		$query_insert = mysql_query($sql_insert);
		check_sql($query_insert);
		
		// Refer to empl_new_pic.php
		//header('Location: empl_new_pic.php?from=new');
		header('Location: empl_curr.php');
	}
	
	// Select sexes from EMPLSEX for dropdown-menu
	$sql_sex = "SELECT * FROM emplsex";
	$query_sex = mysql_query($sql_sex);
	check_sql($query_sex);
	
	// Select non-associated users
	$sql_users = "SELECT user_id, user_name FROM user WHERE user_id NOT IN (SELECT user_id FROM employee)";
	$query_users = mysql_query($sql_users);
	check_sql($query_users);
?>

<html>
	<?PHP include_Head('New Employee',0) ?>	
		<script>
			function validate(form){
				fail = validateName(form.empl_name.value)
				fail += validateDob(form.empl_dob.value)
				fail += validateAddress(form.empl_address.value)
				fail += validatePhone(form.empl_phone.value)
				fail += validateEmail(form.empl_email.value)
				if (fail == "") return true;
				else { alert(fail); return false; }
			}
		</script>
		<script src="functions_validate.js"></script>
	</head>
	<body>
		<!-- MENU -->
		<?PHP include_Menu(7); ?>
		<div id="menu_main">
			<!-- <a href="empl_search.php">Search</a> -->
			<a href="empl_new.php" id="item_selected">New Employee</a>
			<a href="empl_curr.php">Current Employees</a>
			<a href="empl_past.php">Former Employees</a>
		</div>
		
		<!-- PAGE HEADING -->
		<p class="heading">New Employee</p> 
		
		<!-- CONTENT -->
		<div class="content_center">
			<form action="empl_new.php" method="post" onSubmit="return validate(this)" enctype="multipart/form-data">
				
				<table id ="tb_fields" style="max-width:750px;">
					<tr>
						<td>Number:</td>
						<td><input type="text" name="empl_no" tabindex="1" /></td>
						<td>Address:</td>
						<td><input type="text" name="empl_address" placeholder="Place of Residence" tabindex="6" /></td>
					</tr>
					<tr>
						<td>Name:</td>
						<td><input type="text" name="empl_name" placeholder="Full Name" tabindex="2" /></td>
						<td>Phone No:</td>
						<td><input type="text" name="empl_phone" tabindex="7"/></td>
					</tr>
					<tr>
						<td>Gender:</td>
						<td>
							<select name="emplsex_id" size="1" tabindex="3">';
								<?PHP
									while ($row_sex = mysql_fetch_assoc($query_sex)){
										echo '<option value="'.$row_sex['emplsex_id'].'">'.$row_sex['emplsex_name'].'</option>';
									}
								?>
							</select>
						</td>
						<td>E-Mail:</td>
						<td><input type="text" name="empl_email" placeholder="abc@xyz.com" tabindex="8"/></td>
					</tr>
					<tr>
						<td>DoB:</td>
						<td><input type="text" id="datepicker" name="empl_dob" placeholder="DD.MM.YYYY" tabindex="4" /></td>
						<td>Employed since:</td>
						<td><input type="text" id="datepicker2" name="empl_in" value="<?PHP echo date("d.m.Y", $timestamp) ?>" tabindex="13" /></td>
					</tr>
					<tr>
						<td>User:</td>
						<td>
							<select name="user_id" size="1" tabindex="9">';
								<option value="0">None</option>
								<?PHP
									while ($row_users = mysql_fetch_assoc($query_users)){
										echo '<option value="'.$row_users['user_id'].'">'.$row_users['user_name'].'</option>';
									}
								?>
							</select>
						</td>
						<td>Active:</td>
						<td><input type="checkbox" name="empl_active" checked="checked" value="1"/></td>
					</tr>
					<tr>
						<td colspan="4" class="center">
							<input type="submit" name="create" value="Continue" tabindex="14" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>