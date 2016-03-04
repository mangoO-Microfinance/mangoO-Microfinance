<!DOCTYPE HTML>
<?PHP
	session_start();
	require_once 'functions.php';
	
	if(isset($_POST['adminSetup'])){
		
		// Make new passwort pepper
		require 'setup_makepepper.php';
		
		// Include passwort pepper
		require 'config/pepper.php';
		
		// Sanitize user input	
		$admin_name = sanitize($_POST['admin_name']);
		$admin_pass = password_hash ((sanitize($_POST['admin_pass'])).$pepper, PASSWORD_DEFAULT);
		$timestamp = time();

		// Connect to Database Server
		$db_connect = mysql_connect($_SESSION['db_host'], $_SESSION['db_user'], $_SESSION['db_pass']);
		if(!$db_connect) die('Could not connect to server '.$_SESSION['db_host'].': '.mysql_showMessage());
		$db_select = mysql_select_db($_SESSION['db_name']);
		if(!$db_select) die('Could not select database '.$_SESSION['db_name'].': '.mysql_showMessage());

		// Insert new admin user into database
		$sql_makeadmin = "INSERT INTO user (user_name, user_pw, ugroup_id, user_created) VALUES ('$admin_name', '$admin_pass', '1', '$timestamp')";
		$query_makeadmin = mysql_query($sql_makeadmin);
		checkSQL($query_makeadmin);
		
		// Forward to setup_makeconf.php
		header ('Location:setup_makeconf.php');
	}
?>

<html>
	<?PHP includeHead('Microfinance Management', 0) ?>	
		<link rel="stylesheet" type="text/css" href="css/setup.css" />
		<script>
			function validate(form){
				fail = validatePw(form.admin_pass.value, form.admin_pass_conf.value)
				if (fail == "") return true
				else { alert(fail); return false }
			}
		</script>
		<script src="functions_validate.js"></script>
	</head>
	<body>
		<div class="content_center">
			<img src="ico/mangoo_l.png" style="width:380px; margin-top:3em; margin-bottom:2em;"/>
			<p class="heading">mangoO Setup Assistant</p>
			
			<div class="setup">
				<p>Admin Account Setup</p>
				<form action="setup_admin.php" method="post" onsubmit="return validate(this)">
					<input type="text" name="admin_name" placeholder="Admin Name" required="required" />
					<input type="password" name="admin_pass" placeholder="Admin Password" required="required" />
					<input type="password" name="admin_pass_conf" placeholder="Repeat Admin Password" required="required" />
					<input type="submit" name="adminSetup" value="Setup" />
				</form>
			</div>
		
		</div>
	</body>
</html>