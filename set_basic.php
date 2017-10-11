<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionAdmin();
	$db_link = connect();

	if (isset($_POST['upd_genset'])){

		//Generate timestamp
		$timestamp = time();

		//Update Currency Abbreviation
		$new_cur_short = sanitize($db_link, $_POST['cur_short']);
		$sql_upd_cur_short = "UPDATE settings SET set_value = '$new_cur_short' WHERE set_short = 'SET_CUR'";
		$query_upd_cur_short = mysqli_query ($db_link, $sql_upd_cur_short);
		checkSQL($db_link, $query_upd_cur_short);

		//Update Minimum Savings Balance
		$new_minsavbal = sanitize($db_link, $_POST['minsavbal']);
		$sql_upd_minsavbal = "UPDATE settings SET set_value = '$new_minsavbal' WHERE set_short = 'SET_MSB'";
		$query_upd_minsavbal = mysqli_query($db_link, $sql_upd_minsavbal);
		checkSQL($db_link, $query_upd_minsavbal);

		//Update Account Deactivation option
		$new_deact = sanitize($db_link, $_POST['deactivate']);
		$sql_upd_deact = "UPDATE settings SET set_value = '$new_deact' WHERE set_short = 'SET_DEA'";
		$query_upd_deact = mysqli_query($db_link, $sql_upd_deact);
		checkSQL($db_link, $query_upd_deact);

		//Update Dashboard Settings Left
		$new_dash_left = sanitize($db_link, $_POST['dash_left']);
		if ($new_deact != NULL )$new_dash_left = "dashboard/dash_subscr.php";
		$sql_upd_dashl = "UPDATE settings SET set_value = '$new_dash_left' WHERE set_short = 'SET_DBL'";
		$query_upd_dashl = mysqli_query($db_link, $sql_upd_dashl);
		checkSQL($db_link, $query_upd_dashl);

		//Update Dashboard Settings Right
		$new_dash_right = sanitize($db_link, $_POST['dash_right']);
		if ($_SESSION['set_auf'] != NULL) $new_dash_right = "dashboard/dash_loandefaults.php";
		$sql_upd_dashr = "UPDATE settings SET set_value = '$new_dash_right' WHERE set_short = 'SET_DBR'";
		$query_upd_dashr = mysqli_query($db_link, $sql_upd_dashr);
		checkSQL($db_link, $query_upd_dashr);

		//Update Customer Number Format
		$new_cno = sanitize($db_link, $_POST['cnformat']);
		$sql_upd_cno = "UPDATE settings SET set_value = '$new_cno' WHERE set_short = 'SET_CNO'";
		$query_upd_cno = mysqli_query($db_link, $sql_upd_cno);
		checkSQL($db_link, $query_upd_cno);

		//Update Employee Number Format
		$new_eno = sanitize($db_link, $_POST['enformat']);
		$sql_upd_eno = "UPDATE settings SET set_value = '$new_eno' WHERE set_short = 'SET_ENO'";
		$query_upd_eno = mysqli_query($db_link, $sql_upd_eno);
		checkSQL($db_link, $query_upd_eno);

		//Update Fixed-term Savings Deposits
		if (isset($_POST['savFixed'])) $new_savFixed = sanitize($db_link, $_POST['savFixed']);
		else $new_savFixed = 0;
		$sql_upd_savFixed = "UPDATE settings SET set_value = '$new_savFixed' WHERE set_short = 'SET_SFX'";
		$query_upd_savFixed = mysqli_query($db_link, $sql_upd_savFixed);
		checkSQL($db_link, $query_upd_savFixed);

		//Update Customer Search by ID
		if (isset($_POST['csearchID'])) $new_csearchID = sanitize($db_link, $_POST['csearchID']);
		else $new_csearchID = 0;
		$sql_upd_csearchID = "UPDATE settings SET set_value = '$new_csearchID' WHERE set_short = 'SET_CSI'";
		$query_upd_csearchID = mysqli_query($db_link, $sql_upd_csearchID);
		checkSQL($db_link, $query_upd_csearchID);
	}

	//Get Settings and fill session variables
	getSettings($db_link);
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
			<?PHP if (strtoupper(substr(PHP_OS, 0, 5)) === 'LINUX') echo '<a href="set_dbbackup.php">Database Backup</a>' ?>
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
								<option value="dashboard/dash_none.php" <?PHP if ($_SESSION['set_dashl'] == "dashboard/dash_none.php") echo "selected='selected'" ?>>None</option>
								<option value="dashboard/dash_subscr.php" <?PHP if ($_SESSION['set_dashl'] == "dashboard/dash_subscr.php") echo "selected='selected'" ?>>Overdue Subscriptions</option>
								<option value="dashboard/dash_loandefaults.php" <?PHP if ($_SESSION['set_dashl'] == "dashboard/dash_loandefaults.php") echo "selected='selected'" ?>>Defaulted Loan Instalments</option>
								<option value="dashboard/dash_stat_cust.php" <?PHP if ($_SESSION['set_dashl'] == "dashboard/dash_stat_cust.php") echo "selected='selected'" ?>>Statistics: Customers</option>
								<option value="dashboard/dash_stat_finance.php" <?PHP if ($_SESSION['set_dashl'] == "dashboard/dash_stat_finance.php") echo "selected='selected'" ?>>Statistics: Finances</option>
							</select>
						</td>
					</tr>

					<tr>
						<td><span>Dashboard Right</span></td>
						<td>
							<select name="dash_right">
								<option value="dashboard/dash_none.php" <?PHP if ($_SESSION['set_dashr'] == "dashboard/dash_none.php") echo "selected='selected'" ?> >None</option>
								<option value="dashboard/dash_subscr.php" <?PHP if ($_SESSION['set_dashr'] == "dashboard/dash_subscr.php") echo "selected='selected'" ?> >Overdue Subscriptions</option>
								<option value="dashboard/dash_loandefaults.php" <?PHP if ($_SESSION['set_dashr'] == "dashboard/dash_loandefaults.php") echo "selected='selected'" ?>>Defaulted Loan Instalments</option>
								<option value="dashboard/dash_stat_cust.php" <?PHP if ($_SESSION['set_dashr'] == "dashboard/dash_stat_cust.php") echo "selected='selected'" ?>>Statistics: Customers</option>
								<option value="dashboard/dash_stat_finance.php" <?PHP if ($_SESSION['set_dashr'] == "dashboard/dash_stat_finance.php") echo "selected='selected'" ?>>Statistics: Finances</option>
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
						<td><span>Customer Search by ID</span></td>
						<td>
							<input type="radio" name="csearchID" value="1" <?PHP if ($_SESSION['set_csi'] == 1) echo 'checked="checked"'; ?> /> On
							<input type="radio" name="csearchID" value="0" <?PHP if ($_SESSION['set_csi'] != 1) echo 'checked="checked"'; ?> style="margin-left:.75em;" /> Off
						</td>
					</tr>

					<tr>
						<td><span>Customer Number Format</span></td>
						<td>
							<input type="text" name="cnformat" value="<?PHP echo $_SESSION['set_cno']; ?>" placeholder="Customer No. Format"/>
						</td>
					</tr>

					<tr>
						<td><span>Employee Number Format</span></td>
						<td>
							<input type="text" name="enformat" value="<?PHP echo $_SESSION['set_eno']; ?>" placeholder="Employee No. Format"/>
						</td>
					</tr>

					<tr>
						<td><span>Minimum Savings Balance</span></td>
						<td>
							<input type="number" min="0" name="minsavbal" value="<?PHP echo $_SESSION['set_msb']; ?>" placeholder="<?PHP echo $_SESSION['set_cur']; ?>" />
						</td>
					</tr>

					<tr>
						<td><span>Fixed-term Saving Deposits</span></td>
						<td>
							<input type="radio" name="savFixed" value="1" <?PHP if ($_SESSION['set_sfx'] == 1) echo 'checked="checked"'; ?> /> On
							<input type="radio" name="savFixed" value="0" <?PHP if ($_SESSION['set_sfx'] != 1) echo 'checked="checked"'; ?> style="margin-left:.75em;" /> Off
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
