<?
// Connect to Database Server
$db_connect = mysql_connect($db_host, $db_user, $db_pass);
if(!$db_connect) die('Could not connect to server '.$db_host.' '.mysql_error());
$db_select = mysql_select_db($db_name);
if(!$db_select) die('Select DB "'.$db_name.'" failed: '.mysql_error());

// Sanitize user input	
require 'salt.php';
$admin_name = sanitize($_POST['admin_name']);
$admin_pass = sha1($salt1.(sanitize($_POST['admin_pass'])).$salt2);
$timestamp = time();

// Insert new admin user into database
$sql_makeadmin = "INSERT INTO user (user_name, user_pw, ugroup_id, user_created) VALUES ('$admin_name', '$admin_pass', '1', '$timestamp')";
$query_makeadmin = mysql_query($sql_makeadmin);
check_sql($query_makeadmin);
?>