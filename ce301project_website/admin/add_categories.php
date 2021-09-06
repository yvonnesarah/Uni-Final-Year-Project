<?php
include("top.php");
 

 if($_SERVER['REQUEST_METHOD'] == "POST")
 {
	 //something was posted
	 $categories_name     = $_POST['categories_name'];
	 
	 
	 if(!empty($categories_name))
 {
	 //save to database
	
    $query = "insert into categories(categories_name) values('$categories_name')";
		
    mysqli_query($con,$query);
	
	header("Location: add_categories.php");
	die;
	
     }else
	 {
		 echo "Please enter valid information!";
		 
    }
 }
	 
  ?>


<div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Categories</strong><small> Form</small></div>
                        <form method="post">
							<div class="card-body card-block">
							   <div class="form-group">
									<label for="categories_name" class=" form-control-label">Categories</label>
									<input type="text" name="categories_name" placeholder="Enter categories name" class="form-control">
								</div>
							   <button id="payment-button" name="submit" type="submit" class="btn btn-lg btn-info btn-block">
							   <span id="payment-button-amount">Submit</span>
							   </button>
							</div>
						</form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
<?php
require('footer.php');
?>