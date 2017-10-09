<!DOCTYPE HTML>
<?PHP
	require 'functions.php';
	require 'function_pic.php';
	checkLogin();
	$db_link = connect();

	//SKIP-Button
	if (isset($_POST['skip'])) header('Location: employee.php?empl='.$_SESSION['empl_id']);

	//UPLOAD-Button
	if (isset($_POST['upload']) AND isset($_FILES['image'])){
		//Settings
		$max_file_size = 1024*2048; // 2048kb
		$valid_exts = array('jpeg', 'jpg', 'png', 'tif', 'tiff');
		$path = 'uploads/photos/employees/empl'.$_SESSION['empl_id'].'_';

		//Thumbnail Sizes
		$sizes = array(100 => 130, 146 => 190, 230 => 300);

		//Check for maximum file size
		if( $_FILES['image']['size'] < $max_file_size ){
			// Get file extension
			$ext = strtolower(pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION));

			if (in_array($ext, $valid_exts)) {
				//Resize image
				foreach ($sizes as $width => $height) {
					$files[] = resizeImage($width, $height, $path);
				}
				$sql_picpath = "UPDATE employee SET empl_pic = '$files[1]' WHERE empl_id = '$_SESSION[empl_id]'";
				$query_picpath = mysqli_query($db_link, $sql_picpath);
				checkSQL($db_link, $query_picpath);

				// Forward to EMPLOYEE.PHP
				header('Location:employee.php?empl='.$_SESSION['empl_id']);
			}
			else $error_msg = 'Unsupported file';
		}
		else $error_msg = 'Please choose an image smaller than 2048kB.';
	}

	// Get employee details
	$result_empl = getEmployee($db_link, $_SESSION['empl_id']);
?>

<html>
	<?PHP includeHead('New Picture Upload',1) ?>

	<body>
		<!-- MENU -->
		<?PHP includeMenu(7); ?>
		<div id="menu_main">
			<!-- <a href="empl_search.php">Search</a> -->
			<a href="empl_new.php" id="item_selected">New Employee</a>
			<a href="empl_curr.php">Current Employees</a>
			<a href="empl_past.php">Former Employees</a>
		</div>

		<div class="content_center">
			<p class="heading">Upload Photo for <?PHP echo $result_empl['empl_name'].' ('.$result_empl['empl_no'].')'; ?></p>

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
