<?php
include('../connect.php');
ini_set('display_errors', 1);
error_reporting(E_ALL);

if (isset($_POST['update'])) {
    $recipient_id = $_GET['recipient_id'] ?? '';
    $customer_id = $_GET['customer_id'] ?? '';
    $recipient_name = $_POST['name'] ?? '';
    $recipient_address = $_POST['address'] ?? '';
    $recipient_email = $_POST['email'] ?? '';
    $recipient_phone = $_POST['phone'] ?? '';

    $query = "update recipient set recipient_name=:recipient_name, recipient_address=:recipient_address, recipient_email=:recipient_email, recipient_phone=:recipient_phone where recipient_id=:recipient_id";
    $stmt = $db->prepare($query);
    $result = $stmt->execute(array(
        ':recipient_name' => $recipient_name,
        ':recipient_address' => $recipient_address,
        ':recipient_email' => $recipient_email,
        ':recipient_phone' => $recipient_phone,
        ':recipient_id' => $recipient_id
    ));

    if ($result) {
        header("location:recipient.php?recipient_id=$recipient_id&customer_id=$customer_id");
    } else {
        header("location:reedit.php?recipient_id=$recipient_id&customer_id=$customer_id&error=query");
    }
} else {
    header("location:customer.php");
}


?>