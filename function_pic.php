<?PHP

/**
	* Resizing uploaded image files
	* @param int width : Target width dimension
	* @param int height : Target height dimension
	* @return string path : Storage path for newly created image file
	*/
	function resizeImage($width, $height, $path){
		
		// Get original image dimensions
		list($w, $h) = getimagesize($_FILES['image']['tmp_name']);
		
		// Calculate new image size with ratio
		$ratio = max($width/$w, $height/$h);
		$h = ceil($height / $ratio);
		$x = ($w - $width / $ratio) / 2;
		$w = ceil($width / $ratio);
		
		// New file name
		$basename = strtolower(pathinfo($_FILES['image']['name'], PATHINFO_FILENAME));
		$path = $path.$width.'x'.$height.'.jpg';
		//$path = 'uploads/photos/cust'.$_SESSION['cust_id'].'_'.$width.'x'.$height.'.jpg';
		
		// Read binary data from image file
		$imgString = file_get_contents($_FILES['image']['tmp_name']);
		
		// Create image from string
		$image = imagecreatefromstring($imgString);
		$tmp_img = imagecreatetruecolor($width, $height);
		imagecopyresampled(
			$tmp_img, $image,
			0, 0,
			$x, 0,
			$width, $height,
			$w, $h);
		imagejpeg($tmp_img, $path, 95);
		
		return $path;
		
		// Cleanup memory
		imagedestroy($image);
		imagedestroy($tmp_img);
	}
	
?>