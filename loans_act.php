<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	$db_link = connect();

	$rep_year = date("Y",time());
	$rep_month = date("m",time());

	//Make array for exporting data
	$_SESSION['rep_export'] = array();
	$_SESSION['rep_exp_title'] = $rep_year.'-'.$rep_month.'_loans-active';

	//Select Active Loans from LOANS
	$sql_loans = "SELECT * FROM loans LEFT JOIN loanstatus ON loans.loanstatus_id = loanstatus.loanstatus_id LEFT JOIN customer ON loans.cust_id = customer.cust_id WHERE loans.loanstatus_id = 2 ORDER BY loan_dateout, loans.cust_id";
	$query_loans = mysqli_query($db_link, $sql_loans);
	checkSQL($db_link, $query_loans);
?>
<html>
	<?PHP includeHead('Active Loans',1) ?>

	<body>
		<!-- MENU -->
		<?PHP includeMenu(3);	?>
		<div id="menu_main">
			<a href="loans_search.php">Search</a>
			<a href="loans_act.php" id="item_selected">Active Loans</a>
			<a href="loans_pend.php">Pending Loans</a>
			<a href="loans_securities.php">Loan Securities</a>
		</div>

		<!-- CONTENT -->
		<div class="content-center">

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
					<form class="export" action="rep_export.php" method="post">
						<th class="title" colspan="7">Active Loans
						<!-- Export Button -->
						<input type="submit" name="export_rep" value="Export" />
						</th>
					</form>
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
				$count = 0;
				while ($row_loans = mysqli_fetch_assoc($query_loans)){

					$loan_balances = getLoanBalance($db_link, $row_loans['loan_id']);

					echo '<tr>
									<td><a href="loan.php?lid='.$row_loans['loan_id'].'">'.$row_loans['loan_no'].'</a></td>
									<td>'.$row_loans['cust_name'].' (<a href="customer.php?cust='.$row_loans['cust_id'].'">'.$row_loans['cust_no'].')</a></td>
									<td>'.$row_loans['loan_period'].'</td>
									<td>'.number_format($loan_balances['pdue']).' '.$_SESSION['set_cur'].'</td>
									<td>'.number_format($loan_balances['idue']).' '.$_SESSION['set_cur'].'</td>
									<td>'.number_format($loan_balances['balance']).' '.$_SESSION['set_cur'].'</td>
									<td>'.date("d.m.Y", $row_loans['loan_dateout']).'</td>
								</tr>';

					// Export Array
					array_push($_SESSION['rep_export'], array("Loan No." => $row_loans['loan_no'], "Customer" => $row_loans['cust_name'].' ('.$row_loans['cust_no'].')', "Status" => $row_loans['loanstatus_status'],"Loan Period" => $row_loans['loan_period'], "Principal" => $loan_balances['pdue'], "Interest" => $loan_balances['idue'], "Remaining" => $loan_balances['balance'], "Issued on" => date("d.m.Y", $row_loans['loan_dateout'])));

					$count++;
				}
				?>
				<tr class="balance">
					<td	colspan="7">
					<?PHP
					echo $count.' active loan';
					if ($count != 1) echo 's';
					?>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>
