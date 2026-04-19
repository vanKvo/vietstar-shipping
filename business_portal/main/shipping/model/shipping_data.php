<?php

/** Customers */
function get_customers()
{
  //echo "Start get_customers() <br>";
  global $db;
  $query = 'SELECT * FROM customer';
  $stmt = $db->prepare($query);
  $stmt->execute();
  $customers = $stmt->fetchAll();
  $stmt->closeCursor();
  //echo "End get_customers() <br>";
  return $customers;
}

function add_customer($v1, $v2, $v3, $v4, $v5, $v6, $v7)
{
  global $db;
  $query = 'INSERT INTO `customer`(`cust_name`, `cust_address`, `cust_city`, `cust_state`, `cust_zipcode`, `cust_email`, `cust_phone`) VALUES (:v1,:v2,:v3,:v4,:v5,:v6,:v7)';
  $stmt = $db->prepare($query);
  $res = $stmt->execute(array(
    ':v1' => $v1,
    ':v2' => $v2,
    ':v3' => $v3,
    ':v4' => $v4,
    ':v5' => $v5,
    ':v6' => $v6,
    ':v7' => $v7
  ));
  $stmt->closeCursor();
}

function get_customer($v1, $v2)
{
  global $db;
  $query = 'SELECT * FROM `customer` WHERE cust_name = :v1 AND cust_phone = :v2';
  $stmt = $db->prepare($query);
  $res = $stmt->execute(array(
    ':v1' => $v1,
    ':v2' => $v2
  ));
  $customer = $stmt->fetchAll();
  $stmt->closeCursor();
  return $customer;
}

function search_customer($search_input)
{
  global $db;
  $phone_number = '';
  $email = '';
  $where_clauses = [];
  $params = [];

  // Clean input
  $search_input = trim($search_input);

  if (valid_phone($search_input)) {
    $phone_number = preg_replace('/[^0-9]/', '', $search_input);
    $where_clauses[] = 'cust_phone = :phone_number';
    $params[':phone_number'] = $phone_number;
  } else if (valid_email($search_input)) {
    $email = strtolower($search_input);
    $where_clauses[] = 'LOWER(cust_email) = :email';
    $params[':email'] = $email;
  } else {
    // If it's not a valid 10-digit phone and not a valid email, try a more generic search
    // to satisfy "make sure that the user can enter either" - maybe they entered a partial email?
    if (strpos($search_input, '@') !== false) {
      $email = strtolower($search_input);
      $where_clauses[] = 'LOWER(cust_email) = :email';
      $params[':email'] = $email;
    } else {
      // Try as numbers if any
      $digits = preg_replace('/[^0-9]/', '', $search_input);
      if (strlen($digits) > 0) {
        $phone_number = $digits;
        $where_clauses[] = 'cust_phone = :phone_number';
        $params[':phone_number'] = $phone_number;
      }
    }
  }

  if (empty($where_clauses)) {
    return array(0, 0);
  }

  $query = 'SELECT * FROM customer c LEFT JOIN recipient r
  ON c.customer_id = r.customer_id
  WHERE ' . implode(' OR ', $where_clauses);

  $stmt = $db->prepare($query);
  $res = $stmt->execute($params);
  $customer = $stmt->fetchAll();
  $count = $stmt->rowCount();
  array_push($customer, $count);
  $stmt->closeCursor();
  return $customer;
}

/** Recipient */
function add_recipient($a, $b, $c, $d, $e)
{
  global $db;
  $query = 'INSERT INTO `recipient`(`recipient_name`, `recipient_address`, `recipient_phone`, `customer_id`, `recipient_email`) VALUES (:a,:b,:c,:d,:e)';
  $stmt = $db->prepare($query);
  $stmt->execute(array(
    ':a' => $a,
    ':b' => $b,
    ':c' => $c,
    ':d' => $d,
    ':e' => $e
  ));
}

function get_recipient($v1, $v2, $v3)
{
  global $db;
  $query = 'SELECT * FROM `recipient` WHERE customer_id = :v1 AND recipient_name = :v2 AND recipient_phone = :v3';
  $stmt = $db->prepare($query);
  $stmt->execute(array(
    ':v1' => $v1,
    ':v2' => $v2,
    ':v3' => $v3
  ));
  $recipient = $stmt->fetchAll();
  $stmt->closeCursor();
  return $recipient;
}

/** Shipping  */
function get_location()
{
  global $db;
  $query = 'SELECT * FROM shipping_location';
  $stmt = $db->prepare($query);
  $stmt->execute();
  $locations = $stmt->fetchAll();
  $stmt->closeCursor();
  return $locations;
}

function add_shipping_order($v1, $v2, $v3, $v4, $v5, $v6, $v7, $v8, $v9, $v10, $v11, $v12, $v13, $v14, $v15, $v16, $v17)
{
  global $db;
  $query = 'INSERT INTO `shipping_order`(`mst`, `send_date`, `airport_delivery_date`, `total_weight`, `num_of_packages`, `package_value`, `custom_fee`, `insurance`, `payment_method`, `user_id`, `location`, `customer_id`, `recipient_id`, `price_per_lb`,`amount`, `custom_fee_taxed_item`,`sales_id`) VALUES (:v1,:v2,:v3,:v4,:v5,:v6,:v7,:v8,:v9,:v10,:v11,:v12,:v13,:v14,:v15,:v16,:v17)';
  $stmt = $db->prepare($query);
  $res = $stmt->execute(array(
    ':v1' => $v1,
    ':v2' => $v2,
    ':v3' => $v3,
    ':v4' => $v4,
    ':v5' => $v5,
    ':v6' => $v6,
    ':v7' => $v7,
    ':v8' => $v8,
    ':v9' => $v9,
    ':v10' => $v10,
    ':v11' => $v11,
    ':v12' => $v12,
    ':v13' => $v13,
    ':v14' => $v14,
    ':v15' => $v15,
    ':v16' => $v16,
    ':v17' => $v17
  ));
  $stmt->closeCursor();
}

