<?php
session_start();
include("dbconnection.php");
include("functions.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Products Basket</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <link rel="stylesheet" href="style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<?php   
        include("navbar.php");
	?>
  
<div class="container">

  <div id="products_box">
  <br>
<form action="" method="post" enctype="multipart/form-data">

<table align="center" width="700" bgcolor="black">

<tr align="center">
<th>Remove</th>
<th>Products</th>
<th>Age Groups</th>
<th>Total Price</th>
</tr>

<?php
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
		$product_name  = $pp_price['product_name'];
		$age_groups  = $pp_price['age_groups'];
		$product_image = $pp_price['product_image'];
		$single_price  = $pp_price['product_price'];
		
		 $values = array_sum($product_price);
			
		$total +=$values;		
		
		?>
		
		<tr align="center">
		<td><input type="checkbox" name="remove[]" value="<?php echo $product_id;?>"/></td>
        <td><?php echo $product_name; ?>
		<td><?php echo $age_groups; ?><br>
       <img src="products_images/<?php echo $product_image;?>" width="60" height="60"/>
       </td>
	   <?php
		if(isset($_POST['update_basket'])){
	
	$quantity = $_POST['quantity'];
	
	$update_quantity = "update basket set quantity='$quantity'";
	$run_quantity = mysqli_query($con, $update_quantity);
	
	$_SESSION['quantity']=$quantity;
	
	$total = $total*$quantity;
}


?>

	   <td><?php echo "£" . $single_price; ?><td>
	    </tr>
		
	<?php }} ?>
	
	<tr align="right">
<td colspan="6"><b>Sub Total:<b></td>
<td><?php echo "£" . $total;?></td>
</tr>
	
<tr align="center">
<td colspan="0"><input type="submit" name="remove_basket" value="Remove Basket"/></td>
<td colspan="0"><input type="submit" name="continue" value="Continue Shopping"/></td>
<td><button><a href="checkout.php" style="text-decoration:none; color:white">Checkout</a></button></td>
</tr>


</table>

</form>
<?php
$ip = getIp();

if(isset($_POST['remove_basket'])){
		foreach($_POST['remove'] as $remove_id){
			
			$delete_product = "delete from basket where product_id='$remove_id' AND ip_address='$ip'";
			$run_delete = mysqli_query($con, $delete_product);
			if($run_delete){
				echo "<script>window.open('products_basket.php','_self')</script>";
				
			}
			
			
		}
	}
	if(isset($_POST['continue'])){
		echo "<script>window.open('index.php','_self')</script>";
	}
		
	?>
</div> 
</div>
</body>
</html>
<?php include("footer.php");
?>