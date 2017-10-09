<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	$db_link = connect();

	//Generate timestamp
	$timestamp = time();

	// Get EMPL_ID
	if(isset($_GET['empl'])) $_SESSION['empl_id'] = sanitize($db_link, $_GET['empl']);
	else header('Location:empl_curr.php');

	//UPDATE-Button
	if (isset($_POST['update'])){

		//Sanitize user input
		$empl_no = sanitize($db_link, $_POST['empl_no']);
		$empl_name = sanitize($db_link, $_POST['empl_name']);
		$empl_dob = strtotime(sanitize($db_link, $_POST['empl_dob']));
		$emplsex_id = sanitize($db_link, $_POST['emplsex_id']);
		$emplmarried_id = sanitize($db_link, $_POST['emplmarried_id']);
		$empl_position = sanitize($db_link, $_POST['empl_position']);
		$empl_salary = sanitize($db_link, $_POST['empl_salary']);
		$empl_address = sanitize($db_link, $_POST['empl_address']);
		$empl_phone = sanitize($db_link, $_POST['empl_phone']);
		$empl_email = sanitize($db_link, $_POST['empl_email']);
		$empl_in = strtotime(sanitize($db_link, $_POST['empl_in']));
		$empl_out = strtotime(sanitize($db_link, $_POST['empl_out']));
		if($empl_out == NULL) $empl_out = "NULL";

		//Update EMPLOYEE
		$sql_update = "UPDATE employee SET empl_no = '$empl_no', empl_name = '$empl_name', empl_dob = $empl_dob, emplsex_id = $emplsex_id, emplmarried_id = '$emplmarried_id', empl_position = '$empl_position', empl_salary = '$empl_salary', empl_address = '$empl_address', empl_phone = '$empl_phone', empl_email = '$empl_email', empl_in = '$empl_in', empl_out = $empl_out, empl_lastupd = $timestamp, user_id = $_SESSION[log_id] WHERE empl_id = $_SESSION[empl_id]";
		$query_update = mysqli_query($db_link, $sql_update);
		checkSQL($db_link, $query_update);

		// Forward to this page
		header('Location: employee.php?empl='.$_SESSION['empl_id']);
	}

	//Select Sexes from EMPLSEX for dropdown-menu
	$sql_sex = "SELECT * FROM emplsex";
	$query_sex = mysqli_query($db_link, $sql_sex);
	checkSQL($db_link, $query_sex);

	//Select Marital Status from EMPLMARRIED for dropdown-menu
	$sql_mstat = "SELECT * FROM emplmarried";
	$query_mstat = mysqli_query($db_link, $sql_mstat);
	checkSQL($db_link, $query_mstat);

	//Select employee from EMPLOYEE
	$result_empl = getEmployee($db_link, $_SESSION['empl_id']);
?>

