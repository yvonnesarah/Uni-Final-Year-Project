<?php
include("dbconnection.php");
include("functions.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Products Results</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<?php include("navbar.php");
?>
	
<?php include("slider.php");
?>
	
<div class="container">

<div id="products_box">
 <?php
  
  if(isset($_GET['search'])){
	  
	$search_query = $_GET['user_query'];
	  
	 $get_pro = "select * from products where categories_name like '%$search_query%'";
	 $run_pro = mysqli_query($con, $get_pro);
	 
	while($row_pro=mysqli_fetch_array($run_pro)){
    
    $product_id            = $row_pro['product_id'];
    $product_name         = $row_pro['product_name'];
    $product_image        = $row_pro['product_image'];
    $product_price        = $row_pro['product_price'];
	$categories_name      = $row_pro['categories_name'];
    $age_groups           = $row_pro['age_groups'];
	$group_code           = $row_pro['group_code'];
    $product_description  = $row_pro['product_description'];
    $product_author       = $row_pro['product_author'];
    
  
  echo " 
  
  <div id='single_product'>
		<h3>$product_name</h3>
		<img src='products_images/$product_image' width='200' height='200' />
		<p><b>Price: £ $product_price</b></p>
		<p><b>Category: $categories_name</b></p>
		<p><b>Age Groups: $age_groups</b></p>
		<p><b>Group Code: $group_code</b></p>
		<p><b> Author: $product_author</b></p>
		<p>Description: $product_description</p>
		
		<a href='index.php?add_basket=$product_id'><button style='float:right'>Add to basket</button></a>
		</div>
      ";
	  }
	 }
  
  ?>
  
 
  <?php
  
  if(isset($_GET['search'])){
	  
	$search_query = $_GET['user_query'];
	  
	 $get_pro = "select * from products where age_groups like '%$search_query%'";
	 $run_pro = mysqli_query($con, $get_pro);
	 
	 while($row_pro=mysqli_fetch_array($run_pro)){
    
    $product_id            = $row_pro['product_id'];
    $product_name         = $row_pro['product_name'];
    $product_image        = $row_pro['product_image'];
    $product_price        = $row_pro['product_price'];
	$categories_name      = $row_pro['categories_name'];
    $age_groups           = $row_pro['age_groups'];
	$group_code           = $row_pro['group_code'];
    $product_description  = $row_pro['product_description'];
    $product_author       = $row_pro['product_author'];
  
  echo " 
  
  <div id='single_product'>
		<h3>$product_name</h3>
		<img src='products_images/$product_image' width='200' height='200' />
		<p><b>Price: £ $product_price</b></p>
		<p><b>Category: $categories_name</b></p>
		<p><b>Age Groups: $age_groups</b></p>
		<p><b>Group Code: $group_code</b></p>
		<p><b> Author: $product_author</b></p>
		<p>Description: $product_description</p>
		
		<a href='index.php?add_basket=$product_id'><button style='float:right'>Add to basket</button></a>
		</div>
      ";
	  }
	 }
  
  ?>
  <?php
  
  if(isset($_GET['search'])){
	  
	$search_query = $_GET['user_query'];
	  
	 $get_pro = "select * from products where product_author like '%$search_query%'";
	 $run_pro = mysqli_query($con, $get_pro);
	 
	 
	while($row_pro=mysqli_fetch_array($run_pro)){
    
    $product_id            = $row_pro['product_id'];
    $product_name         = $row_pro['product_name'];
    $product_image        = $row_pro['product_image'];
    $product_price        = $row_pro['product_price'];
	$categories_name      = $row_pro['categories_name'];
    $age_groups           = $row_pro['age_groups'];
	$group_code           = $row_pro['group_code'];
    $product_description  = $row_pro['product_description'];
    $product_author       = $row_pro['product_author'];
  
  echo " 
  
  <div id='single_product'>
		<h3>$product_name</h3>
		<img src='products_images/$product_image' width='200' height='200' />
		<p><b>Price: £ $product_price</b></p>
		<p><b>Category: $categories_name</b></p>
		<p><b>Age Groups: $age_groups</b></p>
		<p><b>Group Code: $group_code</b></p>
		<p><b> Author: $product_author</b></p>
		<p>Description: $product_description</p>
		
		<a href='index.php?add_basket=$product_id'><button style='float:right'>Add to basket</button></a>
		</div>
      ";
	  }
	 }
	
  
  ?>
  <?php
  
  if(isset($_GET['search'])){
	  
	$search_query = $_GET['user_query'];
	  
	 $get_pro = "select * from products where group_code like '%$search_query%'";
	 $run_pro = mysqli_query($con, $get_pro);
	 
	while($row_pro=mysqli_fetch_array($run_pro)){
    
    $product_id            = $row_pro['product_id'];
    $product_name         = $row_pro['product_name'];
    $product_image        = $row_pro['product_image'];
    $product_price        = $row_pro['product_price'];
	$categories_name      = $row_pro['categories_name'];
    $age_groups           = $row_pro['age_groups'];
	$group_code           = $row_pro['group_code'];
    $product_description  = $row_pro['product_description'];
    $product_author       = $row_pro['product_author'];
   
  echo " 
  
  <div id='single_product'>
		<h3>$product_name</h3>
		<img src='products_images/$product_image' width='200' height='200' />
		<p><b>Price: £ $product_price</b></p>
		<p><b>Category: $categories_name</b></p>
		<p><b>Age Groups: $age_groups</b></p>
		<p><b>Group Code: $group_code</b></p>
		<p><b> Author: $product_author</b></p>
		<p>Description: $product_description</p>
		
		<a href='index.php?add_basket=$product_id'><button style='float:right'>Add to basket</button></a>
		</div>
      ";
	  }
	 }
	
  
  ?>
  
  
  <?php
  
  if(isset($_GET['search'])){
	  
	$search_query = $_GET['user_query'];
	  
	 $get_pro = "select * from products where product_description like '%$search_query%'";
	 $run_pro = mysqli_query($con, $get_pro);
	 
	 while($row_pro=mysqli_fetch_array($run_pro)){
    
    $product_id            = $row_pro['product_id'];
    $product_name         = $row_pro['product_name'];
    $product_image        = $row_pro['product_image'];
    $product_price        = $row_pro['product_price'];
	$categories_name      = $row_pro['categories_name'];
    $age_groups           = $row_pro['age_groups'];
	$group_code           = $row_pro['group_code'];
    $product_description  = $row_pro['product_description'];
    $product_author       = $row_pro['product_author'];
    
  echo " 
  
  <div id='single_product'>
		<h3>$product_name</h3>
		<img src='products_images/$product_image' width='200' height='200' />
		<p><b>Price: £ $product_price</b></p>
		<p><b>Category: $categories_name</b></p>
		<p><b>Age Groups: $age_groups</b></p>
		<p><b>Group Code: $group_code</b></p>
		<p><b> Author: $product_author</b></p>
		<p>Description: $product_description</p>
		
		<a href='index.php?add_basket=$product_id'><button style='float:right'>Add to basket</button></a>
		</div>
      ";
	  }
	 }
  
  ?>
  
</div> 
</div>
<?php include("footer.php");
?>
</body>
</html>
