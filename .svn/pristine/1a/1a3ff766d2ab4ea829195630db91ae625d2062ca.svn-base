<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>12Full details of Money Transfer</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</head>
<style>

.success-transaction.text-center {
    background: #e3e3e38a;
    padding: 0px;
    padding-bottom: 20px;
    border: 2px solid #e4eef6;
}
.success-transaction .well {
    margin-bottom: 20px;
    background-color: #e4eef6;
    border: 3px solid #e4eef6;
    border-radius: 4px;
    box-shadow: none;
}
.block {

border: 1px solid black;
background: 808080;
}
</style>
<body>
<%@include file="headerNew.jsp" %>
<div class="col-md-offset-4 col-md-4">
<br />

<div class="success-transaction text-center">
<div class="">
<p><b>Transfer ${txnDetail.transactionId}</b></p>
</div><br>

<c:if test="${txnDetails.status eq 'pending' }">
<p style="text-align:center;">Your transfer has successfully been paid to your recipient </p>
<br></c:if>
<c:if test="${txnDetails.status ne 'pending' }">
<p style="text-align:center;"> Your transfer is yet to be paid to your recipient</p>
</c:if>


<p style="color:blue;text-align:center;"><B>TRANSFER AMOUNT</B>S</p>
<p style="text-align:center;">${txnDetail.sendingCurrency} ${txnDetail.sendingAmount} </p>
<p style="color:blue;text-align:center;"><b>RECIPIENT GETS</b></p>
<p style="text-align:center;">${txnDetail.receivingCurrency} ${txnDetail.receipentAmount} </p>
<p style="color:blue;text-align:center;"><b>TRANSFER FEE</b></p>
<p style="text-align:center;">${txnDetail.sendingCurrency} ${txnDetail.totalFee}</p>
<p style="color:blue;text-align:center;"><b>EXCHAnNGE RATE</b></p>
<p style="text-align:center;">${txnDetail.transactionRate}</p>

  <p style="color:blue;text-align:center;"><b>YOUR TRANSFER WAS PAID TO</b> </p>
 <c:if test="${txnDetail.paymentType eq 'bank' or txnDetail.paymentType eq 'Urgent Local Deposit' or txnDetail.paymentType eq '11'}">
<p Style="text-align:center;"><span><img src="${pageContext.request.contextPath}/images/countryimages/${txnDetail.receivingCurrency.toLowerCase()}.jpg" width="30px" height="30px" class="rounded-circle"></span>&nbsp; ${txnDetail.beneficiary.firstName} ${txnDetail.beneficiary.lastName}<p>
<p style="color:blue;text-align:center;"><b>ACCOUNT NUMBER</b></p>
<p style="text-align:center;">${txnDetail.beneficiary.bankAccountNumber}</p>

                           </c:if>
                              <c:if test="${txnDetail.paymentType eq 'eWallet' }">
                              <p><img src="${pageContext.request.contextPath}/images/countryimages/${txnDetail.receivingCurrency.toLowerCase()}.jpg" width="30px" height="30px" class="rounded-circle">&nbsp;${txnDetail.beneficiary.bankName}<p>
                         <p>${txnDetail.beneficiary.eWalletNo}</p>
                         </c:if>
                            <c:if test="${txnDetail.paymentType eq 'cash' }">
<p Style="text-align:center;"><span><img src="/images/countryimages/${txnDetail.receivingCurrency.toLowerCase()}.jpg" width="30px" height="30px" class="rounded-circle"></span>&nbsp; ${txnDetail.beneficiary.firstName} ${txnDetail.beneficiary.lastName}</p>
                            
                              <p style="color:blue;text-align:center;">${txnDetail.beneficiary.bankName}</p>

                         </c:if>

</div>
</div>
</div>
<div>

</div>


<div class="clearfix"></div>
<br /><br />
</body>
</html>