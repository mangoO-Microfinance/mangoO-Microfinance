<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_admin();
	connect();
?>

<html>
	<head>
		<title>Settings -> Usergroups</title>
		<link rel="stylesheet" href="mangoo.css">
		
		<script type="text/javascript">
			function edit_enable(ugroup_id){
				document.getElementById('ugroup_report'+ugroup_id).disabled = false;
				document.getElementById('ugroup_admin'+ugroup_id).disabled = false;
				document.getElementById('editButton').display = none;
			}
		</script>
	
	</head>	
	
	<body>
		
		<!-- MENU HEADER & TABS -->
		<?PHP 
		include 'menu_header.php';
		menu_Tabs(6);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="admin_logrec.php">Log Records</a>
			<a href="admin_fees.php">Fees</a>
			<a href="admin_user.php">Users</a>
			<a href="admin_ugroup.php" id="item_selected">Usergroups</a>
		</div>
		
		
		
		<?PHP
		
			//EDIT-Button
			if (isset($_POST['edit_ugroup'])){
				$i = 0;
				
				print_r ($_POST['ugroup_id']);
				print_r ($_POST['ugroup_report']);
				print_r ($_POST['ugroup_admin']);
				
				while ($i < count($_POST['ugroup_id'])){
					//if(!isset($_POST['ugroup_report'][$i])) $_POST['ugroup_report'][$i] = '0';
					//if(!isset($_POST['ugroup_admin'][$i])) $_POST['ugroup_admin'][$i] = '0';
					
					echo $_POST['ugroup_id'][$i];
					echo '<br/>';
					echo $_POST['ugroup_report'][$i];
					echo '<br/>';
					echo $_POST['ugroup_admin'][$i];
					echo '<br/>';
					echo '<br/>';
						
					 /*
					$sql_edit = "UPDATE ugroup SET ugroup_report = '$_POST[ugroup_report][$i]', ugroup_admin = '$_POST[ugroup_admin][$i]' WHERE ugroup_id = '$_POST[ugroup_id][$i]'";
					$query_edit = mysql_query($sql_edit);
					if (!$query_edit) die ('UPDATE failed: '.mysql_error());
					*/
					$i++;
				}
				
			}
		
			//CREATE-Button
			if(isset($_POST['create_ugroup'])){
			
				//Check if Usergroup already exists
				$sql_checkexist = "SELECT ugroup_id FROM ugroup WHERE ugroup_name = '$_POST[ugroup_name]'";
				$query_checkexist = mysql_query($sql_checkexist);
				if(!$query_checkexist) die ('SELECT failed: '.mysql_error());
				if($ausgabe = mysql_fetch_array($query_checkexist)){
					error_alert('Usergroup already exists.\nPlease choose different name for Usergroup.');
					goto START_OVER;
				}
				
				//Create new Usergroup
				if(!isset($_POST['ugroup_new'])) $_POST['ugroup_new'] = 0;
				if(!isset($_POST['ugroup_report'])) $_POST['ugroup_report'] = 0;
				if(!isset($_POST['ugroup_admin'])) $_POST['ugroup_admin'] = 0;
				$ugroup_created = time();
				$sql_insert = "INSERT INTO ugroup (ugroup_name, ugroup_new, ugroup_report, ugroup_admin, ugroup_created) VALUES ('$_POST[ugroup_name]', '$_POST[ugroup_new]', '$_POST[ugroup_report]', '$_POST[ugroup_admin]', '$ugroup_created')";
				$query_insert = mysql_query($sql_insert);
				if(!$query_insert) die ('SELECT failed: '.mysql_error());
				echo '<script language=javascript>alert(\'Usergroup created successfully.\')</script>';
			}
			START_OVER:
		?>
			<div class="content_left">
				<form action="admin_ugroup_2.php" method="post">
					<table id="tb_table">				
						<colgroup>
							<col width="30%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="10%">
						</colgroup>
						<tr>
							<th rowspan="2">User Group Name</th>
							<th colspan="2">Permissions</th>
							<th rowspan="2">Edit</th>
						</tr>
						<tr>
							<th style="background-color:#646464">Reports</th>
							<th style="background-color:#646464">Admin</th>
						</tr>
						<?PHP
							$sql_ugroups = "SELECT * FROM ugroup";
							$query_ugroups = mysql_query($sql_ugroups);
							if (!$query_ugroups) die ('SELECT failed: '.mysql_error());
							
							while ($row_ugroups = mysql_fetch_assoc($query_ugroups)){
								tr_colored($color); 	//Function for alternating row colors
								echo '<td><input type="hidden" name="ugroup_id[]" id="ugroup_id" value="'.$row_ugroups['ugroup_id'].'" />'.$row_ugroups['ugroup_name'].'</td>
																						
											<td>
												<input type="checkbox" disabled="disabled" name="ugroup_report[]" id="ugroup_report'.$row_ugroups['ugroup_id'].'" value="1" ';
											if ($row_ugroups['ugroup_report'] == 1) echo 'checked="checked"';
											echo '/ >
											</td>

											<td>
												<input type="checkbox" disabled="disabled" name="ugroup_admin[]" id="ugroup_admin'.$row_ugroups['ugroup_id'].'" value="1" ';
											if ($row_ugroups['ugroup_admin'] == 1) echo 'checked="checked"';
											echo ' />
											</td>
											
											<td>
												<input id="editButton" style="display:inline;" type="button" value="Edit" onClick="edit_enable('.$row_ugroups['ugroup_id'].')" />
											</td>
										</tr>';
							}
						?>
					</table>
					<input type="submit" name="edit_ugroup" value="Edit Usergroup"></input>
				</form>
				</div>
		
				<!-- RIGHT SIDE: Form for creating new User Group -->
				<div class="content_right">
					<p class="heading">Create New Usergroup</p>
					<br/>
					<form action="admin_ugroup.php" method="post">
						<p>Usegroup Name:<br/>
						<input type="text" name="ugroup_name"><br/></p>
						<br/>
						<table border=0 style="margin-left:auto; margin-right:auto;">
							<colgroup>
								<col width="25%">
								<col width="50%">
								<col width="25%">
							</colgroup>
							<tr align="center">
								<td colspan="3"><i>Permissions</i></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr align="center">
								<td>New</td>
								<td>Editing</td>
								<td>Admin</td>
							</tr>
							<tr align="center">
								<td><input type="checkbox" name="ugroup_new" value="1"></td>
								<td><input type="checkbox" name="ugroup_report" value="1"></td>
								<td><input type="checkbox" name="ugroup_admin" value="1"></td>
							</tr>
						</table>
						<input type="submit" name="create_ugroup" value="Create Usergroup">
					</form>
				</div>
		</div>
	</body>
</html>