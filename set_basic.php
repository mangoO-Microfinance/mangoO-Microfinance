<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionAdmin();
	connect();
	
	if (isset($_POST['upd_genset'])){
		
		//Generate timestamp
		$timestamp = time();
		
		//Update Currency Abbreviation
		$new_cur_short = sanitize($_POST['cur_short']);
		$sql_upd_cur_short = "UPDATE settings SET set_value = '$new_cur_short' WHERE set_short = 'SET_CUR'";
		$query_upd_cur_short = mysql_query($sql_upd_cur_short);
		checkSQL($query_upd_cur_short);
		
		//Update Minimum Savings Balance
		$new_minsavbal = sanitize($_POST['minsavbal']);
		$sql_upd_minsavbal = "UPDATE settings SET set_value = '$new_minsavbal' WHERE set_short = 'SET_MSB'";
		$query_upd_minsavbal = mysql_query($sql_upd_minsavbal);
		checkSQL($query_upd_minsavbal);
		
		//Update Account Deactivation option
		$new_deact = sanitize($_POST['deactivate']);
		$sql_upd_deact = "UPDATE settings SET set_value = '$new_deact' WHERE set_short = 'SET_DEA'";
		$query_upd_deact = mysql_query($sql_upd_deact);
		checkSQL($query_upd_deact);
		
		//Update Dashboard Settings Left
		$new_dash_left = sanitize($_POST['dash_left']);
		if ($new_deact != NULL )$new_dash_left = "dashboard/dash_subscr.php";
		$sql_upd_dashl = "UPDATE settings SET set_value = '$new_dash_left' WHERE set_short = 'SET_DBL'";
		$query_upd_dashl = mysql_query($sql_upd_dashl);
		checkSQL($query_upd_dashl);
	
		//Update Dashboard Settings Right
		$new_dash_right = sanitize($_POST['dash_right']);
		if ($_SESSION['set_auf'] != NULL) $new_dash_right = "dashboard/dash_loandefaults.php";
		$sql_upd_dashr = "UPDATE settings SET set_value = '$new_dash_right' WHERE set_short = 'SET_DBR'";
		$query_upd_dashr = mysql_query($sql_upd_dashr);
		checkSQL($query_upd_dashr);
	}
	
	//Get Settings and fill session variables
	getSettings();
?>

<html>
	<?PHP includeHead('Settings | Basic Settings',1) ?>
	
	<body>
		<!-- MENU -->
		<?PHP includeMenu(6); ?>
		<div id="menu_main">
			<a href="set_basic.php" id="item_selected">Basic Settings</a>
			<a href="set_loans.php">Loan Settings</a>
			<a href="set_fees.php">Fees & Charges</a>
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
						<td><span>Minimum Savings Balance</span></td>
						<td>
							<input type="number" min="0" name="minsavbal" value="<?PHP echo $_SESSION['set_msb']; ?>" placeholder="<?PHP echo $_SESSION['set_cur']; ?>" />
						</td>
					</tr>
					
					<tr>
						<td><span>Auto-deactivate unrenewed<br/>accounts after (Months)</span></td>
						<td>
							<input type="number" name="deactivate" min="0" value="<?PHP echo $_SESSION['set_deact']; ?>" placeholder="Auto-deactivation off" />
						</td>
					</tr>
					
				</table>
			
				<input type="submit" name="upd_genset" value="Save Changes">
				
			</form>
			
		</div>
		
	</body>
</html>