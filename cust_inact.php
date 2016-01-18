<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();
	
	$rep_year = date("Y",time());
	$rep_month = date("m",time());
		
	//Make array for exporting data
	$_SESSION['rep_export'] = array();
	$_SESSION['rep_exp_title'] = $rep_year.'-'.$rep_month.'_cust-inact';
	
	//Select inactive customers from CUSTOMER
	$sql_custinact = "SELECT * FROM customer WHERE cust_active != 1";
	$query_custinact = mysql_query($sql_custinact);
	check_sql ($query_custinact);
?>
	
<html>
	<?PHP htmlHead('Inactive Customers',1) ?>	
	
	<body>
		<!-- MENU -->
		<?PHP 
				menu_Tabs(2);
		?>
		
		<!-- MENU MAIN -->
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
				<th>Place of Residence</th> 
				<th>Phone No.</th>
				<th>Memb. since</th>
			</tr>
			<?PHP		
			$color = 0;
			while ($row_custinact = mysql_fetch_assoc($query_custinact)){					
				
				//Set value for $gender
				if ($row_custinact['cust_sex'] == 1) $gender = "Male";
				elseif ($row_custinact['cust_sex'] == 2) $gender = "Female";
				else $gender = "Institution";
				
				tr_colored($color);	//Alternating row colors
				echo '<td>
								<a href="customer.php?cust='.$row_custinact['cust_id'].'">'.$row_custinact['cust_id'].'/'.date("Y",$row_custinact['cust_since']).'</a>
							</td>
							<td>'.$row_custinact['cust_name'].'</td>
							<td>'.$gender.'</td>
							<td>'.date("d.m.Y",$row_custinact['cust_dob']).'</td>
							<td>'.$row_custinact['cust_occup'].'</td>
							<td>'.$row_custinact['cust_address'].'</td>
							<td>'.$row_custinact['cust_phone'].'</td>
							<td>'.date("d.m.Y",$row_custinact['cust_since']).'</td>
						</tr>';
				
				array_push($_SESSION['rep_export'], array("Cust. No." => $row_custinact['cust_id'], "Customer Name" => $row_custinact['cust_name'], "DoB" => date("d.m.Y",$row_custinact['cust_dob']), "Gender" => $gender, "Occupation" => $row_custinact['cust_occup'], "Place of Residence" => $row_custinact['cust_address'], "Phone No." => $row_custinact['cust_phone'], "Member since" => date("d.m.Y",$row_custinact['cust_since'])));
			}
			?>
		</table>
		
	</body>
</html>