<?PHP

//Set customer to "inactive" after 18 months of delaying subscription
if ($row_subscrdef['cust_lastsub'] < ($timestamp - 47347200) && $row_subscrdef['cust_active'] == 1){
	$sql_deactivate = "UPDATE customer SET cust_active = '0' WHERE cust_id = '$row_subscrdef[cust_id]'";
	$query_deactiate = mysql_query($sql_deactivate);
	echo "<script>
					alert('The membership for ".$row_subscrdef['cust_name']." (".$row_subscrdef['cust_id'].") has been set to INACTIVE.')
				</script>";
}

?>