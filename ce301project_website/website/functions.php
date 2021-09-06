<?php
include("dbconnection.php");

function check_login($con)
{
	if(isset($_SESSION['customer_id']))
	{
		
		$id = $_SESSION['customer_id'];
		$query = "select * from customers where customer_id = '$id' limit 1";
		
		$result = mysqli_query($con,$query);
		if($result && mysqli_num_rows($result) > 0)
		{
			
			$customer_data = mysqli_fetch_assoc($result);
			return $customer_data;
		}
	}
	
	//redirect to login
	
	header("Location: customer_login.php");
	die;
    }
	
	//getting the categories
	function getCats(){
		
		global $con;
		
		$get_cats="select * from categories";
		
		$run_cats = mysqli_query($con, $get_cats);
		
		while($row_cats=mysqli_fetch_array($run_cats)){
			
			$categories_name = $row_cats['categories_name'];
			
			echo "<li><a href='index.php?categories=$categories_name'>$categories_name</a></li>";
		}
	}
	
	//getting the user IP address
	function getIp() {
    $ip = $_SERVER['REMOTE_ADDR'];
 
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    }
 
    return $ip;
}

	//creating the shopping basket
	function basket(){
	 if(isset($_GET['add_basket'])){
		
		global $con;
		 
		  $ip = getIp();
		  $product_id = $_GET['add_basket'];
		  $age_groups = $_GET['add_basket'];
		
		 $check_pro = "select * from basket where ip_address='$ip' AND product_id='$product_id'";
         $run_check = mysqli_query($con, $check_pro);
		
		if(mysqli_num_rows($run_check)>0){
			
			echo"";
			
		}
		else{
			$insert_pro ="insert into basket(product_id,ip_address) values('$product_id','$ip')";
			$run_pro = mysqli_query($con, $insert_pro);
			
			echo "<script>window.open('index.php',self')</script>";
		}
			
	 }
	 
}	 

//getting the total added items
function total_items(){
	if(isset($_GET['add_basket'])){
		
		global $con;
		
		$ip = getIp();
		$get_items = "select * from basket where ip_address='$ip'";
		$run_items = mysqli_query($con, $get_items);
		$count_items = mysqli_num_rows($run_items);
		
	}
		else{
		global $con;
		$ip = getIp();
		$get_items = "select * from basket where ip_address='$ip'";
		$run_items = mysqli_query($con, $get_items);
		$count_items = mysqli_num_rows($run_items);
		
	}
	echo $count_items;
	
	
}

//getting the total price of items in the cart
function total_price(){
	$total = 0;
	
	global $con;
	$ip = getIp();
	
	$sel_price = "select * from basket where ip_address='$ip'";
	
	$run_price = mysqli_query($con, $sel_price);
	
	while($product_price=mysqli_fetch_array($run_price)){
		
		$product_id = $product_price['product_id'];
		$product_price = "select * from products where product_id='$product_id'";
		$run_pro_price = mysqli_query($con, $product_price);
		
		while($pp_price = mysqli_fetch_array($run_pro_price)){
		$product_price = array($pp_price['product_price']);
         $values = array_sum($product_price);
			
			$total +=$values;		
			
		}
		
	}
	echo "£". $total;
	
}		

	//getting the products

 function getPro(){
	 if(!isset($_GET['categories'])){
	 
	  global $con;
	 
	 $get_pro = "select * from products order by RAND() LIMIT 0,8";
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
 }
	
   function getCatPro(){
	 if(isset($_GET['categories'])){
	 
	 $categories_name = $_GET['categories'];
	  
	  global $con;
	 
	 $get_cat_pro = "select * from products where categories_name='$categories_name'";
	 $run_cat_pro = mysqli_query($con, $get_cat_pro);
	 $count_cats = mysqli_num_rows($run_cat_pro);
	 
	 if($count_cats==0){
		 echo "<h2>No products were found in this category!</h2>";
	 }
	 
	 while($row_cat_pro=mysqli_fetch_array($run_cat_pro)){

	$product_id            = $row_cat_pro['product_id'];
    $product_name         = $row_cat_pro['product_name'];
    $product_image        = $row_cat_pro['product_image'];
    $product_price        = $row_cat_pro['product_price'];
	$categories_name      = $row_cat_pro['categories_name'];
    $age_groups           = $row_cat_pro['age_groups'];
	$group_code           = $row_cat_pro['group_code'];
    $product_description  = $row_cat_pro['product_description'];
    $product_author       = $row_cat_pro['product_author'];
   
  
  
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
   }
   
 ?>
  
   