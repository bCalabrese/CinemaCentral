<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--<jsp:useBean id="userBean" class="account.UserAccount" scope="session"/>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Plan</title>
</head>
<body>
	<h1 style="text-align: center">Payment Plan</h1>
	<!-- 	<ul style="text-align:center">
		<li>Silver</li>
		<li>gold</li>
		<li>platinum</li>
	</ul> -->
	<table cellspacing="25" style="width:100%; border: 1px solid black;">
		<tr>
			<th style="width:33%">Ranking</th>
			<th style="width:33%">Description</th>
			<th style="width:33%">Price</th>
		</tr>
		<tr>
			<td style="width:33%; text-align: center ; border: 1px solid black;">Silver</td>
			<td style="width:33%; text-align: center">
				Can only play movies on one screen
			</td>
			<td style="width:33%; text-align: center">$9.99/month</td>
		</tr>
		<tr>
			<td style="width:33%; text-align: center; border: 1px solid black;">Gold</td>
			<td style="width:33%; text-align: center">
				Able to play movies on two different screens
			</td>
			<td style="width:33%; text-align: center">$11.99/month</td>
		</tr>
		<tr>
			<td style="width:33%; text-align: center; border: 1px solid black;">Platinum</td>
			<td style="width:33%; text-align: center">
				Able to play movies on four different screens
			</td>
			<td style="width:33%; text-align: center">$12.99/month</td>
		</tr>
	</table>
</body>
</html>