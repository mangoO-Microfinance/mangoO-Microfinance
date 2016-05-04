<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionAdmin();
	connect();
	
	//UPDATE-Button
	if (isset($_POST['upd_fees'])){
		
		//Get current Share Value
		getShareValue();
		
		//Generate timestamp
		$timestamp = time();
		
		//Update Entrance Fee
		$new_entryfee = sanitize($_POST['entryfee']);
		$sql_upd_entryfee = "UPDATE fees SET fee_value = '$new_entryfee' WHERE fee_id = 1";
		$query_upd_entryfee = mysql_query($sql_upd_entryfee);
		checkSQL($query_upd_entryfee);
	
		//Update Share Value
		$new_shareval = sanitize($_POST['shareval']);
		if($new_shareval != $_SESSION['share_value']){
			$sql_upd_shareval = "INSERT INTO shareval (shareval_date, shareval_value) VALUES ('$timestamp', '$new_shareval')";
			$query_upd_shareval = mysql_query($sql_upd_shareval);
			checkSQL($query_upd_shareval);
		}
		
		//Update Withdrawal Fee
		$new_withdrawfee = sanitize($_POST['withdrawfee']);
		$sql_upd_withdrawfee = "UPDATE fees SET fee_value = '$new_withdrawfee' WHERE fee_id = 2";
		$query_upd_withdrawfee = mysql_query($sql_upd_withdrawfee);
		checkSQL($query_upd_withdrawfee);	
		
		//Update Price for Stationary Sales
		$new_stationary = sanitize($_POST['stationary']);
		$sql_upd_stationary = "UPDATE fees SET fee_value = '$new_stationary' WHERE fee_id = 3";
		$query_upd_stationary = mysql_query($sql_upd_stationary);
		checkSQL($query_upd_stationary);
				
		//Update Annual Subscription Fee
		$new_subscripfee = sanitize($_POST['subscripfee']);
		$sql_upd_subscripfee = "UPDATE fees SET fee_value = '$new_subscripfee' WHERE fee_id = 4";
		$query_upd_subscripfee = mysql_query($sql_upd_subscripfee);
		checkSQL($query_upd_subscripfee);
		
		//Update Loan Fee
		$new_loanfeerate = sanitize($_POST['loanfeerate']);
		$sql_upd_loanfeerate = "UPDATE fees SET fee_value = '$new_loanfeerate' WHERE fee_id = 5";
		$query_upd_loanfeerate = mysql_query($sql_upd_loanfeerate);
		checkSQL($query_upd_loanfeerate);
		
		//Update Loan Application Fee
		$new_lappfee = sanitize($_POST['lappfee']);
		$sql_upd_lappfee = "UPDATE fees SET fee_value = '$new_lappfee' WHERE fee_id = 6";
		$query_upd_lappfee = mysql_query($sql_upd_lappfee);
		checkSQL($query_upd_lappfee);
			
		//Update Loan Default Fine
		$new_ldefaultfine = sanitize($_POST['ldefaultfine']);
		$sql_upd_ldefaultfine = "UPDATE fees SET fee_value = '$new_ldefaultfine' WHERE fee_id = 7";
		$query_upd_ldefaultfine = mysql_query($sql_upd_ldefaultfine);
		checkSQL($query_upd_ldefaultfine);
			
		//Update Loan Insurance Rate
		$new_insurance = sanitize($_POST['insurance']);
		$sql_upd_insurance = "UPDATE fees SET fee_value = '$new_insurance' WHERE fee_short = 'FEE_INS'";
		$query_upd_insurance = mysql_query($sql_upd_insurance);
		checkSQL($query_upd_insurance);
		
		//Update Additional Fee on Loans
		$new_xFee1 = sanitize($_POST['xtraFee1']);	
		$new_xFee1_name = sanitize($_POST['xtraFee1_name']);
		$sql_upd_xFee1 = "UPDATE fees SET fee_name= '$new_xFee1_name', fee_value = '$new_xFee1' WHERE fee_short = 'FEE_XL1'";
		$query_upd_xFee1 = mysql_query($sql_upd_xFee1);
		checkSQL($query_upd_xFee1);
		$sql_upd_inctype = "UPDATE inctype SET inctype_type = '$new_xFee1_name' WHERE inctype_short = 'INC_XL1'";
		$query_upd_inctype = mysql_query($sql_upd_inctype);
		checkSQL($query_upd_inctype);
	}
	
	//Get current Fees and Charges
	getFees();
	
	//Get current Share Value
	getShareValue();
