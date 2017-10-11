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
	<?PHP includeHead('Monthly Report',1) ?>

	<body>
		<!-- MENU -->
		<?PHP includeMenu(5); ?>
		<div id="menu_main">
			<a href="rep_incomes.php">Income Report</a>
			<a href="rep_expenses.php">Expense Report</a>
			<a href="rep_loans.php">Loans Report</a>
			<a href="rep_capital.php">Capital Report</a>
			<a href="rep_monthly.php" id="item_selected">Monthly Report</a>
			<a href="rep_annual.php" >Annual Report</a>
		</div>

		<!-- MENU: Selection Bar -->
		<div id="menu_selection">
			<form action="rep_monthly.php" method="post">
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
			$_SESSION['rep_exp_title'] = $rep_year.'-'.$rep_month.'_monthly-report';


			/**** INCOME RELATED DATA ****/

			//Select INCOMES and INCTYPE
			$sql_incomes = "SELECT * FROM incomes WHERE inc_date BETWEEN $firstDay AND $lastDay";
			$query_incomes = mysqli_query($db_link, $sql_incomes);
			checkSQL($db_link, $query_incomes);

			$sql_inctype = "SELECT * FROM inctype";
			$query_inctype = mysqli_query($db_link, $sql_inctype);
			checkSQL($db_link, $query_inctype);


			/**** EXPENDITURE RELATED DATA ****/

			//Select Expenses and EXPTYPE
			$sql_expendit = "SELECT * FROM expenses WHERE exp_date BETWEEN $firstDay AND $lastDay ORDER BY exp_date";
			$query_expendit = mysqli_query($db_link, $sql_expendit);
			checkSQL($db_link, $query_expendit);

			$sql_exptype = "SELECT * FROM exptype";
			$query_exptype = mysqli_query($db_link, $sql_exptype);
			checkSQL($db_link, $query_exptype);


			/**** CAPITAL RELATED DATA ****/

			//Select bought and sold Shares from SHARES
			$sql_shares = "SELECT * FROM shares WHERE share_date BETWEEN $firstDay AND $lastDay";
			$query_shares = mysqli_query($db_link, $sql_shares);
			checkSQL($db_link, $query_shares);
			$total_share_buys = 0;
			$total_share_sales = 0;
			while($row_shares = mysqli_fetch_assoc($query_shares)){
				if($row_shares['share_amount'] >= 0){
					$total_share_buys = $total_share_buys + $row_shares['share_value'];
				}
				elseif($row_shares['share_amount'] < 0){
					$total_share_sales = $total_share_sales + $row_shares['share_value'] * (-1);
				}
			}

			//Select Saving Deposits from SAVINGS
			$sql_savdep = "SELECT * FROM savings WHERE sav_date BETWEEN $firstDay AND $lastDay AND savtype_id = 1";
			$query_savdep = mysqli_query($db_link, $sql_savdep);
			checkSQL($db_link, $query_savdep);
			$total_savdep = 0;
			while($row_savdep = mysqli_fetch_assoc($query_savdep)){
				$total_savdep = $total_savdep + $row_savdep['sav_amount'];
			}

			//Select Loan Recoveries from LOANS
			$sql_loanrec = "SELECT * FROM ltrans WHERE ltrans_date BETWEEN $firstDay AND $lastDay";
			$query_loanrec = mysqli_query($db_link, $sql_loanrec);
			checkSQL($db_link, $query_loanrec);
			$total_loanrec = 0;
			while($row_loanrec = mysqli_fetch_assoc($query_loanrec)){
				$total_loanrec = $total_loanrec + $row_loanrec['ltrans_principal'];
			}

			//Select Saving Withdrawals from SAVINGS
			$sql_savwithd = "SELECT * FROM savings WHERE sav_date BETWEEN $firstDay AND $lastDay AND savtype_id = 2";
			$query_savwithd = mysqli_query($db_link, $sql_savwithd);
			checkSQL($db_link, $query_savwithd);
			$total_savwithd = 0;
			while($row_savwithd = mysqli_fetch_assoc($query_savwithd)){
				$total_savwithd = $total_savwithd + $row_savwithd['sav_amount'];
			}
			$total_savwithd = $total_savwithd * (-1);

			/**** LOAN RELATED DATA ****/

			//Select Loans Out from LOANS
			$sql_loanout = "SELECT * FROM loans WHERE loan_dateout BETWEEN $firstDay AND $lastDay";
			$query_loanout = mysqli_query($db_link, $sql_loanout);
			checkSQL($db_link, $query_loanout);
			$total_loanout = 0;
			while($row_loanout = mysqli_fetch_assoc($query_loanout)){
				$total_loanout = $total_loanout + $row_loanout['loan_principal'];
			}

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


			<!-- INCOMES: Table 1 -->
			<?PHP array_push($_SESSION['rep_export'], array("Type" => "INCOMES", "Amount" => "")); ?>
			<table id="tb_table" style="width:50%">
				<colspan>
					<col width="50%">
					<col width="50%">
				</colspan>
				<tr>
					<th class="title" colspan="2">Incomes for <?PHP echo $rep_month.'/'.$rep_year; ?></th>
				</tr>
				<tr>
					<th>Type</th>
					<th>Amount</th>
				</tr>
				<?PHP
				//Make array for income types
				$inctype = array();
				while($row_inctype = mysqli_fetch_assoc($query_inctype)){
					$inctype[] = $row_inctype;
				}

				//Make array for all incomes for selected month
				$incomes = array();
				while($row_incomes = mysqli_fetch_assoc($query_incomes)){
					$incomes[] = $row_incomes;
				}

				//Iterate over income types and add matching incomes to $total
				$total_inc = 0;
				foreach ($inctype as $it){
					$total_row = 0;
					foreach ($incomes as $ic) if ($ic['inctype_id'] == $it['inctype_id']) $total_row = $total_row + $ic['inc_amount'];
					echo '<tr>
									<td>'.$it['inctype_type'].'</td>
									<td>'.number_format($total_row).' '.$_SESSION['set_cur'].'</td>
								</tr>';
					$total_inc = $total_inc + $total_row;

					//Prepare INCOME data for export to Excel file
					array_push($_SESSION['rep_export'], array("Type" => $it['inctype_type'], "Amount" => $total_row));
				}

				//Total Incomes Amount
				echo '	<tr class="balance">
									<td>Total Incomes:</td>
									<td>'.number_format($total_inc).' '.$_SESSION['set_cur'].'</td>
								</tr>';
				array_push($_SESSION['rep_export'], array("Type" => "Total Incomes", "Amount" => $total_inc));
				array_push($_SESSION['rep_export'], array("Type" => "", "Amount" => ""));
				?>
			</table>

			<!-- Expenses: Table 1 -->
			<?PHP array_push($_SESSION['rep_export'], array("Type" => "EXPENSES", "Amount" => "")); ?>
			<table id="tb_table" style="width:50%">
				<colspan>
					<col width="50%">
					<col width="50%">
				</colspan>
				<tr>
					<th class="title" colspan="2">Expenses for <?PHP echo $rep_month.'/'.$rep_year ?></th>
				</tr>
				<tr>
					<th>Type</th>
					<th>Amount</th>
				</tr>
				<?PHP

				$exptype = array();
				while($row_exptype = mysqli_fetch_assoc($query_exptype)){
					$exptype[] = $row_exptype;
				}

				$expendit = array();
				while($row_expendit = mysqli_fetch_assoc($query_expendit)){
					$expendit[] = $row_expendit;
				}

				$total_exp = 0;
				foreach ($exptype as $et){
					$total_row = 0;
					foreach ($expendit as $ex) if ($ex['exptype_id'] == $et['exptype_id']) $total_row = $total_row + $ex['exp_amount'];
					echo '<tr>
									<td>'.$et['exptype_type'].'</td>
									<td>'.number_format($total_row).' '.$_SESSION['set_cur'].'</td>
								</tr>';
					$total_exp = $total_exp + $total_row;

					//Prepare EXPENSE data for export to Excel file
					array_push($_SESSION['rep_export'], array("Type" => $et['exptype_type'], "Amount" => $total_row));
				}

				//Total expenses Amount Line
				echo '<tr class="balance">
								<td>Total expenses:</td>
								<td>'.number_format($total_exp).' '.$_SESSION['set_cur'].'</td>
							</tr>';
				array_push($_SESSION['rep_export'], array("Type" => "Total Expenses", "Amount" => $total_exp));
				array_push($_SESSION['rep_export'], array("Type" => "", "Amount" => ""));
				?>
			</table>


			<!-- LOANS: Table 1: Due Repayments -->
			<?PHP array_push($_SESSION['rep_export'], array("Type" => "LOAN REPAYMENTS", "Amount" => "")); ?>
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

				//Prepare LOAN REPAYMENT data for export to Excel file
				array_push($_SESSION['rep_export'], array("Type" => "Due Loan Payments", "Amount" => $total_loandue));
				?>
			</table>

			<!-- LOANS: Table 2: Loan Recoveries -->
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

				//Prepare LOANS RECOVERY data for export to Excel file
				array_push($_SESSION['rep_export'], array("Type" => "Loan Recoveries", "Amount" => $total_loanrec));
				if ($total_loandue != 0) array_push($_SESSION['rep_export'], array("Type" => "Loan Recovery Rate", "Amount" => round(($total_loanrec / $total_loandue * 100),2).'%'));
				array_push($_SESSION['rep_export'], array("Type" => "", "Amount" => ""));
				?>
			</table>

			<!-- LOANS: Table 3: Loans Out -->
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
				?>
			</table>


			<!-- CAPITAL: Table 1: Capital Additions -->
			<table id="tb_table" style="width:50%">
				<colgroup>
					<col width="50%"/>
					<col width="50%"/>
				</colgroup>
				<tr>
					<th class="title" colspan="2">Capital Additions for <?PHP echo $rep_month.'/'.$rep_year; ?></th>
				</tr>
				<tr>
					<th>Type</th>
					<th>Amount</th>
				</tr>
				<tr>
					<td>Shares Out</td>
					<td><?PHP echo number_format($total_share_buys).' '.$_SESSION['set_cur'] ?></td>
				</tr>
				<tr class="alt">
					<td>Saving Deposits</td>
					<td><?PHP echo number_format($total_savdep).' '.$_SESSION['set_cur'] ?></td>
				</tr>
				<tr>
					<td>Loan Recoveries</td>
					<td><?PHP echo number_format($total_loanrec).' '.$_SESSION['set_cur'] ?></td>
				</tr>
				<tr class="balance">
					<td>Total Capital Additions:</td>
					<td><?PHP echo number_format($total_share_buys + $total_savdep + $total_loanrec).' '.$_SESSION['set_cur'] ?></td>
				</tr>
			</table>

			<!-- CAPITAL: Table 2: Capital Deductions -->
			<table id="tb_table" style="width:50%">
				<colgroup>
					<col width="50%"/>
					<col width="50%"/>
				</colgroup>
				<tr>
					<th class="title" colspan="2">Capital Deductions for <?PHP echo $rep_month.'/'.$rep_year; ?></th>
				</tr>
				<tr>
					<th>Type</th>
					<th>Amount</th>
				</tr>
				<tr>
					<td>Shares In</td>
					<td><?PHP echo number_format($total_share_sales).' '.$_SESSION['set_cur'] ?></td>
				</tr>
				<tr class="alt">
					<td>Loans Out</td>
					<td><?PHP echo number_format($total_loanout).' '.$_SESSION['set_cur'] ?></td>
				</tr>
				<tr>
					<td>Saving Withdrawals</td>
					<td><?PHP echo number_format($total_savwithd).' '.$_SESSION['set_cur'] ?></td>
				</tr>
				<tr class="balance">
					<td>Total Capital Deductions:</td>
					<td><?PHP echo number_format($total_loanout+$total_savwithd).' '.$_SESSION['set_cur'] ?></td>
				</tr>

				<?PHP
				//Prepare CAPITAL data for export to Excel file
				array_push($_SESSION['rep_export'], array("Type" => "CAPITAL ADDITIONS", "Amount" => ""));
				array_push($_SESSION['rep_export'], array("Type" => "Shares Out", "Amount" => $total_share_buys));
				array_push($_SESSION['rep_export'], array("Type" => "Saving Deposits", "Amount" => $total_savdep));
				array_push($_SESSION['rep_export'], array("Type" => "Loan Recoveries", "Amount" => $total_loanrec));
				array_push($_SESSION['rep_export'], array("Type" => "Total Additions", "Amount" => $total_loanrec+$total_savdep+$total_share_buys));

				array_push($_SESSION['rep_export'], array("Type" => "", "Amount" => ""));

				array_push($_SESSION['rep_export'], array("Type" => "CAPITAL DEDUCTIONS", "Amount" => ""));
				array_push($_SESSION['rep_export'], array("Type" => "Shares In", "Amount" => $total_share_sales));
				array_push($_SESSION['rep_export'], array("Type" => "Saving Withdrawals", "Amount" => $total_savwithd));
				array_push($_SESSION['rep_export'], array("Type" => "Loans Out", "Amount" => $total_loanout));
				array_push($_SESSION['rep_export'], array("Type" => "Total Deductions", "Amount" => $total_loanout+$total_savwithd+$total_share_sales));
				?>
			</table>

		<?PHP
		}
		?>
	</body>
</html>
