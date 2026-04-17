<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>VietStar Shipping Form</title>
<link rel="stylesheet" href="shippingStyles.css">
<script src="Scripts/swfobject_modified.js"></script>
<link rel="shortcut icon" href="images/Vietstar Shipping Company Logo (No Background).png">

<script src="js/datatables.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<header>    
    <div class="logo_tl">
        <a href="cusHomepage.html">
        <img src="images/Vietstar Shipping Company Logo (No Background).png" title="VietStar Shipping Logo" alt="VietStar Shipping Logo" style="width:200px;height:200px;">
        </a>

        <div class="heading">
            <H1>Customer Shippment Form</H1>
        </div>
    </div>

</header>

<body>
    <div class="container1">
        <form action="shippingForm_BE.php" method="POST" class="form">

            <div class="container1-1">
                <!-- Sender's information -->

                <div class="sender">
                    <label for="first_name" class="form-label">First Name</label>
                    <input type="text" class="form-control" id="first_name" name="first_name" placeholder="First Name" tabindex="1" required>
                </div>
                <div class="sender">
                    <label for="last_name" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="first_name" name="last_name" placeholder="Last Name" tabindex="2" required>
                </div>
                <div class="sender">
                    <label for="address1" class="form-label">Address 1</label>
                    <input type="text" class="form-control" id="address1" name="address1" placeholder="Address" tabindex="3" required>
                </div>
                <div class="sender">
                    <label for="address2" class="form-label">Address 2</label>
                    <input type="text" class="form-control" id="address2" name="address2" placeholder="Apt., PMB#, etc. (Optional)" tabindex="4">
                </div>
                <div class="sender">
                    <label for="zip_code" class="form-label">Zip Code</label>
                    <input type="text" class="form-control" id="zip_code" name="zip_code" placeholder="Zip Code" tabindex="5" required>
                </div>
                <div class="sender">
                    <label for="city" class="form-label">City</label>
                    <input type="text" class="form-control" id="city" name="city" placeholder="City" tabindex="6" required>
                </div>
                <div class="sender">
                    <label for="state" class="form-label">State</label>
                    <input type="text" class="form-control" id="state" name="state" placeholder="State" tabindex="7" required>
                </div>
                <div class="sender">
                    <label for="phone" class="form-label">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone" tabindex="8" required>
                </div>
                <div class="sender">
                    <label for="email" class="form-label">Email</label>
                    <input type="text" class="form-control" id="email" name="email" placeholder="Email" tabindex="9" required>
                </div>
            </div>

            <div class="container1-2">
                <!-- Recipient's information -->

                <div class="recipient">
                    <label for="first_name_r" class="form-label">First Name</label>
                    <input type="text" class="form-control" id="first_name_r" name="first_name_r" placeholder="First Name" tabindex="10" required>
                </div>
                <div class="recipient">
                    <label for="last_name_r" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="last_name_r" name="last_name_r" placeholder="Last Name" tabindex="11" required>
                </div>
                <div class="recipient">
                    <label for="address_r1" class="form-label">Address 1</label>
                    <input type="text" class="form-control" id="address_r1" name="address_r1" placeholder="Address 1" tabindex="12" required>
                </div>
                <div class="recipient">
                    <label for="address_r2" class="form-label">Address 2</label>
                    <input type="text" class="form-control" id="address_r2" name="address_r2" placeholder="Address 2" tabindex="13" required>
                </div>
                <div class="recipient">
                    <label for="cityprov" class="form-label">City/Province</label>
                    <input type="text" class="form-control" id="cityprov" name="cityprov" placeholder="City/Province" tabindex="14" required>
                </div>
                <div class="recipient">
                    <label for="postalcode" class="form-label">Postal Code</label>
                    <input type="text" class="form-control" id="postalcode" name="postalcode" placeholder="Postal Code" tabindex="15" required>
                </div>
                <div class="recipient">
                    <label for="phone_r" class="form-label">Phone Number</label>
                    <input type="text" class="form-control" id="phone_r" name="phone_r" placeholder="Phone Number (Optional)" tabindex="16">
                </div>
                <div class="recipient">
                    <label for="email_r" class="form-label">Email</label>
                    <input type="text" class="form-control" id="email_r" name="email_r" placeholder="Email (Optional)" tabindex="17">
                </div>
            </div>

            <div class="container1-3">
                <!-- Item description field -->

                <div class="item_desc">
                    <label for="email_r" class="form-label">Item Description</label>
                    <textarea class="form-control" rows="5" cols="50" id="message" name="message" placeholder="List items being shipped" tabindex="18"></textarea>
                </div>
                <div class="item_desc">
                    <label for="num_lg_boxes">Large Boxes: </label>
                    <select name="num_lg_boxes" id="num_lg_boxes">
                        <option value=""></option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                    </select>
                </div>
                <div class="item_desc">
                    <label for="num_med_boxes">Medium Boxes: </label>
                    <select name="num_med_boxes" id="num_med_boxes">
                        <option value=""></option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                    </select>
                </div>
                <div class="item_desc">
                    <label for="num_sm_boxes">Small Boxes: </label>
                    <select name="num_sm_boxes" id="num_sm_boxes">
                        <option value=""></option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                    </select>
                </div>
            </div>
            
        </form>
    </div>
</body>

</html>
