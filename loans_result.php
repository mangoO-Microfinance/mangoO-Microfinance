<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	$db_link = connect();

	//Select from LOANS depending on Search or not Search
	if (isset($_POST['loan_no'])){
		$loan_search = sanitize($db_link, $_POST['loan_no']);
		$sql_loansearch = "SELECT * FROM loans LEFT JOIN loanstatus ON loans.loanstatus_id = loanstatus.loanstatus_id LEFT JOIN customer ON loans.cust_id = customer.cust_id WHERE loan_no LIKE '%$loan_search%'";
		$query_loansearch = mysqli_query($db_link, $sql_loansearch);
		checkSQL($db_link, $query_loansearch);
	}
	elseif (isset($_POST['loan_status'])){
		$loan_search = sanitize($db_link, $_POST['loan_status']);
		$sql_loansearch = "SELECT * FROM loans LEFT JOIN loanstatus ON loans.loanstatus_id = loanstatus.loanstatus_id LEFT JOIN customer ON loans.cust_id = customer.cust_id WHERE loans.loanstatus_id = '$loan_search'";
		$query_loansearch = mysqli_query($db_link, $sql_loansearch);
		checkSQL($db_link, $query_loansearch);
	}
	else header('Location: start.php');
?>

<html>
	<?PHP includeHead('Loans Search Result',1) ?>
	<body>

		<!-- MENU -->
		<?PHP includeMenu(3); ?>
		<div id="menu_main">
			<a href="loans_search.php" id="item_selected">Search</a>
			<a href="loans_act.php">Active Loans</a>
			<a href="loans_pend.php">Pending Loans</a>
			<a href="loans_securities.php">Loan Securities</a>
		</div>

		<div id="content_center">

			<!-- SEARCH RESULTS -->
			<table id="tb_table">
				<colgroup>
					<col width="7.5%" />
					<col width="25%" />
					<col width="10%" />
					<col width="7.5%" />
					<col width="15%" />
					<col width="15%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th class="title" colspan="8" >Loan Search Results</th>
				</tr>
				<tr>
					<th>Loan No.</th>
					<th>Customer</th>
					<th>Status</th>
					<th>Period</th>
					<th>Principal</th>
					<th>Interest</th>
					<th>Applied for on</th>
					<th>Issued</th>
				</tr>
				<?PHP
				while ($row_loansearch = mysqli_fetch_assoc($query_loansearch)){
					echo '<tr>
									<td><a href="loan.php?lid='.$row_loansearch['loan_id'].'">'.$row_loansearch['loan_no'].'</a></td>
									<td>'.$row_loansearch['cust_name'].' (<a href="customer.php?cust='.$row_loansearch['cust_id'].'">'.$row_loansearch['cust_no'].'</a>)</td>
									<td>'.$row_loansearch['loanstatus_status'].'</td>
									<td>'.$row_loansearch['loan_period'].'</td>
									<td>'.number_format($row_loansearch['loan_principal']).' '.$_SESSION['set_cur'].'</td>
									<td>'.number_format(($row_loansearch['loan_repaytotal'] - $row_loansearch['loan_principal'])).' '.$_SESSION['set_cur'].'</td>
									<td>'.date("d.m.Y",$row_loansearch['loan_date']).'</td>
									<td>';
									if ($row_loansearch['loan_dateout'] == 0) echo "No";
									else echo date("d.m.Y", $row_loansearch['loan_dateout']);
						echo	'</td>
								</tr>';
				}
				?>
			</table>
		</div>
	</body>
</html>
