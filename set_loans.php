<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionAdmin();
	$db_link = connect();

	//Save Changes
	if (isset($_POST['upd_loans'])){
		//Update Interest Calculation Method
		$new_intcalcmethod = sanitize($db_link, $_POST['intcalcmethod']);
		$sql_upd_intcalcmethod = "UPDATE settings SET set_value = '$new_intcalcmethod' WHERE set_short = 'SET_ICL'";
		$query_upd_intcalcmethod = mysqli_query($db_link, $sql_upd_intcalcmethod);
		checkSQL($db_link, $query_upd_intcalcmethod);

		//Update Interest Rate
		$new_loaninterest = sanitize($db_link, $_POST['loaninterest']);
		$sql_upd_loaninterest = "UPDATE fees SET fee_value = '$new_loaninterest' WHERE fee_short = 'FEE_LIR'";
		$query_upd_loaninterest = mysqli_query($db_link, $sql_upd_loaninterest);
		checkSQL($db_link, $query_upd_loaninterest);

		//Update Minimum Loan Principal
		$new_minLP = sanitize($db_link, $_POST['minLP']);
		$sql_upd_minLP = "UPDATE settings SET set_value = '$new_minLP' WHERE set_short = 'SET_MLP'";
		$query_upd_minLP = mysqli_query($db_link, $sql_upd_minLP);
		checkSQL($db_link, $query_upd_minLP);

		//Update Maximum Loan Principal
		$new_maxLP = sanitize($db_link, $_POST['maxLP']);
		$sql_upd_maxLP = "UPDATE settings SET set_value = '$new_maxLP' WHERE set_short = 'SET_XLP'";
		$query_upd_maxLP = mysqli_query($db_link, $sql_upd_maxLP);
		checkSQL($db_link, $query_upd_maxLP);

		//Update Maximum Principal-Savings Ratio
		$new_maxPSR = sanitize($db_link, $_POST['maxPSR']);
		$sql_upd_maxPSR = "UPDATE settings SET set_value = '$new_maxPSR' WHERE set_short = 'SET_PSR'";
		$query_upd_maxPSR = mysqli_query($db_link, $sql_upd_maxPSR);
		checkSQL($db_link, $query_upd_maxPSR);

		//Update Maximum Number of Guarantees any member can give
		$new_maxGuar = sanitize($db_link, $_POST['maxGuar']);
		$sql_upd_maxGuar = "UPDATE settings SET set_value = '$new_maxGuar' WHERE set_short = 'SET_GUA'";
		$query_upd_maxGuar = mysqli_query($db_link, $sql_upd_maxGuar);
		checkSQL($db_link, $query_upd_maxGuar);

		//Update Minimum Length of Membership before Loan Application
		$new_minMemb = sanitize($db_link, $_POST['minMemb']);
		$sql_upd_minMemb = "UPDATE settings SET set_value = '$new_minMemb' WHERE set_short = 'SET_MEM'";
		$query_upd_minMemb = mysqli_query($db_link, $sql_upd_minMemb);
		checkSQL($db_link, $query_upd_minMemb);

		//Update Auto-fine option
		$new_auf = sanitize($db_link, $_POST['autofine']);
		$sql_upd_auf = "UPDATE settings SET set_value = '$new_auf' WHERE set_short = 'SET_AUF'";
		$query_upd_auf = mysqli_query($db_link, $sql_upd_auf);
		checkSQL($db_link, $query_upd_auf);

		//Update Additional Loans Input Field
		$new_xl1 = sanitize($db_link, $_POST['xtraField1']);
		$sql_upd_xl1 = "UPDATE settings SET set_value = '$new_xl1' WHERE set_short = 'SET_XL1'";
		$query_upd_xl1 = mysqli_query($db_link, $sql_upd_xl1);
		checkSQL($db_link, $query_upd_xl1);

		//If auto-fine option is enabled, make sure dashboard shows loan default list
		if ($new_auf != NULL){
			$new_dash_right = "dashboard/dash_loandefaults.php";
			$sql_upd_dashr = "UPDATE settings SET set_value = '$new_dash_right' WHERE set_short = 'SET_DBR'";
			$query_upd_dashr = mysqli_query($db_link, $sql_upd_dashr);
			checkSQL($db_link, $query_upd_dashr);
		}
	}

	//Get Settings and Fees
	getSettings($db_link);
	getFees($db_link);
