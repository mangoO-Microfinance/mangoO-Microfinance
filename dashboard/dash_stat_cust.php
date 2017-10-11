<?PHP
// Select all customers
$query_customers = getCustAll($db_link);

// Fill array
$customers = array();
while ($row_customers = mysqli_fetch_assoc($query_customers)) {
    $customers[] = $row_customers;
}

// Count total number of customers
$cust_total = count($customers);

// Count customers
$cust_act = 0;
$cust_inact = 0;

$cust_male = 0;
$cust_female = 0;
$cust_other = 0;

$timestamp = time();
$length1 = convertMonths(12);
$length2 = convertMonths(60);
$length3 = convertMonths(120);
$cust_length1 = 0;
$cust_length2 = 0;
$cust_length3 = 0;
$cust_length4 = 0;

foreach ($customers as $c) {

    // Count active customers
    if ($c['cust_active'] == 1) {
        $cust_act++;

        // Count gender
        if ($c['custsex_id'] == 1) $cust_male++;
        elseif ($c['custsex_id'] == 2) $cust_female++;
        else $cust_other++;

        // Count length of membership
        if ($timestamp - $c['cust_since'] <= $length1) $cust_length1++;
        elseif ($timestamp - $c['cust_since'] <= $length2) $cust_length2++;
        elseif ($timestamp - $c['cust_since'] <= $length3) $cust_length3++;
        else $cust_length4++;
    } // Count inactive customers
    else $cust_inact++;
}

// Convert to percentage
$cust_male = $cust_male === 0 ? 0 : round(($cust_male / $cust_act) * 100, 1);
$cust_female = $cust_female === 0 ? 0 : round(($cust_female / $cust_act) * 100, 1);
$cust_other = $cust_other === 0 ? 0 : round(($cust_other / $cust_act) * 100, 1);

$cust_length1 = $cust_length1 === 0 ? 0 : round(($cust_length1 / $cust_act) * 100, 0);
$cust_length2 = $cust_length2 === 0 ? 0 : round(($cust_length2 / $cust_act) * 100, 0);
$cust_length3 = $cust_length3 === 0 ? 0 : round(($cust_length3 / $cust_act) * 100, 0);
$cust_length4 = $cust_length4 === 0 ? 0 : ceil(($cust_length4 / $cust_act) * 100);

$cust_act = round(($cust_act / $cust_total) * 100, 1);
$cust_inact = round(($cust_inact / $cust_total) * 100, 1);
?>

<p class="heading_narrow">Customers' Status</p>
<div class="bar">
    <p style="width:<?PHP echo $cust_act; ?>%;"><?PHP echo $cust_act; ?>%</p>
    <p style="width:<?PHP echo $cust_inact; ?>%;"><?PHP echo $cust_inact; ?>%</p>
</div>
<!-- Key -->
<div class="key">
    <p style="width:50%;">Active</p>
    <p style="width:50%;">Inactive</p>
</div>

<p class="heading_narrow">Customers' Gender</p>
<div class="bar">
    <p style="width:<?PHP echo $cust_male; ?>%;"><?PHP echo $cust_male; ?>%</p>
    <p style="width:<?PHP echo $cust_female; ?>%;"><?PHP echo $cust_female; ?>%</p>
    <p style="width:<?PHP echo $cust_other; ?>%;"><?PHP echo $cust_other; ?>%</p>
</div>
<!-- Key -->
<div class="key">
    <p style="width:33.5%;">Male</p>
    <p style="width:33.5%;">Female</p>
    <p style="width:33%;">Other</p>
</div>

<p class="heading_narrow">Customers' Length of Membership</p>
<div class="bar">
    <p style="width:<?PHP echo $cust_length1; ?>%;"><?PHP echo $cust_length1; ?>%</p>
    <p style="width:<?PHP echo $cust_length2; ?>%;"><?PHP echo $cust_length2; ?>%</p>
    <p style="width:<?PHP echo $cust_length3; ?>%;"><?PHP echo $cust_length3; ?>%</p>
    <p style="width:<?PHP echo $cust_length4; ?>%;"><?PHP echo $cust_length4; ?>%</p>
</div>
<!-- Key -->
<div class="key">
    <p style="width:25%;">< 1 year</p>
    <p style="width:25%;">1-5 years</p>
    <p style="width:25%;">5-10 years</p>
    <p style="width:25%;">> 10 years</p>
</div>
