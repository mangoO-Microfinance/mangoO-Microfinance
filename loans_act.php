<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();
	
	$rep_year = date("Y",time());
	$rep_month = date("m",time());
		
	//Make array for exporting data
	$_SESSION['rep_export'] = array();
	$_SESSION['rep_exp_title'] = $rep_year.'-'.$rep_month.'_loans-active';
	
	//Select Active Loans from LOANS
	$sql_loans = "SELECT * FROM loans, customer, loanstatus WHERE loans.cust_id = customer.cust_id AND loans.loanstatus_id = loanstatus.loanstatus_id AND loans.loanstatus_id = 2 ORDER BY loan_dateout, loans.cust_id";
	$query_loans = mysql_query($sql_loans);
	check_sql($query_loans);
?>
<html>
	<?PHP htmlHead('Active Loans',1) ?>
	
	<body>
		<!-- MENU -->
		<?PHP 
				menu_Tabs(3);
		?>
		
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="loan_search.php">Search</a>
			<a href="loans_act.php" id="item_selected">Active Loans</a>
			<a href="loans_pend.php">Pending Loans</a>
		</div>
		
		<!-- CONTENT -->
		<div class="content-center">
				
			<!-- Export Button -->
			<form class="export" action="rep_export.php" method="post">
				<input type="submit" name="export_rep" value="Export List" />
			</form>	
				
			<table id="tb_table">
				<colgroup>
					<col width="7.5%">
					<col width="30%">
					<col width="10%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="7.5%">
				</colgroup>
				<tr>
					<th class="title" colspan="7">Active Loans</th>
				</tr>
				<tr>
					<th>Loan No.</th>
					<th>Customer</th>
					<th>Loan Period</th>
					<th>Principal</th>
					<th>Interest</th>
					<th>Remaining</th>
					<th>Issued on</th>
				</tr>
				<?PHP
				$color = 0;
				
				while ($row_loans = mysql_fetch_assoc($query_loans)){
					
					//Select Loan Balance from LTRANS
					$sql_balance = "SELECT ltrans_principaldue, ltrans_interestdue, ltrans_principal, ltrans_interest FROM ltrans, loans WHERE ltrans.loan_id = loans.loan_id AND loans.loan_id = '$row_loans[loan_id]'";
					$query_balance = mysql_query($sql_balance);
					check_sql($query_balance);
					
					//Calculate outstanding balance
					$loan_balance = 0;
					$loan_paid = 0;
					while ($row_balance = mysql_fetch_assoc($query_balance)){
						$loan_paid = $loan_paid + $row_balance['ltrans_principal'] + $row_balance['ltrans_interest'];
						$loan_balance = $loan_balance + $row_balance['ltrans_interestdue'] + $row_balance['ltrans_principaldue'];
					}
					$loan_balance = $loan_balance - $loan_paid;
					
					tr_colored($color);	//Alternating row colors
					
					echo '	<td><a href="loan.php?lid='.$row_loans['loan_id'].'">'.$row_loans['loan_no'].'</a></td>
									<td>'.$row_loans['cust_name'].' (<a href="customer.php?cust='.$row_loans['cust_id'].'">'.$row_loans['cust_id'].'/'.date("Y",$row_loans['cust_since']).')</a></td>
									<td>'.$row_loans['loan_period'].'</td>
									<td>'.number_format($row_loans['loan_principal']).' '.$_SESSION['set_cur'].'</td>
									<td>'.number_format(($row_loans['loan_repaytotal'] - $row_loans['loan_principal'])).' '.$_SESSION['set_cur'].'</td>
									<td>'.number_format($loan_balance).' '.$_SESSION['set_cur'].'</td>
									<td>'.date("d.m.Y", $row_loans['loan_dateout']).'</td>				
								</tr>';
					array_push($_SESSION['rep_export'], array("Loan No." => $row_loans['loan_no'], "Customer" => $row_loans['cust_name'].' ('.$row_loans['cust_id'].'/'.date("Y",$row_loans['cust_since']).')', "Status" => $row_loans['loanstatus_status'],"Loan Period" => $row_loans['loan_period'], "Principal" => $row_loans['loan_principal'], "Interest" => ($row_loans['loan_repaytotal'] - $row_loans['loan_principal']), "Remaining" => $loan_balance, "Issued on" => date("d.m.Y", $row_loans['loan_dateout'])));
				}
				?>
			</table>
		</div>
	</body>
</html>