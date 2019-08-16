<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Loan By User</title>
<style>
		.userLoanContainer{
    		font-family: Helvetica Neue, Arial, sans-serif; 
    	}
		
		.userLoanContainer h1, table { 
			text-align: center; 
    		margin:0;
		}
		
		.userLoanContainer table {
			border-collapse: collapse;  
			width: 80%; 
			margin: 0 auto 5rem;
		}
		.userLoanContainer th, td { 
			padding: 2.5% 0 2.5% 0; 
		}
		
		.userLoanContainer tr {
			background: #fff; 
		}
		
		.userLoanContainer tr, td { 
			transition: .00001s ease-in; 
		} 
		.userLoanContainer td{
			font-size:16px;
		}
		.userLoanContainer tr:first-child {
			background: #666666; 
			color:#ffffff;
		}
		
		.userLoanContainer tr:hover{
			background: #595959;
			color:#008000; 
			pointer-events: visible;
			color:#fff;
			opacity:0.5;
		}
</style>
</head>
<body>
	<div class="userLoanContainer">
		<form method="get" action="" class="userLoanForm">
			<input type="text" name="user_id" class="field" placeholder="Enter User ID">
			<input type="submit" name="submit" value="View" class="btn">
		</form>
		<%@ include file="../connection.jsp" %>
		<%
			if(("View").equals(request.getParameter("submit"))){
					if(conTrue){
						String lid="",type="",sp="",uid="",uid2="";
						String aid="",amt="",status="";
						int prd=0,minst=0;
						boolean flag=false;
						PreparedStatement ps1=null,ps=null;
						ResultSet rs1=null,rs=null;
						uid=request.getParameter("user_id");
						try{
							ps=con.prepareStatement("select * from customer");
							rs=ps.executeQuery();
							while(rs.next()){
								uid2=rs.getString(1);
								if(uid2.equals(uid)){
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
	</div>
</body>
</html>
