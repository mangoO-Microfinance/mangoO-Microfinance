<?PHP
	include 'functions.php';
	check_logon();
	connect();

	//DELETE-Button
	
	if (isset($_POST['del_inc'])){
		$sql_delinc = "DELETE FROM incomes ORDER BY inc_id DESC LIMIT 1";
		$query_delinc = mysql_query($sql_delinc);
		check_sql($query_delinc);
		
		//Refer to income_new.php
		header('Location: income_new.php');
	}
?>