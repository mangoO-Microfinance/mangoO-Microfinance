<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_admin();
	connect();
	$user_id = 0;
	$error = "no";
	
	//Select all users from USER
	$users = array();
	$user_names = array();
	$sql_users = "SELECT * FROM user, ugroup WHERE ugroup.ugroup_id = user.ugroup_id ORDER BY user_name";
	$query_users = mysql_query($sql_users);
	check_sql ($query_users);
	while($row_users = mysql_fetch_assoc($query_users)){
		$users[] = $row_users;
		$user_names[] = $row_users['user_name'];
	}
	
	//Select all usergroups from UGROUP
	$sql_ugroup = "SELECT ugroup_name, ugroup_id FROM ugroup";
	$query_ugroup = mysql_query($sql_ugroup);
	check_sql($query_ugroup);
	
	//Set heading and variables according to selection
	if(isset($_GET['user'])){
		$user_id = sanitize($_GET['user']);
		foreach ($users as $row_user){
			if ($row_user['user_id'] == $user_id){
				$user_id = $row_user['user_id'];
				$user_name = $row_user['user_name'];
				$user_ugroup = $row_user['ugroup_id'];
			}
		}
		$heading = "Edit User";
	}
	else $heading = "Create User";
	
	//SAVE Button
	if(isset($_POST["save_changes"])){
		
		//Sanitize user input
		$user_id = sanitize($_POST['user_id']);
		$user_name = sanitize($_POST['user_name']);
		include 'salt.php';
		$user_pw = sha1($salt1.(sanitize($_POST['user_pw'])).$salt2);
		$user_pw_conf = sha1($salt1.(sanitize($_POST['user_pw_conf'])).$salt2);
		$ugroup = sanitize($_POST['ugroup']);
		$timestamp = time();	
		
		if($user_id == 0){
			//Insert new user into USER
			$sql_insert = "INSERT INTO user (user_name, user_pw, ugroup_id, user_created) VALUES ('$user_name', '$user_pw', '$ugroup', '$timestamp')";
			$query_insert = mysql_query($sql_insert);
		}
		else {
			//Update existing user
			$sql_user_upd = "UPDATE user SET user_name = '$user_name', user_pw = '$user_pw', ugroup_id = $ugroup, user_created = $timestamp WHERE user_id = $user_id";
			$query_user_upd = mysql_query($sql_user_upd);
			check_sql($query_user_upd);
		}
		header('Location:set_user.php');
	}
?>

<html>
	<?PHP htmlHead('Settings | Users', 0) ?>
		<script>
			function validate(form){
				fail = validateUser(form.user_name.value, <?PHP echo json_encode($user_names).', '.$user_id; ?>)
				fail += validatePw(form.user_pw.value, form.user_pw_conf.value)
				if (fail == "") return true
				else { alert(fail); return false }
			}
		</script>
		<script src="functions_validate.js"></script>
	</head>
	
	<body>
		<!-- MENU -->
		<?PHP 
				include_Menu(6);
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
		
		<!-- LEFT SIDE: Create New User Form -->
		<div class="content_left">
			<div class="content_settings" style="text-align:left; width:80%;">
				<?PHP echo '<p class="heading">'.$heading.'</p>'; ?>
			
				<form action="set_user.php" method="post" onSubmit="return validate(this)">
				
					<table id="tb_set" style="margin:auto;">
						<tr>
							<td>Username</td>
							<td><input type="text" name="user_name" placeholder="Username" value="<?PHP if(isset($user_name)) echo $user_name;?>" /></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input type="password" name="user_pw" placeholder="Password" /></td>
						</tr>
						<tr>
							<td>Repeat Password</td>
							<td><input type="password" name="user_pw_conf" placeholder="Repeat Password" /></td>
						</tr>
						<tr>
							<td>Usergroup</td>
							<td class="center">
								<select name="ugroup" size="1" <?PHP if ($user_id == 1) echo ' disabled="disabled"'; ?> >
									<?PHP
									while ($row_ugroup = mysql_fetch_assoc($query_ugroup)){
											echo '<option value="'.$row_ugroup['ugroup_id'].'"';
											if (isset($user_ugroup) and $row_ugroup['ugroup_id'] == $user_ugroup) echo ' selected="selected	"';
											echo '>'.$row_ugroup['ugroup_name'].'</option>';
										}
									?>
								</select>
							</td>
						</tr>
					</table>
					<input type="submit" name="save_changes" value="Save Changes" />
					<input type="hidden" name="user_id" value="<?PHP echo $user_id; ?>" />
				</form>			
			</div>
		</div>
		
		<!-- RIGHT SIDE: List of Users -->
		<div class="content_right">
			<form action="set_ugroup.php" method="post">
				<table id="tb_table">				
					<colgroup>
						<col width="35%">
						<col width="35%">
						<col width="20%">
						<col width="10%">
					</colgroup>
					<tr>
						<th class="title" colspan="4">Existing Users</th>
					</tr>
					<tr>
						<th>User Name</th>
						<th>User Group</th>					
						<th>Changed</th>
						<th>Edit</th> 
					</tr>
					<?PHP
					$color=0;
					foreach ($users as $row_user){					
						tr_colored($color);		//Alternating row colors
							echo '<td>'.$row_user['user_name'].'</td>';
							echo '<td>'.$row_user['ugroup_name'].'</td>';
							echo '<td>'.date('d.m.Y',$row_user['user_created']).'</td>';
							echo '<td><a href="set_user.php?user='.$row_user['user_id'].'"><img src="ico/edit.png"></td>';
						echo '</tr>';
					}
					?>
				</table>
			</form>
		</div>
	</body>
</html>