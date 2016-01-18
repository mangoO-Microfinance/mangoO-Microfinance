<?PHP
	include 'functions.php';
	check_logon();
	connect();

	//DELETE-Button
	if (isset($_GET['exp_id'])){
		$exp_id = sanitize($_GET['exp_id']);
		$sql_delexp = "DELETE FROM expenditures WHERE exp_id = $exp_id";
		$query_delexp = mysql_query($sql_delexp);
		check_sql($query_delexp);
		
		//Refer to books_expense_new.php
		header('Location: books_expense_new.php');
	}
	
	else{
		echo '<script>alert(\'Entry cannot be deleted!\');</script>';
		header('Location: books_expense_new.php');
	}
?>