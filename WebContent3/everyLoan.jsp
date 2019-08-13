<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Loan Details</title>
<style>

	.loanDetailsContainer{
    		font-family: Helvetica Neue, Arial, sans-serif; 
    	}
		
		..loanDetailsContainer h1, table { 
			text-align: center; 
    		margin:0;
		}
		
		.loanDetailsContainer table {
			border-collapse: collapse;  
			width: 80%; 
			margin: 0 auto 5rem;
		}
		
		.loanDetailsContainer th, td { 
			padding: 2.5%; 
		}
		
		.loanDetailsContainer tr {
			background: #fff; 
		}
		
		.loanDetailsContainer tr, td { 
			transition: .3s ease-in; 
		} 
		.loanDetailsContainer td{
			font-size:16px;
		}
		.loanDetailsContainer td:empty {
			background: #bfbfbf; 
		}
		.loanDetailsContainer tr:first-child {
			background: #262626; 
			color:#ffffff;
		}
		.loanDetailsContainer tr:hover:not(#firstrow){
			background: #e6e6e6;
			pointer-events: visible;
			color:#000;
		}
</style>
</head>
<body>
	<div class="loanDetailsContainer">
		<h1 style="font-size:40px;font-weight:bold;text-align:center;">Loan Details</h1>
											
		<table id="">
			<tr id="firstrow">
				<th>Application ID</th>
				<th>Loan ID</th>
				<th>User ID</th>
				<th>Amount</th>
				<th>Monthly Installment</th>
				<th>Period</th>
				<th>Status</th>
			</tr>
			
			<%@ include file="../connection.jsp" %>
			<%
				String lid="",type="",sp="",uid="",uid2="";
				String aid="",amt="",status="";
				int prd=0,minst=0;
				if(conTrue){
					PreparedStatement ps=null;
					ResultSet rs=null;
					PrintWriter pw1=response.getWriter();
					try{
						ps=con.prepareStatement("select * from loan_applications");
						rs=ps.executeQuery();
						while(rs.next()) {
							aid=rs.getString(1);
							lid=rs.getString(2);
							uid=rs.getString(3);
							amt=rs.getString(4);
							minst=rs.getInt(5);
							prd=rs.getInt(6);
							status=rs.getString(7);
							%>
							<tr>
								<td><%=aid%></td>
								<td><%=lid%></td>
								<td><%=uid%></td>
								<td><%=amt%></td>
								<td><%=minst%></td>
								<td><%=prd%></td>
								<td><%=status%></td>
							</tr>
						<%
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			%>
		</table>
	</div>
</body>
</html>