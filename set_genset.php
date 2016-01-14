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
	
	//Update Dashboard Settings Left
	if(isset($_POST['upd_dashl'])){
		$new_dash_left = sanitize($_POST['dash_left']);
		$sql_upd_dashl = "UPDATE settings SET set_value = '$new_dash_left' WHERE set_short = 'DashL'";
		$query_upd_dashl = mysql_query($sql_upd_dashl);
		check_sql($query_upd_dashl);
		echo '<script>alert(\'Left dashboard section updated successfully.\')</script>';
	}
	
	//Update Dashboard Settings Right
	if(isset($_POST['upd_dashr'])){
		$new_dash_right = sanitize($_POST['dash_right']);
		$sql_upd_dashr = "UPDATE settings SET set_value = '$new_dash_right' WHERE set_short = 'DashR'";
		$query_upd_dashr = mysql_query($sql_upd_dashr);
		check_sql($query_upd_dashr);
		echo '<script>alert(\'Right dashboard section updated successfully.\')</script>';
	}
	
	// Get Settings and fill variables
	get_settings();
	
	//Select Value of Shares from SHAREVAL
	$sql_shareval = "SELECT shareval_value FROM shareval WHERE shareval_id IN (SELECT MAX(shareval_id) FROM shareval)";
	$query_shareval = mysql_query($sql_shareval);
	check_sql($query_shareval);
	$shareval = mysql_fetch_row($query_shareval);
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
				<input type="text" min="0" name="cur_short" value="<?PHP echo $_SESSION['set_cur'] ?>" />
				<input type="submit" name="upd_cur_short" value="Update" />
			</form>
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Value of Shares</p>
			<form action="set_genset.php" method="post">
				<input type="number" min="0" name="shareval" value="<?PHP echo $shareval[0] ?>" />
				<input type="submit" name="upd_shareval" value="Update" />
			</form>
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Minimum Savings Balance</p>
			<form action="set_genset.php" method="post">
				<input type="number" min="0" name="minsavbal" value="<?PHP echo $_SESSION['set_msb'] ?>" />
				<input type="submit" name="upd_minsavbal" value="Update" />
			</form>
			
		</div>
		
		<!-- RIGHT SIDE: General Settings -->	
		<div class="content_right" style="width:50%;">
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Dashboard Left</p>
			<form action="set_genset.php" method="post">
				<select name="dash_left">
					<option value="dashboard/dash_none.php" <?PHP if ($dashL == "dashboard/dash_none.php") echo "selected='selected'" ?> >Empty</option>
					<option value="dashboard/dash_subscr.php" <?PHP if ($_SESSION['set_dashl'] == "dashboard/dash_subscr.php") echo "selected='selected'" ?> >Overdue Subscriptions</option>
					<option value="dashboard/dash_loandefaults.php" <?PHP if ($_SESSION['set_dashl'] == "dashboard/dash_loandefaults.php") echo "selected='selected'" ?>>Defaulted Loan Instalments</option>
					<option value="dashboard/dash_statistics.php" <?PHP if ($_SESSION['set_dashl'] == "dashboard/dash_statistics.php") echo "selected='selected'" ?>>Statistics</option>
				</select>
				<input type="submit" name="upd_dashl" value="Update" />
			</form>
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Dashboard Right</p>
			<form action="set_genset.php" method="post">
				<select name="dash_right">
					<option value="dashboard/dash_none.php" <?PHP if ($_SESSION['set_dashr'] == "dashboard/dash_none.php") echo "selected='selected'" ?> >Empty</option>
					<option value="dashboard/dash_subscr.php" <?PHP if ($_SESSION['set_dashr'] == "dashboard/dash_subscr.php") echo "selected='selected'" ?> >Overdue Subscriptions</option>
					<option value="dashboard/dash_loandefaults.php" <?PHP if ($_SESSION['set_dashr'] == "dashboard/dash_loandefaults.php") echo "selected='selected'" ?>>Defaulted Loan Instalments</option>
					<option value="dashboard/dash_statistics.php" <?PHP if ($_SESSION['set_dashr'] == "dashboard/dash_statistics.php") echo "selected='selected'" ?>>Statistics</option>
				</select>
				<input type="submit" name="upd_dashr" value="Update" />
			</form>
			
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Account Deactivation</p>
			<form action="set_genset.php" method="post">
				<label for="deactivate">
					<input type="checkbox" name="deactivate" id="deactivate" value="1" <?PHP if ($_SESSION['set_deact'] == 1) echo 'checked="checked"' ?> /> Deactivate unsubscribed accounts
				</label>
				<input type="submit" name="upd_deact" value="Update" />
			</form>
			
		</div>
	</body>
</html>