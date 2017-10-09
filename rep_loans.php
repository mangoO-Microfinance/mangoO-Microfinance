<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionReport();
	$db_link = connect();

	//Variables $year and $month provide the pre-set values for input fields
	$year = date("Y",time());
	$month = date("m",time());
?>
<html>
	<?PHP includeHead('Loans Report',1) ?>
	<body>
		<!-- MENU -->
		<?PHP includeMenu(5); ?>
		<div id="menu_main">
			<a href="rep_incomes.php">Income Report</a>
			<a href="rep_expenses.php">Expense Report</a>
			<a href="rep_loans.php" id="item_selected">Loans Report</a>
			<a href="rep_capital.php">Capital Report</a>
			<a href="rep_monthly.php">Monthly Report</a>
			<a href="rep_annual.php">Annual Report</a>
		</div>
		<!-- MENU: Selection Bar -->
		<div id="menu_selection">
			<form action="rep_loans.php" method="post">
				<input type="number" min="2006" max="2206" name="rep_year" style="width:100px;" value="<?PHP if ($month == 01) echo $year-1; else echo $year; ?>" placeholder="Give Year" />
				<select name="rep_month">
					<option value="01" <?PHP if ($month == 2) echo 'selected="selected"' ?> >January</option>
					<option value="02" <?PHP if ($month == 3) echo 'selected="selected"' ?> >February</option>
					<option value="03" <?PHP if ($month == 4) echo 'selected="selected"' ?> >March</option>
					<option value="04" <?PHP if ($month == 5) echo 'selected="selected"' ?> >April</option>
					<option value="05" <?PHP if ($month == 6) echo 'selected="selected"' ?> >May</option>
					<option value="06" <?PHP if ($month == 7) echo 'selected="selected"' ?> >June</option>
					<option value="07" <?PHP if ($month == 8) echo 'selected="selected"' ?> >July</option>
					<option value="08" <?PHP if ($month == 9) echo 'selected="selected"' ?> >August</option>
					<option value="09" <?PHP if ($month == 10) echo 'selected="selected"' ?> >September</option>
					<option value="10" <?PHP if ($month == 11) echo 'selected="selected"' ?> >October</option>
					<option value="11" <?PHP if ($month == 12) echo 'selected="selected"' ?> >November</option>
					<option value="12" <?PHP if ($month == 1) echo 'selected="selected"' ?> >December</option>
				</select>
				<input type="submit" name="select" value="Select Report" />
			</form>
		</div>

		<?PHP
		if(isset($_POST['select'])){

			//Sanitize user input
			$rep_month = sanitize($db_link, $_POST['rep_month']);
			$rep_year = sanitize($db_link, $_POST['rep_year']);

			//Calculate UNIX TIMESTAMP for first and last day of selected month
			$firstDay = mktime(0, 0, 0, $rep_month, 1, $rep_year);
			$lastDay = mktime(0, 0, 0, ($rep_month+1), 0, $rep_year);

			//Make array for exporting data
			$_SESSION['rep_export'] = array();
			$_SESSION['rep_exp_title'] = $rep_year.'-'.$rep_month.'_loans';

			//Select Due Loan Payments from LTRANS
			$sql_loandue = "SELECT * FROM ltrans, loans, loanstatus WHERE ltrans.loan_id = loans.loan_id AND loans.loanstatus_id = loanstatus.loanstatus_id AND ltrans_due BETWEEN $firstDay AND $lastDay AND loans.loanstatus_id IN (2, 4, 5) ORDER BY ltrans_due, loans.cust_id";
			$query_loandue = mysqli_query($db_link, $sql_loandue);
			checkSQL($db_link, $query_loandue);

			//Select Loan Recoveries from LTRANS
			$sql_loanrec = "SELECT * FROM ltrans, loans WHERE ltrans.loan_id = loans.loan_id AND ltrans_date BETWEEN $firstDay AND $lastDay ORDER BY ltrans_date, loans.cust_id";
			$query_loanrec = mysqli_query($db_link, $sql_loanrec);
			checkSQL($db_link, $query_loanrec);

			//Select Loans Out from LOANS
			$sql_loanout = "SELECT * FROM loans, customer WHERE loans.cust_id = customer.cust_id AND loans.loan_dateout BETWEEN $firstDay AND $lastDay ORDER BY loan_dateout, loans.cust_id";
			$query_loanout = mysqli_query($db_link, $sql_loanout);
			checkSQL($db_link, $query_loanout);
			?>

			<!-- Export Button -->
			<form class="export" action="rep_export.php" method="post">
				<input type="submit" name="export_rep" value="Export Report" />
			</form>

			<!-- TABLE 1: Expected Due Payments -->
			<table id="tb_table" style="width:75%">
				<colgroup>
					<col width="25%"/>
					<col width="25%"/>
					<col width="25%"/>
					<col width="25%"/>
				</colgroup>
				<tr>
					<th class="title" colspan="4">Due Loan Payments for <?PHP echo $rep_month.'/'.$rep_year; ?></th>
				</tr>
				<tr>
					<th>Loan No.</th>
					<th>Loan Status</th>
					<th>Due Date</th>
					<th>Due Amount</th>
				</tr>
				<?PHP
				$total_loandue = 0;
				while($row_loandue = mysqli_fetch_assoc($query_loandue)){
					echo '<tr>
									<td><a href="loan.php?lid='.$row_loandue['loan_id'].'">'.$row_loandue['loan_no'].'</a></td>
									<td>'.$row_loandue['loanstatus_status'].'</td>
									<td>'.date("d.m.Y",$row_loandue['ltrans_due']).'</td>
									<td>'.number_format($row_loandue['ltrans_principaldue'] + $row_loandue['ltrans_interestdue']).' '.$_SESSION['set_cur'].'</td>
								</tr>';
					$total_loandue = $total_loandue + $row_loandue['ltrans_principaldue'] + $row_loandue['ltrans_interestdue'];
				}
				echo '<tr class="balance">
								<td colspan="4">Total Due Payments: '.number_format($total_loandue).' '.$_SESSION['set_cur'].'</td>
							</tr>';

				//Prepare data for export to Excel file
				array_push($_SESSION['rep_export'], array("Type" => "Due Loan Payments", "Amount" => $total_loandue));
				array_push($_SESSION['rep_export'], array("Type" => "", "Amount" => ""));
				?>
			</table>

			<!-- TABLE 2: Loan Recoveries -->
			<table id="tb_table" style="width:75%">
				<colgroup>
					<col width="25%"/>
					<col width="25%"/>
					<col width="25%"/>
					<col width="25%"/>
				</colgroup>
				<tr>
					<th class="title" colspan="4">Loan Recoveries for <?PHP echo $rep_month.'/'.$rep_year; ?></th>
				</tr>
				<tr>
					<th>Loan No.</th>
					<th>Instalment Due</th>
					<th>Recovered</th>
					<th>Date</th>
				</tr>
				<?PHP
				$total_loanrec = 0;
				while($row_loanrec = mysqli_fetch_assoc($query_loanrec)){
					echo '<tr>
									<td><a href="loan.php?lid='.$row_loanrec['loan_id'].'">'.$row_loanrec['loan_no'].'</a></td>
									<td>'.number_format($row_loanrec['ltrans_principaldue'] + $row_loanrec['ltrans_interestdue']).' '.$_SESSION['set_cur'].'</td>
									<td>'.number_format($row_loanrec['ltrans_principal'] + $row_loanrec['ltrans_interest']).' '.$_SESSION['set_cur'].'</td>
									<td>'.date("d.m.Y",$row_loanrec['ltrans_date']).'</td>
								</tr>';
					$total_loanrec = $total_loanrec + $row_loanrec['ltrans_principal'] + $row_loanrec['ltrans_interest'];
				}
				echo '<tr class="balance">
								<td colspan="4">
									Total Recoveries: '.number_format($total_loanrec).' '.$_SESSION['set_cur'];
				if ($total_loandue != 0) echo '<br/>Loan Recovery Rate: '.number_format($total_loanrec / $total_loandue * 100).'%';
				echo '	</td>
							</tr>';
				array_push($_SESSION['rep_export'], array("Type" => "Loan Recoveries", "Amount" => $total_loanrec));
				if ($total_loandue != 0) array_push($_SESSION['rep_export'], array("Type" => "Loan Recovery Percentage", "Amount" => round(($total_loanrec / $total_loandue * 100),2).'%'));
				array_push($_SESSION['rep_export'], array("Type" => "", "Amount" => ""));
				?>
			</table>

			<!-- TABLE 3: Loans Out -->
			<table id="tb_table" style="width:75%">
				<colgroup>
					<col width="10%"/>
					<col width="30%"/>
					<col width="20%"/>
					<col width="5%"/>
					<col width="5%"/>
					<col width="20%"/>
					<col width="10%"/>
				</colgroup>
				<tr>
					<th class="title" colspan="7">Loans Out for <?PHP echo $rep_month.'/'.$rep_year; ?></th>
				</tr>
				<tr>
					<th>Loan No.</th>
					<th>Customer</th>
					<th>Principal</th>
					<th>Interest</th>
					<th>Period</th>
					<th>Repay Total</th>
					<th>Date Out</th>
				</tr>
				<?PHP
				$total_loanout = 0;
				while($row_loanout = mysqli_fetch_assoc($query_loanout)){
					echo '<tr>
									<td><a href="loan.php?lid='.$row_loanout['loan_id'].'">'.$row_loanout['loan_no'].'</a></td>
									<td>'.$row_loanout['cust_name'].' ('.$row_loanout['cust_no'].')</td>
									<td>'.number_format($row_loanout['loan_principal']).' '.$_SESSION['set_cur'].'</td>
									<td>'.$row_loanout['loan_interest'].'%</td>
									<td>'.$row_loanout['loan_period'].'</td>
									<td>'.number_format($row_loanout['loan_repaytotal']).' '.$_SESSION['set_cur'].'</td>
									<td>'.date("d.m.Y", $row_loanout['loan_dateout']).'</td>
								</tr>';
					$total_loanout = $total_loanout + $row_loanout['loan_principal'];
				}
				echo '<tr class="balance">
								<td colspan="7">Total Loans Out: '.number_format($total_loanout).' '.$_SESSION['set_cur'].'</td>
							</tr>';
				array_push($_SESSION['rep_export'], array("Type" => "Loans Out", "Amount" => $total_loanout));
				array_push($_SESSION['rep_export'], array("Type" => "", "Amount" => ""));
				?>
			</table>
		<?PHP
		}
		?>
	</body>
</html>
