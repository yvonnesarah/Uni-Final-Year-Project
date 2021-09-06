<?php
include("dbconnection.php");
 include("functions.php");
 

 if($_SERVER['REQUEST_METHOD'] == "POST")
 {
	 //something was posted
	 $first_name     = $_POST['first_name'];
	 $last_name      = $_POST['last_name'];
	 $gender         = $_POST['gender'];
	 $email_address  = $_POST['email_address'];
	 $password       = $_POST['password'];
	 
	 if(!empty($first_name) && !empty($last_name) && !empty($gender)&& !empty($email_address)&& !empty($password) && !is_numeric($first_name))
 {
	 //save to database
	
    $query = "insert into admin(first_name,last_name,gender,email_address,password) values('$first_name','$last_name','$gender','$email_address','$password')";
		
    mysqli_query($con,$query);
	
	header("Location: admin_login.php");
	die;
	
     }else
	 {
		 echo "Please enter valid information!";
		 
    }
 }
	 
  ?>

<!doctype html>
<html class="no-js" lang="">
   <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>Admin Register</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="assets/css/normalize.css">
      <link rel="stylesheet" href="assets/css/bootstrap.min.css">
      <link rel="stylesheet" href="assets/css/font-awesome.min.css">
      <link rel="stylesheet" href="assets/css/themify-icons.css">
      <link rel="stylesheet" href="assets/css/pe-icon-7-filled.css">
      <link rel="stylesheet" href="assets/css/flag-icon.min.css">
      <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
      <link rel="stylesheet" href="assets/css/style.css">
      <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
   </head>
   <body class="bg-dark">
      <div class="sufee-login d-flex align-content-center flex-wrap">
         <div class="container">
            <div class="login-content">
               <div class="login-form mt-150">
                  <form method="post">
				  <div class="form-group">
                        <label>First Name</label>
                        <input type="text" name="first_name" class="form-control" placeholder="First Name" required>
                     </div>
					 <div class="form-group">
                        <label>Last Name</label>
                        <input type="text" name="last_name" class="form-control" placeholder="Last Name" required>
                     </div>
					 <div class="form-group">
                        <br><label>Gender</label></br>
						 <input type="radio" name="gender" value="Female"> Female 
						 <input type="radio" name="gender" value="Male"> Male
                     </div>
                     <div class="form-group">
                        <label>Email Address</label>
                        <input type="text" name="email_address" class="form-control" placeholder="Email Address" required>
                     </div>
                     <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Password" required>
                     </div>
                     <button type="submit" name="submit" class="btn btn-success btn-flat m-b-30 m-t-30">Register</button>
					 
					 <a href="admin_login.php">Admin Login</a><br><br>
					</form>
               </div>
            </div>
         </div>
      </div>
      <script src="assets/js/vendor/jquery-2.1.4.min.js" type="text/javascript"></script>
      <script src="assets/js/popper.min.js" type="text/javascript"></script>
      <script src="assets/js/plugins.js" type="text/javascript"></script>
      <script src="assets/js/main.js" type="text/javascript"></script>
   </body>
</html>