<?PHP
$sixtydays = time() - convertDays(60);

// Getting expenses
$sql_exp = "SELECT exp_amount FROM expenses WHERE exp_date > $sixtydays";
$query_exp = mysqli_query($db_link, $sql_exp);
checkSQL($db_link, $query_exp);
$exp_total = 0;
while($row_exp = mysqli_fetch_assoc($query_exp)){
	$exp_total = $exp_total + $row_exp['exp_amount'];
}

// Getting income
$sql_inc = "SELECT inc_amount FROM incomes WHERE inc_date > $sixtydays";
$query_inc = mysqli_query($db_link, $sql_inc);
checkSQL($db_link, $query_inc);
$inc_total = 0;
while($row_inc = mysqli_fetch_assoc($query_inc)){
	$inc_total = $inc_total + $row_inc['inc_amount'];
}

// Convert to percent
$inc_percent = $inc_percent === 0 ? 0 : $inc_total/($inc_total+$exp_total)*100;
$exp_percent = $exp_percent === 0 ? 0 : $exp_total/($inc_total+$exp_total)*100;

// Getting savings
$sql_sav = "SELECT sav_amount FROM savings WHERE sav_date > $sixtydays";
$query_sav = mysqli_query($db_link, $sql_sav);
checkSQL($db_link, $query_sav);
$sav_depos = 0;
$sav_withd = 0;
while($row_sav = mysqli_fetch_assoc($query_sav)){
	if($row_sav['sav_amount'] > 0) $sav_depos = $sav_depos + $row_sav['sav_amount'];
	elseif($row_sav['sav_amount'] < 0) $sav_withd = $sav_withd + ($row_sav['sav_amount'] * -1);
}

// Convert to percent
$sav_depos_percent = $sav_depos_percent === 0 ? 0 : $sav_depos/($sav_depos+$sav_withd)*100;
$sav_withd_percent = $sav_withd_percent === 0 ? 0 : $sav_withd/($sav_depos+$sav_withd)*100;
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

<!-- Income / Expense Ratio -->
<p class="heading_narrow">Deposit / Withdraw Ratio (60 Days)</p>
<div class="bar">
	<p style="width:<?PHP echo $sav_depos_percent; ?>%;"><?PHP echo number_format($sav_depos).' '.$_SESSION['set_cur']; ?></p>
	<p style="width:<?PHP echo $sav_withd_percent; ?>%";><?PHP echo number_format($sav_withd).' '.$_SESSION['set_cur']; ?></p>
</div>
<!-- Key -->
<div class="key">
	<p style="width:50%;">Deposits</p>
	<p style="width:50%;">Withdrawals</p>
</div>
