<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	$db_link = connect();
	getLoanID($db_link);


	//Retrieve loan_id and loan_no of newly created loan from LOANS.
	$sql_loan = "SELECT loan_id, loan_no FROM loans WHERE loan_id = '$_SESSION[loan_id]'";
	$query_loan = mysqli_query($db_link, $sql_loan);
	checkSQL($db_link, $query_loan);
	$result_loan = mysqli_fetch_assoc($query_loan);

	// Select Securities from SECURITIES
	$securities = getLoanSecurities($db_link, $_SESSION['loan_id']);
	foreach ($securities as $s){
		if ($s['sec_no'] == 1) $security1 = $s;
		elseif ($s['sec_no'] == 2) $security2 = $s;
	}

	// Generate timestamp
	$timestamp = time();

	//SKIP-Button
	if (isset($_POST['skip'])){
		header('Location: loan.php?lid='.$_SESSION['loan_id']);
	}

	//UPLOAD-Button
	if (isset($_POST['upload'])){

		$target_path = "uploads/securities/";

		//Check if a file was uploaded for security 1
		if ($_FILES['sec1']['size'] != 0){

			//Determine where file 1 is going to be stored and create file name
			$path_part1 = pathinfo($_FILES['sec1']['name']);
			$extension1 = $path_part1['extension'];
			$file_name1 = $security1['loan_id'].'_01';

			//Add original filename 1 to target path 1
			$target_path1 = $target_path.$file_name1.'.'.$extension1;

			//Move uploaded file 1 from temporary storage to final location
			move_uploaded_file($_FILES['sec1']['tmp_name'], $target_path1);

			//UPDATE file path for security 1 in SECURITIES
			$sql_update_sec1_path = "UPDATE securities SET sec_path = '$target_path1' WHERE sec_id = '$security1[sec_id]'";
			$query_update_sec1_path = mysqli_query($db_link, $sql_update_sec1_path);
			checkSQL($db_link, $query_update_sec1_path);

		}

		//Check if a file was uploaded for security 2
		if ($_FILES['sec2']['size'] != 0){

			//Determine where file 2 is going to be stored and create file name
			$path_part2 = pathinfo($_FILES['sec2']['name']);
			$extension2 = $path_part2['extension'];
			$file_name2 = $security2['loan_id'].'_02';

			//Add original filename to target path 2
			$target_path2 = $target_path.$file_name2.'.'.$extension2;

			//Move uploaded file 2 from temporary storage to final location
			move_uploaded_file($_FILES['sec2']['tmp_name'], $target_path2);

			//UPDATE file path for security 2 in SECURITIES
			$sql_update_sec2_path = "UPDATE securities SET sec_path = '$target_path2' WHERE sec_id = '$security2[sec_id]'";
			$query_update_sec2_path = mysqli_query($db_link, $sql_update_sec2_path);
			checkSQL($db_link, $query_update_sec2_path);
		}

		//Unset session variables and refer to LOAN.PHP
		header('Location: loan.php?lid='.$_SESSION['loan_id']);
	}
?>

<html>
	<?PHP includeHead('New Loan',1) ?>
	<body>
		<!-- MENU -->
		<?PHP includeMenu(2); ?>
		<div id="menu_main">
			<a href="customer.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Back</a>
			<a href="cust_search.php">Search</a>
			<a href="acc_sav_depos.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Deposit</a>
			<a href="acc_sav_withd.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Withdrawal</a>
			<a href="acc_share_buy.php?cust=<?PHP echo $_SESSION['cust_id'] ?>">Share Buy</a>
			<a href="loan_new.php?cust=<?PHP echo $_SESSION['cust_id'] ?>" id="item_selected">New Loan</a>
			<a href="cust_new.php">New Customer</a>
			<a href="cust_act.php">Active Cust.</a>
			<a href="cust_inact.php">Inactive Cust.</a>
		</div>

		<div class="content_center">
			<p class="heading">Upload Documents for Loan <?PHP echo $result_loan['loan_no']; ?></p>

			<form enctype="multipart/form-data" action="loan_sec.php" method="POST">
				<input type="hidden" name="MAX_FILE_SIZE" value="1000000" />
				<?PHP
				if (isset($security1) AND $security1['sec_name'] != ""){
					echo '<label for="sec1" class="file-upload">
									<i class="fa fa-file-text-o"></i> '.$security1['sec_name'].'
								</label>
								<input type="file" name="sec1" id="sec1" accept=".pdf,.jpg,.jpeg,.png,.tif,.tiff,.doc,.docx,.xls,.xlsx,.odt,.ods,.txt" />
								<br/>';
				}
				if (isset($security2) AND $security2['sec_name'] != ""){
					echo '<label for="sec2" class="file-upload">
									<i class="fa fa-file-text-o"></i> '.$security2['sec_name'].'
								</label>
								<input type="file" name="sec2" id="sec2" accept=".pdf,.jpg,.jpeg,.png,.tif,.tiff,.doc,.docx,.xls,.xlsx,.odt,.ods,.txt" />
								<br/>';
				}
				?>
				<input type="submit" name="upload" value="Upload" />
				<input type="submit" name="skip" value="Skip" />
			</form>
		</div>
	</body>
</html>
