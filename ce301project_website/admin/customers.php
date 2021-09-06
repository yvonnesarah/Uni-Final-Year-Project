<?php
require('top.php');

if(isset($_GET['type']) && $_GET['type']!=''){
	$type=get_safe_value($con,$_GET['type']);
	if($type=='delete'){
		$id=get_safe_value($con,$_GET['id']);
		$delete_sql="delete from customers where customer_id='$customer_id'";
		mysqli_query($con,$delete_sql);
	}
}

$sql="select * from customers order by customer_id desc";
$res=mysqli_query($con,$sql);
?>
<div class="content pb-0">
	<div class="orders">
	   <div class="row">
		  <div class="col-xl-12">
			 <div class="card">
				<div class="card-body">
				   <h4 class="box-title">Customers </h4>
				</div>
				<div class="card-body--">
				   <div class="table-stats order-table ov-h">
					  <table class="table ">
						 <thead>
							<tr>
							   <th class="serial">Serial Number</th>
							   <th> Customer ID</th>
							   <th>First Name</th>
							   <th>Last Name</th>
							   <th>Gender</th>
							   <th>Email Address</th>
							   <th>Address</th>
							   <th>City</th>
							   <th>Country</th>
							   <th>Post Code</th>
							   <th></th>
							</tr>
						 </thead>
						 <tbody>
							<?php 
							$i=1;
							while($row=mysqli_fetch_assoc($res)){?>
							<tr>
							   <td class="serial"><?php echo $i++?></td>
							   <td><?php echo $row['customer_id']?></td>
							   <td><?php echo $row['first_name']?></td>
							   <td><?php echo $row['last_name']?></td>
							   <td><?php echo $row['gender']?></td>
							   <td><?php echo $row['email_address']?></td>
							   <td><?php echo $row['address']?></td>
							   <td><?php echo $row['city']?></td>
							   <td><?php echo $row['country']?></td>
							   <td><?php echo $row['postcode']?></td>
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
