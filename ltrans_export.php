 <?PHP
	session_start();
	 
  // File name for download
  $filename = $_SESSION['ltrans_exp_title'].'.xls';

  header("Content-Disposition: attachment; filename=$filename");
  header("Content-Type: application/vnd.ms-excel");

  $firstRow = true;
	
  foreach($_SESSION['ltrans_export'] as $row_ltrans) {
		// Display array keys as first row
		if($firstRow) {
      echo implode("\t", array_keys($row_ltrans))."\n";
      $firstRow = false;
    }    
    echo implode("\t", array_values($row_ltrans))."\n";
  }

	unset($_SESSION['ltrans_exp_title']);
	unset($_SESSION['ltrans_export']);
  exit;
?>