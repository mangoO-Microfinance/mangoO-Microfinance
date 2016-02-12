<?PHP
$mngconfig = "
<?PHP
/**
	*	Define Server and Database parameters
	*/
	define ('DB_HOST', '$db_host');
	define ('DB_USER', '$db_user');
	define ('DB_PASS', '$db_pass');
	define ('DB_NAME', '$db_name');
?>";
file_put_contents("mng-config.php", $mngconfig);
?>