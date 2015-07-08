<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	check_admin();
	connect();
?>
<html>
	<?PHP htmlHead('Settings | Log Records',1) ?>
	<body>
		<!-- MENU HEADER & TABS -->
		<?PHP 
		include 'menu_header.php';
		menu_Tabs(6);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="admin_genset.php">General Settings</a>
			<a href="admin_fees.php">Fees</a>
			<a href="admin_user.php">Users</a>
			<a href="admin_ugroup.php">Usergroups</a>
			<a href="admin_logrec.php" id="item_selected">Log Records</a>
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
					<th class="title" colspan="4">Login/Logoff Records</th>
				</tr>
				<tr>
					<th>No.</th>		
					<th>Logon Time</th>					
					<th>User Name</th>
					<th>Logoff Time</th> 
				</tr>
				<?PHP
				$sql_logrec = "SELECT * FROM logrec, user WHERE logrec.user_id = user.user_id ORDER BY logrec_id DESC";
				$query_logrec = mysql_query($sql_logrec);
				check_sql($query_logrec);
				
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