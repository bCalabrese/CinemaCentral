<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="userBean" class="account.UserAccount" scope="session"/>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Cinema Central</title>
	</head>
	<body>
		<h1>Hello from landing!</h1>
		<%
			if (!userBean.isSessionValid()) {
				// user has not logged in or session has been invalidated
				response.sendRedirect("index.jsp");
			}
		%>
		
		
	</body>
</html>