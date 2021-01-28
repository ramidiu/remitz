<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
      <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PayID</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
 /* .abc:after {
    content: " ";
    position: absolute;
    display: table;
    content: " ";
    border: 1px solid black;
    width: 410px;
    left: 23px;
    top: 60px;
} 
.col-md-6 p{font-size: 16px;
    font-weight: inherit;}
     .con{
   background-color: #fff;
    -webkit-box-shadow: 0px 5px 30px 0px rgba(0, 0, 0, 0.05);
    box-shadow: 0px 5px 30px 0px rgba(0, 0, 0, 0.05);

    padding-bottom: 24px;}  */
    
 .btn1{
     background-color: #2dbe60;
     color: white;
     width: 100%;
    border: 0px solid;
    padding: 0px 0 0 0;
    margin-top: 24px;
    height: 40px;
    border-radius: 6px;
    display: block;}
   
.btn2{
    background-color: #00b9ff;
    color:#fff;
    width: 100%;
    border: 1px solid #00b9ff;
    padding: 0px 0 0 0;
    margin-top: 20px;
    height: 40px;
    border-radius: 6px;
    display: block;
  }
.btn3{
     background-color: white;
     color: #fff;
     height: 40px; 
     width: 100%;
     border: 1px solid #7f7f7f;
     padding: 0px 0 0 0;
     margin-top: 20px;
     border-radius: 6px;
     display: block;
     background-color: red !important;
	 border-color:red;
}

    .payid table {
    width: 100%;
    padding: 20px 20px;
    margin-left: 45px;
    margin-bottom: 10px;
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

<section class="payid">
         <div class="container">
              <div class="row">
                   <div class="col-md-6 col-md-offset-3">
                        <h3>Next, go to your Bank and make a payment</h3>
                        <p>Use the instructions below to make your payment. We need to receive your money by friday 8.22pm to guarantee your rate
                           of ${rate}</p> 
                              <div class="alert alert-warning">
                     <strong>IMPORTANT!</strong> You must include   <strong>${fn:substring(txnId, 3, fn:length(txnId))}</strong> in your bank transfer's payment description field
                    </div>
                      <h3>PayID instructions</h3>
                      
                     <table>
                            <tr>
                               <th>Amount</th>
                              <td>$ ${sendAmount}</td>
                             </tr>
                             <tr>
                                <th>PayID</th>
                                <td>77 600 038 300</td>
                              </tr>
                              <tr>
                                 <th>PayID Name</th>
                                 <td>Techwest Pty Ltd</td>
                               </tr>
                               <tr>
                                   <th>Reference/Description</th>
                                   <td><strong>${fn:substring(txnId, 3, fn:length(txnId))}</strong></td>
                                </tr>
                         </table>
					     <p>Techwest Pty Ltd never takes money automatically from your account</p>
					     <button type="button" class="btn1" onclick="updatePayIdPaymentStatus('paid');">I've made payID transfer</button>
					     <button type="button" class="btn2"onclick="updatePayIdPaymentStatus('later');">I'll transfer my money later</button>
					     <button type="button" class="btn3" onclick="updatePayIdPaymentStatus('cancelled');" >cancel my transfer</button><br/>
                   </div>
              </div>         
         </div>
</section>



<%@include file="frontendfooter.jsp" %>
</body>
</html>