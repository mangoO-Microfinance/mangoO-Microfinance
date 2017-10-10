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
		$admin_pass = password_hash ($_POST['admin_pass'].$pepper, PASSWORD_DEFAULT);
		$timestamp = time();
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
				<p>Generate Password Hash</p>
				<form action="setup_pwhash.php" method="post" onsubmit="return validate(this)">
					<input type="password" name="admin_pass" placeholder="Password" required="required" />
					<input type="password" name="admin_pass_conf" placeholder="Repeat Password" required="required" />
					<input type="submit" name="adminSetup" value="Generate" />
				</form>
			</div>

			<?PHP
			if(isset($_POST['adminSetup'])) echo '
				<div class="ui-widget">
					<div class="ui-state-highlight ui-corner-all" style="width:50%; border:none; background-color:#fa6900; margin: 4em auto; padding: .7em;">
						<p style="color:#ffffff;"><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
						The salted password hash is:<br/><br/><strong>'.$admin_pass.'</strong><br/><br/>Copy this hash into your database.</p>
					</div>
				</div>';
			?>

		</div>
	</body>
</html>
