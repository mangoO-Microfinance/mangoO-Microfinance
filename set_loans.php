<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_admin();
	connect();
	
	//Save Changes
	if (isset($_POST['upd_loans'])){
		//Update Interest Calculation Method
		$new_intcalcmethod = sanitize($_POST['intcalcmethod']);
		$sql_upd_intcalcmethod = "UPDATE settings SET set_value = '$new_intcalcmethod' WHERE set_id = 9";
		$query_upd_intcalcmethod = mysql_query($sql_upd_intcalcmethod);
		check_sql($query_upd_intcalcmethod);
		
		//Update Loan Interest Rate
		$new_loaninterest = sanitize($_POST['loaninterest']);
		$sql_upd_loaninterest = "UPDATE fees SET fee_value = '$new_loaninterest' WHERE fee_id = 8";
		$query_upd_loaninterest = mysql_query($sql_upd_loaninterest);
		check_sql($query_upd_loaninterest);

		//Update Loan Fee Rate
		$new_loanfeerate = sanitize($_POST['loanfeerate']);
		$sql_upd_loanfeerate = "UPDATE fees SET fee_value = '$new_loanfeerate' WHERE fee_id = 5";
		$query_upd_loanfeerate = mysql_query($sql_upd_loanfeerate);
		check_sql($query_upd_loanfeerate);
		
		//Update Loan Application Fee
		$new_lappfee = sanitize($_POST['lappfee']);
		$sql_upd_lappfee = "UPDATE fees SET fee_value = '$new_lappfee' WHERE fee_id = 6";
		$query_upd_lappfee = mysql_query($sql_upd_lappfee);
		check_sql($query_upd_lappfee);
			
		//Update Loan Default Fine
		$new_ldefaultfine = sanitize($_POST['ldefaultfine']);
		$sql_upd_ldefaultfine = "UPDATE fees SET fee_value = '$new_ldefaultfine' WHERE fee_id = 7";
		$query_upd_ldefaultfine = mysql_query($sql_upd_ldefaultfine);
		check_sql($query_upd_ldefaultfine);
	
		//Update Minimum Loan Principal
		$new_minLP = sanitize($_POST['minLP']);
		$sql_upd_minLP = "UPDATE settings SET set_value = '$new_minLP' WHERE set_short = 'MinLP'";
		$query_upd_minLP = mysql_query($sql_upd_minLP);
		check_sql($query_upd_minLP);

		//Update Maximum Loan Principal
		$new_maxLP = sanitize($_POST['maxLP']);
		$sql_upd_maxLP = "UPDATE settings SET set_value = '$new_maxLP' WHERE set_short = 'MaxLP'";
		$query_upd_maxLP = mysql_query($sql_upd_maxLP);
		check_sql($query_upd_maxLP);
		
		//Update Auto-fine option
		$new_auf = sanitize($_POST['autofine']);
		$sql_upd_auf = "UPDATE settings SET set_value = '$new_auf' WHERE set_short = 'AUF'";
		$query_upd_auf = mysql_query($sql_upd_auf);
		check_sql($query_upd_auf);
		
		//If auto-fine option is enabled, make sure dashboard shows loan default list
		if ($new_auf != NULL){
			$new_dash_right = "dashboard/dash_loandefaults.php";
			$sql_upd_dashr = "UPDATE settings SET set_value = '$new_dash_right' WHERE set_short = 'DashR'";
			$query_upd_dashr = mysql_query($sql_upd_dashr);
			check_sql($query_upd_dashr);
		}
	}
	
	//Get Settings and Fees
	get_settings();
	get_fees();
?>
<html>
	<?PHP htmlHead('Settings | Loan Settings',1) ?>
	
	<body>
		<!-- MENU -->
		<?PHP 
				include_Menu(6);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="set_basic.php">Basic Settings</a>
			<a href="set_loans.php" id="item_selected">Loan Settings</a>
			<a href="set_fees.php">Fees</a>
			<a href="set_user.php">Users</a>
			<a href="set_ugroup.php">Usergroups</a>
			<a href="set_logrec.php">Log Records</a>
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
						<td>Loan Interest Rate (%)</td>
						<td>
							<input type="text" min="0" name="loaninterest" value="<?PHP echo $_SESSION['fee_loaninterestrate'] ?>" />
						</td>
					</tr>
					
					<tr>
						<td>Loan Application Fee</td>
						<td>
							<input type="number" min="0" name="lappfee" value="<?PHP echo $_SESSION['fee_loanappl'] ?>" />
						</td>
					</tr>
				
					<tr>
						<td>Loan Fee Rate (%)</td>
						<td>
							<input type="text" min="0" name="loanfeerate" value="<?PHP echo $_SESSION['fee_loan'] ?>" />
						</td>
					</tr>
				
					<tr>
						<td>Loan Default Fine</td>
						<td>
							<input type="number" min="0" name="ldefaultfine" value="<?PHP echo $_SESSION['fee_loanfine'] ?>" />
						</td>
					</tr>
			
					<tr>
						<td>Minimum Loan Principal</td>
						<td>
							<input type="number" min="0" name="minLP" value="<?PHP echo $_SESSION['set_minlp'] ?>" />
						</td>
					</tr>
			
					<tr>
						<td>Maximum Loan Principal</td>
						<td>
							<input type="number" min="0" name="maxLP" value="<?PHP echo $_SESSION['set_maxlp'] ?>" />
						</td>
					</tr>
			
			
					<tr>
						<td>Auto-fine defaulted loan<br/>instalments after X days</td>
						<td>
							<input type="number" name="autofine" id="autofine" min="0" value="<?PHP echo $_SESSION['set_auf'] ?>" placeholder="Auto-fining off"/>
						</td>
					</tr>
					
				</table>
				
				<input type="submit" name="upd_loans" value="Save Changes">
				
			</form>
			
		</div>
	</body>
</html>