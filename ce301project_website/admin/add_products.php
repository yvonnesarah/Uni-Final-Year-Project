<?php
include("top.php");
 

 if($_SERVER['REQUEST_METHOD'] == "POST")
 {
	 //something was posted
	 $product_id           = $_POST['product_id'];
	 $product_name         = $_POST['product_name'];
	 $group_code           = $_POST['group_code'];
	 $categories_name      = $_POST['categories_name'];
	 $age_groups           = $_POST['age_groups'];
     $product_description  = $_POST['product_description'];
     $product_author       = $_POST['product_author'];
	 $product_image        = $_POST['product_image'];
	 $product_price        = $_POST['product_price'];
	 
	 
	 if(!empty($product_id))
 {
	 //save to database
	
    $query = "insert into products(product_id,product_name,group_code,categories_name,age_groups,product_description,product_author,product_image,product_price) values ('$product_id','$product_name','$group_code','$categories_name','$age_groups','$product_description','$product_author','$product_image','$product_price')";
			
    mysqli_query($con,$query);
	
	header("Location: add_products.php");
	die;
	
     }else
	 {
		 echo "Product Added!";
		 
    }
 }
	 
  ?>


<div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Product</strong><small> Form</small></div>
                        <form method="post"  action="add_products.php" enctype="multipart/form-data">
							<div class="card-body card-block">
							   <div class="form-group">
									<label for="product_id" class=" form-control-label">Product ID</label>
									<input type="text" name="product_id" placeholder="Enter Product ID" class="form-control">
									
									<label for="product_name" class=" form-control-label">Product Name</label>
									<input type="text" name="product_name" placeholder="Enter Product Name" class="form-control">
									
									<label for="group_code" class=" form-control-label">Group Code</label>
									<input type="text" name="group_code" placeholder="Enter Group Code" class="form-control">
									
									<label for="categories_name" class=" form-control-label">Categories Name</label>
									<input type="text" name="categories_name" placeholder="Enter Category Name" class="form-control">
									
									<br><label for="age_groups" class=" form-control-label">Age Groups</label></br>
									<input type="radio" name="age_groups" value="Baby"> Baby <br>
						            <input type="radio" name="age_groups" value="1 years"> 1 years <br>
									<input type="radio" name="age_groups" value="2-3 years"> 2-3 years <br>
									<input type="radio" name="age_groups" value="4-5 years"> 4-5 years <br>
									<input type="radio" name="age_groups" value="6-11 years"> 6-11 years <br>
									<input type="radio" name="age_groups" value="12-14 years"> 12-14 years <br>
									<input type="radio" name="age_groups" value="15-18 years"> 15-18 years
									
									
									<br><label for="product_description" class=" form-control-label">Product Description</label></br>
									<input type="text" name="product_description" placeholder="Enter Product Description" class="form-control">
									
									<label for="product_author" class=" form-control-label">Product Author</label>
									<input type="text" name="product_author" placeholder="Enter Product Author" class="form-control">
									
									
									<label for="product_image" class=" form-control-label">Product Image</label>
									<input type="text" name="product_image" class="form-control">
									
									
									<label for="product_price" class=" form-control-label">Product Price</label>
									<input type="text" name="product_price" placeholder="Enter Product Price" class="form-control">
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



























