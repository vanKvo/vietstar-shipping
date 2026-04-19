<?php
include('../connect.php');

$a = $_POST['supplier_id'] ?? '';
$b = '3';
$c = date("Y-m-d");
$d = $_POST['Cost_Product'] ?? '';
$e = $_POST['Quantity_Product'] ?? '';
$f = $_POST['Product_id'] ?? '';

// query
$sql = "INSERT INTO `purchase`(`supplier_id`, `user_id`, `purchase_date`, `purchase_cost`, `purchase_qty`, `product_id`) VALUES (:a,:b,:c,:d,:e,:f)";
$q = $db->prepare($sql);
$res = $q->execute(array(':a' => $a, ':b' => $b, ':c' => $c, ':d' => $d, ':e' => $e, ':f' => $f));

// Update qty onhand in products
$sql2 = "UPDATE products SET qty_onhand = qty_onhand+? WHERE product_id = ?";
$q = $db->prepare($sql2);
$res2 = $q->execute(array($e, $f));

header("location: purchase.php");


?>