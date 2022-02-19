<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Cookie</title>
</head>
<body>
<% 
//create a cookie
Cookie cookie = new Cookie("name","Maria");
cookie.setMaxAge(300);

//add cookie to browser
response.addCookie(cookie);
%>
<br>
<a href="readCookie.jsp">Read the cookie</a>
<br/>
<a href="deleteCookie.jsp">Delete the cookie</a>
</body>
</html>