<html>
	<?PHP includeHead('Employee',0) ?>
		<script>
			function validate(form){
				fail = validateName(form.empl_name.value)
				fail += validateDob(form.empl_dob.value)
				fail += validateAddress(form.empl_address.value)
				fail += validatePhone(form.empl_phone.value)
				fail += validateEmail(form.empl_email.value)
				if (fail == "") return true
				else { alert(fail); return false }
			}
		</script>
		<script src="functions_validate.js"></script>
	</head>

	<body>
		<!-- MENU -->
		<?PHP includeMenu(7); ?>
		<div id="menu_main">
			<!-- <a href="empl_search.php">Search</a> -->
			<a href="empl_new.php">New Employee</a>
			<a href="empl_curr.php">Current Employees</a>
			<a href="empl_past.php">Former Employees</a>
			<?PHP
				if($_SESSION['log_admin'] == 1 AND isset($result_empl['user_id'])) echo '<a href="set_user.php?user='.$result_empl['user_id'].'">User</a>';
				elseif($_SESSION['log_admin'] == 1) echo '<a href="set_user.php">User</a>';
			?>
		</div>

		<div class="content_center">
			<!-- HEADING -->
			<p class="heading" style="margin-bottom:.3em;">
				<?PHP echo $result_empl['empl_name'].' ('.$result_empl['empl_no'].')'; ?>
			</p>

			<form action="employee.php" method="post" onSubmit="return validate(this)">

				<table id ="tb_fields" style="border-spacing:0.1em 1.25em;">
					<colgroup>
						<col width="9%"/>
						<col width="25%"/>
						<col width="8%"/>
						<col width="25%"/>
						<col width="8%"/>
						<col width="25%"/>
					</colgroup>
					<?PHP
						echo '<tr>
										<td rowspan="4" colspan="2" style="text-align:center; vertical-align:top;">
										<a href="empl_new_pic.php">';
						if (isset($result_empl['empl_pic']))
							echo '<img src="'.$result_empl['empl_pic'].'" title="Employee\'s picture">';
						else {
								if ($result_empl['emplsex_id'] == 2) echo '<img src="ico/custpic_f.png" title="Upload new picture" />';
								else echo '<img src="ico/custpic_m.png" title="Upload new picture" />';
						}
						echo '	</a>
										</td>
										<td>Empl. No:</td>
										<td><input type="text" name="empl_no" value="'.$result_empl['empl_no'].'" tabindex=1 /></td>
										<td>Phone No:</td>
										<td><input type="text" name="empl_phone" value="'.$result_empl['empl_phone'].'" tabindex=7 /></td>
									</tr>';
						echo '<tr>
										<td>Name:</td>
										<td><input type="text" name="empl_name" value="'.$result_empl['empl_name'].'" tabindex=2 /></td>
										<td>E-Mail:</td>
										<td><input type="text" name="empl_email" value="'.$result_empl['empl_email'].'" placeholder="abc@xyz.com" tabindex=8 /></td>
									</tr>
									<tr>
										<td>Gender:</td>
										<td>
											<select name="emplsex_id" size="1" tabindex=3>';
								while ($row_sex = mysqli_fetch_assoc($query_sex)){
									if($row_sex ['emplsex_id'] == $result_empl['emplsex_id']){
										echo '<option selected value="'.$row_sex['emplsex_id'].'">'.$row_sex['emplsex_name'].'</option>';
									}
									else echo '<option value="'.$row_sex['emplsex_id'].'">'.$row_sex['emplsex_name'].'</option>';
								}
								echo '</select>
										</td>
										<td>Position:</td>
										<td><input type="text" name="empl_position" value="'.$result_empl['empl_position'].'" placeholder="Job description" tabindex=9 /></td>
									</tr>
									<tr>
										<td>DoB:</td>
										<td><input type="text" id="datepicker" name="empl_dob" value="'.date("d.m.Y",$result_empl['empl_dob']).'" placeholder="DD.MM.YYYY" tabindex=4 /></td>
										<td>Salary:</td>
										<td><input type="number" name="empl_salary" value="'.$result_empl['empl_salary'].'" placeholder="'.$_SESSION['set_cur'].'" tabindex=10 /></td>
									</tr>
									<tr>
										<td>Last updated:</td>
										<td><input type="text" disabled="diabled" value="'.date("d.m.Y", $result_empl['empl_lastupd']).'" /></td>
										<td>Maritial Status:</td>
										<td>
											<select name="emplmarried_id" size="1" tabindex=5>';
											while ($row_mstat = mysqli_fetch_assoc($query_mstat)){
												if($row_mstat ['emplmarried_id'] == $result_empl['emplmarried_id']){
													echo '<option selected value="'.$row_mstat['emplmarried_id'].'">'.$row_mstat['emplmarried_status'].'</option>';
												}
												else echo '<option value="'.$row_mstat['emplmarried_id'].'">'.$row_mstat['emplmarried_status'].'</option>';
											}
											echo '</select>
										</td>
										<td>Employm. Start:</td>
										<td><input type="text" name="empl_in" id="datepicker2" value="'.date("d.m.Y", $result_empl['empl_in']).'" tabindex=11 /></td>
									</tr>
									<tr>
										<td>Username:</td>
										<td><input type="text" disabled="diabled" value="'.$result_empl['user_name'].'" /></td>
										<td>Address:</td>
										<td><input type="text" name="empl_address" value="'.$result_empl['empl_address'].'" placeholder="Place of Residence" tabindex=6 /></td>
										<td>Employm. End:</td>
										<td>
											<input type="text" name="empl_out" id="datepicker3" placeholder="DD.MM.YYYY"';
											if($result_empl['empl_out'] != NULL) echo ' value="'.date("d.m.Y", $result_empl['empl_out']).'"';
											echo ' tabindex=12 />
										</td>
									</tr>
									<tr>
										<td colspan="6" class="center">
											<input type="submit" name="update" value="Save Changes" tabindex=13 />
										</td>
									</tr>';
					?>
				</table>
			</form>
		</div>
	</body>
</html>
