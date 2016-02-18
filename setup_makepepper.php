<?PHP	
$newPepper = "";
$charUniverse = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,.:-_!%&=?";
$numberChar = 10;

for($i = 0; $i < $numberChar; $i++){
	$randInt = mt_rand(0,71);
	$randChar = $charUniverse[$randInt];
	$newPepper = $newPepper.$randChar;
}

$mngpepper = "
<?PHP
/**
	*	Password pepper
	*/
	\$pepper = '".$newPepper."';
?>";

// Create new pepper file
file_put_contents("config/pepper.php", $mngpepper);
?>