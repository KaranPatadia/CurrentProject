<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Example</title>
</head>
<body>

<form name="form-name" action="" method="get">

    <input name="goto" type="submit" value="Login"> 
     <input type="radio" name="myradio" value="1" id="radio1" checked="checked"/> 
     <label for='radio1'>Customer</label>
     <input type="radio" name="myradio" value="2" id="radio1"/>
	<label for='radio1'>Customer</label>
     <input type="radio" name="myradio" value="3" id="radio1"/>Other
	<label for='radio1'>Customer</label>

</form>

</body>
</html>
<%
	if(("Login").equals(request.getParameter("goto"))){
    String myRadio= request.getParameter("myradio");
	out.println(myRadio);}
%>