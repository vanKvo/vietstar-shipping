<?php
	include('../connect.php');
	$sales_order_id=$_GET['sales_order_id'] ?? '';
	$invoice=$_GET['invoice'] ?? '';
	$qty_picked =$_GET['qty_picked'] ?? 0;
	$product_id=$_GET['product_id'] ?? '';
	$pmt_method=$_GET['pmt_method'] ?? '';
	
	//$sdsd=$_GET['dle'];
	//$c=$_GET['invoice'];
	//$qty=$_GET['qty'];
	//$wapak=$_GET['code'];
	//edit qty
	
	$sql = "UPDATE products 
			SET qty_onhand=qty_onhand+?
			WHERE product_id=?";
	$q = $db->prepare($sql);
	$q->execute(array($qty_picked,$product_id));

	$result = $db->prepare("DELETE FROM sales_order WHERE sales_order_id = :sales_order_id");
	$result->bindParam(':sales_order_id', $sales_order_id);
	$res = $result->execute();

	header("location: sales.php?pmt_method=$pmt_method&invoice=$invoice");
?>