<?PHP
if (($result_cust['cust_lastsub']+31536000) < $timestamp ){ 
	$visibility = 'block';
	if($result_cust['cust_active'] == 1) echo '<script language=javascript>alert(\'This Customer needs to renew his / her Subscription!\')</script>';
}
else $visibility = 'none';

//RENEW-MEMBERSHIP-Button
if(isset($_POST['subscr_renew'])){
	
	//Sanitize user input
	$subscr_date = strtotime(sanitize($_POST['subscr_date']));
	$subscr_receipt = sanitize($_POST['subscr_receipt']);
	$timestamp = time();
	
	//Select Subscription Fee from FEES
	$sql_fee = "SELECT * FROM fees WHERE fee_id = 4";
	$query_fee = mysql_query($sql_fee);
	check_sql($query_fee); 
	while ($row_fee = mysql_fetch_array($query_fee)){
		$fee_subscr = $row_fee['fee_value'];
	}
	$fee_subscr_sav = $fee_subscr*(-1);
	
	//Insert Subscription Fee into SAVINGS
	if ($_POST['subscr_from_sav'] == 1){
		$sql_insert_fee = "INSERT INTO savings (cust_id, sav_date, sav_amount, savtype_id, sav_receipt, sav_created, user_id) VALUES ('$_SESSION[cust_id]', '$subscr_date', '$fee_subscr_sav', '5', '$subscr_receipt', '$timestamp', '$_SESSION[log_id]')";
		$query_insert_fee = mysql_query ($sql_insert_fee);
		check_sql($query_insert_fee);
	}
	
	//Insert Subscription Fee into INCOMES
	$sql_insert_fee = "INSERT INTO incomes (cust_id, inctype_id, inc_amount, inc_date, inc_receipt, inc_created, user_id) VALUES ('$_SESSION[cust_id]', '8', '$fee_subscr', '$subscr_date', '$subscr_receipt', '$timestamp', '$_SESSION[log_id]')";
	$query_insert_fee = mysql_query ($sql_insert_fee);
	check_sql($query_insert_fee);
	
	//Set Customer to ACTIVE and update SUBSCRIPTION DATE
	$query_active = mysql_query("UPDATE customer SET cust_lastsub = '$subscr_date', cust_active = '1' WHERE cust_id = '$_SESSION[cust_id]'");
	check_sql($query_active);
	
	header('Location: customer.php?cust='.$_SESSION['cust_id']);
}
?>

<div id="content_hidden" style="display:<?PHP echo $visibility; ?>;">
	<form action=customer.php method=post onSubmit="validateSubscr(this)">
		<input type=text name="subscr_date" value="<?PHP echo date('d.m.Y', $timestamp); ?>" placeholder="DD.MM.YYYY" />
		<br/><br/>
		<input type=number name="subscr_receipt" placeholder="Receipt No." min="1"/>
		<br/><br/>
		<input type=checkbox name="subscr_from_sav" value="1" /> deduct from Savings
		<br/><br/>
		<input type=submit name="subscr_renew" value="Renew Subscription" />
	</form>
</div>