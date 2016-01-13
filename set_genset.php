<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_admin();
	connect();
	
	//Update Currency Abbreviation
	if (isset($_POST['upd_cur_short'])){
		$new_cur_short = sanitize($_POST['cur_short']);
		$sql_upd_cur_short = "UPDATE settings SET set_value = '$new_cur_short' WHERE set_short = 'CUR'";
		$query_upd_cur_short = mysql_query($sql_upd_cur_short);
		check_sql($query_upd_cur_short);
		echo '<script>alert(\'Currency Abbreviation updated successfully.\')</script>';
	}
	
	//Update Share Value
	if (isset($_POST['upd_shareval'])){
		$new_shareval = sanitize($_POST['shareval']);
		$timestamp = time();
		$sql_upd_shareval = "INSERT INTO shareval (shareval_date, shareval_value) VALUES ('$timestamp', '$new_shareval')";
		$query_upd_shareval = mysql_query($sql_upd_shareval);
		check_sql($query_upd_shareval);
		echo '<script>alert(\'Share Value updated successfully.\')</script>';
	}
		
	//Update Minimum Savings Balance
	if (isset($_POST['upd_minsavbal'])){
		$new_minsavbal = sanitize($_POST['minsavbal']);
		$sql_upd_minsavbal = "UPDATE settings SET set_value = '$new_minsavbal' WHERE set_short = 'MSB'";
		$query_upd_minsavbal = mysql_query($sql_upd_minsavbal);
		check_sql($query_upd_minsavbal);
		echo '<script>alert(\'Minimum Savings Balance updated successfully.\')</script>';
	}
	
	//Update Account Deactivation option
	if (isset($_POST['upd_deact'])){
		if (isset($_POST['deactivate'])) $new_deact = 1;
			else $new_deact = 0;
		$sql_upd_deact = "UPDATE settings SET set_value = '$new_deact' WHERE set_short = 'DEACT'";
		$query_upd_deact = mysql_query($sql_upd_deact);
		check_sql($query_upd_deact);
		echo '<script>alert(\'Account Deactivation option updated successfully.\')</script>';
	}
	
	
	/* SELECTIONS */
	
	//Select Currency Abbreviation from SETTINGS
	$sql_cur_short = "SELECT set_value FROM settings WHERE set_short = 'CUR'";
	$query_cur_short = mysql_query($sql_cur_short);
	check_sql($query_cur_short);
	$cur_short = mysql_fetch_row($query_cur_short);

	//Select Value of Shares from SHAREVAL
	$sql_shareval = "SELECT shareval_value FROM shareval WHERE shareval_id IN (SELECT MAX(shareval_id) FROM shareval)";
	$query_shareval = mysql_query($sql_shareval);
	check_sql($query_shareval);
	$shareval = mysql_fetch_row($query_shareval);
	
	//Select Minimum Savings Balance from SETTINGS
	$sql_minsavbal = "SELECT set_value FROM settings WHERE set_short = 'MSB'";
	$query_minsavbal = mysql_query($sql_minsavbal);
	check_sql($query_minsavbal);
	$minsavbal = mysql_fetch_row($query_minsavbal);
	
	//Select Auto-fine from SETTINGS
	$sql_deact = "SELECT set_value FROM settings WHERE set_short = 'DEACT'";
	$query_deact = mysql_query($sql_deact);
	check_sql($query_deact);
	$deact = mysql_fetch_row($query_deact);
?>

<html>
	<?PHP htmlHead('Settings | General Settings',1) ?>
	
	<body>
		<!-- MENU HEADER & TABS -->
		<?PHP 
		include 'menu_header.php';
		menu_Tabs(6);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="set_genset.php" id="item_selected">General Settings</a>
			<a href="set_loans.php">Loan Settings</a>
			<a href="set_fees.php">Fees</a>
			<a href="set_user.php">Users</a>
			<a href="set_ugroup.php">Usergroups</a>
			<a href="set_logrec.php">Log Records</a>
		</div>
	
		<!-- LEFT SIDE: General Settings -->	
		<div class="content_left" style="width:50%; margin-bottom:5em;">
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Currency Abbreviation</p>
			<form action="set_genset.php" method="post">
				<input type="text" min="0" name="cur_short" value="<?PHP echo $cur_short[0] ?>" />
				<input type="submit" name="upd_cur_short" value="Update" />
			</form>
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Value of Shares</p>
			<form action="set_genset.php" method="post">
				<input type="number" min="0" name="shareval" value="<?PHP echo $shareval[0] ?>" />
				<input type="submit" name="upd_shareval" value="Update" />
			</form>
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Minimum Savings Balance</p>
			<form action="set_genset.php" method="post">
				<input type="number" min="0" name="minsavbal" value="<?PHP echo $minsavbal[0] ?>" />
				<input type="submit" name="upd_minsavbal" value="Update" />
			</form>
			
		</div>
		
		<!-- RIGHT SIDE: General Settings -->	
		<div class="content_right" style="width:50%;">
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Account Deactivation</p>
			<form action="set_genset.php" method="post">
				<label for="deactivate">
					<input type="checkbox" name="deactivate" id="deactivate" value="1" <?PHP if ($deact[0] == 1) echo 'checked="checked"' ?> /> Deactivate unsubscribed accounts
				</label>
				<input type="submit" name="upd_deact" value="Update" />
			</form>
			
		</div>
	</body>
</html>