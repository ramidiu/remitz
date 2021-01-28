<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer List</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
     integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <title></title>
 -->    <style media="screen">
 td,th {
  border: 1px solid #ddd;
  padding: 8px;

}
#green{
  background:#449d44;
  color:white;
  padding:10px;
  text-decoration:none;
text-align: center;
}
#red{
  background:#d9534f;
  color:white;
  padding:10px;text-decoration:none;
}
h6{
  text-align:center;background :#c8e2f8;color:white;padding: 8px;
  font-size:15px;
  border-bottom: 2px solid #ddd;
      vertical-align: bottom;
      border-top: 1px solid #ddd;
      font-weight: 600;
}
    </style>
</head>
<body>
<%@include file ="headerNew.jsp" %><br>
<div class="container">
      <h6 style="color:black;">CUSTOMER DETAILS</h6>
<table class="table">
<tr>
  <td>Name</td>
  <td>${customer.firstName} ${customer.lastName}</td>
</tr>
<tr>
<td>Date of Birth</td>
<td>${customer.dob}</td>
</tr>
<tr>
<td>Birth Country</td>
<td>${customer.country.countryName}</td>
</tr>
<tr>
<td>Address</td>
<td>${customer.address1}</td>
</tr>
</table>
  <h6 style="color:black;">SEARCH CONFIRMATION</h6>
  <table>
    <tr>
      <td><p style="font-size:15px;text-align:center;">

The search data entered produced some results from the sanctions li
st that potentially match your client. By clicking one of the buttons below, you are confirming that results listed did o
r did not match your clien</p></td>

    </tr>
  </table>
  <table class="table">
    <tr>
<td style="text-align:center;" ><a id="green" href="updatesanctionsearchstatus?customerId=${customer.customerId}">My Client is not in the result</a></td>
<td style="text-align:center;"> <a  id="red" href="getsanctioncustomers">My Client is  in the result</a></td>
    </tr>
  </table><br>
  <c:forEach items="${sanctionSearchList}" var="sanctioncustomer">
  <table class="table" style="background:#d9534f;color:black">
  
    <tr>
      <td>name</td>
      <td>${sanctioncustomer.name}</td>
    </tr>  <tr>
        <td>Details</td>
        <td>${sanctioncustomer.extra7}</td>
      </tr>  <tr>
          <td>Addres</td>
          <td></td>
        </tr>
  </table>
  </c:forEach>
  
 
</div>
</body>
</html>