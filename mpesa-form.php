<!DOCTYPE html>
<html lang="en">
<?php
include("includes/connect.php");
include_once 'product-action.php';
error_reporting(0);
session_start();


if (empty($_SESSION["user_id"])) {
    header('location:login.php');
} else {


    foreach ($_SESSION["cart_item"] as $item) {

        $item_total += ($item["price"] * $item["quantity"]);
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

                <div class="container">

                    <span style="color:green;">
                        <?php echo $success; ?>
                    </span>

                </div>




                <div class="container m-t-30">

                    <div class="widget clearfix col-md-8">

                        <div class="widget-body">

                            <div class="media mt-4 ">
                                <img src="images/mpesa.png" class="mr-3" height="75" />
                                <div class="media-body">
                                    <h6 class="mt-1">Enter Phone Number</h6>
                                </div>
                            </div>
                            <div class="media mt-1 pl-1">
                                <!--bs5 input-->

                                <form class="row g-2" action="./stk_initiate.php" method="POST">

                                    <div class="col-12">
                                        <label for="inputAddress" class="form-label">Amount</label>
                                        <input type="text" class="form-control" name="amount" readonly
                                            placeholder=" <?php echo "Ksh " . $item_total; ?> ">

                                        <!-- Add a hidden input field to store the amount -->
                                        <input type="hidden" name="hidden_amount" value="<?php echo $item_total; ?>">
                                    </div>

                                    <div class="col-12  mt-1">
                                        <label for="inputAddress2" class="form-label">Phone
                                            Number</label>
                                        <input type="text" class="form-control" name="phone"
                                            placeholder="Enter Phone Number">
                                    </div>

                                    <div class="col-12  mt-1">
                                        <button type="submit" class="btn btn-success" name="submit"
                                            value="submit">Send</button>
                                    </div>
                                </form>
                                <!--bs5 input-->
                            </div>

                        </div>

                    </div>
                </div>

            </div>
        </div>



        <script>
            function redirectToMpesa() {
                window.location.href = 'mpesa-form.php';
            }
        </script>


        <?php
        include("includes/footer.php")
            ?>
        </div>
        </div>

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