?>
<html>
	<?PHP includeHead('Settings | Loan Settings',1) ?>

	<body>
		<!-- MENU -->
		<?PHP includeMenu(6);	?>
		<div id="menu_main">
			<a href="set_basic.php">Basic Settings</a>
			<a href="set_loans.php" id="item_selected">Loan Settings</a>
			<a href="set_fees.php">Fees & Charges</a>
			<a href="set_user.php">Users</a>
			<a href="set_ugroup.php">Usergroups</a>
			<a href="set_logrec.php">Log Records</a>
			<?PHP if (strtoupper(substr(PHP_OS, 0, 5)) === 'LINUX') echo '<a href="set_dbbackup.php">Database Backup</a>' ?>
		</div>

		<!-- LEFT SIDE: Fees -->
		<div class="content_settings">

			<form action="set_loans.php" method="post">

				<p class="heading">Loan Settings</td>

				<table id="tb_set">

					<tr>
						<td>Interest Calculation Method</td>
						<td>
							<select name="intcalcmethod" />
								<option value="modules/mod_inter_fixed.php" <?PHP if ($_SESSION['set_intcalc']=="modules/mod_inter_fixed.php") echo 'selected="selected"'; ?> >Fixed</option>
								<option value="modules/mod_inter_float.php" <?PHP if ($_SESSION['set_intcalc']=="modules/mod_inter_float.php") echo 'selected="selected"'; ?>>Floating</option>
							</select>
						</td>
					</tr>

					<tr>
						<td>Interest Rate (%)</td>
						<td>
							<input type="text" min="0" name="loaninterest" value="<?PHP echo $_SESSION['fee_loaninterestrate'] ?>" placeholder="Pecentage" />
						</td>
					</tr>

					<tr>
						<td>Minimum Length of<br/>Membership (Months)</td>
						<td>
							<input type="number" min="0" name="minMemb" value="<?PHP echo $_SESSION['set_minmemb'] ?>" placeholder="No Minimum Length" />
						</td>
					</tr>

					<tr>
						<td>Minimum Loan Principal</td>
						<td>
							<input type="number" min="0" name="minLP" value="<?PHP echo $_SESSION['set_minlp'] ?>" placeholder="Minimum Limit off" />
						</td>
					</tr>

					<tr>
						<td>Maximum Loan Principal</td>
						<td>
							<input type="number" min="0" name="maxLP" value="<?PHP echo $_SESSION['set_maxlp'] ?>" placeholder="Maximum Limit off" />
						</td>
					</tr>

					<tr>
						<td>Maximum Principal /<br/>Savings Ratio (%)</td>
						<td>
							<input type="number" min="0" name="maxPSR" value="<?PHP echo $_SESSION['set_maxpsr'] ?>" placeholder="Princ./Sav. Ratio off" />
						</td>
					</tr>

					<tr>
						<td>Auto-fine defaulted loan<br/>instalments after (Days)</td>
						<td>
							<input type="number" name="autofine" id="autofine" min="0" value="<?PHP echo $_SESSION['set_auf'] ?>" placeholder="Auto-fining off"/>
						</td>
					</tr>

					<tr>
						<td>Limit of Guarantees</td>
						<td>
							<input type="number" min="0" name="maxGuar" value="<?PHP echo $_SESSION['set_maxguar'] ?>" placeholder="Guarantee Limit off" />
						</td>
					</tr>

					<tr>
						<td>Additional Field</td>
						<td>
							<input type="text" name="xtraField1" value="<?PHP echo $_SESSION['set_xl1'] ?>" placeholder="No additional input field" />
						</td>
					</tr>

				</table>

				<input type="submit" name="upd_loans" value="Save Changes">

			</form>

		</div>
	</body>
</html>
