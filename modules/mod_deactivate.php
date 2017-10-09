<?PHP

//Calculating grace period before deactivation in months
$timestamp = time();
$graceperiod = convertDays(365) + convertMonths($_SESSION['set_deact']);

//Set customer to "inactive" after grace period for subscription payment expired
if ($row_subscrdef['cust_lastsub'] < ($timestamp - $graceperiod) && $row_subscrdef['cust_active'] == 1){
	$sql_deactivate = "UPDATE customer SET cust_active = '0' WHERE cust_id = '$row_subscrdef[cust_id]'";
	$query_deactiate = mysqli_query($db_link, $sql_deactivate);
	checkSQL($db_link, $query_deactiate);
	showMessage('The membership for '.$row_subscrdef['cust_name'].' ('.$row_subscrdef['cust_id'].') has been set to INACTIVE.');
}

?>
