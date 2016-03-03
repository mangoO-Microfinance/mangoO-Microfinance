<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	check_logon();
	connect();
	
	//Check where Re-direct comes from
	if(isset($_GET['from'])){
		$from = sanitize($_GET['from']);
	}
	
	//SKIP-Button
	if (isset($_POST['skip'])) header('Location: employee.php?empl='.$_SESSION['empl_id']);
	
	//UPLOAD-Button
	if (isset($_POST['upload']) AND isset($_FILES['image'])){
		//Settings
		$max_file_size = 1024*2048; // 2048kb
		$valid_exts = array('jpeg', 'jpg', 'png', 'tif', 'tiff');
		//$path ;
		
		//Thumbnail Sizes
		$sizes = array(100 => 130, 146 => 190, 230 => 300);

		//Check for maximum file size
		if( $_FILES['image']['size'] < $max_file_size ){			
			// Get file extension
			$ext = strtolower(pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION));
			
			if (in_array($ext, $valid_exts)) {
				//Resize image
				foreach ($sizes as $width => $height) {
					$files[] = resize_img($width, $height);
				}
				$sql_picpath = "UPDATE employee SET empl_pic = '$files[1]' WHERE empl_id = '$_SESSION[empl_id]'";
				$query_picpath = mysql_query($sql_picpath);
				check_sql($query_picpath);
				
				// Forward to EMPLOYEE.PHP
				header('Location:employee.php?empl='.$_SESSION['empl_id']);
			}
			else $error_msg = 'Unsupported file';
		}
		else $error_msg = 'Please choose an image smaller than 2048kB.';
	}
?>

<html>
	<?PHP include_Head('New Picture Upload',1) ?>
	
	<body>
		<!-- MENU -->
		<?PHP include_Menu(7); ?>
		<div id="menu_main">
			
		</div>
			
		<div class="content_center">
			<p class="heading">Upload Photo for Employee <?PHP echo $_SESSION['empl_id']?></p>
			
			<?php if(isset($error_msg)): ?>
			<p class="alert"><?php echo $error_msg; ?></p>
			<?php endif ?>
			
			<!-- File uploading form -->
			<form action="" method="post" enctype="multipart/form-data">
				
				<label for="image" class="file-upload">
					<i class="fa fa-image"></i> Choose image
				</label>
				<input type="file" name="image" id="image" accept="image/*" />
				<br/>
				<input type="submit" name="upload" value="Upload" />
				<input type="submit" name="skip" value="Skip" />
			</form>
		</div>
	</body>
</html>