?>


<html>
	<?PHP includeHead('Settings | Fees',1) ?>
	
	<body>
		<!-- MENU -->
		<?PHP includeMenu(6); ?>
		<div id="menu_main">
			<a href="set_basic.php">Basic Settings</a>
			<a href="set_loans.php">Loan Settings</a>
			<a href="set_fees.php" id="item_selected">Fees & Charges</a>
			<a href="set_user.php">Users</a>
			<a href="set_ugroup.php">Usergroups</a>
			<a href="set_logrec.php">Log Records</a>
		</div>
	
		<!-- LEFT SIDE -->	
		<div class="content_settings">
			
			<form action="set_fees.php" method="post">
			
				<p class="heading">Fees and Charges</p>
				
				<table id="tb_set">
					<tr>
						<td><span>Value of Shares</span></td>
						<td>
							<input type="number" min="0" name="shareval" value="<?PHP echo $_SESSION['share_value']; ?>" placeholder="<?PHP echo $_SESSION['set_cur']; ?>" />
						</td>
					</tr>
					
					<tr>
						<td><span>Entrance Fee</span></td>
						<td>
							<input type="number" min="0" name="entryfee" value="<?PHP echo $_SESSION['fee_entry'] ?>" placeholder="<?PHP echo $_SESSION['set_cur']; ?>" />
						</td>
					</tr>
					
					<tr>
						<td><span>Stationary Sales</span></td>
						<td>
							<input type="number" min="0" name="stationary" value="<?PHP echo $_SESSION['fee_stationary'] ?>" placeholder="<?PHP echo $_SESSION['set_cur']; ?>" />
						</td>
					</tr>
					
					<tr>
						<td><span>Annual Subscription Fee</span></td>
						<td>
							<input type="number" min="0" name="subscripfee" value="<?PHP echo $_SESSION['fee_subscr'] ?>" placeholder="<?PHP echo $_SESSION['set_cur']; ?>" />
						</td>
					</tr>
					
					<tr>
						<td><span>Withdrawal Fee</span></td>
						<td>
							<input type="number" min="0" name="withdrawfee" value="<?PHP echo $_SESSION['fee_withdraw'] ?>" placeholder="<?PHP echo $_SESSION['set_cur']; ?>" />
						</td>
					</tr>
					
					<tr>
						<td>Loan Application Fee</td>
						<td>
							<input type="number" min="0" name="lappfee" value="<?PHP echo $_SESSION['fee_loanappl'] ?>" placeholder="<?PHP echo $_SESSION['set_cur']; ?>" />
						</td>
					</tr>
				
					<tr>
						<td>Loan Fee (%)</td>
						<td>
							<input type="text" min="0" name="loanfeerate" value="<?PHP echo $_SESSION['fee_loan'] ?>" placeholder="Percentage of Principal"/>
						</td>
					</tr>
				
					<tr>
						<td>Loan Insurance (%)</td>
						<td>
							<input type="text" min="0" name="insurance" value="<?PHP echo $_SESSION['fee_loaninsurance'] ?>" placeholder="Pecentage" />
						</td>
					</tr>
				
					<tr>
						<td>Loan Default Fine</td>
						<td>
							<input type="number" min="0" name="ldefaultfine" value="<?PHP echo $_SESSION['fee_loanfine'] ?>" placeholder="<?PHP echo $_SESSION['set_cur']; ?>" />
						</td>
					</tr>
				
					<tr>
						<td>Additional Fee on Loans</td>
						<td>
							<input type="text" name="xtraFee1_name" style="width:78px;" value="<?PHP echo $_SESSION['fee_xl1_name'] ?>" placeholder="Fee name" />
							<input type="text" name="xtraFee1" style="width:78px;"value="<?PHP echo $_SESSION['fee_xl1'] ?>" placeholder="No fee" />
						</td>
					</tr>
				
				</table>	
				
				<input type="submit" name="upd_fees" value="Save Changes">
			
			</form>
		
		</div>
		
	</body>
</html>