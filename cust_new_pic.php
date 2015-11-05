<!DOCTYPE HTML>
<?PHP
	include 'functions.php';
	check_logon();
	connect();
	
	//SKIP-Button
	if (isset($_POST['skip'])){
		header('Location: acc_share.php?cust='.$_SESSION['cust_id'].'&rec='.$_SESSION['receipt_no']);
	}
	
	//UPLOAD-Button
	if (isset($_POST['upload']) AND isset($_FILES['image'])){
		// Settings
		$max_file_size = 1024*200; // 200kb
		$valid_exts = array('jpeg', 'jpg', 'png', 'tif', 'tiff');
		
		// Thumbnail Sizes
		$sizes = array(100 => 130, 200 => 260, 300 => 390);

		//Check for maximum file size
		if( $_FILES['image']['size'] < $max_file_size ){			
			// Get file extension
			$ext = strtolower(pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION));
			
			if (in_array($ext, $valid_exts)) {
				/* Resize image */
				foreach ($sizes as $width => $height) {
					$files[] = resize_img($width, $height);
				}
				$sql_picpath = "UPDATE customer SET cust_pic = '$files[1]' WHERE cust_id = '$_SESSION[cust_id]'";
				$query_picpath = mysql_query($sql_picpath);
				check_sql($query_picpath);
				
				header('Location: acc_share.php?cust='.$_SESSION['cust_id'].'&rec='.$_SESSION['receipt_no']);
			}
			else $error_msg = 'Unsupported file';
		}
		else $error_msg = 'Please choose an image smaller than 200kB';
	}
?>

<html>
	<?PHP htmlHead('New Loan',1) ?>
	
	<body>
		<!-- MENU HEADER & TABS -->
		<?PHP 
		include 'menu_header.php';
		menu_Tabs(2);
		?>
		<!-- MENU MAIN -->
		<div id="menu_main">
			<a href="cust_search.php">Search</a>
			<a href="cust_new.php" id="item_selected">New Customer</a>
			<a href="cust_act.php">Active Customers</a>
			<a href="cust_inact.php">Inactive Customers</a>
		</div>
			
		<div class="content_center">
			<p class="heading">Upload Photo for New Customer <?PHP echo $_SESSION['cust_id']?></p>
			
			<?php if(isset($error_msg)): ?>
			<p class="alert"><?php echo $error_msg ?></p>
			<?php endif ?>
			
			<!-- File uploading form -->
			<form action="" method="post" enctype="multipart/form-data">
				<label>
					<span>Choose image</span>
					<input type="file" name="image" accept="image/*" />
				</label>
				<br/><br/>
				<input type="submit" name="upload" value="Upload" />
				<input type="submit" name="skip" value="Skip Upload" />
			</form>
		</div>
	</body>
</html>