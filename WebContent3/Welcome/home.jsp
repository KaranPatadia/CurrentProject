<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <style>
  /* Make the image fully responsive */
  .carousel-inner img {
      width: 100%;
      height: 100%;
  }
	.homeContainer {
		top: 0px;
	}
	.homeContainer h1{
		font-size: 50px;
		margin: 0px 0 0 0;
		color: 	#ffffff;
		display:inline-block;
		padding:0;
	}

  .slogan h2{
  	color: #ffffff;
  	margin:0px 12% 5px 12%;
  	text-align:center;
  	font-family: "Cinzel Decorative",Georgia, serif;
  }
  blockquote:before {
  content: '\201C';
  position: relative;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 3rem;
  height: 0;
  font: 6em/1.08em 'PT Sans', sans-serif;
  color: #666;
  text-align: center;
}
blockquote:after {
  display: block;
  text-align: right;
  font-size: 0.875em;
  color: #e74c3c;
}
  </style>
</head>
<body>
	<div class="homeContainer">
		<div class="heading">
				<h1>Préstamo</h1>
		</div>
		<div id="demo" class="carousel slide" data-ride="carousel">
		
		  <!-- Indicators -->
		  <ul class="carousel-indicators">
		    <li data-target="#demo" data-slide-to="0" class="active"></li>
		    <li data-target="#demo" data-slide-to="1"></li>
		    <li data-target="#demo" data-slide-to="2"></li>
		    <li data-target="#demo" data-slide-to="3"></li>
		    <li data-target="#demo" data-slide-to="4"></li>
		  </ul>
		  
		  <!-- The slideshow -->
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="../Pictures/Intro.png" alt="loan" width="1100" height="500">
		    </div>
		    <div class="carousel-item">
		      <img src="../Pictures/loan.png" alt="loan" width="1100" height="500">
		    </div>
		    <div class="carousel-item">
		      <img src="../Pictures/EMI.png" alt="emi" width="1100" height="500">
		    </div>
		    <div class="carousel-item">
		      <img src="../Pictures/Loandisbursal.png" alt="loandisbursal" width="1100" height="500">
		    </div>
		    <div class="carousel-item">
		      <img src="../Pictures/Minimal.png" alt="minimal" width="1100" height="500">
		    </div>
		  </div>
		  
		  <!-- Left and right controls -->
		  <a class="carousel-control-next" href="#demo" data-slide="next">
		    <span class="carousel-control-next-icon"></span>
		  </a>
		</div>
		
		<div class="slogan">
			<blockquote>
			<h2>"A debt is just as hard for a government to pay as it is for an individual. No debt ever comes due to good time. Borrowing is the only thing that seems hardy all the time."</h2>
			</blockquote>
		</div>
		<br><br>
	</div>
</body>
</html>