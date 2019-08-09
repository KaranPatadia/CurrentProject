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
		  width: 12%;
		  position: fixed;
		  z-index: 1;
		  top: 0;
		  left: 0;
		  background-color: #000000;
		  overflow-x: hidden;
		  padding-top: 16px;
		  text-align:center;
		}
		
		.sidebar a {
		  padding: 6px 8px 6px 8px;
		  text-decoration: none;
		  font-size: 17px;
		  color: #818181;
		  display: block;
		  margin-bottom: 20px;
		  margin-left: 3px;
		}
		.sidebar p {
		  padding: 6px 8px 6px 8px;
		  text-decoration: none;
		  font-size: 17px;
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
		@media screen and (max-height: 450px) {
		  .sidebar {padding-top: 15px;}
		  .sidebar a {font-size: 18px;}
		}
		
		.sidebar i{
			font-size: 50px;
			margin-bottom: 5px;
		}
		img.logo {
		  width: 55%;
		  border-radius: 50%;
		  margin-bottom: 20px;
		}
		
	</style>
</head>
<body>
	
	<div class="sidebar">
		<img src="./Pictures/rupeelogo1.JPG" class="logo" alt="logo">
	  	<a href="#home"><i class="fa fa-fw fa-home"></i><br>Home</a>
		<a href="#about"><i class="fa fa-fw fa-user"></i><br>About Us</a>
		<a href="#contact"><i class="fa fa-fw fa-envelope"></i><br> Contact</a>
		<p> <%= session.getAttribute("user")%></p>
		<a href="../customerprofile/logout.jsp">Logout</a>
	</div>
	
</body>
</html>