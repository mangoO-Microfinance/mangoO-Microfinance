<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();	
	connect();
	check_custid();
	get_sharevalue();
	$timestamp = time();
	
	//ADD SHARE-Button
	if (isset($_POST['shareadd'])){
		
		//Sanitize user input
		$share_date = strtotime(sanitize($_POST['share_date']));
		$share_receipt = sanitize($_POST['share_receipt']);
		$share_amount = sanitize($_POST['share_amount']);
		$share_value = $_SESSION['share_value'] * $share_amount;
		
		//Insert into SHARES
		$sql_insert_sh = "INSERT INTO shares (cust_id, share_date, share_amount, share_value, share_receipt, share_created, user_id) VALUES ('$_SESSION[cust_id]', '$share_date', '$share_amount', '$share_value', '$share_receipt', $timestamp, '$_SESSION[log_id]')";
		$query_insert_sh = mysql_query($sql_insert_sh);
		check_sql($query_insert_sh);
		header('Location: customer.php?cust='.$_SESSION['cust_id']);
	}

	//TRANSFER-Button
	if (isset($_POST['shtrans'])){
		$shtrans_cust = sanitize($_POST['shtrans_cust']);
		
		$sql_shfrom = "SELECT * FROM shares WHERE cust_id = '$shtrans_cust'";
		$query_shfrom = mysql_query($sql_shfrom);
		check_sql($query_shfrom);
		
		$shfrom_amount = 0;
		$shfrom_value = 0;
		while($row_shfrom = mysql_fetch_assoc($query_shfrom)){
			$shfrom_amount = $shfrom_amount + $row_shfrom['share_amount'];
			$shfrom_value = $shfrom_value + $row_shfrom['share_value'];
		}
		
		//Insert into SHARES for Target Customer
		$sql_shto = "INSERT INTO shares (cust_id, share_date, share_amount, share_value, share_trans, share_transfrom, share_created, user_id) VALUES ('$_SESSION[cust_id]', '$timestamp', '$shfrom_amount', '$shfrom_value', '1', '$shtrans_cust', $timestamp, '$_SESSION[log_id]')";
		$query_shto = mysql_query($sql_shto);
		check_sql($query_shto);
		
		//Empty Share Account for Source Customer
		$shfrom_amount_del = $shfrom_amount * (-1);
		$shfrom_value_del = $shfrom_value * (-1);
		$sql_shdel = "INSERT INTO shares (cust_id, share_date, share_amount, share_value, share_trans, share_created, user_id) VALUES ('$shtrans_cust', '$timestamp', '$shfrom_amount_del', '$shfrom_value_del', '1', $timestamp, '$_SESSION[log_id]')";
		$query_shdel = mysql_query($sql_shdel);
		check_sql($query_shdel);
		
		//Set Source Customer inactive
		$sql_inactive = "UPDATE customer SET cust_active = '0', cust_lastupd = '$timestamp', user_id = '$_SESSION[log_id]' WHERE cust_id = '$shtrans_cust'";
		$query_inactive = mysql_query($sql_inactive);

		header('Location: customer.php?cust='.$_SESSION['cust_id']);
	}
	
	//Select CUSTOMER from database
	$sql_cust = "SELECT * FROM customer, cust_married WHERE customer.cust_married_id = cust_married.cust_married_id AND cust_id = '$_SESSION[cust_id]'";
	$query_cust = mysql_query($sql_cust);
	if (!$query_cust) die ('SELECT failed: '.mysql_error());
	$result_cust = mysql_fetch_assoc($query_cust);
	
	//Select SHARES from database
	$sql_sha = "SELECT * FROM shares, user WHERE shares.user_id = user.user_id AND cust_id = '$_SESSION[cust_id]'";
	$query_sha = mysql_query($sql_sha);
	check_sql($query_sha);
	
	//Select ALL CUSTOMERS from database
	$sql_custall = "SELECT cust_id, cust_name, cust_since FROM customer WHERE cust_id != '$_SESSION[cust_id]'";
	$query_custall = mysql_query($sql_custall);
	check_sql($query_custall);
	
	//Make array for exporting data
	$share_exp_date = date("Y-m-d",time());
	$_SESSION['share_export'] = array();
	$_SESSION['share_exp_title'] = $_SESSION['cust_id'].'_shares_'.$share_exp_date;
?>

<html>
<?PHP htmlHead('Share Addition',0) ?>	
	<script>
		function validate(form){
			fail = validateDate(form.share_date.value)
			fail += validateReceipt(form.share_receipt.value)
			if (fail == "") return true
			else { alert(fail); return false }
		}
		
		function setVisibility(id, visibility) {
			document.getElementById(id).style.display = visibility;
		}
	</script>
	<script src="functions_validate.js"></script>
	<script src="function_randCheck.js"></script>
</head>
	
