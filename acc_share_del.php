<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionDelete();
	connect();

	//Delete from SHARES
	if (isset($_GET['sha_id'])){
		$sha_id = sanitize($_GET['sha_id']);
		
		$sql_delsav = "DELETE FROM shares WHERE share_id = $sha_id";
		$query_delsav = mysql_query($sql_delsav);
		checkSQL($query_delsav);
	}
	
	//Refer to customer.php
	header('Location: acc_share_buy.php?cust='.$_SESSION['cust_id']);
?>