<?php
$time_zone = 'Asia/Kolkata';

$con = mysqli_connect("localhost", "username", "yourpassword", "dbname");

if(!$con) {
    echo "Error connecting to MySQL <br>";
    exit;
}
?>
