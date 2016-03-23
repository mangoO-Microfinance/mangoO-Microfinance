<?PHP
$sixtydays = time() - convertDays(60);

// Getting expenses
$sql_exp = "SELECT exp_amount FROM expenses WHERE exp_date > $sixtydays";
$query_exp = mysql_query($sql_exp);
checkSQL($query_exp);
$exp_total = 0;
while($row_exp = mysql_fetch_assoc($query_exp)){
	$exp_total = $exp_total + $row_exp['exp_amount'];
}

// Getting income
$sql_inc = "SELECT inc_amount FROM incomes WHERE inc_date > $sixtydays";
$query_inc = mysql_query($sql_inc);
checkSQL($query_inc);
$inc_total = 0;
while($row_inc = mysql_fetch_assoc($query_inc)){
	$inc_total = $inc_total + $row_inc['inc_amount'];
}

// Converting to percent
$inc_percent = $inc_total/($inc_total+$exp_total)*100;
$exp_percent = $exp_total/($inc_total+$exp_total)*100;

?>

<!-- Income / Expense Ratio -->
<p class="heading_narrow">Income / Expense Ratio (60 Days)</p>
<div class="bar">
	<p style="width:<?PHP echo $inc_percent; ?>%;"><?PHP echo number_format($inc_total).' '.$_SESSION['set_cur']; ?></p>
	<p style="width:<?PHP echo $exp_percent; ?>%";><?PHP echo number_format($exp_total).' '.$_SESSION['set_cur']; ?></p>
</div>

<!-- Key -->
<div class="key">
	<p style="width:50%;">Income</p>
	<p style="width:50%;">Expenses</p>
</div>