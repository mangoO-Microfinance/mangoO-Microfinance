<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	$db_link = connect();

	//Select from CUSTOMER
	if (isset($_POST['cust_search'])){
		$cust_search_no = sanitize($db_link, $_POST['cust_search_no']);
		$cust_search_name = sanitize($db_link, $_POST['cust_search_name']);
		$cust_search_addr = sanitize($db_link, $_POST['cust_search_addr']);
		$cust_search_occup = sanitize($db_link, $_POST['cust_search_occup']);

		//Defining WHERE condition
		$where = "";
		$title = "Customers";

		if ($cust_search_no != ""){
			$where = "cust_no LIKE '%$cust_search_no%'";
			$title = $title.' with number "'.$cust_search_no.'"';
		}
		if ($cust_search_no != "" AND $cust_search_name != "") $where = $where.' AND ';

		if ($cust_search_name != ""){
			$where = $where."cust_name LIKE '%$cust_search_name%'";
			$title = $title.' named "'.ucwords($cust_search_name).'"';
		}
		if (($cust_search_no != "" OR $cust_search_name != "") AND $cust_search_addr != "") $where = $where.' AND ';

		if ($cust_search_addr != ""){
			$where = $where."cust_address LIKE '%$cust_search_addr%'";
			$title = $title.' from "'.ucwords($cust_search_addr).'"';
		}
		if (($cust_search_no != "" OR $cust_search_name != "" OR $cust_search_addr != "") AND $cust_search_occup != "") $where = $where.' AND ';

		if ($cust_search_occup != ""){
			$where = $where."cust_occup LIKE '%$cust_search_occup%'";
			$title = $title.' working as "'.ucwords($cust_search_occup).'"';
		}

		$sql_custsearch = "SELECT * FROM customer LEFT JOIN custsex ON customer.custsex_id = custsex.custsex_id WHERE $where ORDER BY customer.cust_id";
		$query_custsearch = mysqli_query($db_link, $sql_custsearch);
		checkSQL($db_link, $query_custsearch);

		//Make array for exporting data
		$cust_exp_date = date("Y-m-d",time());
		$_SESSION['cust_export'] = array();
		$_SESSION['cust_exp_title'] = 'customers-search_'.$cust_exp_date;
	}
	else header('Location: start.php');
?>

<html>
	<?PHP includeHead('Customer Search Result',1) ?>
	<body>
		<!-- MENU -->
		<?PHP includeMenu(2); ?>
		<div id="menu_main">
			<a href="cust_search.php" id="item_selected">Search</a>
			<a href="cust_new.php">New Customer</a>
			<a href="cust_act.php">Active Customers</a>
			<a href="cust_inact.php">Inactive Customers</a>
		</div>

		<!-- CONTENT: Search Results -->
		<div id="content_center">

			<table id="tb_table">
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<tr>
					<form class="export" action="cust_export.php" method="post">
						<th class="title" colspan="7"><?PHP echo $title; ?>
						<!-- Export Button -->
						<input type="submit" name="export_cust" value="Export" />
						</th>
					</form>
				</tr>
				<tr>
					<th>Cust. No.</th>
					<th>Name</th>
					<th>DoB</th>
					<th>Gender</th>
					<th>Occupation</th>
					<th>Address</th>
					<th>Phone No.</th>
				</tr>
				<?PHP
				while ($row_custsearch = mysqli_fetch_assoc($query_custsearch)){
					echo '<tr>
									<td><a href="customer.php?cust='.$row_custsearch['cust_id'].'">'.$row_custsearch['cust_no'].'</a></td>
									<td>'.$row_custsearch['cust_name'].'</td>
									<td>'.date("d.m.Y",$row_custsearch['cust_dob']).'</td>
									<td>'.$row_custsearch['custsex_name'].'</td>
									<td>'.$row_custsearch['cust_occup'].'</td>
									<td>'.$row_custsearch['cust_address'].'</td>
									<td>'.$row_custsearch['cust_phone'].'</td>
								</tr>';

					//Prepare data for export to Excel file
					array_push($_SESSION['cust_export'], array("Cust No." => $row_custsearch['cust_no'], "Name" => $row_custsearch['cust_name'], "DoB" => date("d.m.Y", $row_custsearch['cust_dob']), "Gender" => $row_custsearch['custsex_name'], "Occupation" => $row_custsearch['cust_occup'], "Address" => $row_custsearch['cust_address'], "Phone No." => $row_custsearch['cust_phone']));
				}
				?>
			</table>
		</div>
	</body>
</html>
