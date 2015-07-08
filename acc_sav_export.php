 <?PHP
	session_start();
	 
  // File name for download
  $filename = $_SESSION['sav_exp_title'].'.xls';

  header("Content-Disposition: attachment; filename=$filename");
  header("Content-Type: application/vnd.ms-excel");

  $firstRow = true;
	
  foreach($_SESSION['sav_export'] as $row_sav) {
		// Display array keys as first row
		if($firstRow) {
      echo implode("\t", array_keys($row_sav)) . "\n";
      $firstRow = false;
    }    
    echo implode("\t", array_values($row_sav)) . "\n";
  }

	unset($_SESSION['sav_exp_title']);
	unset($_SESSION['sav_export']);
  exit;
?>