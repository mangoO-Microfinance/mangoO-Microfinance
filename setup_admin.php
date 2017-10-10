<!DOCTYPE HTML>
<?PHP
	session_start();

	// Connect to database
	$db_link = mysqli_connect($_SESSION['db_host'], $_SESSION['db_user'], $_SESSION['db_pass'], $_SESSION['db_name']);
	if(!$db_link) die('Could not connect to server '.$_SESSION['db_host'].': '.mysqli_error($db_link));

	require_once 'functions.php';

	if(isset($_POST['adminSetup'])){

		// Make new passwort pepper
		require 'setup_makepepper.php';

		// Include passwort pepper
		require 'config/pepper.php';

		// Sanitize user input
		$admin_name = sanitize($db_link, $_POST['admin_name']);
		$admin_pass = password_hash ((sanitize($db_link, $_POST['admin_pass'])).$pepper, PASSWORD_DEFAULT);
		$timestamp = time();

		// Insert new admin user into database
		$sql_makeadmin = "INSERT INTO user (user_name, user_pw, ugroup_id, empl_id, user_created) VALUES ('$admin_name', '$admin_pass', '1', '0', '$timestamp')";
		$query_makeadmin = mysqli_query($db_link, $sql_makeadmin);
		checkSQL($db_link, $query_makeadmin);

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
