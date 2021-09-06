<?php
 include("dbconnection.php");
 include("functions.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Customer Account</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <link rel="stylesheet" href="style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li><a href="index.php"><span class="glyphicon glyphicon-home"></span>Home</a></li>
      <?php getCats(); ?>
    </ul>
    <ul class="nav navbar-nav navbar-right">
	  <li><a href="customer_account.php">Customer Account</a></li>
      <li><a href="customer_register.php"><span class="glyphicon glyphicon-user"></span> Register</a></li>
      <li><a href="customer_login.php"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	  <li><a href="products_basket.php"><span class="glyphicon glyphicon-shopping-cart"></span> Basket</a></li>
    </ul>
	</div>
	<form class="search" action="products_results.php">
  <input type="text" placeholder="Search for products here.." name="search">
  <button type="submit">Search<i class="fa fa-search"></i></button>
      </form>
</nav>
  
<div class="container">
  
</div>
</body>
</html>

