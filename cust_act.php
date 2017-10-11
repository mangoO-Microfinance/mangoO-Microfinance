<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	$db_link = connect();

	//Make array for exporting data
	$rep_year = date("Y",time());
	$rep_month = date("m",time());
	$_SESSION['rep_export'] = array();
	$_SESSION['rep_exp_title'] = $rep_year.'-'.$rep_month.'_cust-active';

	//Select active customers from CUSTOMER
	$query_custact = getCustAct($db_link);
?>
	
<html>
	<?PHP includeHead('Active Customers',1) ?>

	<body>
		<!-- MENU -->
		<?PHP includeMenu(2); ?>
		<div id="menu_main">
			<a href="cust_search.php">Search</a>
			<a href="cust_new.php">New Customer</a>
			<a href="cust_act.php" id="item_selected">Active Customers</a>
			<a href="cust_inact.php">Inactive Customers</a>
		</div>

		<!-- TABLE: Active Customers -->
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
					<th class="title" colspan="8">Active Customers
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
			while ($row_custact = mysqli_fetch_assoc($query_custact)){
				echo '<tr>
								<td>
									<a href="customer.php?cust='.$row_custact['cust_id'].'">'.$row_custact['cust_no'].'</a>
								</td>
								<td>'.$row_custact['cust_name'].'</td>
								<td>'.$row_custact['custsex_name'].'</td>
								<td>'.date("d.m.Y",$row_custact['cust_dob']).'</td>
								<td>'.$row_custact['cust_occup'].'</td>
								<td>'.$row_custact['cust_address'].'</td>
								<td>'.$row_custact['cust_phone'].'</td>
								<td>'.date("d.m.Y",$row_custact['cust_since']).'</td>
							</tr>';

				array_push($_SESSION['rep_export'], array("Cust. No." => $row_custact['cust_no'], "Customer Name" => $row_custact['cust_name'], "DoB" => date("d.m.Y",$row_custact['cust_dob']), "Gender" => $row_custact['custsex_name'], "Occupation" => $row_custact['cust_occup'], "Address" => $row_custact['cust_address'], "Phone No." => $row_custact['cust_phone'], "Member since" => date("d.m.Y",$row_custact['cust_since'])));

				$count++;
			}
			?>
			<tr class="balance">
				<td colspan="8">
				<?PHP
				echo $count.' active customer';
				if ($count != 1) echo 's';
				?>
				</td>
			</tr>
		</table>
	</body>
</html>
