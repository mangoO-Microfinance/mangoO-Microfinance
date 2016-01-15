<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_admin();
	connect();
	
	//NEW USER Button
	if(isset($_POST["newuser"])){
		
		//Sanitize user input
		include 'salt.php';
		$user_name = sanitize($_POST['user_name']);
		$user_pw = sha1($salt1.(sanitize($_POST['user_pw'])).$salt2);
		$user_pw_conf = sha1($salt1.(sanitize($_POST['user_pw_conf'])).$salt2);
		$ugroup = sanitize($_POST['ugroup']);
		$timestamp = time();	
		
		//Check if Username already exists
		$sql_check = "SELECT user_id FROM user WHERE user_name = '$user_name'";
		$query_check = mysql_query($sql_check);
		if($ausgabe = mysql_fetch_array($query_check)){
			echo '<script>alert(\'Username already exists. Please choose a different Username.\')</script>';
		}
		
		//Insert new user into USER
		else {			
			$sql_insert = "INSERT INTO user (user_name, user_pw, ugroup_id, user_created) VALUES ('$user_name', '$user_pw', '$ugroup', '$timestamp')";
			$query_insert = mysql_query($sql_insert);
			echo '<script>alert(\'User '.$user_name.' created successfully.\')</script>';
		}
	}
?>

<html>
	<?PHP htmlHead('Settings | Users', 0) ?>
	<script>
			function validate(form){
				fail = validateUser(form.user_name.value)
				fail += validatePw(form.user_pw.value, form.user_pw_conf.value)
				if (fail == "") return true
				else { alert(fail); return false }
			}
		</script>
		<script src="functions_validate.js"></script>
	</head>
	
	<body>
		<!-- MENU HEADER & TABS -->
		<?PHP 
		include 'menu_header.php';
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
		
		<!-- LEFT SIDE: Create New User Form -->
		<div class="content_left">
			<div class="content_settings">
				<p class="heading_narrow" style="text-align:center;">Create New User</p>
			
				<form action="set_user.php" method="post" onSubmit="return validate(this)">
				
					<table id="tb_set">
						<tr>
							<td class="center"><input type="text" name="user_name" placeholder="Username"/></td>
						</tr>
						<tr>
							<td class="center"><input type="password" name="user_pw" placeholder="Password" /></td>
						</tr>
						<tr>
							<td class="center"><input type="password" name="user_pw_conf" placeholder="Repeat Password" /></td>
						</tr>
						<tr>
							<td class="center">
								<select name="ugroup" size="1">
									<?PHP
									$sql_ugroup = "SELECT ugroup_name, ugroup_id FROM ugroup";
									$query_ugroup = mysql_query($sql_ugroup);
									check_sql($query_ugroup);
									while ($row_ugroup = mysql_fetch_assoc($query_ugroup)){
											echo '<option value="'.$row_ugroup['ugroup_id'].'">'.$row_ugroup['ugroup_name'].'</option>';
										}
									?>
								</select>
							</td>
						</tr>
						<tr>
							<td class="center">
								<input type="submit" name="newuser" value="Save Changes" />
							</td>
						</tr>
					</table>
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
						$sql_user = "SELECT * FROM user, ugroup WHERE ugroup.ugroup_id = user.ugroup_id ORDER BY user_name";
						$query_user = mysql_query($sql_user);
						check_sql ($query_user);
						$color=0;
						while ($row_user = mysql_fetch_assoc($query_user)){					
							tr_colored($color);		//Alternating row colors
								echo '<td>'.$row_user['user_name'].'</td>';
								echo '<td>'.$row_user['ugroup_name'].'</td>';
								echo '<td>'.date('d.m.Y',$row_user['user_created']).'</td>';
								echo '<td><a href="set_user_edit.php?id='.$row_user['user_id'].'"><img src="ico/edit.png"></td>';
							echo '</tr>';
						}
					?>
				</table>
			</form>
		
		</div>

	</body>
</html>