<?PHP

/**
	* Check for database configuration file.
	* If it exists, proceed to login page.
	* If it doesn't, call the setup page.
	*/
	
	if(file_exists('config/config.php')) header('Location: login.php');
	
	else header('Location: setup.php');

?>