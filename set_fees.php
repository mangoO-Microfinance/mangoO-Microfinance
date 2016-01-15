<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_admin();
	connect();
	
	//UPDATE-Button
	if (isset($_POST['upd_fees'])){
		//Update Entry Fee
		$new_entryfee = sanitize($_POST['entryfee']);
		$sql_upd_entryfee = "UPDATE fees SET fee_value = '$new_entryfee' WHERE fee_id = 1";
		$query_upd_entryfee = mysql_query($sql_upd_entryfee);
		check_sql($query_upd_entryfee);
	
		//Update Withdrawal Fee
		$new_withdrawfee = sanitize($_POST['withdrawfee']);
		$sql_upd_withdrawfee = "UPDATE fees SET fee_value = '$new_withdrawfee' WHERE fee_id = 2";
		$query_upd_withdrawfee = mysql_query($sql_upd_withdrawfee);
		check_sql($query_upd_withdrawfee);	
		
		//Update Price for Stationary Sales
		$new_stationary = sanitize($_POST['stationary']);
		$sql_upd_stationary = "UPDATE fees SET fee_value = '$new_stationary' WHERE fee_id = 3";
		$query_upd_stationary = mysql_query($sql_upd_stationary);
		check_sql($query_upd_stationary);
				
		//Update Annual Subscription Fee
		$new_subscripfee = sanitize($_POST['subscripfee']);
		$sql_upd_subscripfee = "UPDATE fees SET fee_value = '$new_subscripfee' WHERE fee_id = 4";
		$query_upd_subscripfee = mysql_query($sql_upd_subscripfee);
		check_sql($query_upd_subscripfee);
	}
	
	get_fees();
?>


<html>
	<?PHP htmlHead('Settings | Fees',1) ?>
	
	<body>
		<!-- MENU -->
		<?PHP 
				menu_Tabs(6);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="set_basic.php">Basic Settings</a>
			<a href="set_loans.php">Loan Settings</a>
			<a href="set_fees.php" id="item_selected">Fees</a>
			<a href="set_user.php">Users</a>
			<a href="set_ugroup.php">Usergroups</a>
			<a href="set_logrec.php">Log Records</a>
		</div>
	
		<!-- LEFT SIDE -->	
		<div class="content_settings">
			
			<form action="set_fees.php" method="post">
			
				<p class="heading">Fee Settings</p>
				
				<table id="tb_set">
					<tr>
						<td><span>Entry Fee</span></td>
						<td>
							<input type="number" min="0" name="entryfee" value="<?PHP echo $_SESSION['fee_entry'] ?>" />
						</td>
					</tr>
					
					<tr>
						<td><span>Stationary Sales</span></td>
						<td>
							<input type="number" min="0" name="stationary" value="<?PHP echo $_SESSION['fee_stationary'] ?>" />
						</td>
					</tr>
					
					<tr>
						<td><span>Annual Subscription Fee</span></td>
						<td>
							<input type="number" min="0" name="subscripfee" value="<?PHP echo $_SESSION['fee_subscr'] ?>" />
						</td>
					</tr>
					
					<tr>
						<td><span>Withdrawal Fee</span></td>
						<td>
							<input type="number" min="0" name="withdrawfee" value="<?PHP echo $_SESSION['fee_withdraw'] ?>" />
						</td>
					</tr>
				
				</table>	
				
				<input type="submit" name="upd_fees" value="Save Changes">
			
			</form>
		
		</div>
		
	</body>
</html>