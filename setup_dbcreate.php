<?php
	// Connect to Database Server
	$db_connect = mysql_connect($_SESSION['db_host'], $_SESSION['db_user'], $_SESSION['db_pass']);
	if(!$db_connect) die('Could not connect to host '.$_SESSION['db_host'].': '.mysql_error());

	// Create new Database
	$sql_createDB = 'CREATE DATABASE IF NOT EXISTS '.$_SESSION['db_name'];
	$query_createDB = mysql_query($sql_createDB);
	if(!$query_createDB) die('Could not create database "'.$_SESSION['db_name'].'" '.mysql_error());
?>