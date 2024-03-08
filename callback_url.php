<?php
header("Content-Type: application/json");

$response = '{"ResultCode": 0, "ResultDesc": "Confirmation Received Successfully"}';

// Get the M-Pesa response data
$mpesaResponse = file_get_contents('php://input');
$logFile = "M_PESAConfirmationResponse.txt";

// Log the M-Pesa response
$log = fopen($logFile, "a");
fwrite($log, $mpesaResponse);
fclose($log);

// Parse the M-Pesa response JSON
$data = json_decode($mpesaResponse, true);

if (isset($data['ResultCode']) && $data['ResultCode'] == 0) {
    // Payment was successful, update your database or perform other actions
    $transactionId = $data['TransactionID'];
    $amount = $data['Amount'];
    $phoneNumber = $data['MSISDN'];

    // Add the item to the user's orders
    include("includes/connect.php");  

    foreach ($_SESSION["cart_item"] as $item) {

        $item_total += ($item["price"] * $item["quantity"]);

        if ($_POST['submit']) {

            $SQL = "insert into users_orders(u_id,title,quantity,price) values('" . $_SESSION["user_id"] . "','" . $item["title"] . "','" . $item["quantity"] . "','" . $item["price"] . "')";

            mysqli_query($db, $SQL);


            unset($_SESSION["cart_item"]);
            unset($item["title"]);
            unset($item["quantity"]);
            unset($item["price"]);
            $success = "Thank you. Your order has been placed!";

            function_alert();



        }
    }
    // Respond with a success message
    echo $response;
} else {
    // Handle the case where the payment was not successful
    // You might want to log this or perform other actions
    echo '{"ResultCode": 1, "ResultDesc": "Error processing payment"}';
}
