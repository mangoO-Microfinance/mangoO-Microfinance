<?PHP
	session_start();
	require 'functions.php';
	$db_link = connect();

	//Record logout time for this session
	$logrec_end = time();
	$sql_update_logrec = "UPDATE logrec SET logrec_end = '$logrec_end', logrec_logout = '1' WHERE logrec_id = '$_SESSION[logrec_id]'";
	$query_update_logrec = mysqli_query($db_link, $sql_update_logrec);
	checkSQL($db_link, $query_update_logrec);

	logout();
?>
