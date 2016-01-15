<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_admin();
	connect();
	
	if (isset($_POST['upd_genset'])){
		$timestamp = time();
		
		//Update Currency Abbreviation
		$new_cur_short = sanitize($_POST['cur_short']);
		$sql_upd_cur_short = "UPDATE settings SET set_value = '$new_cur_short' WHERE set_short = 'CUR'";
		$query_upd_cur_short = mysql_query($sql_upd_cur_short);
		check_sql($query_upd_cur_short);
	
		//Update Share Value
		$new_shareval = sanitize($_POST['shareval']);
		$sql_upd_shareval = "INSERT INTO shareval (shareval_date, shareval_value) VALUES ('$timestamp', '$new_shareval')";
		$query_upd_shareval = mysql_query($sql_upd_shareval);
		check_sql($query_upd_shareval);
		
		//Update Minimum Savings Balance
		$new_minsavbal = sanitize($_POST['minsavbal']);
		$sql_upd_minsavbal = "UPDATE settings SET set_value = '$new_minsavbal' WHERE set_short = 'MSB'";
		$query_upd_minsavbal = mysql_query($sql_upd_minsavbal);
		check_sql($query_upd_minsavbal);
		
		//Update Account Deactivation option
		if (isset($_POST['deactivate'])) $new_deact = 1;
			else $new_deact = 0;
		$sql_upd_deact = "UPDATE settings SET set_value = '$new_deact' WHERE set_short = 'DEACT'";
		$query_upd_deact = mysql_query($sql_upd_deact);
		check_sql($query_upd_deact);
		
		//Update Dashboard Settings Left
		$new_dash_left = sanitize($_POST['dash_left']);
		$sql_upd_dashl = "UPDATE settings SET set_value = '$new_dash_left' WHERE set_short = 'DashL'";
		$query_upd_dashl = mysql_query($sql_upd_dashl);
		check_sql($query_upd_dashl);
	
		//Update Dashboard Settings Right
		$new_dash_right = sanitize($_POST['dash_right']);
		$sql_upd_dashr = "UPDATE settings SET set_value = '$new_dash_right' WHERE set_short = 'DashR'";
		$query_upd_dashr = mysql_query($sql_upd_dashr);
		check_sql($query_upd_dashr);
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
	<?PHP htmlHead('Settings | Basic Settings',1) ?>
	
	<body>
		<!-- MENU -->
		<?PHP 
				menu_Tabs(6);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="set_basic.php" id="item_selected">Basic Settings</a>
			<a href="set_loans.php">Loan Settings</a>
			<a href="set_fees.php">Fees</a>
			<a href="set_user.php">Users</a>
			<a href="set_ugroup.php">Usergroups</a>
			<a href="set_logrec.php">Log Records</a>
		</div>
	
		<!-- LEFT SIDE: Basic Settings -->	
		<div class="content_settings">
			<form action="set_basic.php" method="post">
			
				<p class="heading">Basic Settings</p>
				
				<table id="tb_set">
					
					<tr>
						<td><span>Dashboard Left</span></td>
						<td>
							<select name="dash_left">
								<option value="dashboard/dash_none.php" <?PHP if ($_SESSION['set_dashl'] == "dashboard/dash_none.php") echo "selected='selected'" ?> >Empty</option>
								<option value="dashboard/dash_subscr.php" <?PHP if ($_SESSION['set_dashl'] == "dashboard/dash_subscr.php") echo "selected='selected'" ?> >Overdue Subscriptions</option>
								<option value="dashboard/dash_loandefaults.php" <?PHP if ($_SESSION['set_dashl'] == "dashboard/dash_loandefaults.php") echo "selected='selected'" ?>>Defaulted Loan Instalments</option>
								<option value="dashboard/dash_statistics.php" <?PHP if ($_SESSION['set_dashl'] == "dashboard/dash_statistics.php") echo "selected='selected'" ?>>Statistics</option>
							</select>
						</td>
					</tr>
			
					<tr>
						<td><span>Dashboard Right</span></td>
						<td>
							<select name="dash_right">
								<option value="dashboard/dash_none.php" <?PHP if ($_SESSION['set_dashr'] == "dashboard/dash_none.php") echo "selected='selected'" ?> >Empty</option>
								<option value="dashboard/dash_subscr.php" <?PHP if ($_SESSION['set_dashr'] == "dashboard/dash_subscr.php") echo "selected='selected'" ?> >Overdue Subscriptions</option>
								<option value="dashboard/dash_loandefaults.php" <?PHP if ($_SESSION['set_dashr'] == "dashboard/dash_loandefaults.php") echo "selected='selected'" ?>>Defaulted Loan Instalments</option>
								<option value="dashboard/dash_statistics.php" <?PHP if ($_SESSION['set_dashr'] == "dashboard/dash_statistics.php") echo "selected='selected'" ?>>Statistics</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td><span>Currency Abbreviation</span></td>
						<td>
							<input type="text" min="0" name="cur_short" value="<?PHP echo $_SESSION['set_cur'] ?>" />
						</td>
					</tr>
					
					<tr>
						<td><span>Value of Shares</span>
						<td>
							<input type="number" min="0" name="shareval" value="<?PHP echo $shareval[0] ?>" />
						</td>
					</tr>
					
					<tr>
						<td><span>Minimum Savings Balance</span>
						<td>
							<input type="number" min="0" name="minsavbal" value="<?PHP echo $_SESSION['set_msb'] ?>" />
						</td>
					</tr>
					
					<tr>
						<td><span>Automatic Deactivation</span></td>
						<td>
							<input type="checkbox" name="deactivate" id="deactivate" value="1" <?PHP if ($_SESSION['set_deact'] == 1) echo 'checked="checked"' ?> /> of unsubscribed accounts
						</td>
					</tr>
					
				</table>
			
				<input type="submit" name="upd_genset" value="Save Changes">
				
			</form>
			
		</div>
		
	</body>
</html>