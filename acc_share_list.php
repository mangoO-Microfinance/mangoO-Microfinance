<?PHP
//Select SHARES from database
$sql_sha = "SELECT * FROM shares, user WHERE shares.user_id = user.user_id AND cust_id = '$_SESSION[cust_id]' ORDER BY share_date DESC";
$query_sha = mysqli_query($db_link, $sql_sha);
checkSQL($db_link, $query_sha);

//Make array for exporting data
$share_exp_date = date("Y-m-d",time());
$_SESSION['share_export'] = array();
$_SESSION['share_exp_title'] = $_SESSION['cust_id'].'_shares_'.$share_exp_date;
?>

<table id="tb_table">
	<colgroup>
		<col width="15%">
		<col width="20%">
		<col width="20%">
		<col width="20%">
		<col width="20%">
		<col width="5%">
	</colgroup>
	<tr>								
		<form class="export" action="acc_share_export.php" method="post">
			<th class="title" colspan="6">Share Account
			<!-- Export Button -->
			<input type="submit" name="export_rep" value="Export" />
			</th>
		</form>
	</tr>
	<tr>
		<th>Date</th>
		<th>Amount of Shares</th>
		<th>Value of Shares</th>
		<th>Receipt No.</th>
		<th>Authorized by</th>
		<th>Delete</th>
	</tr>
	<?PHP
	$amount_balance = 0;
	$value_balance = 0;
	while($row_sha = mysqli_fetch_assoc($query_sha)){
		echo '<tr>
						<td>'.date("d.m.Y",$row_sha['share_date']).'</td>
						<td>'.$row_sha['share_amount'].'</td>
						<td>'.number_format($row_sha['share_value']).' '.$_SESSION['set_cur'].'</td>
						<td>'.$row_sha['share_receipt'].'</td>
						<td>'.$row_sha['user_name'].'</td>
						<td>';
						if($_SESSION['log_delete'] == 1) echo '<a href="acc_share_del.php?sha_id='.$row_sha['share_id'].'" onClick="return randCheck()"><i class="fa fa-remove fa-lg"></i></a>';
			echo '</td>
					</tr>';
		$amount_balance = $amount_balance + $row_sha['share_amount'];
		$value_balance = $value_balance + $row_sha['share_value'];
		
		//Prepare data for export to Excel file
		array_push($_SESSION['share_export'], array("Date" => date("d.m.Y",$row_sha['share_date']), "Amount of Shares" => $row_sha['share_amount'], "Share Value" => $row_sha['share_value'], "Receipt" => $row_sha['share_receipt']));
	}
	echo '<tr class="balance">
					<td>Balance:</td>
					<td>'.$amount_balance.'</td>
					<td>'.number_format($value_balance).' '.$_SESSION['set_cur'].'</td>
					<td colspan="3"></td>
				</tr>';
	?>
</table>