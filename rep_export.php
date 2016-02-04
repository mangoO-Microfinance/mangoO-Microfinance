<?PHP
	session_start();
	 
  // File name for download
  $filename = $_SESSION['rep_exp_title'].'.xls';

  header("Content-Disposition: attachment; filename=$filename");
  header("Content-Type: application/vnd.ms-excel");

  $firstRow = true;
	
  foreach($_SESSION['rep_export'] as $row_rep) {
		// Display array keys as first row
		if($firstRow) {
      echo implode("\t", array_keys($row_rep)) . "\n";
      $firstRow = false;
    }    
    echo implode("\t", array_values($row_rep)) . "\n";
  }

	unset($_SESSION['rep_exp_title']);
	unset($_SESSION['rep_export']);
  exit;
?>