<?php
include("top.php");
 

 if($_SERVER['REQUEST_METHOD'] == "POST")
 {
	 //something was posted
	 $group_code     = $_POST['group_code'];
	 
	 
	 if(!empty($group_code))
 {
	 //save to database
	
    $query = "insert into product_groups_code(group_code) values('$group_code')";
		
    mysqli_query($con,$query);
	
	header("Location: add_product_groups_code.php");
	die;
	
     }else
	 {
		 echo "Product Group Code Added!";
		 
    }
 }
	 
  ?>
<div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Product Group Code</strong><small> Form</small></div>
                        <form method="post">
							<div class="card-body card-block">
							   <div class="form-group">
									<label for="group_code" class=" form-control-label">Product Group Code</label>
									<input type="text" name="group_code" placeholder="Enter Group Code" class="form-control">
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




