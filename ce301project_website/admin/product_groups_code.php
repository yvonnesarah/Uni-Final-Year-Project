<?php
require('top.php');

if(isset($_GET['type']) && $_GET['type']!=''){
	$type=get_safe_value($con,$_GET['type']);
	if($type=='delete'){
		$id=get_safe_value($con,$_GET['id']);
		$delete_sql="delete from product_groups_code where product_groups_code='$group_code'";
		mysqli_query($con,$delete_sql);
	}
}

$sql="select * from product_groups_code";
$res=mysqli_query($con,$sql);
?>
<div class="content pb-0">
	<div class="orders">
	   <div class="row">
		  <div class="col-xl-12">
			 <div class="card">
				<div class="card-body">
				   <h4 class="box-title">Product Groups Code </h4>
				   <a href="add_product_groups_code.php" class="btn btn-primary btn-sm">Add Product Groups Code</a>
				</div>
				<div class="card-body--">
				   <div class="table-stats order-table ov-h">
					  <table class="table ">
						 <thead>
							<tr>
							   <th class="serial">Serial Number</th>
							   <th>Product Group Code</th>
							    <th>Edit</th>
							    <th>Delete</th>
							   <th></th>
							</tr>
						 </thead>
						 <tbody>
							<?php 
							$i=1;
							while($row=mysqli_fetch_assoc($res)){?>
							<tr>
							   <td class="serial"><?php echo $i++?></td>
							   <td><?php echo $row['group_code']?></td>
							   <td><a href="edit_product_groups_code.php" class="btn btn-success btn-sm">Edit</a></td> 
							   <td><a href="delete_product_groups_code.php" class="btn btn-danger btn-sm">Delete</a></td> 
							</tr>
							<?php } ?>
						 </tbody>
					  </table>
				   </div>
				</div>
			 </div>
		  </div>
	   </div>
	</div>
</div>
<?php
require('footer.php');
?>

