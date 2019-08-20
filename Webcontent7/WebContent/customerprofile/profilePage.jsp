<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
	.body{
		background-color:#bfbfbf;
	}
	.card {
	  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	  max-width: 300px;
	  margin: auto;
	  text-align: center;
	  font-family: arial;
	}
	
	.title {
	  color: grey;
	  font-size: 18px;
	}
	
	button {
	  border: none;
	  outline: 0;
	  display: inline-block;
	  padding: 8px;
	  color: white;
	  background-color: #000;
	  text-align: center;
	  cursor: pointer;
	  width: 100%;
	  font-size: 18px;
	}
	
	a {
	  text-decoration: none;
	  font-size: 22px;
	  color: black;
	}
	
	button:hover, a:hover {
	  opacity: 0.7;
	}
	i{
		width: 7vh;
		height:7vh;
		border-radius: 50%;
		margin-bottom: 20px;
		margin-top : 5%;
		font-size:7vh;
	}
</style>
</head>
<body style="background-color:#bfbfbf;">
	<%@ include file="../connection.jsp" %>
	<h2 style="text-align:center">User Profile Card</h2>
	
	<div class="card" style="background-color:#fff;">
		<i class="fa fa-user" aria-hidden="true" style="border-radius: 50%;font-size:10vh;"></i>
	  <%
		if(conTrue){
			PreparedStatement ps=null;
			ResultSet rs=null;
			String uname;
			String uid=(String)session.getAttribute("user");
			
			ps=con.prepareStatement("select * from customer where user_id='"+uid+"'");
			rs=ps.executeQuery();
			rs.next();
			
			uname=rs.getString(2);
			String ph=rs.getString("phone_num");
		%>
	  <h1><%=uname %></h1>
	  <p class="title">User ID: <%=uid %></p>
	  <p>Phone: <%=ph %></p>
	  <p><button onclick="redirects()">Back</button></p>
	</div>
		<%} %>
</body>
</html>
<script>
	function redirects(){
		window.location.href = "customerlogin.jsp";
	}
</script>
