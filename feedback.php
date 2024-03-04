<!DOCTYPE html>
<html lang="en">
<?php
include("includes/connect.php");
include_once 'product-action.php';
error_reporting(0);
session_start();

function function_alert($message, $redirect = null)
{
    echo "<script>alert('$message');</script>";
    if ($redirect) {
        echo "<script>window.location.replace('$redirect');</script>";
    }
}

if (empty($_SESSION["user_id"])) {
    header('location:login.php');
} else {

            // Check the payment status using the Daraja API
            $daraja_api_url = 'https://sandbox.safaricom.co.ke/mpesa/stkpushquery/v1/query';
            $daraja_headers = ['Content-Type:application/json', 'Authorization:Bearer ' . $access_token];

            $daraja_payload = [
                'BusinessShortCode' => $BusinessShortCode,
                'Password' => $Password,
                'Timestamp' => $Timestamp,
                'CheckoutRequestID' => $_SESSION['checkout_request_id'],
            ];


            $daraja_curl = curl_init();
            curl_setopt($daraja_curl, CURLOPT_URL, $daraja_api_url);
            curl_setopt($daraja_curl, CURLOPT_HTTPHEADER, $daraja_headers);
            curl_setopt($daraja_curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($daraja_curl, CURLOPT_POST, true);
            curl_setopt($daraja_curl, CURLOPT_POSTFIELDS, json_encode($daraja_payload));

            $daraja_response = curl_exec($daraja_curl);
            $daraja_status = curl_getinfo($daraja_curl, CURLINFO_HTTP_CODE);
            curl_close($daraja_curl);

            echo "<pre>Debug Info - Daraja API Response: ";
            print_r($daraja_response);
            echo "</pre>";

            $daraja_response_data = json_decode($daraja_response, true);

            echo "<pre>Debug Info - Daraja API Decoded Response: ";
            print_r($daraja_response_data);
            echo "</pre>";

            // Check if the payment was successful
            if (isset($daraja_response_data['ResultCode']) && $daraja_response_data['ResultCode'] == '0') {


                foreach ($_SESSION["cart_item"] as $item) {
                    $item_total += ($item["price"] * $item["quantity"]);
            
                    if ($_POST['submit']) {
                        $SQL = "insert into users_orders(u_id,title,quantity,price) values('" . $_SESSION["user_id"] . "','" . $item["title"] . "','" . $item["quantity"] . "','" . $item["price"] . "')";
                        mysqli_query($db, $SQL);
            
                        unset($_SESSION["cart_item"]);
                        unset($item["title"]);
                        unset($item["quantity"]);
                        unset($item["price"]);


                // Display success message
                echo '<div class="media mt-4 ">
                        <img src="images/mpesa.png" class="mr-3" height="75" />
                        <div class="media-body" style="height: 20vh;">
                            <h3>Payment successful! Thank you for your order.</h3>
                        </div>
                      </div>';
                function_alert('Thank you. Your order has been placed!', 'your_orders.php');
            } else {
                // Display error message
                echo '<div class="media mt-4 ">
                        <img src="images/mpesa.png" class="mr-3" height="75" />
                        <div class="media-body" style="height: 20vh;">
                            <h3>Error: Payment request could not be completed.</h3>
                        </div>
                      </div>';
                // Optionally, you can print or log the response for further analysis
                // print_r($daraja_response_data);
            }
        }
    }

?>


<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="#">
  <title>Checkout</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/font-awesome.min.css" rel="stylesheet">
  <link href="css/animsition.min.css" rel="stylesheet">
  <link href="css/animate.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
</head>

<body>

  <div class="site-wrapper">
    <header id="header" class="header-scroll top-header headrom">
      <nav class="navbar navbar-dark">
        <div class="container">
          <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse"
            data-target="#mainNavbarCollapse">&#9776;</button>
          <a class="navbar-brand" href="index.php"> <img class="img-rounded" src="images/foslogo.png" alt="">
          </a>
          <div class="collapse navbar-toggleable-md  float-lg-right" id="mainNavbarCollapse">
            <ul class="nav navbar-nav">
              <li class="nav-item"> <a class="nav-link active" href="index.php">Home <span
                    class="sr-only">(current)</span></a> </li>
              <li class="nav-item"> <a class="nav-link active" href="restaurants.php">Restaurants <span
                    class="sr-only"></span></a> </li>

              <?php
              if (empty($_SESSION["user_id"])) {
                echo '<li class="nav-item"><a href="login.php" class="nav-link active">Login</a> </li>
							  <li class="nav-item"><a href="registration.php" class="nav-link active">Register</a> </li>';
              } else {


                echo '<li class="nav-item"><a href="your_orders.php" class="nav-link active">My Orders</a> </li>';
                echo '<li class="nav-item"><a href="LogOut.php" class="nav-link active">LogOut</a> </li>';
              }

              ?>

            </ul>
          </div>
        </div>
      </nav>
    </header>
    <div class="page-wrapper">
      <div class="top-links">
        <div class="container">
          <ul class="row links">

            <li class="col-xs-12 col-sm-4 link-item"><span>1</span><a href="restaurants.php">Choose
                Restaurant</a></li>
            <li class="col-xs-12 col-sm-4 link-item "><span>2</span><a href="#">Pick Your favorite food</a>
            </li>
            <li class="col-xs-12 col-sm-4 link-item active"><span>3</span><a href="checkout.php">Order and
                Pay</a></li>
          </ul>
        </div>
      </div>



      <div class="container m-t-30">

        <div class="widget clearfix col-md-8">

          <div class="widget-body" >

            <div class="media mt-4 ">
              <img src="images/mpesa.png" class="mr-3" height="75" />
              <div class="media-body" style="height: 20vh;">
                 <h3>Your request is being processed, please wait..</h3>
              </div>
            </div>


          </div>

        </div>
      </div>

    </div>
  </div>

  <?php
  include("includes/footer.php")

    ?>
  <script src="js/jquery.min.js"></script>
  <script src="js/tether.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/animsition.min.js"></script>
  <script src="js/bootstrap-slider.min.js"></script>
  <script src="js/jquery.isotope.min.js"></script>
  <script src="js/headroom.js"></script>
  <script src="js/foodpicky.min.js"></script>
</body>

</html>


<?php
}
?>