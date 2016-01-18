<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();
	
	//Select from CUSTOMER depending on Search or not Search
	if (isset($_POST['cust_search'])){
		$cust_search = sanitize($_POST['cust_search']);
		$sql_custsearch = "SELECT * FROM customer WHERE cust_name LIKE '%$cust_search%'";
		$query_custsearch = mysql_query($sql_custsearch);
		check_sql ($query_custsearch);
	}
	else header('Location: start.php');
?>
	
<html>
	<?PHP htmlHead('Customer Search Result',1) ?>	
	<body>
		
		<!-- MENU -->
		<?PHP 
				include_Menu(2);
		?>
		
		<!-- MENU MAIN -->
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
					<col width="35%">
					<col width="10%">
					<col width="10%">
					<col width="35%">
				</colgroup>
				<tr>
					<th class="title" colspan="5">Customer Search Results</th>
				</tr>
				<tr>
					<th>Cust. No.</th>
					<th>Name</th>					
					<th>DoB</th> 
					<th>Gender</th> 
					<th>Place of Residence</th> 
				</tr>
				<?PHP		
				$color = 0;
				while ($row_custsearch = mysql_fetch_assoc($query_custsearch)){					
					//Alternating row colors
					tr_colored($color);
					echo '<td><a class="sacco" href="customer.php?cust='.$row_custsearch['cust_id'].'">'.$row_custsearch['cust_id'].'/'.date("Y",$row_custsearch['cust_since']).'</a></td>';
					echo '<td>'.$row_custsearch['cust_name'].'</td>';
					echo '<td>'.date("d.m.Y",$row_custsearch['cust_dob']).'</td>';
					if ($row_custsearch['cust_sex'] == 1) echo '<td>Male</td>';
					elseif ($row_custsearch['cust_sex'] == 2) echo '<td>Female</td>';
					else echo '<td>Institution</td>';
					echo '<td>'.$row_custsearch['cust_address'].'</td>';
					echo '</tr>';
				}
				?>
			</table>
		</div>
	</body>
</html>