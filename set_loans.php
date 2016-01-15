<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_admin();
	connect();
	
	//Save Changes
	if (isset($_POST['upd_loans'])){
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
	
		//Update Loan Interest Rate
		$new_loaninterest = sanitize($_POST['loaninterest']);
		$sql_upd_loaninterest = "UPDATE fees SET fee_value = '$new_loaninterest' WHERE fee_id = 8";
		$query_upd_loaninterest = mysql_query($sql_upd_loaninterest);
		check_sql($query_upd_loaninterest);
		
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
		if (isset($_POST['autofine'])) $new_auf = 1;
			else $new_auf = 0;
		$sql_upd_auf = "UPDATE settings SET set_value = '$new_auf' WHERE set_short = 'AUF'";
		$query_upd_auf = mysql_query($sql_upd_auf);
		check_sql($query_upd_auf);
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
				menu_Tabs(6);
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
			
				<p class="heading">Loan Settings</p>
				
				<table id="tb_set">
					<tr>
						<td><span>Loan Application Fee</p>
						<td>
							<input type="number" min="0" name="lappfee" value="<?PHP echo $_SESSION['fee_loanappl'] ?>" />
						</td>
					</tr>
				
					<tr>
						<td><span>Loan Fee Rate (%)</p>
						<td>
							<input type="text" min="0" name="loanfeerate" value="<?PHP echo $_SESSION['fee_loan'] ?>" />
						</td>
					</tr>
				
					<tr>
						<td><span>Loan Interest Rate (%)</p>
						<td>
							<input type="text" min="0" name="loaninterest" value="<?PHP echo $_SESSION['fee_loaninterestrate'] ?>" />
						</td>
					</tr>
			
					<tr>
						<td><span>Loan Default Fine</span></td>
						<td>
							<input type="number" min="0" name="ldefaultfine" value="<?PHP echo $_SESSION['fee_loanfine'] ?>" />
						</td>
					</tr>
			
					<tr>
						<td><span>Minimum Loan Principal</p>
						<td>
							<input type="number" min="0" name="minLP" value="<?PHP echo $_SESSION['set_minlp'] ?>" />
						</td>
					</tr>
			
					<tr>
						<td><span>Maximum Loan Principal</p>
						<td>
							<input type="number" min="0" name="maxLP" value="<?PHP echo $_SESSION['set_maxlp'] ?>" />
						</td>
					</tr>
			
			
					<tr>
						<td><span>Auto-charge Fine</p>
						<td>
							<input type="checkbox" name="autofine" id="autofine" value="1" <?PHP if ($_SESSION['set_auf'] == 1) echo 'checked="checked"' ?> /> on defaulted instalments
						</td>
					</tr>
					
				</table>
				
				<input type="submit" name="upd_loans" value="Save Changes">
				
			</form>
			
		</div>
	</body>
</html>