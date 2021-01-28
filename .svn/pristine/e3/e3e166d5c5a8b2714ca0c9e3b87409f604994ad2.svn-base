<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>sanctionCustomersList</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<%@include file="headerNew.jsp"%>
	<div class="container">
	<div class="table-responsive">
		<table class="table table-bordered mb-0">
			<thead class="table-primary">
				<tr id="headerrow" style="background: #2e287b;color:white;padding:5px;text-align:center">
					<th scope="col">Customer Id</th>
					<th scope="col">FirstName</th>
					<th scope="col">LastName</th>
					<th scope="col">EmailId</th>
					<th scope="col">SanctionSearchFlag</th>
					<th scope="col">Country</th>
			   </tr>
			</thead>
			<tbody >
			<c:forEach items="${sanctionCustomersList}" var="customer">
				<tr>
					<td><a href="sanctionsearchcustomer?customerId=${customer.customerId}">${customer.customerId}</a></td>
					<td>${customer.firstName}</td>
					<td>${customer.lastName}</td>
					<td>${customer.emailId}</td>
					<td>${customer.sanctionSearchFlag}</td>
					<td>${customer.country.countryName}</td>

				</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>
</body>
</html>