<body>
	<!-- MENU -->
		<?PHP 
				menu_Tabs(2);
		?>
		
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="customer.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Back</a>
			<a href="cust_search.php">Search</a>
			<a href="acc_sav_depos.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Deposit</a>
			<a href="acc_sav_withd.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Withdrawal</a>
			<a href="acc_share.php?cust=<?PHP echo $_SESSION['cust_id'] ?>" id="item_selected">Add Shares</a>
			<a href="loan_new.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">New Loan</a>
			<a href="cust_new.php">New Customer</a>
			<a href="cust_act.php">Active Cust.</a>
			<a href="cust_inact.php">Inactive Cust.</a>
		</div>
			
		<!-- Left Side: Input for Share Addition -->
		<div class="content_left">
			
			<p class="heading">Add Shares for <?PHP echo $result_cust['cust_name'].' ('.$result_cust['cust_id'].'/'.date("Y",$result_cust['cust_since']).')' ?></p>
		
			<form action="acc_share.php" method="post" onSubmit="return validate(this)">
				
				<table id="tb_fields">
					<tr>
						<td>Date:</td>
						<td>
							<input type="text" name="share_date" <?PHP echo 'value="'.date("d.m.Y", $timestamp).'"' ?> />
						</td>
					</tr>
					<tr>
						<td>Receipt No:</td>
						<td>
							<input type="number" name="share_receipt" class="defaultnumber" <?PHP if(isset($_GET['rec'])) echo 'value="'.$_GET['rec'].'"' ?> />
						</td>
					</tr>
					<tr>
						<td>Number of Shares:</td>
						<td>
							<select name="share_amount" class="defaultfield">
								<option value="1">1 @ <?PHP echo number_format($_SESSION['share_value']).' '.$_SESSION['set_cur']; ?></option>
								<option value="2">2 @ <?PHP echo number_format($_SESSION['share_value']*2).' '.$_SESSION['set_cur']; ?></option>
								<option value="3">3 @ <?PHP echo number_format($_SESSION['share_value']*3).' '.$_SESSION['set_cur']; ?></option>
								<option value="4">4 @ <?PHP echo number_format($_SESSION['share_value']*4).' '.$_SESSION['set_cur']; ?></option>
								<option value="5">5 @ <?PHP echo number_format($_SESSION['share_value']*5).' '.$_SESSION['set_cur']; ?></option>
								<option value="6">6 @ <?PHP echo number_format($_SESSION['share_value']*6).' '.$_SESSION['set_cur']; ?></option>
								<option value="7">7 @ <?PHP echo number_format($_SESSION['share_value']*7).' '.$_SESSION['set_cur']; ?></option>
								<option value="8">8 @ <?PHP echo number_format($_SESSION['share_value']*8).' '.$_SESSION['set_cur']; ?></option>
								<option value="9">9 @ <?PHP echo number_format($_SESSION['share_value']*9).' '.$_SESSION['set_cur']; ?></option>
								<option value="10">10 @ <?PHP echo number_format($_SESSION['share_value']*10).' '.$_SESSION['set_cur']; ?></option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="center" colspan="2">
							<input type="submit" name="shareadd" value="Add Shares" />
							<input type="button" name="sh_transfer" value="Transfer" onclick="setVisibility('content_hidden', 'block');" />
						</td>
					</tr>
				</table>
			</form>
			
			<!-- HIDDEN SECTION: Transfer Shares from other Customer -->
			<div id="content_hidden">
				<form name="share_transfer" action="acc_share.php" method="post">
					<p>Transfer all Shares from</p>
					<br/>
					<select name="shtrans_cust">
						<?PHP
						while ($row_custall = mysql_fetch_assoc($query_custall)){
							echo '<option value="'.$row_custall['cust_id'].'">'.$row_custall['cust_id'].' '.$row_custall['cust_name'].'</option>';
						}
						?>
					</select>
					<br/><br/>
					<p>to this Customer.</p>
					<br/>
					<input type="submit" name="shtrans" value="Transfer Shares" />
				</form>
			</div>
		</div>
		
		<!-- RIGHT SIDE: Share Account Details -->			
		<div class="content_right">
			
			<table id="tb_table">
				<colgroup>
					<col width="20%">
					<col width="20	%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<tr>								
					<form class="export" action="acc_share_export.php" method="post">
						<th class="title" colspan="6">Share Account
						<!-- Export Button -->
						<input type="submit" name="export_rep" value="Export" />
						</th>
					</form>
				</tr>
				<tr>
					<th>Date</th>
					<th>Amount of Shares</th>
					<th>Value of Shares</th>
					<th>Receipt No.</th>
					<th>Authorized by</th>
					<th>Delete</th>
				</tr>
				<?PHP
				$amount_balance = 0;
				$value_balance = 0;
				$color = 0;
				while($row_sha = mysql_fetch_assoc($query_sha)){
					tr_colored($color);
					echo '<td>'.date("d.m.Y",$row_sha['share_date']).'</td>
								<td>'.$row_sha['share_amount'].'</td>
								<td>'.number_format($row_sha['share_value']).' '.$_SESSION['set_cur'].'</td>
								<td>'.$row_sha['share_receipt'].'</td>
								<td>'.$row_sha['user_name'].'</td>
								<td><a href="acc_share_del.php?sha_id='.$row_sha['share_id'].'" onClick="return randCheck()"><img src="ico/delete.png" /></a></td>
							</tr>';
					$amount_balance = $amount_balance + $row_sha['share_amount'];
					$value_balance = $value_balance + $row_sha['share_value'];
					
					//Prepare data for export to Excel file
					array_push($_SESSION['share_export'], array("Date" => date("d.m.Y",$row_sha['share_date']), "Amount of Shares" => $row_sha['share_amount'], "Share Value" => $row_sha['share_value'], "Receipt" => $row_sha['share_receipt']));
				}
				echo '<tr class="balance">
								<td>Balance:</td>
								<td>'.$amount_balance.'</td>
								<td>'.number_format($value_balance).' '.$_SESSION['set_cur'].'</td>
								<td colspan="3"></td>
							</tr>';
				?>
			</table>
		</div>
	</body>
</html>