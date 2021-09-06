<?php

 session_start();
 
 include("dbconnection.php");
 include("functions.php");
 
 if($_SERVER['REQUEST_METHOD'] == "POST")
 {
	 //something was posted
	 
	 $email_address  = $_POST['email_address'];
	 $password       = $_POST['password'];
	 
	 if(!empty($email_address)&& !empty($password))
 {
	 //read from database
	
    $query = "select * from customers where email_address = '$email_address' limit 1";
	
	$result = mysqli_query($con,$query);
	
	if($result)
	{
		if($result && mysqli_num_rows($result) > 0)
		{
			
			$customer_data = mysqli_fetch_assoc($result);
			
			if($customer_data['password'] === $password)
			{
				
			$_SESSION['customer_id'] = $customer_data ['customer_id'];
			
			header("Location: index.php");
	        die;
		
			}	
		}
	}
	echo "wrong email address or password!";
}else
{
	echo "wrong email address or password!";
		 
    }
 }
 
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Customer Login</title>
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
	
	<form action="customer_login.php" method="post">
  <div class="container">
   <h1>Customer Login</h1>
   <hr>
	
    <label for="email_address"><b>Email Address</b></label>
    <input type="text" placeholder="Enter Email Address" name="email_address" required>

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>

    <button type="submit">Login</button>
  </div>
    <div class="container signin">
    <p>Don't have an account? <a href="customer_register.php">Register</a>.</p>
  </div>
</form>
</body>
</html>
<?php include("footer.php");
?>