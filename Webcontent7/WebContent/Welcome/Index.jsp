<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="IndexCSS.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>Welcome Page</title>
</head>
<body class="maincontainer">
	<%@include file='NavBar.jsp' %>
	<div class="main" style="margin-left:12%;padding: 0px 10px;">
		<div id="home">
			<%@include file='home.jsp' %>
		</div>
		
		<div id="login">
			<%@include file='login.jsp' %>
		</div>
		
		<div id="about">
			<%@include file='aboutus.jsp'%>
		</div>
		
		<div id="contact">
			<%@include file='contact.jsp'%>
		</div>
		
		<div id="footer">
			<%@include file='../footer.jsp' %>
		</div>
	</div>
</body>
</html>