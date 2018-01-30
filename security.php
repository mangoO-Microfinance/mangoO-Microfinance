<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	$db_link = connect();

	//Generate timestamp
	$timestamp = time();

		//UPDATE-Button
	if (isset($_POST['update'])){

		//Sanitize user input
		$sec_name = sanitize($db_link, $_POST['sec_name']);
		$sec_returned = sanitize($db_link, $_POST['sec_returned']);
		//$sec_returned_date = strtotime(sanitize($db_link, $_POST['sec_out']));
		//if($sec_out == NULL) $sec_out = "NULL";

		//Update SECURITY
		$sql_update = "UPDATE securities SET sec_name = '$sec_name', sec_returned = '$sec_returned', sec_lastupd = $timestamp, user_id = $_SESSION[log_id] WHERE sec_id = $_SESSION[sec_id]";
		$query_update = mysqli_query($db_link, $sql_update);
		checkSQL($db_link, $query_update);

		//Forward to this page
		header('Location: security.php?security='.$_SESSION['sec_id']);
	}

	// Get sec_ID
	if(isset($_GET['security'])) $_SESSION['sec_id'] = sanitize($db_link, $_GET['security']);
	else header('Location:loans_securities.php');

	//Select security from SECURITIES
	$result_sec = getSecurity($db_link, $_SESSION['sec_id']);
?>

<html>
	<?PHP includeHead('Security',0) ?>
		<script>
			function validate(form){
				fail = validateName(form.sec_name.value)
				if (fail == "") return true
				else { alert(fail); return false }
			}
		</script>
		<script src="functions_validate.js"></script>
	</head>

	<body>
		<!-- MENU -->
		<?PHP includeMenu(3);	?>
		<div id="menu_main">
			<a href="loans_search.php">Search</a>
			<a href="loans_act.php">Active Loans</a>
			<a href="loans_pend.php">Pending Loans</a>
			<a href="loans_securities.php" id="item_selected">Loan Securities</a>
		</div>

		<div class="content_center">
			<!-- HEADING -->
			<p class="heading" style="margin-bottom:.3em;">
				<?PHP echo $result_sec['sec_name'].' ('.$result_sec['cust_name'].')'; ?>
			</p>

			<?PHP
			if (isset($result_sec['sec_path']))
				echo '<a href="'.$result_sec['sec_path'].'" target=_blank><img src="'.$result_sec['sec_path'].'" title="" style="max-width:350px; max-height:175px;"></a>';
			?>

			<form action="security.php" method="post" onSubmit="return validate(this)">

				<table id ="tb_fields" style="border-spacing:0.1em 1.25em;">
					<colgroup>
						<col width="10%"/>
						<col width="40%"/>
						<col width="10%"/>
						<col width="40%"/>
					</colgroup>
					<?PHP
						echo '<tr>
										<td>Description:</td>
										<td><input type="text" name="sec_name" value="'.$result_sec['sec_name'].'" tabindex=2 /></td>
										<td>Customer:</td>
										<td><a href="customer.php?cust='.$result_sec['cust_id'].'" style="color:black;">'.$result_sec['cust_name'].' ('.$result_sec['cust_no'].')</a></td>
									</tr>
									<tr>
										<td>Loan No:</td>
										<td><a href="loan.php?lid='.$result_sec['loan_id'].'">'.$result_sec['loan_no'].'</a></td>
										<td>Security No:</td>
										<td>'.$result_sec['sec_no'].'</td>
									</tr>
									<tr>
										<td>Date:</td>
										<td>'.date("d.m.Y",$result_sec['sec_date']).'</td>
										<td>Returned:</td>
										<td><input type="checkbox" name="sec_returned" value="1" tabindex="12"';
										if ($result_sec['sec_returned']==1) echo ' checked="checked"';
										echo ' />
									</tr>
									<tr>
										<td colspan="4" class="center">
											<input type="submit" name="update" value="Save Changes" tabindex=13 />
											<a href="loans_securities.php">
   											<input type="button" value="Back" />
											</a>
										</td>
									</tr>';
					?>
				</table>
			</form>
		</div>
	</body>
</html>
