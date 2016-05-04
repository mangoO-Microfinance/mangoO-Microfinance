<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	checkLogin();
	connect();
	getLoanID();
	
	//Retrieve loan_id and loan_no of newly created loan from LOANS. Pass securities to SESSION variable.
	$sql_loan = "SELECT loan_id, loan_no, loan_sec1, loan_sec2 FROM loans WHERE loan_id = '$_SESSION[loan_id]'";
	$query_loan = mysql_query($sql_loan);
	checkSQL($query_loan);
	$result_loan = mysql_fetch_assoc($query_loan);
	
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
			$file_name1 = $result_loan['loan_id'].'_sec-01';
					
			//Add original filename 1 to target path 1 
			$target_path1 = $target_path.$file_name1.'.'.$extension1;
			
			//Move uploaded file 1 from temporary storage to final location
			move_uploaded_file($_FILES['sec1']['tmp_name'], $target_path1);
					
			//INSERT information on Security 1 into SECURITIES
			$sql_insert_sec1 = "INSERT INTO securities (cust_id, loan_id, sec_no, sec_path, sec_returned) VALUES ('$_SESSION[cust_id]', '$_SESSION[loan_id]', 1, '$target_path1', 0)";
			$query_insert_sec1 = mysql_query($sql_insert_sec1);
			checkSQL($query_insert_sec1);
		}
		
		//Check if a file was uploaded for security 2
		if ($_FILES['sec2']['size'] != 0){
			
			//Determine where file 2 is going to be stored and create file name
			$path_part2 = pathinfo($_FILES['sec2']['name']);
			$extension2 = $path_part2['extension'];
			$file_name2 = $result_loan['loan_id'].'_sec-02';
				
			//Add original filename to target path 2
			$target_path2 = $target_path.$file_name2.'.'.$extension2;
					
			//Move uploaded file 2 from temporary storage to final location
			move_uploaded_file($_FILES['sec2']['tmp_name'], $target_path2);
				
			//INSERT information on Security 2 into SECURITIES
			$sql_insert_sec2 = "INSERT INTO securities (cust_id, loan_id, sec_no, sec_path, sec_returned) VALUES ('$_SESSION[cust_id]', '$_SESSION[loan_id]', 2, '$target_path2', 0)";
			$query_insert_sec2 = mysql_query($sql_insert_sec2);
			checkSQL($query_insert_sec2);
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
			<p class="heading">Upload Document Scans for Loan <?PHP echo $result_loan['loan_no']; ?></p>
			
			<form enctype="multipart/form-data" action="loan_sec.php" method="POST">
				<input type="hidden" name="MAX_FILE_SIZE" value="1000000" />				
				<label for="sec1" class="file-upload">
					<i class="fa fa-file-text-o"></i> <?PHP echo $result_loan['loan_sec1']; ?>
				</label>
				<input type="file" name="sec1" id="sec1" accept=".pdf,.jpg,.jpeg,.png,.tif,.tiff,.doc,.docx,.xls,.xlsx,.odt,.ods,.txt" />
				<br/>
				<?PHP 
				if ($result_loan['loan_sec2'] != ""){
					echo '<label for="sec2" class="file-upload">
									<i class="fa fa-file-text-o"></i> '.$result_loan['loan_sec2'].'
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