<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionAdmin();
	$db_link = connect();
	$ugroup_id = 0;
	$error = "no";

	//Select all Usergroups from UGROUP
	$ugroups = array();
	$sql_ugroups = "SELECT * FROM ugroup";
	$query_ugroups = mysqli_query($db_link, $sql_ugroups);
	checkSQL($db_link, $query_ugroups);
	while($row_ugroups = mysqli_fetch_assoc($query_ugroups)){
		$ugroups[] = $row_ugroups;
		$ugroup_names[] = $row_ugroups['ugroup_name'];
	}

	//Check for error from set_ugroup_del.php
	if(isset($_GET['error'])){
		$error =  sanitize($db_link, $_GET['error']);
	}

	//Set heading and variable according to selection
	if(isset($_GET['ugroup'])){
		$ugroup_id = sanitize($db_link, $_GET['ugroup']);
		foreach ($ugroups as $row_ugroup){
			if ($row_ugroup['ugroup_id'] == $ugroup_id){
				$ugroup_name = $row_ugroup['ugroup_name'];
				$ugroup_admin = $row_ugroup['ugroup_admin'];
				$ugroup_delete = $row_ugroup['ugroup_delete'];
				$ugroup_report = $row_ugroup['ugroup_report'];
			}
		}
		$heading = "Edit Usergroup";
	}
	else $heading = "Create Usergroup";

	//SAVE-Button
	if(isset($_POST['save_changes'])){

		//Sanitize user input
		$ugroup_id = sanitize($db_link, $_POST['ugroup_id']);
		$ugroup_name = sanitize($db_link, $_POST['ugroup_name']);
		if(isset($_POST['ugroup_admin'])) $ugroup_admin = '1';
			else $ugroup_admin = '0';
		if(isset($_POST['ugroup_delete'])) $ugroup_delete = '1';
			else $ugroup_delete = '0';
		if(isset ($_POST['ugroup_report'])) $ugroup_report = '1';
			else $ugroup_report = '0';
		$timestamp = time();

		if ($ugroup_id == 0){
			//Insert new usergroup into UGROUP
			$sql_ugroup_insert = "INSERT INTO ugroup (ugroup_name, ugroup_admin, ugroup_delete, ugroup_report, ugroup_created) VALUES ('$ugroup_name', '$ugroup_admin', '$ugroup_delete', '$ugroup_report', '$timestamp')";
			$query_ugroup_insert = mysqli_query($db_link, $sql_ugroup_insert);
			checkSQL($db_link, $query_ugroup_insert);
		}

		else{
			//Update existing usergroup
			$sql_ugroup_upd = "UPDATE ugroup SET ugroup_name = '$ugroup_name',  ugroup_admin=$ugroup_admin, ugroup_delete=$ugroup_delete, ugroup_report=$ugroup_report, ugroup_created=$timestamp WHERE ugroup_id = $ugroup_id";
			$query_ugroup_upd = mysqli_query($db_link, $sql_ugroup_upd);
			checkSQL($db_link, $query_ugroup_upd);
		}

		header('Location:set_ugroup.php');
	}
?>

