<?PHP
//Select Subscription Defaulters from CUSTOMER
$query_subscrdef = getCustOverdue ($db_link);
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
	while($row_subscrdef = mysqli_fetch_assoc($query_subscrdef)){
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
