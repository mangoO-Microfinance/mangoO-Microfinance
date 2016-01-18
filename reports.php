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
		
		<!-- MENU -->
		<?PHP 
				menu_Tabs(5);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="rep_incomes.php">Income Report</a>
			<a href="rep_expenditures.php">Expense Report</a>
			<a href="rep_loans.php">Loans Report</a>
			<a href="rep_capital.php">Capital Report</a>
			<a href="rep_monthly.php">Monthly Report</a>
			<a href="rep_annual.php">Annual Report</a>
		</div>
		
	</body>
	
</html>