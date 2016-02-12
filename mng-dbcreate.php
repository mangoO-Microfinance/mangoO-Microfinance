<?php
	// Connect to Database Server
	$db_connect = mysql_connect($db_host, $db_user, $db_pass);
	if(!$db_connect) die('Could not connect to server '.$db_host.' '.mysql_error());

	// Create new Database
	$sql_createDB = 'CREATE DATABASE IF NOT EXISTS '.$db_name;
	$query_createDB = mysql_query($sql_createDB);
	if(!$query_createDB) die('Could not create database "'.$db_name.'" '.mysql_error());
?>