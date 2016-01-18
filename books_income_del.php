<?PHP
	include 'functions.php';
	check_logon();
	connect();
	
	//Delete Entry from INCOMES
	if (isset($_GET['inc_id'])){
		$inc_id = sanitize($_GET['inc_id']);
		$sql_delinc = "DELETE FROM incomes WHERE inc_id = $inc_id";
		$query_delinc = mysql_query($sql_delinc);
		check_sql($query_delinc);
		
		//Refer to books_income_new.php
		header('Location: books_income_new.php');
	}
	else{
		echo '<script>alert(\'Entry cannot be deleted!\');</script>';
		header('Location: books_income_new.php');
	}
?>