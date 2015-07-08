<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();

	//DELETE-Button
	if (isset($_POST['del_share'])){
		$sql_delsav = "DELETE FROM shares WHERE cust_id = '$_SESSION[cust_id]' ORDER BY share_id DESC LIMIT 1";
		$query_delsav = mysql_query($sql_delsav);
		check_sql($query_delsav);
		
		//Refer to customer.php
		header('Location: acc_share.php?cust='.$_SESSION['cust_id']);
	}
?>