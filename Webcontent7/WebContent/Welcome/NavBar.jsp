<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		body {font-family: "Lato", sans-serif;}
		
		.sidebar {
		  height: 100%;
		  width: 12vh;
		  position: fixed;
		  z-index: 1;
		  top: 0;
		  left: 0;
		  background-color: #111;
		  overflow-x: hidden;
		  padding-top: 16px;
		  text-align:center;
		  display:block;
		}
		
		.sidebar a {
		  padding: 6px 8px 6px 8px;
		  text-decoration: none;
		  font-size: 2vh;
		  color: #818181;
		  display: block;
		  margin-bottom: 20px;
		  margin-left: 3px;
		}
		
		.sidebar a:hover {
		  background-color: #555;
		  text-decoration:none;
		  color: white;
		  
		}
		@media screen and (max-width: 600px) {
		  .bars a.icon {
		    float: left;
		    display: block;
		  }
		  .bars{
		    position: absolute;
		    right: 0;
		    top: 0;
		    margin-left:0;
			width:100%;
			position:fixed;
			background-color: #000;
			color:#fff;
			float:left;
		  }
		  .sidebar{
		  	display:none;
		  	width:7vh;
		  }
		  .sidebar a{
		  	font-size: 1.5vh;
		    padding: 2px 1px 2px 1px;
		    text-decoration: none;
		    color: #818181;
		    display: block;
		    margin-bottom: 10px;
		    margin-left:0;
		  }
		  .sidebar i{
		  	font-size: 2vh;
			color: #fff;
			margin-bottom: 0;
		  }
		  .sidebar img.logo {
		    width: 7vh;
		    height:7vh;
		    border-radius: 50%;
		    margin-bottom: 10px;
		  }
			
		}
		@media screen and (min-width: 601px){
		  .bars{
		    position: absolute;
		    right: 0;
		    margin-left: 12vh;
		    top: 0;
			width:100%;
			position:fixed;
			background-color: #000;
			color:#fff;
			float:left;
		  }
		  #mysidebar{
		  	display:block;
		  }
		}
		.sidebar i{
			font-size: 5vh;
			margin-bottom: 5px;
			color: #ffffff;
		}
		img.logo {
		  width: 10vh;
		  height:10vh;
		  border-radius: 50%;
		  margin-bottom: 20px;
		}
	</style>
	<script>
	
	function myFunction(){
		var x=document.getElementById("mysidebar");
		if(window.getComputedStyle(x).display === "none"){
		  	x.style.display="block";
		  	document.getElementById("mybar").style='padding-left:7vh';
		  	return;
		} 
		else{
			x.style.display="none";
			document.getElementById("mybar").style='padding-left:0vh';
		}
	}
	</script>
</head>
<body>
	
	<div class="bars">
		<a class="icon bars" id="mybar" onclick="myFunction()">
    	<i class="fa fa-bars"></i></a>
	</div>
	<div class="sidebar" id="mysidebar">
		<img src="../Pictures/rupeelogo1.JPG" class="logo" alt="logo">
	  	<a href="#home"><i class="fa fa-fw fa-home"></i><br>Home</a>
		<a href="#login"><i class="fa fa-fw fa-sign-in"></i><br>Start</a>
		<a href="#about"><i class="fa fa-fw fa-user"></i><br>About Us</a>
		<a href="#contact"><i class="fa fa-fw fa-envelope"></i><br>Contact</a>
	</div>
</body>
</html>
