<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();

	//Delete from SHARES
	if (isset($_GET['sha_id'])){
		$sha_id = sanitize($_GET['sha_id']);
		$sql_delsav = "DELETE FROM shares WHERE share_id = $sha_id";
		$query_delsav = mysql_query($sql_delsav);
		check_sql($query_delsav);
		
		//Refer to customer.php
		header('Location: acc_share.php?cust='.$_SESSION['cust_id']);
	}
	
	else header('Location: acc_share.php?cust='.$_SESSION['cust_id']);
?>