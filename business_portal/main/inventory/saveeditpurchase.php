<?php
// configuration
include('../connect.php');

// new data
$id = $_POST['purchase_id'] ?? '';
$a = $_POST['cost'] ?? 0;
$b = $_POST['qty'] ?? 0;
$e = $_POST['qty_add'] ?? 0;
$f = $_POST['product_id'] ?? '';
// query
$sql = "UPDATE purchase SET purchase_cost=?, purchase_qty=? WHERE purchase_id=?";
$q = $db->prepare($sql);
$res = $q->execute(array($a, $b, $id));

/*if ($res) echo "Success";
else echo "Fail";*/

// Update qty onhand in products
$sql2 = "UPDATE products SET qty_onhand = qty_onhand+? WHERE product_id = ?";
$q = $db->prepare($sql2);
$res2 = $q->execute(array($e, $f));


header("location: purchase.php");


?>