<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="userBean" class="account.UserAccount" scope="session"/>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/shared/resources.jspf" %>
		<meta charset="ISO-8859-1">
		<title>Cinema Central</title>
		<script src="validate.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/shared/landing.jspf" %>
	<%@ include file="/WEB-INF/shared/handleerror.jspf" %>
	</body>
</html>