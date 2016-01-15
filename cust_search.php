<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();
?>

<html>
	<!-- HTML HEAD -->
	<?PHP htmlHead('Customer Search',1); ?>
	
	<body>
		<!-- MENU -->
		<?PHP 
				menu_Tabs(2);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="cust_search.php" id="item_selected">Search</a>
			<a href="cust_new.php">New Customer</a>
			<a href="cust_act.php">Active Customers</a>
			<a href="cust_inact.php">Inactive Customers</a>
		</div>
					
		<!-- CONTENT: Customer Search -->
		<div class="content_center">
	
			<form action="customer.php" method="get">
				<p class="heading_narrow">Search Customer by Number</p>
				<input type="text" name="cust" placeholder="Number" />
				<input type="submit" value="Search" />
			</form>
			
			<form action="cust_result.php" method="post" style="margin-top:4.5em;">
				<p class="heading_narrow">Search Customer by Name</p>
				<input type="text" name="cust_search" placeholder="Name or name part"/>
				<input type="submit" value="Search" />
			</form>
		</div>
	</body>
</html>