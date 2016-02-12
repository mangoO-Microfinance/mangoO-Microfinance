<?PHP

// Script Configuration
$fileSQL = 'database/mng-empty.sql';
$progressFilename = $fileSQL.'_filepointer'; 	// Temporary file for progress
$errorFilename = $fileSQL.'_error'; 					// Temporary file for errors
$maxRuntime = 30;															// Should be less than script execution time limit
$deadline = time()+ $maxRuntime; 

// Database connection
mysql_connect($db_host, $db_user, $db_pass) OR die('Connecting to host "'.$db_host.'" failed: '.mysql_error());
mysql_select_db($db_name) OR die('Select DB "'.$db_name.'" failed: '.mysql_error());

// Open import file
($fp = fopen($fileSQL, 'r')) OR die('Failed to open file:'.$fileSQL);

// Check for previous errors
if(file_exists($errorFilename) ){
    die('<pre> Previous error encountered: '.file_get_contents($errorFilename));
}

// Activate automatic browser reload
echo '<html>
				<head> 
					<meta http-equiv="refresh" content="'.($maxRuntime+2).'">
					<pre>';

// Go to previous file position
$filePosition = 0;
if(file_exists($progressFilename) ){
	$filePosition = file_get_contents($progressFilename);
  fseek($fp, $filePosition);
}

// Execute SQL commands line by line
$queryCount = 0;
$query = '';
while(time() < $deadline AND ($line = fgets($fp, 1024000))){
    
	// Skipping comment lines
	if(substr($line,0,2)=='--' OR trim($line)=='' ){
    continue;
   }

	$query .= $line;
	if(substr(trim($query),-1)==';' ){
		if(!mysql_query($query) ){
			$error = 'Error performing query <strong>' . $query . ' : ' . mysql_error();
			file_put_contents($errorFilename, $error."\n");
			exit;
		}
		$query = '';
		file_put_contents($progressFilename, ftell($fp)); // Save current file pointer position 
		$queryCount++;
	}
}

// Check if EoF was reached
if(feof($fp) ) echo 'SQL dump successfully restored!';
else{
  echo ftell($fp).'/'.filesize($fileSQL).' '.(round(ftell($fp)/filesize($fileSQL), 2)*100).'%'."\n";
  echo $queryCount.' queries processed! Please wait for automatic browser refresh!';
}
?>