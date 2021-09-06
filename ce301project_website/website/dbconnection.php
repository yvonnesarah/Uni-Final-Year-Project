<?php
$db_host = "localhost"; 
$db_user = "ya17580";
$db_pass = "Ojd2p0G9e5JbH"; 
$db_name = "ya17580_ce301_project"; 

$con = mysqli_connect($db_host, $db_user, $db_pass,$db_name);
// Check connection
if (!$con) {
 die("Connection failed: " . mysqli_connect_error());
}