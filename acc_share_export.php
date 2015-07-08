 <?PHP
	session_start();
	 
  // File name for download
  $filename = $_SESSION['share_exp_title'].'.xls';

  header("Content-Disposition: attachment; filename=$filename");
  header("Content-Type: application/vnd.ms-excel");

  $firstRow = true;
	
  foreach($_SESSION['share_export'] as $row_share) {
		// Display array keys as first row
		if($firstRow) {
      echo implode("\t", array_keys($row_share)) . "\n";
      $firstRow = false;
    }    
    echo implode("\t", array_values($row_share)) . "\n";
  }

	unset($_SESSION['share_exp_title']);
	unset($_SESSION['share_export']);
  exit;
?>