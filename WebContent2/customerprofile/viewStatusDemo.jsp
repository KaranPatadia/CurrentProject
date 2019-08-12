<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

    	.viewStatusContainer{
    		font-family: Helvetica Neue, Arial, sans-serif; 
    	}
		
		..viewStatusContainer h1, table { 
			text-align: center; 
    		margin:0;
		}
		
		.viewStatusContainer table {
			border-collapse: collapse;  
			width: 80%; 
			margin: 0 auto 5rem;
		}
		.viewStatusContainer th, td { 
			padding: 2.5% 0 2.5% 0; 
		}
		
		.viewStatusContainer tr {
			background: #fff; 
		}
		
		.viewStatusContainer tr, td { 
			transition: .00001s ease-in; 
		} 
		.viewStatusContainer td{
			font-size:16px;
		}
		.viewStatusContainer tr:first-child {
			background: #666666; 
			color:#ffffff;
		}
		
		.viewStatusContainer tr:hover{
			background: #595959;
			color:#008000; 
			pointer-events: visible;
			color:#fff;
			opacity:0.5;
		}
</style>
</head>
<body>
<div class="viewStatusContainer">
	<h1 style="font-size:40px;font-weight:bold;text-align:center;">Loan Details</h1>
	<table id="racetimes">
		<%@ include file="../connection.jsp" %>
			<table id="racetimes">
			<%
				if(conTrue){
					String lid,type,sp;
					int prd;;
					String uid;
					PreparedStatement ps1=null;
					ResultSet rs5=null;
					String aid,amt,status;
					int minst;
					uid=(String)session.getAttribute("user");
					PrintWriter pw1=response.getWriter();
					try{
						ps1=con.prepareStatement("select * from loan_applications where user_id='"+uid+"'");
						rs5=ps1.executeQuery();
						rs5.next();
						aid=rs5.getString(1);
						lid=rs5.getString(2);
						amt=rs5.getString(4);
						minst=rs5.getInt(5);
						prd=rs5.getInt(6);
						status=rs5.getString(7);
						%>
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
						<%
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			%>
		</table>
	</div>
</body>
</html>