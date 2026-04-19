<?php
require_once('auth.php');
$user_id=$_SESSION['SESS_MEMBER_ID'];
$position=$_SESSION['SESS_POSITION'];
$name=$_SESSION['SESS_NAME'];

include('../connect.php');
$v1 = htmlspecialchars($_POST['invoice'] ?? '');
$v2 = strtolower(htmlspecialchars($_POST['ptype'] ?? ''));
if (empty($_POST['cname'])) {
    $v3 = 'NA';
} else {
    $v3 = htmlspecialchars($_POST['cname']);
}

$v4 = (float)($_POST['cust_payment'] ?? 0);

if (empty($_POST['discount'])) {
    $v5 = 0;
} else {
    $v5 = (float)$_POST['discount'];
}
$v6 = htmlspecialchars($_POST['date'] ?? date('Y-m-d'));
$v7 = (float)($_POST['amount'] ?? 0);
$v8 = '0';
$v9 = (int)$user_id; 



$sql = 'INSERT INTO `sales`(`invoice_number`,`sales_payment_method`, `sales_custname`, `sales_cust_payment`, `sales_discount`, `sales_date`, `sales_amount`, `mst`, `user_id`) VALUES (:v1,:v2,:v3,:v4,:v5,:v6,:v7,:v8,:v9)';
$q = $db->prepare($sql);
$res = $q->execute(array(':v1'=>$v1,':v2'=>$v2,':v3'=>$v3,':v4'=>$v4,':v5'=>$v5,':v6'=>$v6,':v7'=>$v7,':v8'=>$v8,':v9'=>$v9));



// Get sales id first

$query2 = 'SELECT * FROM sales WHERE invoice_number = :invoice';
$stmt2 = $db->prepare($query2);
$stmt2->bindParam(':invoice', $v1);
$res2 = $stmt2->execute();
$sales = $stmt2->fetchAll();
$sales_id = $sales[0]['sales_id'];


// Update sales id for line items in sales order table

$query3 = "UPDATE sales_order SET sales_id = :sales_id WHERE invoice = :invoice";
$stmt3 = $db->prepare($query3);
$res3 = $stmt3->execute(array(
   ':sales_id' => $sales_id,
   ':invoice' => $v1
  ));


header("location: preview.php?invoice=$v1");
exit();

?>