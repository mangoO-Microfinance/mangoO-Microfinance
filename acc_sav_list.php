<?PHP

//Select Savings Transactions from SAVINGS
$sql_sav = "SELECT * FROM savings, savtype, user WHERE savings.savtype_id = savtype.savtype_id AND savings.user_id = user.user_id AND cust_id = '$_SESSION[cust_id]' ORDER BY sav_date, sav_id";
$query_sav = mysql_query($sql_sav);
check_sql($query_sav);

//Make array for exporting data
$sav_exp_date = date("Y-m-d",time());
$_SESSION['sav_export'] = array();
$_SESSION['sav_exp_title'] = $_SESSION['cust_id'].'_savings_'.$sav_exp_date;

?>

<table id="tb_table">
	<colgroup>
		<col width="15%">
		<col width="20%">
		<col width="20%">
		<col width="15%">
		<col width="15%">
		<col width="15%">
	</colgroup>
	<tr>
		<form class="export" action="acc_sav_export.php" method="post">
			<th class="title" colspan="7">Savings Account
			<!-- Export Button -->
			<input type="submit" name="export_rep" value="Export" />
			</th>
		</form>
	</tr>
	<tr>
		<th>Date</th>
		<th>Transaction Type</th>
		<th>Amount</th>
		<th>Receipt</th>
		<th>W/draw Slip</th>
		<th>Authorised by</th>
		<th>Delete</th>
	</tr>
 <?PHP
	$balance = 0;
	while($row_sav = mysql_fetch_assoc($query_sav)){
		tr_colored($color);
		echo '<td>'.date("d.m.Y",$row_sav['sav_date']).'</td>';
		echo '<td>'.$row_sav['savtype_type'].'</td>';
		echo '<td>'.number_format($row_sav['sav_amount']).' '.$_SESSION['set_cur'].'</td>';
		echo '<td>'.$row_sav['sav_receipt'].'</td>';
		echo '<td>'.$row_sav['sav_slip'].'</td>';
		echo '<td>'.$row_sav['user_name'].'</td>';
		if ($_SESSION['log_delete'] == 1 and ($row_sav['savtype_id'] == 1 or $row_sav['savtype_id'] == 2 or $row_sav['savtype_id'] == 5)) echo '<td><a href="acc_sav_del.php?sav_id='.$row_sav['sav_id'].'" onClick="return randCheck();"><img src="ico/delete.png" /></a></td>';
		else echo '<td></td>';
		echo '</tr>';
		$balance = $balance + $row_sav['sav_amount'];
		
		//Prepare data for export to Excel file
		array_push($_SESSION['sav_export'], array("Date" => date("d.m.Y",$row_sav['sav_date']), "Transaction Type" => $row_sav['savtype_type'], "Amount" => $row_sav['sav_amount'], "Receipt" => $row_sav['sav_receipt'], "W/draw Slip" => $row_sav['sav_slip']));
	}
	echo '<tr class="balance">
					<td colspan="7">Balance: '.number_format($balance).' '.$_SESSION['set_cur'].'</td>
				</tr>';
 ?>
</table>