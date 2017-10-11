<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionDelete();
	$db_link = connect();

	//Delete from SHARES
	if (isset($_GET['sha_id'])){
		$sha_id = sanitize($db_link, $_GET['sha_id']);
		
		$sql_delsav = "DELETE FROM shares WHERE share_id = $sha_id";
		$query_delsav = mysqli_query($db_link, $sql_delsav);
		checkSQL($db_link, $query_delsav);
	}
	
	//Refer to customer.php
	header('Location: acc_share_buy.php?cust='.$_SESSION['cust_id']);
?>