<?PHP
//Select Subscription Defaulters from CUSTOMER
$last_subscr = time() - convertDays(365); //Seconds for 365 days
$sql_subscrdef = "SELECT * FROM customer WHERE cust_active = 1 AND cust_lastsub < $last_subscr ORDER BY cust_lastsub, cust_id";
$query_subscrdef = mysql_query($sql_subscrdef);
checkSQL($query_subscrdef);
?>

<table id="tb_table">
	<colgroup>
		<col width="20%">
		<col width="60%">
		<col width="20%">
	</colgroup>
	<tr>
		<th colspan="3" class="title">Overdue Subscription Fees</th>
	</tr>
	<tr>
		<th>Cust. No.</th>
		<th>Customer Name</th>
		<th>Last Paid</th>
	</tr>
	<?PHP
	while($row_subscrdef = mysql_fetch_assoc($query_subscrdef)){
		echo '<tr>
						<td><a href="customer.php?cust='.$row_subscrdef['cust_id'].'">'.$row_subscrdef['cust_no'].'</a></td>
						<td>'.$row_subscrdef['cust_name'].'</td>
						<td>'.date("d.m.Y", $row_subscrdef['cust_lastsub']).'</td>
					</tr>';
					
		// Module for automatic account deactivation if customer failed to renew subscription 
		if ($_SESSION['set_deact'] != NULL) include './modules/mod_deactivate.php';
	}
	?>
</table>