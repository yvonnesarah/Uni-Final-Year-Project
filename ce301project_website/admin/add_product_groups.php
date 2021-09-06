<?php
include("top.php");

if($_SERVER['REQUEST_METHOD'] == "POST")
 {
	 //something was posted
	 $group_code         = $_POST['group_code'];
	 $categories_name    = $_POST['categories_name'];
	 $age_groups         = $_POST['age_groups'];
	 
	 
	 if(!empty($group_code) && !empty($categories_name) && !empty($age_groups))
 {
	 //save to database
	
    $query = "insert into product_groups(group_code,categories_name,age_groups) values('$group_code','$categories_name','$age_groups')";
		
    mysqli_query($con,$query);
	
	header("Location: add_product_groups.php");
	die;
	
     }else
	 {
		 echo "Product Groups Added!";
		 
    }
 }
	 
  ?>
<div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Product Groups</strong><small> Form</small></div>
                        <form method="post">
							<div class="card-body card-block">
							   <div class="form-group">
									<label for="group_code" class=" form-control-label">Product Group Code</label>
									<input type="text" name="group_code" placeholder="Enter Product Group Code" class="form-control">
									<label for="product_groups" class=" form-control-label">Categories Name</label>
									<input type="text" name="categories_name" placeholder="Enter Categories Name" class="form-control">
									<br><label for="age_groups" class=" form-control-label">Age Groups</label></br>
									<input type="radio" name="age_groups" value="Baby"> Baby <br>
						            <input type="radio" name="age_groups" value="1 years"> 1 years <br>
									<input type="radio" name="age_groups" value="2-3 years"> 2-3 years <br>
									<input type="radio" name="age_groups" value="4-5 years"> 4-5 years <br>
									<input type="radio" name="age_groups" value="6-11 years"> 6-11 years <br>
									<input type="radio" name="age_groups" value="12-14 years"> 12-14 years <br>
									<input type="radio" name="age_groups" value="15-18 years"> 15-18 years
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


