<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_report();
	connect();
?>
<html>
	<?PHP htmlHead('Reports',1) ?>
	
	<body>
		
		<!-- MENU HEADER & TABS -->
		<?PHP 
		include 'menu_header.php';
		menu_Tabs(5);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="rep_incomes.php">Incomes Report</a>
			<a href="rep_expenditures.php">Expenditures Report</a>
			<a href="rep_loans.php">Loans Report</a>
			<a href="rep_capital.php">Capital Report</a>
		</div>
		
	</body>
	
</html>