<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	$db_link = connect();
	getCustID($db_link);

	unset($_SESSION['interest_sum'], $_SESSION['balance']);

	//Generate timestamp
	$timestamp = time();

	//Calculate Balance on Savings account
	$sav_balance = getSavingsBalance($db_link, $_SESSION['cust_id']);
	$sav_fixed = getSavingsFixed($db_link, $_SESSION['cust_id']);

	//UPDATE-Button
	if (isset($_POST['update'])){

		//Sanitize user input
		$cust_no = sanitize($db_link, $_POST['cust_no']);
		$cust_name = sanitize($db_link, $_POST['cust_name']);
		$cust_dob = strtotime(sanitize($db_link, $_POST['cust_dob']));
		$custsex_id = sanitize($db_link, $_POST['custsex_id']);
		$cust_address = sanitize($db_link, $_POST['cust_address']);
		$cust_phone = sanitize($db_link, $_POST['cust_phone']);
		$cust_email = sanitize($db_link, $_POST['cust_email']);
		$cust_occup = sanitize($db_link, $_POST['cust_occup']);
		$custmarried_id = sanitize($db_link, $_POST['custmarried_id']);
		$cust_heir = sanitize($db_link, $_POST['cust_heir']);
		$cust_heirrel = sanitize($db_link, $_POST['cust_heirrel']);
		if ($cust_lengthres == 0 OR $cust_lengthres == NULL) $cust_lengthres = NULL;
		$custsick_id = sanitize($db_link, $_POST['custsick_id']);
		$cust_active = sanitize($db_link, $_POST['cust_active']);
		$timestamp = time();

		//Update CUSTOMER
		$sql_update = "UPDATE customer SET cust_no = '$cust_no', cust_name = '$cust_name', cust_dob = $cust_dob, custsex_id = $custsex_id, cust_address = '$cust_address', cust_phone = '$cust_phone', cust_email = '$cust_email', cust_occup = '$cust_occup', custmarried_id = $custmarried_id, cust_heir = '$cust_heir', cust_heirrel = '$cust_heirrel', custsick_id = $custsick_id, cust_active = '$cust_active', cust_lastupd = $timestamp, user_id = $_SESSION[log_id] WHERE cust_id = $_SESSION[cust_id]";
		$query_update = mysqli_query($db_link, $sql_update);
		checkSQL($db_link, $query_update);
		header('Location: customer.php?cust='.$_SESSION['cust_id']);
	}

	//Get current customer's details
	$result_cust = getCustomer($db_link, $_SESSION['cust_id']);

	//Error-Message, if customer is not found
	if ($result_cust['cust_id']==''){
		echo '<script>
						alert(\'Customer not found in database.\');
						window.location = "cust_search.php";
					</script>';
	}

	//Select Marital Status from custmarried for dropdown-menu
	$sql_mstat = "SELECT * FROM custmarried";
	$query_mstat = mysqli_query($db_link, $sql_mstat);
	checkSQL($db_link, $query_mstat);

	//Select Sicknesses from custsick for dropdown-menu
	$sql_sick = "SELECT * FROM custsick";
	$query_sick = mysqli_query($db_link, $sql_sick);
	checkSQL($db_link, $query_sick);

	//Select Sexes from custsex for dropdown-menu
	$sql_sex = "SELECT * FROM custsex";
	$query_sex = mysqli_query($db_link, $sql_sex);
	checkSQL($db_link, $query_sex);

	//Select Shares from SHARES
	$sql_sha = "SELECT * FROM shares WHERE cust_id = '$_SESSION[cust_id]'";
	$query_sha = mysqli_query($db_link, $sql_sha);
	checkSQL($db_link, $query_sha);
	$share_amount = 0;
	$share_value = 0;
	while($row_shares = mysqli_fetch_assoc($query_sha)){
		$share_amount = $share_amount + $row_shares['share_amount'];
		$share_value = $share_value + $row_shares['share_value'];
	}

	//Select the five most recent savings transactions for display
	$sql_sav = "SELECT * FROM savings, savtype WHERE savings.savtype_id = savtype.savtype_id AND cust_id = '$_SESSION[cust_id]' ORDER BY sav_date DESC, sav_id DESC LIMIT 5" ;
	$query_sav = mysqli_query($db_link, $sql_sav);
	checkSQL($db_link, $query_sav);
?>

<html>
	<?PHP includeHead('Customer',0) ?>
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
				if (document.getElementById('subscr_from_sav').checked){
					fail += validateOverdraft(<?PHP echo $_SESSION['fee_subscr']; ?>, <?PHP echo $sav_balance; ?>, 0, <?PHP echo $_SESSION['set_msb']; ?>, <?PHP echo $sav_fixed; ?>)}
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
		<?PHP includeMenu(2); ?>
		<div id="menu_main">
			<a href="cust_search.php">Search</a>
			<?PHP
			if ($result_cust['cust_active'] == 1) echo '
				<a href="acc_sav_depos.php?cust='.$_SESSION['cust_id'].'">Deposit</a>
				<a href="acc_sav_withd.php?cust='.$_SESSION['cust_id'].'">Withdrawal</a>
				<a href="acc_share_buy.php?cust='.$_SESSION['cust_id'].'">Share Buy</a>
				<a href="acc_share_sale.php?cust='.$_SESSION['cust_id'].'">Share Sale</a>';
			if ($result_cust['cust_active'] == 1 AND ($timestamp-$result_cust['cust_since']) > convertMonths($_SESSION['set_minmemb'])) echo '
				<a href="loan_new.php?cust='.$_SESSION['cust_id'].'">New Loan</a>';
			?>
			<a href="cust_new.php">New Customer</a>
			<a href="cust_act.php">Active Cust.</a>
			<a href="cust_inact.php">Inactive Cust.</a>
		</div>

		<!-- LEFT SIDE: Customer Details -->
		<div class="content_left" style="width:60%;">

			<!-- HEADING -->
			<p class="heading" style="margin-bottom:.3em;">
				<?PHP echo $result_cust['cust_name'].' ('.$result_cust['cust_no'].')'; ?>
			</p>

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
										<td rowspan="4" colspan="2" style="text-align:center; vertical-align:top;">
										<a href="cust_new_pic.php?from=customer">';
						if (isset($result_cust['cust_pic']))
							echo '<img src="'.$result_cust['cust_pic'].'" title="Customer\'s picture">';
						else {
								if ($result_cust['custsex_id'] == 2) echo '<img src="ico/custpic_f.png" title="Upload new picture" />';
								else echo '<img src="ico/custpic_m.png" title="Upload new picture" />';
						}
						echo '	</a>
										</td>
										<td>Cust No:</td>
										<td><input type="text" name="cust_no" value="'.$result_cust['cust_no'].'" tabindex="1" /></td>
										<td>Occupation:</td>
										<td><input type="text" name="cust_occup" value="'.$result_cust['cust_occup'].'" tabindex="8"/></td>
									</tr>';
						echo '<tr>
										<td>Name:</td>
										<td><input type="text" name="cust_name" value="'.$result_cust['cust_name'].'" tabindex="2" /></td>
										<td>Marital Status:</td>
										<td>
											<select name="custmarried_id" size="1" tabindex="9">';
								while ($row_mstat = mysqli_fetch_assoc($query_mstat)){
									if($row_mstat ['custmarried_id'] == $result_cust['custmarried_id']){
										echo '<option selected value="'.$row_mstat['custmarried_id'].'">'.$row_mstat['custmarried_status'].'</option>';
									}
									else echo '<option value="'.$row_mstat['custmarried_id'].'">'.$row_mstat['custmarried_status'].'</option>';
								}
								echo '	</select>
										</td>
									</tr>
									<tr>
										<td>Gender:</td>
										<td>
											<select name="custsex_id" size="1" tabindex="3">';
								while ($row_sex = mysqli_fetch_assoc($query_sex)){
									if($row_sex ['custsex_id'] == $result_cust['custsex_id']){
										echo '<option selected value="'.$row_sex['custsex_id'].'">'.$row_sex['custsex_name'].'</option>';
									}
									else echo '<option value="'.$row_sex['custsex_id'].'">'.$row_sex['custsex_name'].'</option>';
								}
								echo '</select>
										</td>
										<td>Representative:</td>
										<td><input type="text" name="cust_heir" value="'.$result_cust['cust_heir'].'" tabindex="10" /></td>
									</tr>
									<tr>
										<td>DoB:</td>
										<td><input type="text" id="datepicker" name="cust_dob" value="'.date("d.m.Y",$result_cust['cust_dob']).'" placeholder="DD.MM.YYYY" tabindex="4" /></td>
										<td>Relation:</td>
										<td><input type="text" name="cust_heirrel" value="'.$result_cust['cust_heirrel'].'" tabindex="11" /></td>
									</tr>
									<tr>';
									if ($_SESSION['fee_subscr'] > 0) echo '
										<td>Subscrip. expires:</td>
										<td><input type="text" name="cust_lastsub" value="'.date("d.m.Y",$result_cust['cust_lastsub']+31536000).'" disabled="disabled"/></td>';
									else echo '<td></td><td></td>';
							echo '<td>Address:</td>
										<td><input type="text" name="cust_address" value="'.$result_cust['cust_address'].'" placeholder="Place of Residence" tabindex="5" /></td>
										<td>Sickness:</td>
										<td>
											<select name="custsick_id" size="1" tabindex="12">';
												while ($row_sick = mysqli_fetch_assoc($query_sick)){
													if($row_sick['custsick_id'] == $result_cust['custsick_id']){
														echo '<option selected value="'.$row_sick['custsick_id'].'">'.$row_sick['custsick_name'].'</option>';
													}
													else echo '<option value="'.$row_sick['custsick_id'].'">'.$row_sick['custsick_name'].'</option>';
												}
								echo '</select>
										</td>
									</tr>';
						echo '<tr>
										<td>Member since:</td>
										<td><input type="text" name="cust_since" value="'.date("d.m.Y", $result_cust['cust_since']).'" disabled="disabled" /></td>
										<td>Phone No:</td>
										<td><input type="text" name="cust_phone" value="'.$result_cust['cust_phone'].'" tabindex="6" /></td>
										<td>Active:</td>
										<td><input type="checkbox" name="cust_active" value="1" tabindex="13"';
										if ($result_cust['cust_active']==1) echo ' checked="checked"';
										echo ' />
										</td>
									</tr>
									<tr>
										<td>Updated<br/>on / by:</td>
										<td><input type="text" disabled="diabled" value="'.date("d.m.Y", $result_cust['cust_lastupd']).' / '.$result_cust['user_name'].'" /></td>
										<td>E-Mail:</td>
										<td><input type="text" name="cust_email" value="'.$result_cust['cust_email'].'" placeholder="abc@xyz.com" tabindex="7" /></td>
										<td></td>
										<td><input type="submit" name="update" value="Save Changes" tabindex="14" /></td>
									</tr>';
					?>
				</table>

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
			 	while($row_sav = mysqli_fetch_assoc($query_sav)) {
					echo '<tr>
									<td>'.date("d.m.Y",$row_sav['sav_date']).'</td>
									<td>'.$row_sav['savtype_type'].'</td>
									<td>'.number_format($row_sav['sav_amount']).' '.$_SESSION['set_cur'].'</td>';
					if ($row_sav['savtype_id'] == 2) echo '<td>S '.$row_sav['sav_slip'].'</td>';
						else echo '<td>R '.$row_sav['sav_receipt'].'</td>';
					echo '</tr>';
				}

				echo '<tr class="balance">
								<td colspan="4" >Balance: '.number_format($sav_balance).' '.$_SESSION['set_cur'].'</td>
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
					<th>Loan No.</th>
					<th>Status</th>
					<th>Amount</th>
					<th>Balance</th>
					<th>Next Rate</th>
				</tr>
				<?PHP
				//Select all loans for current customer
				$sql_loans = "SELECT * FROM loans, loanstatus WHERE loans.loanstatus_id = loanstatus.loanstatus_id AND cust_id = '$_SESSION[cust_id]'";
				$query_loans = mysqli_query($db_link, $sql_loans);
				checkSQL($db_link, $query_loans);

				while ($row_loan = mysqli_fetch_assoc($query_loans)){

					//Select last unpaid Due Date from LTRANS
					$sql_ltrans = "SELECT MIN(ltrans_due) FROM ltrans, loans WHERE ltrans.loan_id = loans.loan_id AND loans.loanstatus_id = '2' AND loans.loan_id = '$row_loan[loan_id]' AND ltrans_due IS NOT NULL AND ltrans_date IS NULL";
					$query_ltrans = mysqli_query($db_link, $sql_ltrans);
					checkSQL($db_link, $query_ltrans);
					$next_due = mysqli_fetch_assoc($query_ltrans);

					// Get loan balances
					$loan_balances = getLoanBalance($db_link, $row_loan['loan_id']);

					echo '<tr>
									<td><a href="loan.php?lid='.$row_loan['loan_id'].'">'.$row_loan['loan_no'].'</a></td>
									<td>'.$row_loan['loanstatus_status'].'</td>';
					if ($row_loan['loan_issued'] == 1) echo '
									<td>'.number_format($loan_balances['pdue']+$loan_balances['idue']).'</td>
									<td>'.number_format($loan_balances['balance']).'</td>';
					else echo '<td>'.number_format($row_loan['loan_principal']).'</td>
										 <td>N/A</td>';
					if ($row_loan['loanstatus_id'] == 2 and isset($next_due)) {
						echo '<td';
						if ($next_due['MIN(ltrans_due)'] < time()) echo ' class="warn"';
						if ($next_due['MIN(ltrans_due)'] != null) echo '>'.date("d.m.Y",$next_due['MIN(ltrans_due)']).'</td>';
						else echo '></td>';
					}
					else echo '<td>N/A</td>';
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
					'<a href="acc_share_buy.php?cust='.$_SESSION['cust_id'].'">Share Account</a>';
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
	if ($share_amount == 0 && $result_cust['cust_active'] == 1)	showMessage('This Customer owns no Shares!');
	?>
</html>
