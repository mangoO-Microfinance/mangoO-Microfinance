<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_admin();
	connect();
	
	//Check for USER_ID
	if (!isset($_SESSION['user_edit_id'])){
		if (isset($_GET['id'])) $_SESSION['user_edit_id'] = sanitize($_GET['id']);
		else header('Location: set_user.php');
	}

	//CANCEL-Button
	if (isset($_POST['cancel'])) {
		unset($_SESSION['user_edit_id']);
		header('Location: set_user.php');
	}
	
	//UPDATE Button
	if (isset($_POST['update'])){
		include 'salt.php';
		$timestamp = time();
		$user_name = sanitize($_POST['user_name']);
		$user_pw = sha1($salt1.(sanitize($_POST['user_pw'])).$salt2);
		$user_pw_conf = sha1($salt1.(sanitize($_POST['user_pw_conf'])).$salt2);
		
		if($_POST['user_pw'] == ''){
			echo "<script>
							alert('Please enter a Password for user ".$user_name."')
						</script>";
		}
		elseif($user_pw != $user_pw_conf){
			echo '<script>
							alert(\'Passwords do not match. Please try again.\')
						</script>';
		}
		else {
			$sql_update = "UPDATE user SET user_name = '$user_name', user_pw = '$user_pw', ugroup_id = '$_POST[ugroup_name]', user_created = $timestamp WHERE user_id = '$_SESSION[user_edit_id]'";
			$query_update = mysql_query($sql_update);
			check_sql($query_update);
			unset($_SESSION['user_edit_id']);
			header('Location: set_user.php');
		}
	}
	
	//Select USER from database
	$sql_user = "SELECT * FROM user, ugroup WHERE user.ugroup_id = ugroup.ugroup_id AND user_id = '$_SESSION[user_edit_id]'";
	$query_user = mysql_query($sql_user);
	check_sql($query_user);
	$result_user = mysql_fetch_assoc($query_user);
	
	//Select all USERGROUPS to fill drop-down menu
	$sql_ugroup = "SELECT ugroup_id, ugroup_name FROM ugroup";
	$query_ugroups = mysql_query($sql_ugroup);
	check_sql($query_ugroups);
?>
<html>
	<?PHP htmlHead('Admin | Edit User',1) ?>	
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
			<a href="set_user.php" id="item_selected">Users</a>
			<a href="set_ugroup.php">Usergroups</a>
			<a href="set_logrec.php">Log Records</a>
		</div>
				
		<div class="content_center">
			<p class="heading_narrow">Edit User "<?PHP echo $result_user['user_name'] ?>"</p>
			<form action="set_user_edit.php" method="post">
				<table id="tb_fields" style="width:35%;">
					<?PHP
					//Show entry to be edited
					echo '<tr>
									<td>User Name:</td>
									<td><input type="text" name="user_name" value="'.$result_user['user_name'].'" /></td>
								</tr>
								<tr>
									<td>Password:</td>
									<td><input type="password" name="user_pw" /></td>
								</tr>
								<tr>
									<td>Repeat Password:</td>
									<td><input type="password" name="user_pw_conf" /></td>
								</tr>
								<tr>
									<td>User Group:</td>
									<td><select name="ugroup_name" size="1">';
									while ($row_ugroup = mysql_fetch_assoc($query_ugroups)){
										echo '<option ';
										if ($row_ugroup ['ugroup_id'] == $result_user['ugroup_id']) echo 'selected="selected" ';
										echo 'value="'.$row_ugroup['ugroup_id'].'">'.$row_ugroup['ugroup_name'].'</option>';
									}
						echo '</select></td>
								</tr>';
					?>
					<tr>
						<td class="center" colspan="2">
							<input type="submit" name="update" value="Save Changes" />
							<input type="submit" name="cancel" value="Cancel" />
						</td>
					</tr>
				
				
				</table>
				
			</form>
		</div>
	</body>
</html>