<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
    <title>Simple Beautiful Table</title>
    <style>
    	.loanDetailsContainer{
    		font-family: Helvetica Neue, Arial, sans-serif; 
    	}
		
		..loanDetailsContainer h1, table { 
			text-align: center; 
		}
		
		.loanDetailsContainer table {
			border-collapse: collapse;  
			width: 70%; 
			margin: 0 auto 5rem;
		}
		
		.loanDetailsContainer th, td { 
			padding: 3.5%; 
		}
		
		.loanDetailsContainer tr {
			background: #bfbfbf; 
		}
		
		.loanDetailsContainer tr, td { 
			transition: .00001s ease-in; 
		} 
		.loanDetailsContainer td{
			font-size:16px;
		}
		.loanDetailsContainer td:empty {
			background: #bfbfbf; 
		}
		.loanDetailsContainer tr:first-child {
			background: #666666; 
			color:#ffffff;
		}
		
		.loanDetailsContainer tr:nth-child(even) { 
			background: #bfbfbf; 
		}
		.loanDetailsContainer tr:hover:not(#firstrow){
			background: #000;
			color:#008000; 
			pointer-events: visible;
			color:#fff;;
		}
		.loanDetailsContainer tr:hover:not(#firstrow) { 
			transform: scale(1.05); 
			font-weight:bold;
			color:#fff; 
			box-shadow: 0px 3px 7px rgba(0, 0, 0, 0.5);
		}
		    
    </style>
</head>
<body>
	<div class="loanDetailsContainer">
		<h1>Race Times</h1>
	
		<table id="racetimes">
			<tr id="firstrow">
				<th>Loan ID</th>
				<th>Type</th>
				<th>Period</th>
				<th>Rate of Interest</th>
				<th>Special Features</th>
			</tr>
			<%@ include file="../connection.jsp" %>
			<%
				String lid,type,sp;
				int prd;
				double rate;
				if(conTrue){
					PreparedStatement ps=null;
					ResultSet rs=null;
					PrintWriter pw=response.getWriter();
					try{
						ps=con.prepareStatement("select * from loan_details");
						rs=ps.executeQuery();
						while(rs.next()) {
							lid=rs.getString(1);
							type=rs.getString(2);
							prd=rs.getInt(3);
							rate=rs.getDouble(4);
							sp=rs.getString(5);
							%>
							<tr>
								<td><%=lid%></td>
								<td><%=type%></td>
								<td><%=prd%></td>
								<td><%=rate%></td>
								<td><%=sp%></td>
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