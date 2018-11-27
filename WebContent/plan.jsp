<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/shared/validatesession.jspf"%>
<%@ page import="dao.*"%>
<%@ page import="object.*"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/shared/resources.jspf"%>
<meta charset="ISO-8859-1">
<title>Cinema Central</title>
<script src="validate.js"></script>
</head>
<body>
	<%
		Card card = CardDao.getInformation(userBean.getMemberID());
	%>
	<%@ include file="/WEB-INF/shared/header.jspf"%>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">Ranking</th>
				<th scope="col">Description</th>
				<th scope="col">Price</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td><button type="button">Silver</button></td>
				<td>Otto</td>
				<td>@mdo</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td><button type="button">Gold</button></td>
				<td>Thornton</td>
				<td>@fat</td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td><button type="button">Platinum</button></td>
				<td>the Bird</td>
				<td>@twitter</td>
			</tr>
		</tbody>
	</table>
</body>
</html>