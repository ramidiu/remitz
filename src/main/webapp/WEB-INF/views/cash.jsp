<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cash Transfer</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
	
<link href="https://fonts.googleapis.com/css?family=Rubik&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.bank{
    padding: 20px 0px 0px 0px;
}
.btn1{
    background-color: #2dbe60;
    color: white; 
    width: 100%;
    border: 0px solid;
    padding: 0px 0 0 0;
    margin-top: 24px;
    height: 40px;
    border-radius: 6px;
    display: block;
}   
.btn2{
    background-color: #00b9ff;
    color: #fff;  
    width:  100%;
    border: 1px solid #00b9ff;
    padding: 0px 0 0 0;
    margin-top: 20px;
    height: 40px;
    border-radius: 6px;
    display: block;
}
.btn3{
    color: #fff;
    height: 40px; 
    margin-top: 20px;
    width:  100%;
    border: 1px solid #7f7f7f;
    padding: 0px 0 0 0;  
    border-radius: 6px;
    display: block; 
    background-color: red !important;
	border-color:red;
}
   .bank table {
    width: 100%;
    padding: 20px 20px;
    margin-left: 45px;
    margin-bottom: 10px;
}  
.map-places{
    box-shadow: 0 20px 40px 0 rgba(21, 12, 181, 0.3);

}
</style>
<script type="text/javascript">
function updatePayIdPaymentStatus(status){
	$('#status').val(status);
	$('#form').submit();
}
</script>

</head>
<body>
<%@include file="myacc_header.jsp" %> 
<form id="form" method="post" action="updatepaymentstatusfromuser">
<input type="hidden" name="txnId" id="txnId" value="${txnId}">
<input type="hidden" name="status" id="status" value="">

</form>
<section class="bank"><br>
         <div class="container">
              <div class="row">
                   <div class="col-md-6 col-md-offset-3 map-places"><br>
                        <h3>Next, go to your online banking and make a payment</h3>
                        <p>Use the instructions below to make your payment. We need to receive your money by friday 8.22pm to guarantee your rate
                             of ${rate}
                        </p> 
                        <div class="alert alert-warning">
                             <strong>IMPORTANT!</strong> You must include 
                               <strong>${fn:substring(txnId, 3, fn:length(txnId))}
                               </strong> 
                               in your bank transfer's payment description field
                         </div>
                         <h3 >Cash tansfer instructions</h3>
                           <table>
                            <tr>
                               <th>Payee name </th>
                              <td>ABC Pty Ltd</td>
                             </tr>
                             <tr>
                                <th>Payment Description</th>
                                <td>ABC Pty Ltd</td>
                              </tr>
                              <tr>
                                 <th> Amount to send</th>
                                 <td>$ ${sendAmount}</td>
                               </tr>
                               <tr>
                                   <th>BANK code</th>
                                   <td>1000000</td>
                                </tr>
                                 <tr>
                                   <th>Account number</th>
                                   <td>970 970 970</td>
                                   <tr>
                                       <th>Bank name</th>
                                       <td>ABC</td>
                                   </tr>
                         </table>
                       
                             <p>ABC Pty Ltd never takes money automatically from your account</p> 
                             <button type="button" class="btn1" onclick="updatePayIdPaymentStatus('paid');">I've made my bank transfer</button>
                             <button type="button" class="btn2" onclick="updatePayIdPaymentStatus('later');">I'll transfer my money later</button>
                               <button type="button" class="btn3" onclick="updatePayIdPaymentStatus('cancelled');">cancel my transfer</button>
                   <br></div>
              </div>
         </div>
</section>

<br>
<br>
<%@include file="frontendfooter.jsp" %>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
</body>
</html>