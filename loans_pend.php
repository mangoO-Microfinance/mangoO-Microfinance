<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	$db_link = connect();

	$rep_year = date("Y",time());
	$rep_month = date("m",time());

	//Make array for exporting data
	$_SESSION['rep_export'] = array();
	$_SESSION['rep_exp_title'] = $rep_year.'-'.$rep_month.'_loans-pending';

	//Select Pending Loans from LOANS
	$sql_loanpend = "SELECT * FROM loans LEFT JOIN loanstatus ON loans.loanstatus_id = loanstatus.loanstatus_id LEFT JOIN customer ON loans.cust_id = customer.cust_id WHERE loans.loanstatus_id = 1 ORDER BY loan_date, loan_no";
	$query_loanpend = mysqli_query($db_link, $sql_loanpend);
	checkSQL($db_link, $query_loanpend);
?>
<html>
	<?PHP includeHead('Pending Loans',1) ?>

	<body>

		<!-- MENU -->
		<?PHP includeMenu(3); ?>
		<div id="menu_main">
			<a href="loans_search.php">Search</a>
			<a href="loans_act.php">Active Loans</a>
			<a href="loans_pend.php" id="item_selected">Pending Loans</a>
			<a href="loans_securities.php">Loan Securities</a>
		</div>

		<!-- CONTENT: Pending Loans -->
		<div class="content-center">

			<table id="tb_table">
				<colgroup>
					<col width="10%"/>
					<col width="30%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="15%"/>
					<col width="15%"/>
					<col width="10%"/>
				</colgroup>
				<tr>
					<form class="export" action="rep_export.php" method="post">
						<th class="title" colspan="7">Pending Loans
						<!-- Export Button -->
						<input type="submit" name="export_rep" value="Export" />
						</th>
					</form>
				</tr>
				<tr>
					<th>Loan No.</th>
					<th>Customer</th>
					<th>Status</th>
					<th>Loan Period</th>
					<th>Principal applied</th>
					<th>Interest</th>
					<th>Applied for on</th>
				</tr>
				<?PHP
				$total_loanpend = 0;
				$count = 0;
				while($row_loanpend = mysqli_fetch_assoc($query_loanpend)){
					echo '<tr>
									<td><a href="loan.php?lid='.$row_loanpend['loan_id'].'">'.$row_loanpend['loan_no'].'</a></td>
									<td>'.$row_loanpend['cust_name'].' ('.$row_loanpend['cust_no'].')</td>
									<td>'.$row_loanpend['loanstatus_status'].'</td>
									<td>'.$row_loanpend['loan_period'].'</td>
									<td>'.number_format($row_loanpend['loan_principal']).' '.$_SESSION['set_cur'].'</td>
									<td>'.number_format(($row_loanpend['loan_repaytotal'] - $row_loanpend['loan_principal'])).' '.$_SESSION['set_cur'].'</td>
									<td>'.date("d.m.Y",$row_loanpend['loan_date']).'</td>
								</tr>';

					// Export Array
					array_push($_SESSION['rep_export'], array("Loan No." => $row_loanpend['loan_no'], "Customer" => $row_loanpend['cust_name'].' ('.$row_loanpend['cust_no'].')', "Status" => $row_loanpend['loanstatus_status'], "Loan Period" => $row_loanpend['loan_period'], "Principal" => $row_loanpend['loan_principal'], "Interest" => ($row_loanpend['loan_repaytotal'] - $row_loanpend['loan_principal']), "Repay Total" => $row_loanpend['loan_repaytotal'], "Applied for on" => date("d.m.Y",$row_loanpend['loan_date'])));

					$count++;
				}
				?>
				<tr class="balance">
					<td colspan="7">
					<?PHP
					echo $count.' pending loan';
					if ($count != 1) echo 's';
					?>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>
