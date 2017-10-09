<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	$db_link = connect();

	$rep_year = date("Y",time());
	$rep_month = date("m",time());

	//Make array for exporting data
	$_SESSION['rep_export'] = array();
	$_SESSION['rep_exp_title'] = $rep_year.'-'.$rep_month.'_cust-inact';

	//Select inactive customers from CUSTOMER
	$query_custinact = getCustInact($db_link);
?>

<html>
	<?PHP includeHead('Inactive Customers',1) ?>

	<body>
		<!-- MENU -->
		<?PHP includeMenu(2); ?>
		<div id="menu_main">
			<a href="cust_search.php">Search</a>
			<a href="cust_new.php">New Customer</a>
			<a href="cust_act.php">Active Customers</a>
			<a href="cust_inact.php" id="item_selected">Inactive Customers</a>
		</div>

		<!-- TABLE: Inactive Customers -->
		<table id="tb_table">
			<colgroup>
				<col width="8%" />
				<col width="17%" />
				<col width="8%" />
				<col width="8%" />
				<col width="17%" />
				<col width="17%" />
				<col width="17%" />
				<col width="8%" />
			</colgroup>
			<tr>
				<form class="export" action="rep_export.php" method="post">
					<th class="title" colspan="8">Inactive Customers
					<!-- Export Button -->
					<input type="submit" name="export_rep" value="Export" />
					</th>
				</form>
			</tr>
			<tr>
				<th>Cust. No.</th>
				<th>Name</th>
				<th>Gender</th>
				<th>DoB</th>
				<th>Occupation</th>
				<th>Address</th>
				<th>Phone No.</th>
				<th>Memb. since</th>
			</tr>
			<?PHP
			$count = 0;
			while ($row_custinact = mysqli_fetch_assoc($query_custinact)){
				echo '<tr>
								<td>
									<a href="customer.php?cust='.$row_custinact['cust_id'].'">'.$row_custinact['cust_no'].'</a>
								</td>
								<td>'.$row_custinact['cust_name'].'</td>
								<td>'.$row_custinact['custsex_name'].'</td>
								<td>'.date("d.m.Y",$row_custinact['cust_dob']).'</td>
								<td>'.$row_custinact['cust_occup'].'</td>
								<td>'.$row_custinact['cust_address'].'</td>
								<td>'.$row_custinact['cust_phone'].'</td>
								<td>'.date("d.m.Y",$row_custinact['cust_since']).'</td>
							</tr>';

				array_push($_SESSION['rep_export'], array("Cust. No." => $row_custinact['cust_no'], "Customer Name" => $row_custinact['cust_name'], "DoB" => date("d.m.Y",$row_custinact['cust_dob']), "Gender" => $row_custinact['custsex_name'], "Occupation" => $row_custinact['cust_occup'], "Address" => $row_custinact['cust_address'], "Phone No." => $row_custinact['cust_phone'], "Member since" => date("d.m.Y",$row_custinact['cust_since'])));

				$count++;
			}
			?>
			<tr class="balance">
				<td colspan="8">
				<?PHP
				echo $count.' inactive customer';
				if ($count != 1) echo 's';
				?>
				</td>
			</tr>
		</table>
	</body>
</html>
