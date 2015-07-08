<?PHP
	include 'functions.php';
	check_logon();
	connect();

	//DELETE-Button
	if (isset($_POST['del_exp'])){
		$sql_delexp = "DELETE FROM expenditures ORDER BY exp_id DESC LIMIT 1";
		$query_delexp = mysql_query($sql_delexp);
		check_sql($query_delexp);
		
		//Refer to expendit_new.php
		header('Location: expendit_new.php');
	}
?>