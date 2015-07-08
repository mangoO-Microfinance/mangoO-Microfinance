<!-- MENU HEADER -->
<div id="menu_header">
	<img src="ico/mangoo_logo_m.png" style="margin: 1em 0 0 .75em;"/>
	<div id="menu_logout">
		<ul>
			<li><?PHP echo $_SESSION['log_user']; ?>
				<ul>
					<!-- 
					<li>Logged on:<?PHP //echo date("H:m",$_SESSION['log_time']); ?></li>
					-->
					<li><a href="logout.php">Logout</a></li>
				</ul>
			</li>
		</ul>
		<?PHP //echo date("H:m",$_SESSION['log_time']); ?>
	</div>
</div>