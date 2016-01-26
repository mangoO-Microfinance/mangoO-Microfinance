 <?PHP
	session_start();
	 
  // File name for download
  $filename = $_SESSION['cust_exp_title'].'.xls';

  header("Content-Disposition: attachment; filename=$filename");
  header("Content-Type: application/vnd.ms-excel");

  $firstRow = true;
	
  foreach($_SESSION['cust_export'] as $row_cust) {
		// Display array keys as first row
		if($firstRow) {
      echo implode("\t", array_keys($row_cust)) . "\n";
      $firstRow = false;
    }    
    echo implode("\t", array_values($row_cust)) . "\n";
  }

	unset($_SESSION['cust_exp_title']);
	unset($_SESSION['cust_export']);
  exit;
?>