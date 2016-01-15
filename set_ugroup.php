<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_admin();
	connect();
	
	//CREATE-Button
	if(isset($_POST['create_ugroup'])){
		
		//Sanitize user input
		$ugroup_name = sanitize($_POST['ugroup_name']);
		$timestamp = time();
		
		if(isset ($_POST['ugroup_report'])) $ugroup_report = '1';
			else $ugroup_report = '0';
		if(isset($_POST['ugroup_admin'])) $ugroup_admin = '1';
			else $ugroup_admin = '0';
		
		//Check if Usergroup already exists
		$sql= "SELECT ugroup_id FROM ugroup WHERE ugroup_name = '$ugroup_name'";
		$query = mysql_query($sql);
		if($ausgabe = mysql_fetch_array($query)){
			echo "<script>alert('Usergroup already exits. Please choose a different name.')</script>";
			die;
		}
		
		//Insert new Usergroup into UGROUP
		else {
			$sql_insert = "INSERT INTO ugroup (ugroup_name, ugroup_report, ugroup_admin, ugroup_created) VALUES ('$ugroup_name', '$ugroup_report', '$ugroup_admin', '$timestamp')";
			$query_insert = mysql_query($sql_insert);
			if(!$query_insert) die ('INSERT failed');
			else echo "<script>alert('Usergroup created successfully.')</script>";
		}
	}
?>

<html>
	<?PHP htmlHead('Settings | Usergroups',1) ?>		
	<body>
		<!-- MENU -->
		<?PHP 
				menu_Tabs(6);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="set_basic.php">Basic Settings</a>
			<a href="set_loans.php">Loan Settings</a>
			<a href="set_fees.php">Fees</a>
			<a href="set_user.php">Users</a>
			<a href="set_ugroup.php" id="item_selected">Usergroups</a>
			<a href="set_logrec.php">Log Records</a>
		</div>
		
		<!-- LEFT SIDE: Create New Usergroup Form -->
		<div class="content_left">
			<div class="content_settings" style="text-align:left; width:80%;">
				<p class="heading">Create Usergroup</p>
			
				<form action="set_ugroup.php" method="post">
					<table id="tb_set" style="margin:auto;">	
						<tr>
							<td>Usergroup Name</td>
							<td><input type="text" name="ugroup_name" placeholder="Usergroup Name" /></td>
						</tr>
						<tr>
							<td>Permissions</td>
							<td><input type="checkbox" name="ugroup_admin" /> Administrator</td>
						</tr>
						<tr>
							<td></td>
							<td><input type="checkbox" name="ugroup_report" /> Reports</td>
						</tr>
					</table>
					<input type="submit" name="create_ugroup" value="Save Changes" />
				</form>
			</div>
		</div>
	
		<!-- RIGHT SIDE: TABLE: Existing Usergroups -->
		<div class="content_right">
			<table id="tb_table">				
				<colgroup>
					<col width="30%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<tr>
					<th colspan="4" class="title">Existing Usergroups</th>
				</tr>
				<tr>
					<th rowspan="2">User Group Name</th>
					<th colspan="2">Permissions</th>
					<th rowspan="2">Edit</th>
				</tr>
				<tr>
					<th style="background-color:#a7dbd8">Reports</th>
					<th style="background-color:#a7dbd8">Admin</th>
				</tr>
				<?PHP
					$sql_ugroups = "SELECT * FROM ugroup";
					$query_ugroups = mysql_query($sql_ugroups);
					if (!$query_ugroups) {
								die('SELECT failed: ' . mysql_error());
						}
					$color=0;
					while ($row_ugroups = mysql_fetch_assoc($query_ugroups)){
						tr_colored($color);						
						echo '<td>'.$row_ugroups['ugroup_name'].'</td>';
						
						if ($row_ugroups['ugroup_report'] == '1') echo '<td><input type="checkbox" disabled="disabled" name="ugroup_report" value="1" checked></td>';
							else echo '<td><input type="checkbox" disabled="disabled" name="ugroup_report" value="0"></td>';
		
						if($row_ugroups['ugroup_admin']==1) echo '<td><input type="checkbox" disabled="disabled" name="ugroup_admin" value="1" checked></td>';
							else echo '<td><input type="checkbox" disabled="disabled" name="ugroup_admin" value="0"></td>';
							
						echo '<td><a href="set_ugroup_edit.php?id='.$row_ugroups['ugroup_id'].'"><img src="ico/edit.png"></td>
							</tr>';
					}
				?>
			</table>
		</div>		
	</body>
</html>