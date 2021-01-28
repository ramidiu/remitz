<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="adminDashboard" method="Get" id="frm">
 <select name="status" id="status" onchange="resetStatus()">
 <option value="Asset" ${status eq 'Asset'?'selected':''}>Assets</option>
 <option value="Revenue" ${status eq 'Revenue'?'selected':''}>Revenue</option>
 </select>
 <input type="submit" value="search">
 </form>
<c:forEach var="list" items="${list}">
<tr>

<td>${list.majorHeadName}</td>
<td>${list.description }</td>
</tr>
</c:forEach>


</body>
</html>