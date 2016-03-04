<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	checkPermissionAdmin();
	connect();
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
				$query_logrec = mysql_query($sql_logrec);
				checkSQL($query_logrec);
				
				$color=1;
				while ($row_logrec = mysql_fetch_assoc($query_logrec)){					
					tr_colored($color);	//Alternating row colors
					echo '<td>'.$row_logrec['logrec_id'].'</td>';
					echo '<td>'.date("d.m.Y,  H:i:s", $row_logrec['logrec_start']).'</td>';
					echo '<td>'.$row_logrec['user_name'].'</td>';
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