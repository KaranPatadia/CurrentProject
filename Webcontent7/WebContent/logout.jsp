<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	session.removeAttribute("user");
	session.removeAttribute("lid");
	session.removeAttribute("aid");
	session.removeAttribute("amt");
	session.removeAttribute("minst");
	session.removeAttribute("rate");%>
	String s=<% session.getAttribute("user");
	response.sendRedirect("./Welcome/Index.jsp");
	%>
	