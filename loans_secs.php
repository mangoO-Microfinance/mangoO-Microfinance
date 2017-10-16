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

	//Select Securities from LOANS
	$sql_loans = "SELECT * FROM loans LEFT JOIN loanstatus ON loans.loanstatus_id = loanstatus.loanstatus_id LEFT JOIN customer ON loans.cust_id = customer.cust_id LEFT JOIN securities ON loans.loan_id = securities.loan_id WHERE (loan_sec1 != '' OR loan_sec2 != '') ORDER BY loan_dateout, loans.cust_id";
	$query_loans = mysqli_query($db_link, $sql_loans);
	checkSQL($db_link, $query_loans);
?>
<html>
	<?PHP includeHead('Loan Securities',1) ?>

	<body>
		<!-- MENU -->
		<?PHP includeMenu(3);	?>
		<div id="menu_main">
			<a href="loan_search.php">Search</a>
			<a href="loans_act.php">Active Loans</a>
			<a href="loans_pend.php">Pending Loans</a>
			<a href="loans_secs.php" id="item_selected">Loan Securities</a>
		</div>

		<!-- CONTENT -->
		<div class="content-center">

			<table id="tb_table">
				<colgroup>
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<tr>
					<form class="export" action="rep_export.php" method="post">
						<th class="title" colspan="5">Loan Securities
						<!-- Export Button -->
						<input type="submit" name="export_rep" value="Export" />
						</th>
					</form>
				</tr>
				<tr>
					<th>Loan No.</th>
					<th>Customer</th>
					<th>Loan Status</th>
					<th>Security 1</th>
					<th>Security 2</th>
				</tr>
				<?PHP
				$count = 0;
				while ($row_loans = mysqli_fetch_assoc($query_loans)){

					echo '<tr>
									<td><a href="loan.php?lid='.$row_loans['loan_id'].'">'.$row_loans['loan_no'].'</a></td>
									<td>'.$row_loans['cust_name'].' (<a href="customer.php?cust='.$row_loans['cust_id'].'">'.$row_loans['cust_no'].')</a></td>
									<td>'.$row_loans['loanstatus_status'].'</td>
									<td>'.$row_loans['loan_sec1'].'</td>
									<td>'.$row_loans['loan_sec2'].'</td>
								</tr>';

					// Export Array
					array_push($_SESSION['rep_export'], array("Loan No." => $row_loans['loan_no'], "Customer" => $row_loans['cust_name'].' ('.$row_loans['cust_no'].')', "Status" => $row_loans['loanstatus_status'],"Security 1" => $row_loans['loan_sec1'], "Security 2" => $row_loans['loan_sec2']));

					$count++;
				}
				?>

				<tr class="balance">
					<td	colspan="5">
					<?PHP
					echo $count.' loans with securities';
					?>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>
