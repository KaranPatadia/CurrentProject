<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.io.*" %>
<%@ page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html>
<head>
<style>
		*{
			box-sizing: border-box;
		}
		body{
			background-color: #000000;
			font-family: "Arial", sans-serif;
			padding: 50px;
		}
		.getin{
			position: relative;
			margin-bottom:300px;
		}
		.col1,.col2{
			width: 45%;
			margin: auto;
			padding: 0 50px;
			margin-top: 6px;
			background-color: #fff;
			border-radius: 5px;
		}
		.col1{
			float: left;
			height: 550px;
		}
		.col2{
			float: right;
			height: 550px;
		}
		.section1{
			margin-top:50px;
		}
		/* vertical line */
		.vl {
		  position: absolute;
		  left: 50%;
		  transform: translate(-50%);
		  border: 2px solid #ddd;
		  height: 550px;
		}
		/* text inside the vertical line */
		.vl-innertext {
		  position: absolute;
		  top: 50%;
		  transform: translate(-50%, -50%);
		  background-color: #f1f1f1;
		  border: 1px solid #ccc;
		  border-radius: 50%;
		  padding: 8px 10px;
		}
		
		 h1.loginHeader{
		 	width: 70%;
			color: #000000;
			font-size: 32px;
			margin: 5px auto;
			margin-bottom: 20px;
			margin-left: 15%;
			padding-top:5%;
			text-align: center;
		}
		form.loginForm{
			/*padding: 15px;*/
			text-align: center;
		}
		.loginForm input{
			padding: 12px 0;
			margin-bottom: 10px;
			border-radius: 3px;
			border: 2px solid transparent;
			text-align: center;
			width: 90%;
			font-size: 16px;
			transition: border .2s, background-color .2s;
		}
		form .field{
			background-color: #ECF0F1;
		}
		form .field:focus {
			border: 2px solid #000000;
		}
		#cty,#st,#pin,#ph{
			width:45%;
		}
		form .btn{
			background-color:#000000;
			color: #fff;
			line-height: 25px;
			cursor: pointer;
		}
		form .btn:hover,
		form .btn:active {
			background-color: #ffffff;
      		color: #000000;
			border: 2px solid #000000;
      
		}
		.pass-link{
			text-align: center;
		}
		.pass-link a:link,
		.pass-link a:visited{
			font-size: 12px;
			color: #777;
		}
		.getin .heading h1{
			
			font-size: 50px;
			margin: 40px 0 0 0;
			color: 	#ffffff;
			display:inline-block;
			padding:0;
		}
		
		.typeUser{
			margin-top: 35%;
		}
		.typeUser input {
		    visibility:hidden;
		}
		.typeUser label {
		    cursor: pointer;
		    border: 0px;
			border-radius:10%;
			padding:5% 3% 5% 3%;
			background-color: #f2f2f2;
		}
		.typeUser input:checked + label {
		    background-color: #000000;
		    color: #ffffff;
			padding:5% 7% 5% 7%;
		}
</style>
</head>


