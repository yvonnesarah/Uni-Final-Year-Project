<?php
require('top.php');

if(isset($_GET['type']) && $_GET['type']!=''){
	$type=get_safe_value($con,$_GET['type']);
	if($type=='delete'){
		$id=get_safe_value($con,$_GET['id']);
		$delete_sql="delete from customer_orders where order_id='$order_id'";
		mysqli_query($con,$delete_sql);
	}
}

$sql="select * from customer_orders";
$res=mysqli_query($con,$sql);
?>
<div class="content pb-0">
	<div class="orders">
	   <div class="row">
		  <div class="col-xl-12">
			 <div class="card">
				<div class="card-body">
				   <h4 class="box-title">Customers Orders </h4>
				</div>
				<div class="card-body--">
				   <div class="table-stats order-table ov-h">
					  <table class="table ">
						 <thead>
							<tr>
							   <th class="serial">Serial Number</th>
							   <th> Order ID</th>
							   <th>Customer ID</th>
							   <th>Total Price</th>
							   <th>Order Date</th>
							   <th>Order Status Name</th>
							   <th></th>
							</tr>
						 </thead>
						 <tbody>
							<?php 
							$i=1;
							while($row=mysqli_fetch_assoc($res)){?>
							<tr>
							   <td class="serial"><?php echo $i++?></td>
							   <td><?php echo $row['order_id']?></td>
							   <td><?php echo $row['customer_id']?></td>
							   <td><?php echo $row['total']?></td>
							   <td><?php echo $row['order_date']?></td>
							   <td><?php echo $row['order_status_name']?></td>
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

