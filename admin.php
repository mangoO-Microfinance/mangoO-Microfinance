<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_admin();
	connect();
?>
<html>
	<?PHP htmlHead('Settings',1) ?>
	
	<body>
		<!-- MENU HEADER & TABS -->
		<?PHP 
		include 'menu_header.php';
		menu_Tabs(6);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="admin_logrec.php">Log Records</a>
			<a href="admin_fees.php">Fees</a>
			<a href="admin_user.php">Users</a>
			<a href="admin_ugroup.php">Usergroups</a>
		</div>
	
		<!-- CONTENT: ??? -->
		<div class="content_center">
		</div>
	
</html>