function add_package($shipping_ord_id, $packages)
{
  global $db;
  for ($i = 0; $i < count($packages); $i++) {
    $query = 'INSERT INTO `package`(`shipping_order_id`, `package_desc`, `package_weight`, `mst`,`pkg_tracking_no`) VALUES (:v1,:v2,:v3,:v4,:v5);';
    $stmt = $db->prepare($query);
    $res = $stmt->execute(array(
      ':v1' => $shipping_ord_id,
      ':v2' => $packages[$i]['pkg_desc'],
      ':v3' => $packages[$i]['pkg_wt'],
      ':v4' => $packages[$i]['mst'],
      ':v5' => $packages[$i]['pkg_tracking_no'],
    ));
  }
}

function get_shipping_order($mst)
{
  global $db;
  $query = 'SELECT * FROM shipping_order WHERE mst = :mst';
  $stmt = $db->prepare($query);
  $stmt->bindValue(':mst', $mst);
  $stmt->execute();
  $shipping_order = $stmt->fetchAll();
  $stmt->closeCursor();
  return $shipping_order;
}

function get_shipping_invoice_info($mst)
{
  global $db;
  $query = 'SELECT * FROM shipping_order so
  JOIN customer c ON so.customer_id = c.customer_id
  JOIN recipient r ON so.recipient_id = r.recipient_id
  JOIN package p ON so.shipping_order_id = p.shipping_order_id
  WHERE so.mst = :mst';
  $stmt = $db->prepare($query);
  $stmt->bindValue(':mst', $mst);
  $stmt->execute();
  $shipping_order = $stmt->fetchAll();
  $stmt->closeCursor();
  return $shipping_order;
}

function get_temp_shipping_order($shipping_order_id)
{
  global $db;
  $query = 'SELECT * FROM temp_shipping_order
  WHERE shipping_order_id =  :shipping_order_id';
  $stmt = $db->prepare($query);
  $stmt->bindValue(':shipping_order_id', $shipping_order_id);
  $stmt->execute();
  $shipping_order = $stmt->fetchAll();
  $stmt->closeCursor();
  return $shipping_order;
}

function get_temp_shipping_order_temp_package($shipping_order_id)
{
  global $db;
  $query = 'SELECT * FROM temp_shipping_order tso
  JOIN temp_package tp ON tso.shipping_order_id =  tp.shipping_order_id
  WHERE tso.shipping_order_id =  :shipping_order_id';
  $stmt = $db->prepare($query);
  $stmt->bindValue(':shipping_order_id', $shipping_order_id);
  $stmt->execute();
  $shipping_order = $stmt->fetchAll();
  $stmt->closeCursor();
  return $shipping_order;
}

function get_last_shipord()
{
  //echo "<br>Start get_last_shipord()<br>"; 
  global $db;
  $query = 'SELECT * FROM shipping_order WHERE shipping_order_id = (SELECT MAX(shipping_order_id) FROM shipping_order)';
  $stmt = $db->prepare($query);
  $stmt->execute();
  $shipping_order = $stmt->fetch();
  //print_r($shipping_order);
  $stmt->closeCursor();
  //echo "<br>End get_last_shipord()<br>"; 
  return $shipping_order;
}

/** Validations */

function valid_email($input)
{
  $email = clean_input($input);
  if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    //Invalid email format
    return false;
  }
  return true;
}

function valid_phone($input)
{
  // Filter out the character data
  $phone = preg_replace('/[^0-9]/', '', $input);
  if (strlen($phone) !== 10) {
    //Phone is 10 characters in length (###) ###-####
    return false;
  }
  return true;
}

function clean_input($data)
{
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}

function valid_recipient($cust_id, $name)
{
  global $db;
  $query = 'SELECT COUNT(*) AS num FROM recipient WHERE recipient_name = :name AND customer_id = :cust_id';
  $stmt = $db->prepare($query);
  $stmt->execute(array(
    ':cust_id' => $cust_id,
    ':name' => $name
  ));
  $row = $stmt->fetch(PDO::FETCH_ASSOC);
  $stmt->closeCursor();
  return ($row['num'] == 0);
}

function valid_shipping_ord($mst)
{
  global $db;
  $query = 'SELECT COUNT(*) AS num FROM shipping_order WHERE mst=:mst';
  $stmt = $db->prepare($query);
  $stmt->bindValue(':mst', $mst);
  $stmt->execute();
  $row = $stmt->fetch(PDO::FETCH_ASSOC);
  $stmt->closeCursor();
  return ($row['num'] == 0);
}

function valid_customer($cust_name, $cust_phone)
{
  global $db;
  $query = 'SELECT COUNT(*) AS num FROM customer WHERE cust_name = :cust_name AND cust_phone = :cust_phone';
  $stmt = $db->prepare($query);
  $stmt->execute(array(
    ':cust_name' => $cust_name,
    ':cust_phone' => $cust_phone
  ));
  $row = $stmt->fetch(PDO::FETCH_ASSOC);
  $stmt->closeCursor();
  return ($row['num'] == 0);
}


?>