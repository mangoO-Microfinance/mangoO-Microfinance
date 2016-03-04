<?PHP
include 'functions.php';
connect();

$timestamp = time();

/**
	* Update SAVINGS table to include savings balances.
	*/
	
	// Get all customers
	$sql_cust = "SELECT cust_id FROM customer WHERE cust_id != 0";
	$query_cust = mysql_query($sql_cust);
	$customers = array();
	while ($row_cust = mysql_fetch_assoc($query_cust)){
		$customers[] =  $row_cust;
	}

	// Get all savings transactions
	$sql_savings = "SELECT * FROM savings ORDER BY sav_date, sav_id";
	$query_savings = mysql_query($sql_savings);
	$savings = array();
	while ($row_savings = mysql_fetch_assoc($query_savings)){
		$savings[] =  $row_savings;
	}

	foreach($customers as $c){
		echo 'Customer: '.$c['cust_id'];
		$sav_balance = 0;
		
		foreach($savings as $s){
			if($s['cust_id'] == $c['cust_id']){
				$sav_balance = $sav_balance + $s['sav_amount'];
				$sav_date = $s['sav_date'];
			}
		}
		
		$sql_savbal = "INSERT INTO savbalance (cust_id, savbal_balance, savbal_date, savbal_created, user_id) VALUES ('$c[cust_id]', '$sav_balance', '$sav_date', '$timestamp', '1')";
		$query_savbal = mysql_query($sql_savbal);
		checkSQL($query_savbal);
		
		echo ' Savings Balance: '.$sav_balance.'<br>';
	}
?>