<body>
	<div class="getin">
		<div class="heading">
				<h1>Get in..</h1>
		</div>
		<div class="vl">
	        <span class="vl-innertext">or</span>
	    </div>
		<div class="col1">
			<div class="section1">
				<h1 class="loginHeader">Login</h1>
				<form method="post" action="" class="loginForm">
					<input type="text" placeholder="username" class="field" name="l-user">
					<input type="password" placeholder="password" class="field" name="l-password">
					<input type="submit" value="Login" class="btn" name="login">
				</form>
				<div class="pass-link">
					<a href="#" >Lost your password?</a>
				</div>	
			</div>
			<div class="section2">
				<div class="typeUser">
			        <input type='radio' value='1' name='radio' id='radio1' checked/>
			        <label for='radio1'>Customer</label>
			        <input type='radio' value='2' name='radio'  id='radio2'/>
			        <label for='radio2'>Officer</label>
			        <input type='radio' value='3' name='radio'  id='radio3'/>
			        <label for='radio3'>Manager</label>
			    </div>
		    </div>
		</div>
		
		<div class="col2">
			<h1 class="loginHeader">Register</h1>
			<form method="post" action="" class="loginForm">
				<input type="text" placeholder="Username" class="field" name="r-user" required>
				<input type="text" placeholder="Address" class="field" name="r-address" required>
				<input type="text" placeholder="State" class="field" name="r-state" id="st" required>
				<input type="text" placeholder="City" class="field" name="r-city" id="cty" required>
				<input type="text" placeholder="Pincode" class="field" name="r-pincode" id="pin" required>
				<input type="text" placeholder="Phone" pattern="[1-9]{1}[0-9]{9}" title="Enter 10 digit mobile number" class="field" name="r-phone" id="ph" required>
				<input type="password" placeholder="Password" class="field" name="r-password" required>
				<input type="password" placeholder="Confirm password" class="field" name="r-cpassword" required>
				<input type="submit" value="Register" class="btn" name="register">
			</form>
		</div>
	</div>
</body>
</html>
<%@ include file="../connection.jsp" %>
<%
	if("Login".equals(request.getParameter("login"))){
		%>
		<jsp:include page="../connection.jsp"></jsp:include>
		<%
		if(conTrue){
			PreparedStatement ps=null;
			ResultSet rs=null;
			boolean flag1=false,flag2=false;
			PrintWriter pw=response.getWriter();
			String user=request.getParameter("l-user");
			String pass=request.getParameter("l-password");
			pw.println(user);
			try{
				ps=con.prepareStatement("select * from customer");
				rs=ps.executeQuery();
				while(rs.next()) {
					if(user.equals(rs.getString(1)))
						flag1=true;
					if(pass.equals(rs.getString(8)))
						flag2=true;
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			if(rs==null){

				pw.println("not connected");
			}
			else{
				session.setAttribute("user",user);
				if(flag1==true && flag2==true){
					pw.println("Login Success");
					response.sendRedirect("../customerprofile/customerlogin.jsp");
				}
				else{
					%>
					<script>
						alert("Invalid Username or Password!")
					</script>
					<%
				}
			}
		}
	}
%>
<%
	if("Register".equals(request.getParameter("register"))){
		%>
		<jsp:include page="../connection.jsp"></jsp:include>
		<%
		if(conTrue){
			PreparedStatement ps=null;
			ResultSet rs=null;
			PrintWriter pw=response.getWriter();
			String nm=request.getParameter("r-user");
			String ad=request.getParameter("r-address");
			String st=request.getParameter("r-state");
			String cty=request.getParameter("r-city");
			String pin=request.getParameter("r-pincode");
			String ph=request.getParameter("r-phone");
			String pwd=request.getParameter("r-password");
			String uid="";
			pw.println("---------------------------"+nm);
			pw.println(ad);
			pw.println(st);
			pw.println(cty);
			pw.println(pin);
			pw.println(ph);
			pw.println(pwd);
			try{
				uid=nm.substring(0,2)+ph.substring(6,10);
				pw.println(uid);
				ps=con.prepareStatement("insert into customer values(?,?,?,?,?,?,?,?)");
				ps.setString(1,uid);
				ps.setString(2,nm);
				ps.setString(3,ad);
				ps.setString(4,st);
				ps.setString(5,cty);
				ps.setString(6,pin);
				ps.setString(7,ph);
				ps.setString(8,pwd);
				rs=ps.executeQuery();
			}
			catch(Exception e){
				e.printStackTrace();
			}
			if(rs==null){

				pw.println("not connected");
			}
			else{
				session.setAttribute("user",uid);
				pw.println("Registered");
				response.sendRedirect("../customerprofile/customerlogin.jsp");
			}
		}
	}
%>