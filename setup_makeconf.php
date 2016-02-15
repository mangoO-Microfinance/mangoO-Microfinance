<?PHP
session_start();

$mngconfig = "
<?PHP
/**
	*	Define Server and Database parameters
	*/
	define ('DB_HOST', '$_SESSION[db_host]');
	define ('DB_USER', '$_SESSION[db_user]');
	define ('DB_PASS', '$_SESSION[db_pass]');
	define ('DB_NAME', '$_SESSION[db_name]');
?>";

// Create new mangoO config file
file_put_contents("config/config.php", $mngconfig);

// Forward to login page
session_destroy();
header ('Location:login.php');
?>