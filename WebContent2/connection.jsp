<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<% 
	boolean conTrue=false;
	Connection con=null;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
	}catch(Exception e){
		e.printStackTrace();
	}
	if(con==null){
		%>
		<script>
			alert("Server Issue")
		</script>
		<%
	}
	else{
		conTrue=true;
	}
%>