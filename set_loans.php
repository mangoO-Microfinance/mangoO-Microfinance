<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_admin();
	connect();
	
	//Update Loan Fee Rate
	if (isset($_POST['upd_loanfeerate'])){
		$new_loanfeerate = sanitize($_POST['loanfeerate']);
		$sql_upd_loanfeerate = "UPDATE fees SET fee_value = '$new_loanfeerate' WHERE fee_id = 5";
		$query_upd_loanfeerate = mysql_query($sql_upd_loanfeerate);
		check_sql($query_upd_loanfeerate);
		echo '<script>alert(\'Loan Fee Rate updated successfully.\')</script>';
	}
	
	//Update Loan Application Fee
	if (isset($_POST['upd_lappfee'])){
		$new_lappfee = sanitize($_POST['lappfee']);
		$sql_upd_lappfee = "UPDATE fees SET fee_value = '$new_lappfee' WHERE fee_id = 6";
		$query_upd_lappfee = mysql_query($sql_upd_lappfee);
		check_sql($query_upd_lappfee);
		echo '<script>alert(\'Loan Application Fee updated successfully.\')</script>';
	}
	
	//Update Loan Interest Rate
	if (isset($_POST['upd_loaninterest'])){
		$new_loaninterest = sanitize($_POST['loaninterest']);
		$sql_upd_loaninterest = "UPDATE fees SET fee_value = '$new_loaninterest' WHERE fee_id = 8";
		$query_upd_loaninterest = mysql_query($sql_upd_loaninterest);
		check_sql($query_upd_loaninterest);
		echo '<script>alert(\'Loan Interest Rate updated successfully.\')</script>';
	}
	
	//Update Loan Default Fine
	if (isset($_POST['upd_ldefaultfine'])){
		$new_ldefaultfine = sanitize($_POST['ldefaultfine']);
		$sql_upd_ldefaultfine = "UPDATE fees SET fee_value = '$new_ldefaultfine' WHERE fee_id = 7";
		$query_upd_ldefaultfine = mysql_query($sql_upd_ldefaultfine);
		check_sql($query_upd_ldefaultfine);
		echo '<script>alert(\'Loan Default Fine updated successfully.\')</script>';
	}
	
		
	//Update Minimum Loan Principal
	if (isset($_POST['upd_minLP'])){
		$new_minLP = sanitize($_POST['minLP']);
		$sql_upd_minLP = "UPDATE settings SET set_value = '$new_minLP' WHERE set_short = 'MinLP'";
		$query_upd_minLP = mysql_query($sql_upd_minLP);
		check_sql($query_upd_minLP);
		echo '<script>alert(\'Minimum Loan Principal updated successfully.\')</script>';
	}

	//Update Maximum Loan Principal
	if (isset($_POST['upd_maxLP'])){
		$new_maxLP = sanitize($_POST['maxLP']);
		$sql_upd_maxLP = "UPDATE settings SET set_value = '$new_maxLP' WHERE set_short = 'MaxLP'";
		$query_upd_maxLP = mysql_query($sql_upd_maxLP);
		check_sql($query_upd_maxLP);
		echo '<script>alert(\'Maximum Loan Principal updated successfully.\')</script>';
	}
	
	//Update Auto-fine option
	if (isset($_POST['upd_auf'])){
		if (isset($_POST['autofine'])) $new_auf = 1;
			else $new_auf = 0;
		$sql_upd_auf = "UPDATE settings SET set_value = '$new_auf' WHERE set_short = 'AUF'";
		$query_upd_auf = mysql_query($sql_upd_auf);
		check_sql($query_upd_auf);
		echo '<script>alert(\'Auto-fine option updated successfully.\')</script>';
	}
	
	/* SELECTIONS */
	
	//Select Loan Fee Rate from FEES
	$sql_loanfeerate = "SELECT fee_value FROM fees WHERE fee_id = 5";
	$query_loanfeerate = mysql_query($sql_loanfeerate);
	check_sql($query_loanfeerate);
	$loanfeerate = mysql_fetch_row($query_loanfeerate);
	
	//Select Loan Application Fee from FEES
	$sql_lappfee = "SELECT fee_value FROM fees WHERE fee_id = 6";
	$query_lappfee = mysql_query($sql_lappfee);
	check_sql($query_lappfee);
	$lappfee = mysql_fetch_row($query_lappfee);
	
	//Select Loan Interest Rate from FEES
	$sql_loaninterest = "SELECT fee_value FROM fees WHERE fee_id = 8";
	$query_loaninterest = mysql_query($sql_loaninterest);
	check_sql($query_loaninterest);
	$loaninterest = mysql_fetch_row($query_loaninterest);
	
	//Select Loan Default Fine from FEES
	$sql_ldefaultfine = "SELECT fee_value FROM fees WHERE fee_id = 7";
	$query_ldefaultfine = mysql_query($sql_ldefaultfine);
	check_sql($query_ldefaultfine);
	$ldefaultfine = mysql_fetch_row($query_ldefaultfine);
		
	//Select Minimum Loan Principal from SETTINGS
	$sql_minLP = "SELECT set_value FROM settings WHERE set_short = 'MinLP'";
	$query_minLP = mysql_query($sql_minLP);
	check_sql($query_minLP);
	$minLP = mysql_fetch_row($query_minLP);
	
	//Select Maximum Loan Principal from SETTINGS
	$sql_maxLP = "SELECT set_value FROM settings WHERE set_short = 'MaxLP'";
	$query_maxLP = mysql_query($sql_maxLP);
	check_sql($query_maxLP);
	$maxLP = mysql_fetch_row($query_maxLP);

	//Select Auto-fine from SETTINGS
	$sql_auf = "SELECT set_value FROM settings WHERE set_short = 'AUF'";
	$query_auf = mysql_query($sql_auf);
	check_sql($query_auf);
	$auf = mysql_fetch_row($query_auf);
