<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_admin();
	connect();
	
	//Update Entry Fee
	if (isset($_POST['upd_entryfee'])){
		$new_entryfee = sanitize($_POST['entryfee']);
		$sql_upd_entryfee = "UPDATE fees SET fee_value = '$new_entryfee' WHERE fee_id = 1";
		$query_upd_entryfee = mysql_query($sql_upd_entryfee);
		check_sql($query_upd_entryfee);
		echo '<script>alert(\'Entry Fee updated successfully.\')</script>';
	}
	
	//Update Withdrawal Fee
	if (isset($_POST['upd_withdrawfee'])){
		$new_withdrawfee = sanitize($_POST['withdrawfee']);
		$sql_upd_withdrawfee = "UPDATE fees SET fee_value = '$new_withdrawfee' WHERE fee_id = 2";
		$query_upd_withdrawfee = mysql_query($sql_upd_withdrawfee);
		check_sql($query_upd_withdrawfee);
		echo '<script>alert(\'Withdrawal Fee updated successfully.\')</script>';
	}
	
	//Update Loan Fee Rate
	if (isset($_POST['upd_loanfeerate'])){
		$new_loanfeerate = sanitize($_POST['loanfeerate']);
		$sql_upd_loanfeerate = "UPDATE fees SET fee_value = '$new_lf' WHERE fee_id = 5";
		$query_upd_loanfeerate = mysql_query($sql_upd_loanfeerate);
		check_sql($query_upd_loanfeerate);
		echo '<script>alert(\'Loan Fee Rate updated successfully.\')</script>';
	}
	
	//Update Loan Application Fee
	if (isset($_POST['upd_lappfee'])){
		$new_lappfee = sanitize($_POST['lappfee']);
		$sql_upd_lappfee = "UPDATE fees SET fee_value = '$new_laf' WHERE fee_id = 6";
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
	
	//Update Annual Subscription Fee
	if (isset($_POST['upd_subscripfee'])){
		$new_subscripfee = sanitize($_POST['subscripfee']);
		$sql_upd_subscripfee = "UPDATE fees SET fee_value = '$new_subscripfee' WHERE fee_id = 4";
		$query_upd_subscripfee = mysql_query($sql_upd_subscripfee);
		check_sql($query_upd_subscripfee);
		echo '<script>alert(\'Annual Subscription Fee updated successfully.\')</script>';
	}
	
	/* SELECTIONS */
	
	//Select Entry Fee from FEES
	$sql_entryfee = "SELECT fee_value FROM fees WHERE fee_id = 1";
	$query_entryfee = mysql_query($sql_entryfee);
	check_sql($query_entryfee);
	$entryfee = mysql_fetch_row($query_entryfee);
	
	//Select Withdrawal Fee from FEES
	$sql_withdrawfee = "SELECT fee_value FROM fees WHERE fee_id = 2";
	$query_withdrawfee = mysql_query($sql_withdrawfee);
	check_sql($query_withdrawfee);
	$withdrawfee = mysql_fetch_row($query_withdrawfee);
	
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
	
	//Select Price for Stationary Sales from FEES
	$sql_stationary = "SELECT fee_value FROM fees WHERE fee_id = 3";
	$query_stationary = mysql_query($sql_stationary);
	check_sql($query_stationary);
	$stationary = mysql_fetch_row($query_stationary);
	
	//Select Annual Subscription Rate from FEES
	$sql_subscripfee = "SELECT fee_value FROM fees WHERE fee_id = 4";
	$query_subscripfee = mysql_query($sql_subscripfee);
	check_sql($query_subscripfee);
	$subscripfee = mysql_fetch_row($query_subscripfee);
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
			<a href="admin_genset.php">General Settings</a>
			<a href="admin_fees.php" id="item_selected">Fees</a>
			<a href="admin_user.php">Users</a>
			<a href="admin_ugroup.php">Usergroups</a>
			<a href="admin_logrec.php">Log Records</a>
		</div>
	
		<!-- LEFT SIDE: Fees -->	
		<div class="content_left" style="width:50%; margin-bottom:5em;">
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Entry Fee</p>
			<form action="admin_fees.php" method="post">
				<input type="number" min="0" name="entryfee" value="<?PHP echo $entryfee[0] ?>" />
				<input type="submit" name="upd_entryfee" value="Update" />
			</form>
					
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Stationary Sales</p>
			<form action="admin_fees.php" method="post">
				<input type="number" min="0" name="stationary" value="<?PHP echo $stationary[0] ?>" />
				<input type="submit" name="upd_stationary" value="Update" />
			</form>
					
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Annual Subscription Fee</p>
			<form action="admin_fees.php" method="post">
				<input type="number" min="0" name="subscripfee" value="<?PHP echo $subscripfee[0] ?>" />
				<input type="submit" name="upd_subscripfee" value="Update" />
			</form>

			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Withdrawal Fee</p>
			<form action="admin_fees.php" method="post">
				<input type="number" min="0" name="withdrawfee" value="<?PHP echo $withdrawfee[0] ?>" />
				<input type="submit" name="upd_withdrawfee" value="Update" />
			</form>
			
		</div>
		
		<!-- RIGHT SIDE: Fees -->	
		<div class="content_right" style="width:50%;">
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Loan Application Fee</p>
			<form action="admin_fees.php" method="post">
				<input type="number" min="0" name="lappfee" value="<?PHP echo $lappfee[0] ?>" />
				<input type="submit" name="upd_lappfee" value="Update" />
			</form>
	
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Loan Fee Rate (%)</p>
			<form action="admin_fees.php" method="post">
				<input type="text" min="0" name="loanfeerate" value="<?PHP echo $loanfeerate[0] ?>" />
				<input type="submit" name="upd_loanfeerate" value="Update" />
			</form>
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Loan Interest Rate (%)</p>
			<form action="admin_fees.php" method="post">
				<input type="text" min="0" name="loaninterest" value="<?PHP echo $loaninterest[0] ?>" />
				<input type="submit" name="upd_loaninterest" value="Update" />
			</form>
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Loan Default Fine</p>
			<form action="admin_fees.php" method="post">
				<input type="number" min="0" name="ldefaultfine" value="<?PHP echo $ldefaultfine[0] ?>" />
				<input type="submit" name="upd_ldefaultfine" value="Update" />
			</form>
			
		</div>
	</body>
</html>