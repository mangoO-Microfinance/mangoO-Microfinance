<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionAdmin();
	$db_link = connect();
?>
<html>
	<?PHP includeHead('Settings | Log Records',1) ?>
	<body>
		<!-- MENU -->
		<?PHP
				includeMenu(6);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="set_basic.php">Basic Settings</a>
			<a href="set_loans.php">Loan Settings</a>
			<a href="set_fees.php">Fees & Charges</a>
			<a href="set_user.php">Users</a>
			<a href="set_ugroup.php">Usergroups</a>
			<a href="set_logrec.php" id="item_selected">Log Records</a>
			<?PHP if (strtoupper(substr(PHP_OS, 0, 5)) === 'LINUX') echo '<a href="set_dbbackup.php">Database Backup</a>' ?>
		</div>

		<!-- CONTENT: Logrec Data -->
		<div class="content_center">

			<table id="tb_table">
				<colgroup>
					<col width="10%">
					<col width="30%">
					<col width="30%">
					<col width="30%">
				</colgroup>
				<tr>
					<th class="title" colspan="4">Login/Logoff Records (Last 500 Entries)</th>
				</tr>
				<tr>
					<th>No.</th>
					<th>Logon Time</th>
					<th>User Name</th>
					<th>Logoff Time</th>
				</tr>
				<?PHP
				$sql_logrec = "SELECT * FROM logrec, user WHERE logrec.user_id = user.user_id ORDER BY logrec_id DESC LIMIT 500";
				$query_logrec = mysqli_query($db_link, $sql_logrec);
				checkSQL($db_link, $query_logrec);
				while ($row_logrec = mysqli_fetch_assoc($query_logrec)){
					echo '<tr>
									<td>'.$row_logrec['logrec_id'].'</td>
									<td>'.date("d.m.Y,  H:i:s", $row_logrec['logrec_start']).'</td>
									<td>'.$row_logrec['user_name'].'</td>';
									if ($row_logrec['logrec_end'] == 0) echo '<td style="color:#a7dbd8; font-weight:bold;"><i>User currently logged on</i></td>';
										else if($row_logrec['logrec_logout'] == 0) echo '<td class="warn">'.date("d.m.Y,  H:i:s", $row_logrec['logrec_end']).'</td>';
										else echo '<td>'.date("d.m.Y,  H:i:s", $row_logrec['logrec_end']).'</td>';
					echo '</tr>';
				}
				?>
			</table>
		</div>
	</body>
</html>
