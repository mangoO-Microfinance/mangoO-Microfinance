<!DOCTYPE HTML>
<?PHP
	require_once 'functions.php';
	
	if(isset($_POST['dbSetup'])){
		
		// Sanitize user input
		$db_host = sanitize($_POST['db_host']);
		$db_user = sanitize($_POST['db_user']);
		$db_pass = sanitize($_POST['db_pass']);
		$db_name = sanitize($_POST['db_name']);
				
		// Create Database
		require "mng-dbcreate.php";
		
		// Import tables into database
		require "mng-dbimport.php";
		
		// Create configuration file
		require "mng-makeconf.php";	
			
		// Create administrator user
		require "mng-makeadmin.php";

		// Forward to login page
		header ('Location: mng-login.php');
	}
?>

<html>
	<?PHP include_Head('Microfinance Management', 0) ?>	
		<style>
			div.setup{
				width:30%;
				margin-top:4em;
				margin-left:auto;
				margin-right:auto;
				padding:2em; 4em;
				background-color: #a7dbd8;
				border-radius: 6px;
				box-shadow: 5px 5px 5px #bbb;
			}
			div.setup:hover{
				background-color:#69d2e7;
			}
			div.setup input{
				margin-bottom:2em;
				margin-left:auto;
				margin-right:auto;
				display:block;
			}
			div.setup input:last-child{
				margin-bottom:.5em;
			}
			div.setup p{
				color:#fff;
				font-size:18px;
				font-weight:bold;
				text-align:center;
				margin-bottom:1.5em;
			}
		</style>
		<script>
			function nextSetup(){
				var div1 = document.getElementById('div1');
				var div2 = document.getElementById('div2');
				div1.style.display = 'none';
				div2.style.display = 'block';
			}
		
			function validate(form){
				fail = validatePw(form.admin_pass.value, form.admin_pass_conf.value)
				if (fail == "") return true
				else { alert(fail); return false }
			}
		</script>
		<script src="functions_validate.js"></script>
	</head>
	<body>
		<div class="content_center">
			<img src="ico/mangoo_l.png" style="width:380px; margin-top:3em; margin-bottom:2em;"/>
			<p class="heading">mangoO Setup Assistant</p>
			
			<div class="setup" id="div1" style="display:block;">
				<p>Database Setup</p>
				<form action="mng-setup.php" method="post" onsubmit="return validate(this)">
					<input type="text" name="db_host" placeholder="Database Host" required="required" />
					<input type="text" name="db_user" placeholder="Database User" required="required" />					
					<input type="text" name="db_pass" placeholder="Database Password" />
					<input type="text" name="db_name" placeholder="Database Name" required="required" />
					<input type="button" onclick="nextSetup();" value="Continue"/>
			</div>
		
			<div class="setup" id="div2" style="display:none;">
					<p>Admin Account Setup</p>
					<input type="text" name="admin_name" placeholder="Admin Name" required="required" />
					<input type="password" name="admin_pass" placeholder="Admin Password" required="required" />
					<input type="password" name="admin_pass_conf" placeholder="Repeat Admin Password" required="required" />
					<input type="submit" name="dbSetup" value="Setup" />
				</form>
			</div>
		
		</div>
	</body>
</html>