<html>
	<?PHP includeHead('Settings | Usergroups',0) ?>
	<script>
			function validate(form){
				fail = validateUsergroup(form.ugroup_name.value, <?PHP echo json_encode($ugroup_names).', '.$ugroup_id; ?>)
				if (fail == "") return true
				else { alert(fail); return false }
			}
		</script>
		<script src="functions_validate.js"></script>
	</head>

	<body>
		<!-- MENU -->
		<?PHP
				includeMenu(6);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="set_basic.php">Basic Settings</a>
			<a href="set_loans.php">Loan Settings</a>
			<a href="set_fees.php">Fees & Charges</a>
			<a href="set_user.php">Users</a>
			<a href="set_ugroup.php" id="item_selected">Usergroups</a>
			<a href="set_logrec.php">Log Records</a>
			<?PHP if (strtoupper(substr(PHP_OS, 0, 5)) === 'LINUX') echo '<a href="set_dbbackup.php">Database Backup</a>' ?>
		</div>

		<!-- LEFT SIDE: Create New Usergroup Form -->
		<div class="content_left">
			<div class="content_settings" style="text-align:left; width:80%;">
				<?PHP echo '<p class="heading">'.$heading.'</p>'; ?>

				<form action="set_ugroup.php" method="post" onSubmit="return validate(this)">
					<table id="tb_set" style="margin:auto;">
						<tr>
							<td>Usergroup Name</td>
							<td><input type="text" name="ugroup_name" placeholder="Usergroup Name" value="<?PHP if (isset($ugroup_name)) echo $ugroup_name; ?>"/></td>
						</tr>
						<tr>
							<td>Permissions</td>
							<td>
								<input type="checkbox" name="ugroup_admin" <?PHP if(isset($ugroup_admin) AND $ugroup_admin == 1) echo 'checked="checked" '; ?> />
								Administrator</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input type="checkbox" name="ugroup_delete" <?PHP if(isset($ugroup_delete) AND $ugroup_delete == 1) echo 'checked="checked" '; ?> />
								Deleting</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input type="checkbox" name="ugroup_report" <?PHP if(isset($ugroup_report) AND $ugroup_report == 1) echo 'checked="checked" '; ?> />
								Reports</td>
						</tr>
					</table>
					<input type="submit" name="save_changes" value="Save Changes" />
					<input type="hidden" name="ugroup_id" value="<?PHP echo $ugroup_id; ?>" />
				</form>
			</div>
		</div>

		<!-- RIGHT SIDE: TABLE: Existing Usergroups -->
		<div class="content_right">
			<table id="tb_table">
				<colgroup>
					<col width="27%">
					<col width="19%">
					<col width="19%">
					<col width="19%">
					<col width="8%">
					<col width="8%">
				</colgroup>
				<tr>
					<th colspan="6" class="title">Existing Usergroups</th>
				</tr>
				<tr>
					<th rowspan="2">User Group Name</th>
					<th colspan="3">Permissions</th>
					<th rowspan="2">Edit</th>
					<th rowspan="2">Delete</th>
				</tr>
				<tr>
					<th style="background-color:#a7dbd8">Administrator</th>
					<th style="background-color:#a7dbd8">Deleting</th>
					<th style="background-color:#a7dbd8">Reports</th>
				</tr>
				<?PHP
					foreach ($ugroups as $row_ugroups){
						echo '<tr>
									<td>'.$row_ugroups['ugroup_name'].'</td>
									<td>
										<input type="checkbox" disabled="disabled" ';
										if ($row_ugroups['ugroup_admin']==1) echo 'checked="checked" ';
						echo 		'/>
									</td>
									<td>
										<input type="checkbox" disabled="disabled" ';
										if ($row_ugroups['ugroup_delete'] == '1') echo 'checked="checked" ';
						echo 		'/>
									</td>
									<td>
										<input type="checkbox" disabled="disabled" ';
										if ($row_ugroups['ugroup_report'] == '1') echo 'checked="checked" ';
						echo 		'/>
									</td>';
						echo '<td>';
						if ($row_ugroups['ugroup_id'] != 1) echo '
										<a href="set_ugroup.php?ugroup='.$row_ugroups['ugroup_id'].'">
											<i class="fa fa-edit fa-lg"></i>
										</a>';
						echo '</td>
									<td>';
						if ($row_ugroups['ugroup_id'] != 1) echo '
										<a href="set_ugroup_del.php?ugroup='.$row_ugroups['ugroup_id'].'">
											<i class="fa fa-remove fa-lg"></i>
										</a>';
						echo '</td>
								</tr>';
					}

					//Error message, if user tries to delete a usergroup that still has members.
					if ($error == "dep") echo '<script>alert(\'One or more users are still members of this usergroup. Usergroup cannot be deleted!\')</script>';
				?>
			</table>
		</div>
	</body>
</html>
