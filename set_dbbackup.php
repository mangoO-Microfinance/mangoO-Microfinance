<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionAdmin();
	$db_link = connect();

	//Prepare initial information text about server OS
	if (strtoupper(substr(PHP_OS, 0, 5)) === 'LINUX') {	$infoText = 'This seems to be a Linux system.<br/>Database backup will most probably succeed.';	}
	else { $infoText = 'This does not seem to be a Linux system!</br/>Backup process will most likely fail!'; }

	//BACKUP DATABASE Button
	if (isset($_POST['db_backup'])){
		require_once 'config/config.php';
		$dbhost = DB_HOST;
		$dbuser = DB_USER;
		$dbpassword = DB_PASS;
		$dbname = DB_NAME;
		$dumpfile = 'backup/' . $dbname . '_' . date("Y-m-d_H-i-s") . '.sql.gz';
		passthru("mysqldump --user=$dbuser --password=$dbpassword --host=$dbhost $dbname | gzip -c  > $dumpfile");
		$infoText = "Backup created successfully: ".$dumpfile;
	}
?>

<html>
	<?PHP includeHead('Settings | Database Backup',1) ?>

	<body>
		<!-- MENU -->
		<?PHP includeMenu(6); ?>
		<div id="menu_main">
			<a href="set_basic.php">Basic Settings</a>
			<a href="set_loans.php">Loan Settings</a>
			<a href="set_fees.php">Fees & Charges</a>
			<a href="set_user.php">Users</a>
			<a href="set_ugroup.php">Usergroups</a>
			<a href="set_logrec.php">Log Records</a>
			<?PHP if (strtoupper(substr(PHP_OS, 0, 5)) === 'LINUX') echo '<a href="set_dbbackup.php" id="item_selected">Database Backup</a>' ?>
		</div>

		<!-- PAGE HEADING -->
		<p class="heading">Manual Database Backup</p>

		<div class="content_center">

			<!-- Info-Box -->
			<div class="ui-widget">
				<div class="ui-state-highlight ui-corner-all" style="width:33%; border:none; background-color:#fa6900; margin:auto; padding: .7em;">
					<p style="color:#ffffff;">
						<span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
						<?php echo $infoText;	?>
					</p>
				</div>
			</div>

			<!-- Button -->
			<form action="set_dbbackup.php" method="post" style="margin-top:3%;">
				<input type="submit" name="db_backup" value="Backup Database">
			</form>

		</div>

	</body>
</html>
