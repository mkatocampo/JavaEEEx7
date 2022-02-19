<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Read Cookie Value</title>
</head>
<body>
<% 
Cookie[] cookieArray = request.getCookies();
for (int i = 0; i < cookieArray.length; i++) {
    if (cookieArray[i].getName().equals("Name")){
    	out.print("Name of the cookie: " + cookieArray[i].getName() + "<br>");
    	out.print("Value of the cookie: " + cookieArray[i].getValue() + "<br>");
    }
}
%>
</body>
</html>