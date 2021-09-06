<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li><a href="index.php"><span class="glyphicon glyphicon-home"></span>Home</a></li>
      <?php getCats(); ?>
    </ul>
    <ul class="nav navbar-nav navbar-right">
	 <!-- <li><a href="customer_account.php">Customer Account</a></li>-->
      <li><a href="customer_register.php"><span class="glyphicon glyphicon-user"></span> Register</a></li>
      <li><a href="customer_login.php"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	 <li><a href="products_basket.php"<span class="glyphicon glyphicon-shopping-cart"></span>Basket</a></li>
    </ul>
	</div>
	<form method="GET" class="search" action="products_results.php">
  <input type="text"  name="user_query" placeholder="Search for products here.." name="search">
  <button type="submit" name="search">Search<i class="fa fa-search"></i></button>
      </form>
</nav>
  