?>
<html>
	<?PHP htmlHead('Settings | Fees',1) ?>
	
	<body>
		<!-- MENU HEADER & TABS -->
		<?PHP 
		include 'menu_header.php';
		menu_Tabs(6);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="set_genset.php">General Settings</a>
			<a href="set_loans.php" id="item_selected">Loan Settings</a>
			<a href="set_fees.php">Fees</a>
			<a href="set_user.php">Users</a>
			<a href="set_ugroup.php">Usergroups</a>
			<a href="set_logrec.php">Log Records</a>
		</div>
	
		<!-- LEFT SIDE: Fees -->	
		<div class="content_left" style="width:50%; margin-bottom:5em;">
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Loan Application Fee</p>
			<form action="set_loans.php" method="post">
				<input type="number" min="0" name="lappfee" value="<?PHP echo $lappfee[0] ?>" />
				<input type="submit" name="upd_lappfee" value="Update" />
			</form>
	
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Loan Fee Rate (%)</p>
			<form action="set_loans.php" method="post">
				<input type="text" min="0" name="loanfeerate" value="<?PHP echo $loanfeerate[0] ?>" />
				<input type="submit" name="upd_loanfeerate" value="Update" />
			</form>
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Loan Interest Rate (%)</p>
			<form action="set_loans.php" method="post">
				<input type="text" min="0" name="loaninterest" value="<?PHP echo $loaninterest[0] ?>" />
				<input type="submit" name="upd_loaninterest" value="Update" />
			</form>
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Loan Default Fine</p>
			<form action="set_loans.php" method="post">
				<input type="number" min="0" name="ldefaultfine" value="<?PHP echo $ldefaultfine[0] ?>" />
				<input type="submit" name="upd_ldefaultfine" value="Update" />
			</form>
			
		</div>
		
		<!-- RIGHT SIDE: Fees -->	
		<div class="content_right" style="width:50%;">
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Minimum Loan Principal</p>
			<form action="set_loans.php" method="post">
				<input type="number" min="0" name="minLP" value="<?PHP echo $minLP[0] ?>" />
				<input type="submit" name="upd_minLP" value="Update" />
			</form>
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Maximum Loan Principal</p>
			<form action="set_loans.php" method="post">
				<input type="number" min="0" name="maxLP" value="<?PHP echo $maxLP[0] ?>" />
				<input type="submit" name="upd_maxLP" value="Update" />
			</form>
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Auto-fine Defaulters</p>
			<form action="set_loans.php" method="post">
				<label for="autofine">
					<input type="checkbox" name="autofine" id="autofine" value="1" <?PHP if ($auf[0] == 1) echo 'checked="checked"' ?> /> Auto-charge Default Fine
				</label>
				<input type="submit" name="upd_auf" value="Update" />
			</form>
			
		</div>
	</body>
</html>