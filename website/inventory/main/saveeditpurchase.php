<?php
// configuration
include('../connect.php');

// new data
$id = $_POST['purchase_id'];
$a = $_POST['cost'];
$b = $_POST['qty'];

echo "id: $id, cost: $a, qty: $b";

// query
$sql = "UPDATE purchase SET purchase_cost=?, purchase_qty=? WHERE purchase_id=?";
$q = $db->prepare($sql);
$res = $q->execute(array($a,$b,$id));

/*if ($res) echo "Success";
else echo "Fail";*/

header("location: purchase.php");


?>