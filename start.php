<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();	
	$timestamp = time();
	
	//Read system settings and apply to SESSION variables
	$sql_settings = "SELECT * FROM settings";
	$query_settings = mysql_query($sql_settings);
	check_sql($query_settings);
	while($row_settings = mysql_fetch_assoc($query_settings)){
		if ($row_settings['set_id'] == 4) $_SESSION['set_cur'] = $row_settings['set_value'];
		if ($row_settings['set_id'] == 5) $_SESSION['set_auf'] = $row_settings['set_value'];
		if ($row_settings['set_id'] == 6) $_SESSION['set_deact'] = $row_settings['set_value'];
	}
	
	//Select Overdue Loan Instalments from LTRANS
	$sql_overd = "SELECT * FROM loans, ltrans, customer WHERE loans.cust_id = customer.cust_id AND loans.loan_id = ltrans.loan_id AND ltrans_due <= $timestamp AND ltrans_date IS NULL AND loanstatus_id = 2 ORDER BY ltrans_due";
	$query_overd = mysql_query($sql_overd);
	check_sql($query_overd);
	
	//Select Subscription Defaulters from CUSTOMER
	$last_subscr = time() - 31622400; //Seconds for 366 days
	$sql_subscrdef = "SELECT * FROM customer WHERE cust_active = 1 AND cust_lastsub < $last_subscr ORDER BY cust_lastsub, cust_id";
	$query_subscrdef = mysql_query($sql_subscrdef);
	check_sql($query_subscrdef);
?>

<html>
	<!-- HTML HEAD -->
	<?PHP htmlHead('Microfinance Management',1); ?>
	
	<body>
		<!-- MENU HEADER & TABS -->
		<?PHP 
		include 'menu_header.php';
		menu_Tabs(1);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="cust_search.php">Search Customers</a>
			<a href="cust_new.php">New Customer</a>
			<a href="loan_search.php">Search Loans</a>
		</div>
		
		<!-- LEFT SIDE: Overdue Subscription Fees -->
		<div class="content_left" style="width:50%;">
			<table id="tb_table">
				<colgroup>
					<col width="20%">
					<col width="60%">
					<col width="20%">
				</colgroup>
				<tr>
					<th colspan="3" class="title">Overdue Subscription Fees</th>
				</tr>
				<tr>
					<th>Cust. No.</th>
					<th>Customer Name</th>
					<th>Last Paid</th>
				</tr>
				<?PHP
				$color = 0;
				while($row_subscrdef = mysql_fetch_assoc($query_subscrdef)){
					tr_colored($color);
					echo '	<td><a href="customer.php?cust='.$row_subscrdef['cust_id'].'" class="sacco">'.$row_subscrdef['cust_id'].'/'.date("Y",$row_subscrdef['cust_since']).'</a></td>
									<td>'.$row_subscrdef['cust_name'].'</td>
									<td>'.date("d.m.Y", $row_subscrdef['cust_lastsub']).'</td>
								</tr>';
								
					// Module for automatic account deactivation if customer failed to renew subscription 
					if ($_SESSION['set_deact'] == 1) include 'modules/mod_deactivate.php';
				}
				?>
			</table>
		</div>

		<!-- RIGHT SIDE: Defaulted Loan Instalments -->
		<div  class="content_right" style="width:50%;">
			<table id="tb_table">
				<colgroup>
					<col width="15%">
					<col width="45%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<tr>
					<th colspan="4" class="title">Defaulted Loan Instalments</th>
				</tr>
				<tr>
					<th>Loan No.</th>
					<th>Customer Name</th>
					<th>Due Date</th>
					<th>Amount Due</th>
				</tr>
				<?PHP
				$color = 0;
				while ($row_overd = mysql_fetch_assoc($query_overd)){
					tr_colored($color);
					echo '	<td><a href="loan.php?lid='.$row_overd['loan_id'].'">'.$row_overd['loan_no'].'</a></td>
									<td>'.$row_overd['cust_name'].'</td>
									<td>'.date("d.m.Y",$row_overd['ltrans_due']).'</td>
									<td>'.number_format($row_overd['ltrans_principaldue']+$row_overd['ltrans_interestdue']).' '.$_SESSION['set_cur'].'</td>
								</tr>';
					// Module for automatic fine charging
					if ($_SESSION['set_auf'] == 1) include 'modules/mod_autofine.php';
				}
				?>
			</table>
			<?PHP
				if ($_SESSION['logrec_logout'] == 0){
					echo '<script>
									alert ("You forgot to logout last time. Please remember to log out properly.")
								</script>';
					$_SESSION['logrec_logout'] = 1;
				}
			?>
		</div>
	</body>
</html>