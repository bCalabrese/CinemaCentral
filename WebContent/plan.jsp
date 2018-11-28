<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="dao.*"%>
<%@ page import="object.*"%>

<!DOCTYPE html5>
<html>
<head>
<style>
div.a {
    border: 2px solid black;
    outline: 4px solid black;
}
</style>
<%@ include file="/WEB-INF/shared/resources.jspf"%>
<meta charset="ISO-8859-1">
<title>Cinema Central</title>
<script src="validate.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/shared/header.jspf"%>
	<h1 align="center">Payment Options	</h1>
	<%
		if (!CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("silver")) 
		{
			if(CardDao.doesMemberExist(userBean.getMemberID()))
			{
				out.print("<a href=\"index.jsp"+ "\"");
			}
			else
			{
				out.print("<a href=\"payment.jsp"+ "\"");
			} 
		}
	%>
	<div style="background-color: #C0C0C0"class="col-sm-offset-1 col-sm-10 form-group text-muted">
	<%
		if (CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("silver")) 
		{
			if(CardDao.doesMemberExist(userBean.getMemberID()))
			{
				out.print("<div class=\"a\" class=\"col-sm-12\">");
			}
			else
			{
				out.print("<div class=\"col-sm-12\">");
			} 
		}
	%>
			<h1 align="center">Silver</h1>
			<h3 align="center">Downloads Per Month: 1</h3>
			<h3 align="center">Monthly Cost: $3.95</h3>
		</div>
	</div>
	<%
		if (!CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("silver")) 
		{
			out.print("</a>");
		}
	%>
	
	<%
		if (!CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("gold")) 
		{
			if(CardDao.doesMemberExist(userBean.getMemberID()))
			{
				out.print("<a href=\"index.jsp"+ "\"");
			}
			else
			{
				out.print("<a href=\"payment.jsp"+ "\"");
			} 
		}
	%>
	<div style="background-color: #FFD700" class="col-sm-offset-1 col-sm-10 form-group text-muted">
	<%
		if (CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("gold")) 
		{
			if(CardDao.doesMemberExist(userBean.getMemberID()))
			{
				out.print("<div class=\"a\" class=\"col-sm-12\">");
			}
			else
			{
				out.print("<div class=\"col-sm-12\">");
			} 
		}
	%>
			<h1 align="center">Gold</h1>
			<h3 align="center">Downloads Per Month: 2</h3>
			<h3 align="center">Monthly Cost: $6.95</h3>
		</div>
	</div>
	<%
		if (!CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("gold")) 
		{
			out.print("</a>");
		}
	%>
	
	<%
		if (!CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("platinum")) 
		{
			if(CardDao.doesMemberExist(userBean.getMemberID()))
			{
				out.print("<a href=\"index.jsp"+ "\"");
			}
			else
			{
				out.print("<a href=\"payment.jsp"+ "\"");
			} 
		}
	%>
	<div style="background-color: #E5E4E2" class="col-sm-offset-1 col-sm-10 form-group text-muted">
	<%
		if (CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("platinum")) 
		{
			if(CardDao.doesMemberExist(userBean.getMemberID()))
			{
				out.print("<div class=\"a\" class=\"col-sm-12\">");
			}
			else
			{
				out.print("<div class=\"col-sm-12\">");
			} 
		}
	%>
			<h1 align="center">Platinum</h1>
			<h3 align="center">Downloads Per Month: 3</h3>
			<h3 align="center">Monthly Cost: $9.95</h3>
		</div>
	</div>
	<%
		if (!CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("platinum")) 
		{
			out.print("</a>");
		}
	%>
</body>
</html>