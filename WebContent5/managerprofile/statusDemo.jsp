<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>status</title>
<style>
	.statusContainer{
	  overflow: hidden;
	  outline: none;
	}
	
	.sbtn{
		padding: 12px 0;
		margin-bottom: 10px;
		border-radius: 3px;
		border: 2px solid transparent;
		text-align: center;
		width: 100%;
		font-size: 16px;
		transition: border .2s, background-color .2s;
		background-color:#000000;
		color: #fff;
		line-height: 25px;
		cursor: pointer;
	}
	.snackbar {
		left: 50%;
		bottom: 0;
		z-index: 3;
		width: 60%;
		height: 0px;
		margin-left: -30%;
		line-height: 50px;
		position: absolute;
		background-color: white;
		transition: all .3s;
	  border-top: 0px;
		overflow: hidden;
	}
	
	.snackbar.active {
		height: 50px;
	  border-top: 2px solid #222222;
	}
	
	.snackbar > span {
		border: 0;
		float: left;
		color: #222222;
		cursor: pointer;
		font-size: 15px;
		margin-left: 3%;
	  font-weight: bold;
		font-family: 'Lato';
		background: transparent;
		text-transform: uppercase;
	}
	
	.snackbar > button {
		border: 0;
	  width:15%;
	  height:100%;
		float: right;
		color: #222222;
		display: block;
		cursor: pointer;
	  font: 16px 'Lato';
		position: relative;
		background: transparent;
	}
	#myDIV {
	  text-align: center;
 		transition: 1s ease-in;
	}
	.modal-container{
	  width: 560px;
	  position: fixed;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  z-index: 3;
	  background-color: #000;
	  color:#fff;
	  padding: 40px;
	  border-radius: 10%;
	  font-family: Arial, Helvetica, sans-serif !important;
	  border:solid 5px;
	  .fa{
	    color: #f1b434;
	    margin-right: 5px;
	    font-size: 25px;
	  }
	  .modal-title{
	    width: 50%;
	    text-align: center;
	    color: #000000;
	    font-size: 18px;
	    margin-left: 30%;
	    margin-bottom: 30%;
	    font-weight: 600;
	  }
	    .title-text{
	      line-height: 2;
	    }
	  .button-bar{
		margin-left: 18%;
	  	margin-right: 18%;
	  }
	}
	
	.modal-button{
	  font-size: 16px;
	  font-weight: bold;
	  margin-top: 10%;
	  min-width: 165px;
	  max-width: 165px;
	  text-align: center;
	  font-family: Arial;
	  border-radius: 2rem;
	  white-space: nowrap;
	  padding: 5px 10px 5px 10px;
	  cursor: pointer;
	  background-color: #ffffff;
	  border: 2px solid #000000;
	  &:hover{
	    background-color: #000000;
	    color: #ffffff;
	  }
	}
	
	.fl-r{
	  float: right;
	}
	
	.fl-l{
	  float: left;
	}

	.statusForm input{
		color:black;
		padding: 12px 0;
		margin-bottom: 10px;
		border-radius: 3px;
		border: 2px solid transparent;
		text-align: center;
		width: 100%;
		font-size: 16px;
		transition: border .2s, background-color .2s;
	}
	form .field{
		background-color: #ECF0F1;
	}
	form .field:focus {
		border: 2px solid #000000;
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
    .statusContainer h1, table { 
		text-align: center; 
    	margin:0;
	}
	.statusContainer table {
		border-collapse: collapse;  
		width: 80%; 
		margin: 0 auto 5rem;
	}
	.statusContainer th, td { 
		padding: 2.5% 0 2.5% 0; 
	}
	
	.statusContainer tr {
		background: #fff; 
	}
	
	.statusContainer tr, td { 
		transition: .00001s ease-in; 
	} 
	.statusContainer td{
		font-size:16px;
	}
	.statusContainer tr:first-child {
		background: #666666; 
		color:#ffffff;
	}
		
	.statusContainer tr:hover{
		background: #595959;
		color:#008000; 
		pointer-events: visible;
		color:#fff;
		opacity:0.5;
	}
	.sbt{
		color:#000;
	}
</style>
</head>
<body>
	<div class="statusContainer">
		<form method="post" action="" class="userForm">
			<div id="section1">
				<input type="text" placeholder="username" class="field" name="user">
				<input type="submit" value="Confirm" class="btn" name="confirm">
			</div>
		</form>
		<%@ include file="../connection.jsp" %>
		<%
			String lid="",type="",sp="",mid="",mid2="",uid="",uid2="",pass="";
			String aid="",amt="",status="";
			int prd=0,minst=0;
			boolean flag=false,flag1=false;
			PreparedStatement ps3=null,ps2=null,ps1=null,ps=null;
			ResultSet rs3=null,rs2=null,rs1=null,rs=null;
			session.setAttribute("uid2",request.getParameter("user"));
			mid=(String)session.getAttribute("user");
			if(("Confirm").equals(request.getParameter("confirm"))){
					if(conTrue){
						uid=request.getParameter("user");
						try{
							ps=con.prepareStatement("select * from customer");
							rs=ps.executeQuery();
							while(rs.next()){
								if(rs.getString(1).equals(uid)){
									flag=true;
									break;
								}
							}
							if(flag){
								ps1=con.prepareStatement("select * from loan_applications where user_id='"+uid+"'");
								rs1=ps1.executeQuery();
								rs1.next();
								aid=rs1.getString(1);
								lid=rs1.getString(2);
								uid=rs1.getString(3);
								amt=rs1.getString(4);
								minst=rs1.getInt(5);
								prd=rs1.getInt(6);
								status=rs1.getString(7);
								%>
								<h1 style="font-size:40px;font-weight:bold;text-align:center;">Loan Details</h1>
								<table id="">
								<tr>
									<th>Application ID</th>
									<td><%=aid%></td>
								</tr>
								<tr>
									<th>Loan ID</th>
									<td><%=lid%></td>
								</tr>
								<tr>
									<th>User ID</th>
									<td><%=uid%></td>
								</tr>
								<tr>
									<th>Amount</th>
									<td><%=amt%></td>
								</tr>
								<tr>
									<th>Monthly Installment</th>
									<td><%=minst%></td>
								</tr>
								<tr>
									<th>Period</th>
									<td><%=prd%></td>
								</tr>
								<tr>
									<th>Status</th>
									<td><%=status%></td>
								</tr>
								</table>
							<%
							}
							else{
								%>
								<script>
								alert("Invalid Username or Password!")
								</script>
								<%
							}
						}catch(Exception e){
							e.printStackTrace();
						}
					}
			}
		%>
		<%
				if(("Yes, Confirm").equals(request.getParameter("y"))){
					uid2=request.getParameter("newID");
					mid2=request.getParameter("newMID");
					System.out.println("user id2 : "+uid2);
					if(conTrue){
						try{
							ps3=con.prepareStatement("select * from manager where user_id='"+mid+"'");
							rs3=ps3.executeQuery();
							rs3.next();
							pass=rs3.getString(8);
							System.out.println("Password : "+pass);
							System.out.println("Confirm Password : "+request.getParameter("password"));
							System.out.println("user id : "+uid2);
							System.out.println("manager id : "+mid);
							if(pass.equals(request.getParameter("password"))){
								flag1=true;
							}
							if(flag1){
								ps2=con.prepareStatement("update loan_applications set status='Sanctioned' where user_id=?");
								ps2.setString(1,uid2);
								rs2=ps2.executeQuery();
								
							}
							else{
								%>
								<script>
								alert("Invalid Password!")
								</script>
								<%
							}
						}catch(Exception e){
							e.printStackTrace();
						}
					}
			}
		%>
		<button class="sbtn" onclick="myFunction()" id="sanc">Sanctioned</button>
	
		<div class="modal-container" id="myDIV" style="display:none;">
			<span class="modal-title"><i class="fa fa-exclamation-triangle"></i><span class="title-text">Please Confirm Your Change</span></span>
			<div class="modal-content">
			</div>
			<form method="post" action="" class="statusForm">
				<div class="button-bar">
					<input type="hidden" name="newID" value="<%= uid %>"/>
					<input type="hidden" name="newMID" value="<%= mid %>"/>
					<input type="password" placeholder="password" class="field" name="password">
					<input type="submit" class="modal-button fl-l sbt" value="Yes, Confirm" name="y" onclick="showSnackBar()">
					<input type="submit" class="modal-button fl-r sbt" value="NO" name="x" onclick="myFunction()">
				</div>
			</form>
			
		</div>
	
	<div class="snackbar" >
		<span></span>
		<button onclick="hideSnackBar()">OK</button>
	</div>
	<script>
		function myFunction() {
		  var x = document.getElementById("myDIV");
		  if (x.style.display === "none") {
		    x.style.display = "block";
		  } else {
		    x.style.display = "none";
		  }
		}
		
		snackBarSetMessage("Loan Sanctioned");
		function hideSnackBar() {
		  document.querySelector(".snackbar").classList.remove("active");
		}
		
		function showSnackBar() {
		  document.querySelector(".snackbar").classList.add("active");
		}
		
		function snackBarSetMessage(message) {
		  document.querySelector(".snackbar > span").innerHTML = message;
		}
	</script>
	</div>
</body>
</html>

