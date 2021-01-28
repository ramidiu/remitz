<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin List</title>
</head>
<body>
<%@include file="backendheader.jsp"%>
<div style="margin: 48px 0 0 156px;">
<h2><label><strong>Admin Name</strong></label></h2>
</div>
<div style="margin: -44px 0 0 450px;">
<h2><label><strong>URL</strong></label></h2>
</div>
<div>
<table>
<c:forEach var="list" items="${list}">
<tr>
<td>${list.companyName}</td>
<td><a href="${list.url}">${list.url}</a></td>

</tr>
</c:forEach>
</table>
</div>
</body>
</html>