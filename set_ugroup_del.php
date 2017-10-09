<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionAdmin();
	$db_link = connect();
	if(isset($_GET['ugroup'])) $ugroup_id = sanitize($db_link, $_GET['ugroup']);
	else header('Location:set_ugroup.php');

	//Check dependencies for usergroup and delete
	$sql_depending = "SELECT * FROM user WHERE ugroup_id = $ugroup_id";
	$query_depending = mysqli_query($db_link, $sql_depending);
	$result_depending = mysqli_fetch_array($query_depending);

	if($result_depending){
		header('Location: set_ugroup.php?error=dep');
	}
	else{
		$sql_del = "DELETE FROM ugroup WHERE ugroup_id = $ugroup_id";
		$query_del = mysqli_query($db_link, $sql_del);
		checkSQL($db_link, $query_del);
		header('Location: set_ugroup.php');
	}
?>
