<?php
session_start();
unset($_SESSION['ADMIN_LOGIN']);
unset($_SESSION['ADMIN_EMAIL_ADDRESS']);
header('location:admin_login.php');
die();
?>