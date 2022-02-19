<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Cookie[] cookieArray = request.getCookies();
for (int i = 0; i < cookieArray.length; i++) {
    if (cookieArray[i].getName().equals("Name")){
    	cookieArray[i].setMaxAge(0);
    	response.addCookie(cookieArray[i]);
    }
}
%>
</body>
</html>