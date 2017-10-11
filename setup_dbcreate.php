<?php
	// Connect to Database Server
	$db_link = mysqli_connect($_SESSION['db_host'], $_SESSION['db_user'], $_SESSION['db_pass']);
	if(!$db_link) die('Could not connect to host '.$_SESSION['db_host'].': '.mysqli_connect_error());

	// Create new Database
	$sql_createDB = 'CREATE DATABASE IF NOT EXISTS '.$_SESSION['db_name'];
	$query_createDB = mysqli_query($db_link, $sql_createDB);
	if(!$query_createDB) die('Could not create database "'.$_SESSION['db_name'].'" '.mysqli_error($db_link));

	mysqli_close($db_link);
?>
