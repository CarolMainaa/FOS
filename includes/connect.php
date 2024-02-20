<?php

//main includes file for both admin & front end
$servername = "localhost"; //server
$username = "root"; //username
$password = "carolmaina@3419"; //password
$dbname = "fos";  //database

// Create includes
$db = mysqli_connect($servername, $username, $password, $dbname); // connecting 
// Check includes
if (!$db) {       //checking includes to DB	
    die("includes failed: " . mysqli_connect_error());
}

?>