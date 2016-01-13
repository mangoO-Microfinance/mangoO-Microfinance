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
		
	//Update Price for Stationary Sales
	if (isset($_POST['upd_stationary'])){
		$new_stationary = sanitize($_POST['stationary']);
		$sql_upd_stationary = "UPDATE fees SET fee_value = '$new_stationary' WHERE fee_id = 3";
		$query_upd_stationary = mysql_query($sql_upd_stationary);
		check_sql($query_upd_stationary);
		echo '<script>alert(\'Price for Stationary sales updated successfully.\')</script>';
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
			<a href="set_genset.php">General Settings</a>
			<a href="set_loans.php">Loan Settings</a>
			<a href="set_fees.php" id="item_selected">Fees</a>
			<a href="set_user.php">Users</a>
			<a href="set_ugroup.php">Usergroups</a>
			<a href="set_logrec.php">Log Records</a>
		</div>
	
		<!-- LEFT SIDE: Fees -->	
		<div class="content_left" style="width:50%; margin-bottom:5em;">
			
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Entry Fee</p>
			<form action="set_fees.php" method="post">
				<input type="number" min="0" name="entryfee" value="<?PHP echo $entryfee[0] ?>" />
				<input type="submit" name="upd_entryfee" value="Update" />
			</form>
					
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Stationary Sales</p>
			<form action="set_fees.php" method="post">
				<input type="number" min="0" name="stationary" value="<?PHP echo $stationary[0] ?>" />
				<input type="submit" name="upd_stationary" value="Update" />
			</form>
					
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Annual Subscription Fee</p>
			<form action="set_fees.php" method="post">
				<input type="number" min="0" name="subscripfee" value="<?PHP echo $subscripfee[0] ?>" />
				<input type="submit" name="upd_subscripfee" value="Update" />
			</form>
			
		</div>
		
		<!-- RIGHT SIDE: Fees -->	
		<div class="content_right" style="width:50%;">
		
			<p class="heading" style="margin-top:2em; margin-bottom:.8em;">Withdrawal Fee</p>
			<form action="set_fees.php" method="post">
				<input type="number" min="0" name="withdrawfee" value="<?PHP echo $withdrawfee[0] ?>" />
				<input type="submit" name="upd_withdrawfee" value="Update" />
			</form>
			
		</div>
	</body>
</html>