<?PHP

//Calculating grace period before deactivation in months (seconds for 30.5 days)
$timestamp = time();
$graceperiod = 31536000 + months($_SESSION['set_deact']);

//Set customer to "inactive" after grace period for subscription payment expired
if ($row_subscrdef['cust_lastsub'] < ($timestamp - $graceperiod) && $row_subscrdef['cust_active'] == 1){
	$sql_deactivate = "UPDATE customer SET cust_active = '0' WHERE cust_id = '$row_subscrdef[cust_id]'";
	$query_deactiate = mysql_query($sql_deactivate);
	echo "<script>
					alert('The membership for ".$row_subscrdef['cust_name']." (".$row_subscrdef['cust_id'].") has been set to INACTIVE.')
				</script>";
}

?>