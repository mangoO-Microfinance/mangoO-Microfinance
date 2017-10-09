<?PHP
//Select Overdue Loan Instalments from LTRANS
$query_overd = getLtransOverdue ($db_link);
?>

<table id="tb_table">
	<colgroup>
		<col width="15%">
		<col width="45%">
		<col width="20%">
		<col width="20%">
	</colgroup>
	<tr>
		<th colspan="4" class="title">Defaulted Loan Instalments</th>
	</tr>
	<tr>
		<th>Loan No.</th>
		<th>Customer Name</th>
		<th>Due Date</th>
		<th>Amount Due</th>
	</tr>
	<?PHP
	while ($row_overd = mysqli_fetch_assoc($query_overd)){
		echo '<tr>
						<td><a href="loan.php?lid='.$row_overd['loan_id'].'">'.$row_overd['loan_no'].'</a></td>
						<td>'.$row_overd['cust_name'].'</td>
						<td>'.date("d.m.Y",$row_overd['ltrans_due']).'</td>
						<td>'.number_format($row_overd['ltrans_principaldue']+$row_overd['ltrans_interestdue']).' '.$_SESSION['set_cur'].'</td>
					</tr>';

		// Module for automatic fine charging
		if ($_SESSION['set_auf'] != NULL) include './modules/mod_autofine.php';
	}
	?>
</table>
