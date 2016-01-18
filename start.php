<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();
	get_settings();
	get_fees();
?>

<html>
	<!-- HTML HEAD -->
	<?PHP htmlHead('Microfinance Management',1); ?>
	
	<!-- HTML BODY -->
	<body>
		<!-- MENU -->
		<?PHP 
				include_Menu(1);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="cust_search.php">Search Customer</a>
			<a href="cust_new.php">New Customer</a>
			<a href="loan_search.php">Search Loan</a>
		</div>
		
		<!-- Left Side of Dashboard -->
		<div class="content_left" style="width:50%;">
			<?PHP include $_SESSION['set_dashl']; ?>
		</div>

		<!-- Right Side of Dashboard -->
		<div  class="content_right" style="width:50%;">
			<?PHP include $_SESSION['set_dashr']; ?>
		</div>
		
		<!-- Logout Reminder Message -->
		<?PHP
		if ($_SESSION['logrec_logout'] == 0){
			echo '<script>
							alert ("You forgot to logout last time. Please remember to log out properly.")
						</script>';
			$_SESSION['logrec_logout'] = 1;
		}
		?>
		
	</body>
</html>