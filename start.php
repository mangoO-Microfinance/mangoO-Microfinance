<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();	
	$timestamp = time();
	
	//Select Loan Default Fine from FEES
	$sql_ld = "SELECT fee_value FROM fees WHERE fee_id = 7";
	$query_ld = mysql_query($sql_ld);
	check_sql($query_ld);
	$result_fees = mysql_fetch_assoc($query_ld);
	$loandefault_sav = ($result_fees['fee_value']) * (-1);
	$loandefault_inc = $result_fees['fee_value'];
	
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
					
					//Set customer to "inactive" after 18 months of delaying subscription
					if ($row_subscrdef['cust_lastsub'] < ($timestamp - 47347200) && $row_subscrdef['cust_active'] == 1){
						$sql_deactivate = "UPDATE customer SET cust_active = '0' WHERE cust_id = '$row_subscrdef[cust_id]'";
						$query_deactiate = mysql_query($sql_deactivate);
						echo "<script>
										alert('The membership for ".$row_subscrdef['cust_name']." (".$row_subscrdef['cust_id'].") has been set to INACTIVE.')
									</script>";
					}
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
					echo '	<td><a href="loan.php?lid='.$row_overd['loan_id'].'" class="sacco">'.$row_overd['loan_no'].'</a></td>
									<td>'.$row_overd['cust_name'].'</td>
									<td>'.date("d.m.Y",$row_overd['ltrans_due']).'</td>
									<td>'.number_format($row_overd['ltrans_principaldue']+$row_overd['ltrans_interestdue']).' UGX</td>
								</tr>';
					/*			
					//Automatically charge Loan Default Fine if Customer has defaulted for more than 30 days
					if((time() - $row_overd['ltrans_due']) > 2592000 && $row_overd['ltrans_fined'] != 1){
						$timestamp = time();
						
						//Withdraw Fine from SAVINGS
						$sql_fine_sav = "INSERT INTO savings (cust_id, sav_date, sav_amount, cur_id, savtype_id, sav_receipt) VALUES ('$row_overd[cust_id]', '$timestamp', '$loandefault_sav', '1', '6', '')";
						$query_fine_sav = mysql_query($sql_fine_sav);
						check_sql($query_fine_sav);
						
						//Insert Fine into INCOMES
						$sql_fine_inc = "INSERT INTO incomes (cust_id, inctype_id, inc_amount, inc_date, inc_receipt) VALUES ('$row_overd[cust_id]', '5', '$loandefault_inc', '$timestamp', '')";
						$query_fine_inc = mysql_query($sql_fine_inc);
						check_sql($query_fine_inc);
						
						//Set Flag in LTRANS for Fine charged
						$sql_update_ltrans = "UPDATE ltrans SET ltrans_fined = '1' WHERE ltrans_id = '$row_overd[ltrans_id]'";
						$query_update_ltrans = mysql_query($sql_update_ltrans);
					}
					*/
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