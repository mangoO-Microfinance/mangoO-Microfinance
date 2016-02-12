<?PHP

/**
	* Check for database configuration file.
	* If it exists, proceed to login page.
	* If it doesn't, call the setup page.
	*/
	
	if(file_exists('mng-config.php')) header('Location: mng-login.php');
	
	else header('Location: mng-setup.php');

?>