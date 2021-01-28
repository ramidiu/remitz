<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Full details of Money Transfer</title>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

   
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    
</head>
<style>

.success-transaction.text-center {
    background: #e4eef6;
    padding: 0px;
   
    border: 2px solid #e4eef6;
}

.success-transaction .well1 {
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
<div class="container-fluid">
<div class="row">
<div class="col-md-offset-4 col-md-4">
<%-- <div class="card-base">Transfer ${txnDetail.transactionId }
<c:if test="${txnDetails.status eq 'pending' }">
<p>Your transfer has successfully been paid to your recipient <p>
</c:if>
<c:if test="${txnDetails.status ne 'pending' }">
<p> Your transfer is yet to be paid to your recipient<p>
</c:if>

<br />
 --%><br>
<div class="success-transaction text-center">
<div  style="background-color:red">
<h4 class="well1" >
<b>Transfer ${txnDetail.transactionId}</b></h4>
</div>

   <c:if test="${txnDetails.status eq 'pending' }">
    <p style="text-align:center;">Your transfer has successfully been paid
       to your recipient </p>
   </c:if>
   
    <c:if test="${txnDetails.status ne 'pending' }">
     <p style="text-align:center;"> Your transfer is yet to be paid to your recipient</p>
    </c:if>


    <p style="color:blue;text-align:center;"><b>TRANSFER AMOUNT</b></p>
    <p style="text-align:center;">${txnDetail.sendingCurrency} ${txnDetail.sendingAmount} </p>
    <p style="color:blue;text-align:center;"><b>RECIPIENT GETS</b></p>
    <p style="text-align:center;">${txnDetail.receivingCurrency} ${txnDetail.receipentAmount} </p>
    <p style="color:blue;text-align:center;"><b>TRANSFER FEE</b></p>
    <p style="text-align:center;">${txnDetail.sendingCurrency} ${txnDetail.totalFee}</p>
    <p style="color:blue;text-align:center;"><b>EXCHANGE RATE</b></p>
    <p style="text-align:center;">${txnDetail.sendingCurrencyRate}</p>

    <p style="color:blue;text-align:center;"><b>YOUR TRANSFER WAS PAID TO </b></p>
    <p Style="text-align:center;"><span><img src="/images/countryimages/${txnDetail.receivingCurrency.toLowerCase()}.jpg" width="30px" height="30px" class="rounded-circle"></span>&nbsp; ${txnDetail.beneficiary.firstName} ${txnDetail.beneficiary.lastName}<p>
    <c:if test="${txnDetail.paymentType eq 'Card Transfer'}">
    <p style="color:blue;text-align:center;"><b>CARD NUMBER</b></p>
    <p style="text-align:center;">${txnDetail.beneficiary.cardNumber}</p>
 
 </c:if>
 
 
 <c:if test="${txnDetail.paymentType eq 'Bill Payment' }">
 
 <p style="color:blue;text-align:center;"><b>UTILITY COMPANY NAME</b></p>
 <p style="text-align:center;">${txnDetail.beneficiary.utilityCompany}</p>
 <p style="color:blue;text-align:center;"><b>BANKNAME</b></p>
 <p style="text-align:center;">${txnDetail.beneficiary.bankToPay}</p>
 <p style="color:blue;text-align:center;"><b>ACCOUNT NUMBER</b></p>
 <p style="text-align:center;">${txnDetail.beneficiary.customerAccountNumber}</p>

 </c:if>
 
 <c:if test="${txnDetail.paymentType eq 'Bank Deposit' or txnDetail.paymentType eq 'Account Transfer' or txnDetail.paymentType eq '11'}">

 <p style="color:blue;text-align:center;"><b>ACCOUNT NUMBER</b></p>
 <p style="text-align:center;">${txnDetail.beneficiary.beneficiaryAccountTransfer}</p>
 <p style="color:blue;text-align:center;"><b>BANK NAME</b></p>
 <p style="text-align:center;">${txnDetail.beneficiary.bank}</p>

  </c:if>
                           
<c:if test="${txnDetail.paymentType eq 'Home Delivery'}">

 <p style="color:blue;text-align:center;"><b>ADDRESS</b></p>
 <p style="text-align:center;">${txnDetail.beneficiary.beneficiaryAddress1}</p>
 <p style="color:blue;text-align:center;"><b>POSTCODE</b></p>
 <p style="text-align:center;">${txnDetail.beneficiary.postCode}</p>
                          
 </c:if>
  
  <c:if test="${txnDetail.paymentType eq 'Cash Collection' }">
  <p style="color:blue;text-align:center;"><b>COLLECTION POINT BANK</b></p>
  <p style="text-align:center;">${txnDetail.beneficiary.collectionPointBank}</p>
  <p style="color:blue;text-align:center;"><b>COLLECTION POINT NAME</b></p>
  <p style="text-align:center;">${txnDetail.beneficiary.collectionPointName}</p>
                           
   </c:if>
   
   <c:if test="${txnDetail.paymentType eq 'Mobile Money' }">
   
  <p style="color:blue;text-align:center;"><b>MOBILE TRANSFER NUMBER</b></p>
  <p style="text-align:center;">${txnDetail.beneficiary.mobileTrnsferNumber}</p>
  <p style="color:blue;text-align:center;"><b>TRANSFER NETWORK</b></p>
  <p style="text-align:center;">${txnDetail.beneficiary.transferNetWork}</p>
             
             
  </c:if>
                           
   <c:if test="${txnDetail.paymentType eq 'eWallet' }">
   
   <p><img src="${pageContext.request.contextPath}/images/countryimages/${txnDetail.receivingCurrency.toLowerCase()}.jpg" width="30px" height="30px" class="rounded-circle">&nbsp;${txnDetail.beneficiary.bankName}<p>
   <p>${txnDetail.beneficiary.eWalletNo}</p>
                     </c:if>
                       <c:if test="${txnDetail.paymentType eq 'cash' }">
   <p Style="text-align:center;"><span>
   <img src="${pageContext.request.contextPath}/images/countryimages/${txnDetail.receivingCurrency.toLowerCase()}.jpg" width="30px" height="30px" class="rounded-circle"></span>&nbsp; ${txnDetail.beneficiary.firstName} ${txnDetail.beneficiary.lastName}</p>
   <p style="color:blue;text-align:center;"><b>${txnDetail.beneficiary.bankName}</b></p>

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