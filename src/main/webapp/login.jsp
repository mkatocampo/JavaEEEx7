<%-- 
    Document   : login
    Created on : Jan 30, 2020, 6:38:27 AM
    Author     : Chris.Cusack
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/declarativemethods.jspf"%>
<%!
String userName = "";
String password = "";
boolean pref = false;
String correctUserName = "maria";
String correctPassword = "123456";%>

<%
errors=new ArrayList<String>();
if (request.getParameter("btnLogin") != null) {
	userName = checkRequiredField(request.getParameter("txtUserName"), "Username");
	password = checkRequiredField(request.getParameter("txtPassword"), "Password");

	if (errors.size() == 0 && password.equals(correctPassword) && userName.equals(correctUserName)) {
		if (request.getParameter("chkSave") != null) {
			Cookie cookieUserName = new Cookie("userName", userName);
			Cookie cookiePassword = new Cookie("password", password);
			Cookie cookieSave = new Cookie("save", "true");
			pref = true;
		
			cookieUserName.setMaxAge(60 * 60);
			cookieUserName.setPath("/JavaEEEx7");
			response.addCookie(cookieUserName);
		
			cookiePassword.setMaxAge(60 * 60);
			cookiePassword.setPath("/JavaEEEx7");
			response.addCookie(cookiePassword);
		
			cookieSave.setMaxAge(60 * 60);
			cookieSave.setPath("/JavaEEEx7");
			response.addCookie(cookieSave);
		} else {
			if (request.getCookies() != null) {
				Cookie[] cookies = request.getCookies();
		
				for (Cookie c : cookies) {
					if (c.getName().equals("userName")) {
						c.setMaxAge(0);
						c.setPath("/JavaEEEx7");
					}
		
					if (c.getName().equals("password")) {
						c.setMaxAge(0);
						c.setPath("/JavaEEEx7");
					}
		
					if (c.getName().equals("save")) {
						c.setMaxAge(0);
						c.setPath("/JavaEEEx7");
					}
		
					response.addCookie(c);
				}
			}
		}
		session.setAttribute("authenticatedUser",userName);
		session.setAttribute("authenticated",true);
		session.setMaxInactiveInterval(60);
		
		response.sendRedirect("index.jsp");
	}else{
		errors.add("Attempt failed");
	}
	
	if (request.getCookies() != null) {
		Cookie[] cookies = request.getCookies();

		for (Cookie c : cookies) {
			if (c.getName().equals("userName")) {
				userName = c.getValue();
			}

			if (c.getName().equals("password")) {
				password = c.getValue();
			}

			if (c.getName().equals("save")) {
				pref = Boolean.parseBoolean(c.getValue());
			}
		}
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<%@include file="WEB-INF/jspf/header.jspf"%>
</head>
<body>
	<div class="centered">
		<div class="left-align">
			<h1 class="centered-content">Login</h1>
			<%--Implementation here--%>
			<div class="inner-centered">
				<div class="form">
					<form name="form1" method="post" action="login.jsp">
						<table>
							<tr>
								<td class="width-100">User:</td>
								<td class="width-300"><input name="txtUserName"
									class="width-300" value='<%=userName%>' /></td>
							</tr>
							<tr>
								<td class="width-100">Password:</td>
								<td class="width-300"><input type="password"
									name="txtPassword" class="width-300" value='<%=password%>' /></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="chkSave" 
								<%if (pref){ %> 
									checked 
								<% } %>
								value='<%=pref%>' />Save</td>
								<td><input type="submit" name="btnLogin" value="Login"
									class="btn btn-primary" /></td>
							</tr>
							<tr>
								<td colspan="2">
									<div>
										<% if (!errors.isEmpty()){%>
											<ul>
												<%for (String err: errors) {%>
													<li><%=err %></li>
												<%} %>
											</ul>
										<%} %>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
