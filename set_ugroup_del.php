<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionAdmin();
	connect();
	if(isset($_GET['ugroup'])) $ugroup_id = sanitize($_GET['ugroup']);
	else header('Location:set_ugroup.php');
	
	//Check dependencies for usergroup and delete
	$sql_depending = "SELECT * FROM user WHERE ugroup_id = $ugroup_id";
	$query_depending = mysql_query($sql_depending);
	$result_depending = mysql_fetch_array($query_depending);
	
	if($result_depending){
		header('Location: set_ugroup.php?error=dep');
	}
	else{
		$sql_del = "DELETE FROM ugroup WHERE ugroup_id = $ugroup_id";
		$query_del = mysql_query($sql_del);
		checkSQL($query_del);
		header('Location: set_ugroup.php');
	}
?>