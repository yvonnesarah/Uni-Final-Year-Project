<?php
session_start();
 
 include("dbconnection.php");
 include("functions.php");
 
 $customer_data = check_login($con);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Children Attractive Products Online Store</title>
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

<?php   include("slider.php");
    ?>
	
	<a href="customer_logout.php">Logout</a> Hello <?php echo $customer_data['email_address']; ?>

<div class="container">
<?php basket(); ?>
  <div id="products_box">
  
  <?php getPro(); ?>
  <?php getCatPro(); ?>
 
</div> 
</div>
</body>
</html>
<?php include("footer.php");
?>
