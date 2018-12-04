<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="dao.*"%>
<%@ page import="object.*"%>
<%@ page import="servelet.*"%>

<!DOCTYPE html5>
<html>
<head>
<style>
.color {
	background-color: silver;
	border: 4px solid black;
    outline: 4px solid black;
}

.coloring {
	background-color: gold;
    border: 2px solid black;
    outline: 4px solid black;
}

.colorings {
	background-color: E5E4E2;
    border: 2px solid black;
    outline: 4px solid black;
}
.colors {
	background-color: CCFFCC;
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
			out.print("<a href=\"Plan?membership=silver\"");
		}
	%>
	<%
		if (CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("silver")) 
		{
			out.print("<div class=\"color col-sm-offset-1 col-sm-10 form-group text-muted\">");
		}
		else
		{
			out.print("<div style=\"background-color: silver\" class=\"col-sm-offset-1 col-sm-10 form-group text-muted\">");
		} 
	%>
			<div class="col-sm-12">
			<h1 align="center">Silver</h1>
			<h3 align="center">Downloads Per Month: 3</h3>
			<h3 align="center">Monthly Cost: $3.95</h3>
		</div>
	<%
		out.print("</div>");
		if (!CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("silver")) 
		{
			out.print("</a>");
		}
	%>
	

	<%
		if (!CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("gold")) 
		{
			out.print("<a href=\"Plan?membership=gold\"");
		}
		if (CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("gold")) 
		{
			out.print("<div class=\"coloring col-sm-offset-1 col-sm-10 form-group text-muted\">");
		}
		else
		{
			out.print("<div style=\"background-color: gold\" class=\"col-sm-offset-1 col-sm-10 form-group text-muted\">");
		} 
	%>
			<div class="col-sm-12">
			<h1 align="center">Gold</h1>
			<h3 align="center">Downloads Per Month: 4</h3>
			<h3 align="center">Monthly Cost: $6.95</h3>
		</div>
	<%
		out.print("</div>");
		if (!CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("gold")) 
		{
			out.print("</a>");
		}
	%>
	
	<%
		if (!CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("platinum")) 
		{
			out.print("<a href=\"Plan?membership=platinum\"");
		}
		if (CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("platinum")) 
		{
			out.print("<div class=\"colorings col-sm-offset-1 col-sm-10 form-group text-muted\">");
		}
		else
		{
			out.print("<div style=\"background-color: E5E4E2\" class=\"col-sm-offset-1 col-sm-10 form-group text-muted\">");
		} 
	%>
			<div class="col-sm-12">
			<h1 align="center">Platinum</h1>
			<h3 align="center">Downloads Per Month: 6</h3>
			<h3 align="center">Monthly Cost: $9.95</h3>
		</div>
	<%
		out.print("</div>");
		if (!CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("platinum")) 
		{
			out.print("</a>");
		}
	%>
	
	<%
		if (!CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("none")) 
		{
			out.print("<a href=\"Plan?membership=none\"");
		}
		if (CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("none")) 
		{
			out.print("<div class=\"colors col-sm-offset-1 col-sm-10 form-group text-muted\">");
		}
		else
		{
			out.print("<div style=\"background-color: #CCFFCC\" class=\"col-sm-offset-1 col-sm-10 form-group text-muted\">");
		} 
	%>
			<div class="col-sm-12">
			<h1 align="center">None</h1>
			<h3 align="center">Downloads Per Month: 1</h3>
			<h3 align="center">Monthly Cost: Free</h3>
		</div>
	<%
		out.print("</div>");
		if (!CardDao.getTierName(userBean.getMemberID()).toLowerCase().equals("none")) 
		{
			out.print("</a>");
		}
	%>
</body>
</html>