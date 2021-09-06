<?php
session_start();
 
 include("dbconnection.php");
 include("functions.php");
 
 if($_SERVER['REQUEST_METHOD'] == "POST")
 {
	 //something was posted
	 $first_name     = $_POST['first_name'];
	 $last_name      = $_POST['last_name'];
	 $gender         = $_POST['gender'];
	 $email_address  = $_POST['email_address'];
	 $address        = $_POST['address'];
	 $city           = $_POST['city'];
	 $country        = $_POST['country'];
	 $postcode       = $_POST['postcode'];
	 $password       = $_POST['password'];
	 
	 if(!empty($first_name) && !empty($last_name) && !empty($gender)&& !empty($email_address)&& !empty($address) && !empty($city) && !empty($country) && !empty($postcode) && !empty($password) && !is_numeric($first_name))
 {
	 //save to database
	
    $query = "insert into customers(first_name,last_name,gender,email_address,address,city,country,postcode,password) values('$first_name','$last_name','$gender','$email_address','$address','$city','$country','$postcode','$password')";
		
    mysqli_query($con,$query);
	
	header("Location: customer_login.php");
	die;
	
     }else
	 {
		 echo "Please enter valid information!";
		 
    }
 }
	 
  ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Customer Register</title>
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
	
	<form action="customer_register.php" method="post">
  <div class="container">
    <h1> Customer Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
	
	<label for="first_name"><b>First Name</b></label>
    <input type="text" placeholder="Enter First Name" name="first_name" id="first_name" required>
	
	<label for="last_name"><b>Last Name</b></label>
    <input type="text" placeholder="Enter Last Name" name="last_name" id="last_name" required>
	
	<label for="gender"><b>Gender</b></label>
	</br>
    <input type="radio" name="gender" value="Female"> Female
	<input type="radio" name="gender" value="Male"> Male
</br>

    <label for="email_address"><b>Email Address</b></label>
    <input type="text" placeholder="Enter Email Address" name="email_address" id="email_address" required>
	
	<label for="address"><b>Address</b></label>
    <input type="text" placeholder="Enter Address" name="address" id="address" required>
	
	<label for="city"><b>City</b></label>
    <input type="text" placeholder="Enter City" name="city" id="city" required>
	
	<label for="country"><b>Country</b></label>
    <input type="text" placeholder="Enter Country" name="country" id="country" required>

    <label for="postcode"><b>Post Code</b></label>
    <input type="text" placeholder="Enter Post Code" name="postcode" id="postcode" required>
	
    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" id="password" required>
    <hr>
    <button type="submit" class="registerbtn">Register</button>
  </div>
  
  <div class="container signin">
    <p>Already have an account? <a href="customer_login.php">Login</a>.</p>
  </div>
</form>
</body>
</html>
<?php include("footer.php");
?>
		