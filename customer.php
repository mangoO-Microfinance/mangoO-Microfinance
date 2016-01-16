<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();
	check_custid();
	$timestamp = time();
	unset($_SESSION['interest_sum'], $_SESSION['balance']);
	
	//UPDATE-Button
	if (isset($_POST['update'])){
				
		//Sanitize user input
		$cust_name = sanitize($_POST['cust_name']);
		$cust_dob = strtotime(sanitize($_POST['cust_dob']));
		$cust_sex = sanitize($_POST['cust_sex']);
		$cust_address = sanitize($_POST['cust_address']);
		$cust_phone = sanitize($_POST['cust_phone']);
		$cust_email = sanitize($_POST['cust_email']);
		$cust_occup = sanitize($_POST['cust_occup']);
		$cust_married_id = sanitize($_POST['cust_married_id']);
		$cust_heir = sanitize($_POST['cust_heir']);
		$cust_heirrel = sanitize($_POST['cust_heirrel']);
		if ($cust_lengthres == 0 OR $cust_lengthres == NULL) $cust_lengthres = NULL;
		$cust_sick = sanitize($_POST['cust_sick']);
		$cust_active = sanitize($_POST['cust_active']);
		$timestamp = time();
		
		//Update CUSTOMER
		$sql_update = "UPDATE customer SET cust_name = '$cust_name', cust_dob = '$cust_dob', cust_sex = '$cust_sex', cust_address = '$cust_address', cust_phone = '$cust_phone', cust_email = '$cust_email', cust_occup = '$cust_occup', cust_married_id = '$cust_married_id', cust_heir = '$cust_heir', cust_heirrel = '$cust_heirrel', cust_sick = '$cust_sick', cust_active = '$cust_active', cust_lastupd = '$timestamp', user_id = '$_SESSION[log_id]' WHERE cust_id = '$_SESSION[cust_id]'";
		$query_update = mysql_query($sql_update);
		if (!$query_update) die ('UPDATE failed: '.mysql_error());
		header('Location: customer.php?cust='.$_SESSION['cust_id']);
	}
	
	//Select Customer from CUSTOMER
	$sql_cust = "SELECT * FROM customer, cust_married, user WHERE customer.cust_married_id = cust_married.cust_married_id AND customer.user_id = user.user_id AND cust_id = '$_SESSION[cust_id]'";
	$query_cust = mysql_query($sql_cust);
	check_sql($query_cust);
	$result_cust = mysql_fetch_assoc($query_cust);
	
	//Error-Message, if customer is not found
	if ($result_cust['cust_id']==''){
		echo '<script>
						alert(\'Customer not found in database.\');
						window.location = "cust_search.php";
					</script>';
	}
	
	//Select Marital Status from CUST_MARRIED for dropdown-menu
	$sql_mstat = "SELECT * FROM cust_married";
	$query_mstat = mysql_query($sql_mstat);

	//Select Shares from SHARES
	$sql_sha = "SELECT * FROM shares WHERE cust_id = '$_SESSION[cust_id]'";
	$query_sha = mysql_query($sql_sha);
	check_sql($query_sha);
	
	$share_amount = 0;
	$share_value = 0;
	while($row_shares = mysql_fetch_assoc($query_sha)){
		$share_amount = $share_amount + $row_shares['share_amount'];
		$share_value = $share_value + $row_shares['share_value'];
	}
	
	//Select Savings from SAVINGS
	$sql_sav = "SELECT * FROM savings, savtype WHERE savings.savtype_id = savtype.savtype_id AND cust_id = '$_SESSION[cust_id]' ORDER BY sav_date, sav_id";
	$query_sav = mysql_query($sql_sav);
	check_sql($query_sav);
	
	$balance = 0;		//Calculate Balance on Savings account
	while($row_query_sav = mysql_fetch_assoc($query_sav)){
		$row_sav[] = $row_query_sav;
		$balance = $balance + ($row_query_sav['sav_amount']);
	}
	
	if (isset($row_sav)) $row_sav = array_slice($row_sav, -5, 5);	//Take last five items from array only
?>

<html>
	<?PHP htmlHead('Customer',0) ?>		
		<script>
			function validate(form){
				fail = validateName(form.cust_name.value)
				fail += validateDob(form.cust_dob.value)
				fail += validateAddress(form.cust_address.value)
				fail += validatePhone(form.cust_phone.value)
				fail += validateEmail(form.cust_email.value)
				if (fail == "") return true
				else { alert(fail); return false }
			}
			
			function validateSubscr(form){
				fail = validateDate(form.subscr_date.value)
				fail += validateReceipt(form.subscr_receipt.value)
				//fail += validateOverdraft(0,0,0)
				if (fail == "") return true
				else { alert(fail); return false }
			}
			
			function setVisibility(id, visibility) {
				document.getElementById(id).style.display = visibility;
			}
		</script>
		<script src="functions_validate.js"></script>
	</head>
	
	<body>
		<!-- MENU -->
		<?PHP 
				menu_Tabs(2);
		?>
		
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="cust_search.php">Search</a>
			<?PHP
			if ($result_cust['cust_active'] == 1) echo '
				<a href="acc_sav_depos.php?cust='.$_SESSION['cust_id'].'">Deposit</a>
				<a href="acc_sav_withd.php?cust='.$_SESSION['cust_id'].'">Withdrawal</a>
				<a href="acc_share.php?cust='.$_SESSION['cust_id'].'">Add Shares</a>
				<a href="loan_new.php?cust='.$_SESSION['cust_id'].'">New Loan</a>';
			?>
			<a href="cust_new.php">New Customer</a>
			<a href="cust_act.php">Active Cust.</a>
			<a href="cust_inact.php">Inactive Cust.</a>
		</div>

		<!-- HEADING -->	
		<p class="heading">
			<?PHP	
			echo $result_cust['cust_name'].' ('.$result_cust['cust_id'].'/'.date("Y", $result_cust['cust_since']).')'; 
			if (isset($result_cust['cust_pic'])) echo '<a href="'.$result_cust['cust_pic'].'" target="popup" onclick="window.open(\''.$result_cust['cust_pic'].'\',\''.$result_cust['cust_name'].'\',\'width=200px,height=260px\')"> <img src="./ico/photo.png"></a>';
			?>
		</p>
		
		<!-- LEFT SIDE: Customer Details -->
		<div class="content_left" style="width:60%;">

			<form action="customer.php" method="post" onSubmit="return validate(this)">
				
				<table id ="tb_fields" style="border-spacing:0.1em 1.25em;">
					<colgroup>
						<col width="9%"/>
						<col width="25%"/>
						<col width="8%"/>
						<col width="25%"/>
						<col width="8%"/>
						<col width="25%"/>
					</colgroup>					
					<?PHP					
						echo '<tr>
										<td>Name:</td>
										<td><input type="text" name="cust_name" value="'.$result_cust['cust_name'].'" tabindex="1" /></td>
										<td>Residence:</td>
										<td><input type="text" name="cust_address" value="'.$result_cust['cust_address'].'" placeholder="Place of Residence" tabindex="6" /></td>
										<td>Sickness:</td>
										<td>
											<select name="cust_sick" class="defaultfield" size="1" tabindex="11">
												<option value="0"';
													if ($result_cust['cust_sick'] == 0) echo ' selected="selected"';
												echo '>None</option>
												<option value="1"';
													if ($result_cust['cust_sick'] == 1) echo ' selected="selected"';
												echo '>Heart Attack</option>
												<option value="2"';
													if ($result_cust['cust_sick'] == 2) echo ' selected="selected"';
												echo '>Stroke</option>
												<option value="3"';
													if ($result_cust['cust_sick'] == 3) echo ' selected="selected"';
												echo '>Cancer</option>
												<option value="4"';
													if ($result_cust['cust_sick'] == 4) echo ' selected="selected"';
												echo '>HIV/AIDS</option>
											</select>
										</td>
									</tr>';
						echo '<tr>
										<td>Gender:</td>
										<td>';
						if ($result_cust['cust_sex'] == 2) {
							echo '<input type="radio" name="cust_sex" value="1" tabindex="2" /> Male
										<input type="radio" name="cust_sex" value="2" checked="checked" /> Fem.
										<input type="radio" name="cust_sex" value="3" /> Inst.';
							}
						elseif ($result_cust['cust_sex'] == 1) {
							echo '<input type="radio" name="cust_sex" value="1" tabindex="2" checked="checked" /> Male
										<input type="radio" name="cust_sex" value="2"> Fem.
										<input type="radio" name="cust_sex" value="3"> Inst.';
							}
						elseif ($result_cust['cust_sex'] == 3) {
							echo '<input type="radio" name="cust_sex" value="1" tabindex="2" /> Male
										<input type="radio" name="cust_sex" value="2" /> Fem.
										<input type="radio" name="cust_sex" value="3" checked="checked" /> Inst.';
							}
						else echo '<input type="radio" name="cust_sex" value="1"> Male
										<input type="radio" name="cust_sex" value="2"> Fem.
										<input type="radio" name="cust_sex" value="3"> Inst.';
						echo		'</td>
										<td>Phone No:</td>
										<td><input type="text" name="cust_phone" value="'.$result_cust['cust_phone'].'" tabindex="7" /></td>
										<td>Member since:</td>
										<td><input type="text" name="cust_since" value="'.date("d.m.Y", $result_cust['cust_since']).'" disabled="disabled" /></td>
									</tr>';
						echo '<tr>
										<td>DoB:</td>
										<td><input type="text" name="cust_dob" value="'.date("d.m.Y",$result_cust['cust_dob']).'" placeholder="DD.MM.YYYY" tabindex="3" /></td>
										<td>E-Mail:</td>
										<td><input type="text" name="cust_email" value="'.$result_cust['cust_email'].'" placeholder="abc@xyz.com" tabindex="8" /></td>';
						if ($_SESSION['fee_subscr'] > 0) echo'
										<td>Subscription paid until:</td>
										<td><input type="text" name="cust_lastsub" value="'.date("d.m.Y",$result_cust['cust_lastsub']+31536000).'" disabled="disabled"/></td>';
						else echo '<td></td><td></td>';
						echo '</tr>
									<tr>
										<td>Marital Status:</td>
										<td><select name="cust_married_id" class="defaultfield" size="1" tabindex="4">';
								while ($row_mstat = mysql_fetch_assoc($query_mstat)){
									if($row_mstat ['cust_married_id'] == $result_cust['cust_married_id']){
										echo '<option selected value="'.$row_mstat['cust_married_id'].'">'.$row_mstat['cust_married_status'].'</option>';
									}
									else echo '<option value="'.$row_mstat['cust_married_id'].'">'.$row_mstat['cust_married_status'].'</option>';
								}
								echo '</select>
										</td>
										<td>Representative:</td>
										<td><input type="text" name="cust_heir" value="'.$result_cust['cust_heir'].'" tabindex="9" /></td>
										<td>Updated<br/>on / by:</td>
										<td><input type="text" disabled="diabled" value="'.date("d.m.Y", $result_cust['cust_lastupd']).' / '.$result_cust['user_name'].'" /></td>
									</tr>';
						echo '<tr>
										<td>Occupation:</td>
										<td><input type="text" name="cust_occup" value="'.$result_cust['cust_occup'].'" tabindex="5"/></td>
										<td>Relation:</td>
										<td><input type="text" name="cust_heirrel" value="'.$result_cust['cust_heirrel'].'" tabindex="10" /></td>
										<td>Active:</td>
										<td><input type="checkbox" name="cust_active" value="1"'; 
										if ($result_cust['cust_active']==1) echo ' checked="checked"';
							echo ' tabindex="12" /></td>
									</tr>';
					?>
				</table>
				<input type="submit" name="update" value="Save Changes" tabindex="13" />
				<!-- 
				<input type="button" name="membership" value="Subscription" onclick="setVisibility('content_hidden', 'block');" /> 
				-->
			</form>
			
			<!-- MIDDLE PART: Renew Subscription -->
			<?PHP if($_SESSION['fee_subscr'] > 0) include 'modules/mod_subscr.php'; ?>
			
		</div>
			
		<!-- RIGHT SIDE: Account Details -->
		<div class="content_right" style="width:40%;">			
		
			<!-- TABLE 1: Savings Account -->	
			<table id="tb_table">
				<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="30%">
					<col width="20%">
				</colgroup>
				<tr>
					<th class="title" colspan="4">
						<?PHP
						if ($result_cust['cust_active'] == 1) echo
						'<a href="acc_sav_depos.php?cust='.$_SESSION['cust_id'].'">Savings Account</a> (Recent Transactions)';
						else echo 'Savings Account (Recent Transactions)';
						?>
					</th>
				</tr>
				<tr>
					<th>Date</th>
					<th>Transaction Type</th>
					<th>Amount</th>
					<th>Receipt/Slip</th>
				</tr>
			 <?PHP
			 	if (isset($row_sav)) {
					foreach ($row_sav as $row_sav){
						tr_colored($color);
						echo '	<td>'.date("d.m.Y",$row_sav['sav_date']).'</td>
										<td>'.$row_sav['savtype_type'].'</td>
										<td>'.number_format($row_sav['sav_amount']).' '.$_SESSION['set_cur'].'</td>';
						if ($row_sav['savtype_id'] == 2) echo '<td>S '.$row_sav['sav_slip'].'</td>';
							else echo '<td>R '.$row_sav['sav_receipt'].'</td>';
						echo '</tr>';
					}
				}
				echo '<tr class="balance">
								<td colspan="4" >Balance: '.number_format($balance).' '.$_SESSION['set_cur'].'</td>
							</tr>';
			 ?>
			</table>
			
			<!-- TABLE 2: Loans Account -->	
			<table id="tb_table">
				<colgroup>
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<tr>
					<th class="title" colspan="6">Loans Account</th>
				</tr>
				<tr>
					<th>No.</th>
					<th>Status</th>
					<th>Total Repay</th>
					<th>Remaining</th>
					<th>Rate Due</th>
				</tr>
				<?PHP
				//SQL QUERY FOR LOANS
				$sql_loan = "SELECT * FROM loans, loanstatus WHERE loans.loanstatus_id = loanstatus.loanstatus_id AND cust_id = '$_SESSION[cust_id]'";
				$query_loan = mysql_query($sql_loan);
				if (!$query_loan) die('SELECT failed: ' . mysql_error());
				
				$color = 0;
				while ($row_loan = mysql_fetch_assoc($query_loan)){
					
					//Select last unpaid Due Date from LTRANS 
					$sql_ltrans = "SELECT MIN(ltrans_due) FROM ltrans, loans WHERE ltrans.loan_id = loans.loan_id AND loans.loanstatus_id = '2' AND loans.loan_id = '$row_loan[loan_id]' AND ltrans_due IS NOT NULL AND ltrans_date IS NULL";
					$query_ltrans = mysql_query($sql_ltrans);
					check_sql($query_ltrans);
					$next_due = mysql_fetch_assoc($query_ltrans);
					
					//Select Loan Balance from LTRANS
					$sql_balance = "SELECT ltrans_principaldue, ltrans_interestdue, ltrans_principal, ltrans_interest FROM ltrans, loans WHERE ltrans.loan_id = loans.loan_id AND loans.loanstatus_id = '2' AND loans.loan_id = '$row_loan[loan_id]'";
					$query_balance = mysql_query($sql_balance);
					check_sql($query_balance);
					
					$loan_balance = 0;
					$loan_paid = 0;
					while ($row_balance = mysql_fetch_assoc($query_balance)){
						$loan_paid = $loan_paid + $row_balance['ltrans_principal'] + $row_balance['ltrans_interest'];
						$loan_balance = $loan_balance + $row_balance['ltrans_interestdue'] + $row_balance['ltrans_principaldue'];
					}
					$loan_balance = $loan_balance - $loan_paid;
					
					tr_colored($color);
					echo '	<td><a href="loan.php?lid='.$row_loan['loan_id'].'">'.$row_loan['loan_no'].'</a></td>
									<td>'.$row_loan['loanstatus_status'].'</td>
									<td>'.number_format($row_loan['loan_repaytotal']).'</td>
									<td>'.number_format($loan_balance).'</td>';
					if ($row_loan['loanstatus_id'] == 2 and isset($next_due)) {
						echo '<td';
						if ($next_due['MIN(ltrans_due)'] < time()) echo ' class="warn"';
						if ($next_due['MIN(ltrans_due)'] != null) echo '>'.date("d.m.Y",$next_due['MIN(ltrans_due)']).'</td>';
						else echo '></td>';
					}
					else echo '<td></td>';
					echo '</tr>';
					}
				?>
			</table>
			
			
		<!-- TABLE 3: Share Account -->	
		<table id="tb_table">
			<tr>
				<th class="title" colspan="2">
					<?PHP
						if ($result_cust['cust_active'] == 1) echo
						'<a href="acc_share.php?cust='.$_SESSION['cust_id'].'">Share Account</a>';
						else echo 'Share Account';
						?>
				</th>
			</tr>
			<tr>
				<th>Number of Shares</th>
				<th>Value of Shares</th>
			</tr>
			<tr>
				<td><?PHP echo $share_amount ?></td>
				<td><?PHP echo number_format($share_value).' '.$_SESSION['set_cur'] ?></td>
			</tr>
		</table>
	
	</div>
	
	</body>
	<?PHP 
	if ($share_amount == 0 && $result_cust['cust_active'] == 1) {
		echo '<script language=javascript>alert(\'This Customer owns no Shares!\')</script>';
	}
	?>
</html>