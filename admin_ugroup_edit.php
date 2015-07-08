<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();
	if(isset($_GET['id'])) $_SESSION['ugroup_id'] = sanitize($_GET['id']);
	else header('Location:admin_ugroup.php');
	
	//UPDATE Button
	if (isset($_POST['update'])){
		
		//Sanitize user input
		$ugroup_name = sanitize($_POST['ugroup_name']);
		$timestamp = time();

		if(isset ($_POST['ugroup_new'])) $ugroup_new = '1';
			else $ugroup_new = '0';
		if(isset ($_POST['ugroup_admin'])) $ugroup_admin = '1';
			else $ugroup_admin = '0';
		
		//Update UGROUP
		$sql_update = "UPDATE ugroup SET ugroup_name = '$ugroup_name', ugroup_new = '$ugroup_new', ugroup_report = '$_POST[ugroup_report]', ugroup_admin = '$ugroup_admin', ugroup_created = '$timestamp' WHERE ugroup_id = '$_SESSION[ugroup_id]'";
		$query_update = mysql_query($sql_update);
		if (!$query_update) {
			die('SELECT failed: ' . mysql_error());
		}
		unset($_SESSION['ugroup_id']);
		header('Location: admin_ugroup.php');
	}
	
	//DELETE Button
	if (isset($_POST['del'])){
		$sql_depending = "SELECT * FROM user WHERE ugroup_id = '$_SESSION[ugroup_id]'";
		$query_depending = mysql_query($sql_depending);
		$result_depending = mysql_fetch_array($query_depending);
		
		if($result_depending){
			echo '<div id="message">
							<p class="error">One or more users are still members of this Usergroup.<br/>Usergroup cannot be deleted.</p>
						</div>';
			exit;
		}
		else{
			$sql_del = "DELETE FROM ugroup WHERE ugroup_id = '$_SESSION[ugroup_id]'";
			$query_del = mysql_query($sql_del);
			if (!$query_del) {
				die('SELECT failed: ' . mysql_error());
			}
			unset($_SESSION['ugroup_id']);
			header('Location: admin_ugroup.php');
		}
	}
	
	//Select Usergroup from UGROUP
	$sql_ugroup = "SELECT * FROM ugroup WHERE ugroup_id = '$_SESSION[ugroup_id]'";
	$query_ugroup = mysql_query($sql_ugroup);
	check_sql($query_ugroup);
	$result_uged = mysql_fetch_assoc($query_ugroup);
?>
<html>
	<?PHP htmlHead('Settings | Edit Usergroup',1); ?>
	<body>
		
		<!-- MENU HEADER & TABS -->
		<?PHP 
		include 'menu_header.php';
		menu_Tabs(6);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="admin_genset.php">General Settings</a>
			<a href="admin_fees.php">Fees</a>
			<a href="admin_user.php">Users</a>
			<a href="admin_ugroup.php" id="item_selected">Usergroups</a>
			<a href="admin_logrec.php">Log Records</a>
		</div>
		
		<!-- CONTENT: Usergroup Details -->
		<div class="content_center">
			<p class="heading_narrow">Edit Usergroup "<?PHP echo $result_uged['ugroup_name'] ?>"</p>
			<form action="admin_ugroup_edit.php" method="post">
				<table id="tb_fields" style="width:40%;">
					<tr>
						<td class="center" colspan="2"><input type="text" name="ugroup_name" value="<?PHP echo $result_uged['ugroup_name'] ?>" /></td>
					</tr>
					<tr>
						<td class="center" colspan="2">Permissions</td>
					</tr>
					<tr>
						<td class="center">
							<input type="checkbox" name="ugroup_report"
							<?PHP if($result_uged['ugroup_report']==1) echo 'checked="checked" '; ?>
							/> Reports
						</td>
						<td class="center"><input type="checkbox" name="ugroup_admin" 
						<?PHP if($result_uged['ugroup_admin']==1) echo 'checked="checked" ' ?>
						/> Admin
						</td>
					</tr>
					<tr>
						<td class="center" colspan="2">
							<input type="submit" name="update" value="Update Usergroup" />
							<input type="submit" name="del" value="Delete Usergroup" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>