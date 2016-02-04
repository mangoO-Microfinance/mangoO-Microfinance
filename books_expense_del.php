<?PHP
	require 'functions.php';
	check_logon();
	check_delete();
	connect();

	//DELETE-Button
	if (isset($_GET['exp_id'])){
		$exp_id = sanitize($_GET['exp_id']);
		$sql_delexp = "DELETE FROM expenses WHERE exp_id = $exp_id";
		$query_delexp = mysql_query($sql_delexp);
		check_sql($query_delexp);
	}
	
	//Refer to books_expense.php
	header('Location: books_expense.php');
?>