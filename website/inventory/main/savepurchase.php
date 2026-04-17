<?php
session_start();
include('../connect.php');
echo "quantity purchase";
$a = $_POST['supplier_id'];
echo "supplier_id";
$b = '1';
$c = '2022-02-03';
$d = $_POST['Cost_Product'];
$e = $_POST['Quantity_Product'];
$f = $_POST['Product_id'];

// query

$sql = "INSERT INTO `purchase`(`supplier_id`, `user_id`, `purchase_date`, `purchase_cost`, `purchase_qty`, `product_id`) VALUES (:a,:b,:c,:d,:e,:f)";
$q = $db->prepare($sql);
$res = $q->execute(array(':a'=>$a,':b'=>$b,':c'=>$c,':d'=>$d,':e'=>$e,':f'=>$f));

if ($res) echo "Success";
else echo "Fail";

header("location: purchase.php");


?>