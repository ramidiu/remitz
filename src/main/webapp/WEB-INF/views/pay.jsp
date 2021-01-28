<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pay</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#you').addClass('active');
	$('#rec').addClass('active');
	$('#review').addClass('active');
	$('#paypage').addClass('active');
	
	
	$('#cnf').click(function(){
	//$('#pay').submit();
var selectedMop=$('#selectedMop').val();
//alert('modeOfPayment=='+selectedMop);
		var paymentType = [];
	    $.each($("input[name='paymentMethod']:checked"), function(){
	     paymentType.push($(this).val());
	    });
	    if(paymentType=='')
	    	{
	    	/* alert('selectedMop==='+selectedMop); */
	    	paymentType=selectedMop;
	    	/* alert('paymentType===='+paymentType); */
	    }
	    var nextPageName='';
	    
	    
		if(paymentType=='Poli'){
			nextPageName='poli1';
		}
		if(paymentType=='Online'){
			nextPageName='secure';
		}
		if(paymentType=='PayID'){
			nextPageName='payid';
		}
		if(paymentType=='Internet Bank Transfer'){
			nextPageName='bnktrns';
		}
		if(paymentType=='Cash'){
			nextPageName='cash';
		}
		if(paymentType=='Bank'){
			nextPageName='bnktrns';
		}
		$('#nextPageName').val(nextPageName);
	$('#modeOfPayment').val(paymentType);
	$('#pay').submit();
	
	
	});
});
function validateModeOfPaymentFee(fee,Mop,rateType,sr){
	//alert('fee-====='+fee);
	//alert('Mop===='+Mop);
	//alert('rateType===='+rateType);
	var taxfee=$('#fee').val();
	//alert('sr==='+sr);
	//var mop=$('#Mop').val();
	//alert('mop==='+mop);
	//var rateType=$('#rateType').val();
	//alert('rateType===='+rateType);
	var newTotalFee=Number(taxfee)+Number(fee);
	var sendingAmount=$('#sendingAmount').val();
	//alert('sendingAmount=='+sendingAmount);
	var mfee='';
	if(rateType=='percentage'){
		//alert('fee==='+fee);
		mfee=(Math.ceil(sendingAmount)*fee)/100;
		//alert('mfee=='+mfee);
	}else{
		mfee=Number(taxfee)+Number(fee);
	}
	//alert('mfee=='+mfee);
		var totalToPay=Number(sendingAmount)+Number(mfee)+Number(sr);
	$('#totalToPay').val(totalToPay);
	$('#totalfeeshow').empty();
	$('#totalfeeshow').append(Number(mfee).toFixed(2));
	$('#ttpay').empty();
	$('#ttpay').append(Number(totalToPay).toFixed(2));
$('#totalfeeshow').empty();
	$('#totalfeeshow').append(Number(Number(mfee)+Number(sr)).toFixed(2));
	//$('#modeOfPaymentFee').val(fee);
	
	
//alert('modeOfPaymentFee = '+modeOfPaymentFee);
	var totalFee=$('#totalFee').val();
	totalFee=Number(totalFee)-Number(fee);
	
	//alert('totalFee = '+totalFee); 
}
</script>

<style>
.map-places{
box-shadow: 0 20px 40px 0 rgba(21, 12, 181, 0.3);
}
button#cnf {
    padding: 15px;
    font-size: 18px;
}
.details-table.row {
    left: 19px;
    position: relative;
    padding: 22px 32px 0;
    box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.19);
}
.payment-options .form-check1 {
    border: 1px solid #ddd;
    width:100%;
    padding-top:5%;
    padding-bottom:5%;
    padding-left:10px;
   
}
#main-wrapper{
position: relative;
    top: 40px;}
.payment-options{
padding: 22px 32px 0;
	
}
.details-table.row{
	padding: 22px 32px 0;
    box-shadow: none;
    border: 1px solid #ddd;
}


.btn {
  border: none;
  outline: none;
  padding: 10px 16px;
  background-color: #f1f1f1;
  cursor: pointer;
  font-size: 18px;
}

.payment-options .form-check1{
position:relative;
    padding-bottom: 15px;
}

.custom-radio-button {
    border: none !important;
    padding: 6px !important;
    -webkit-appearance: none !important;
}


.payment-options .form-check1-input{
opacity:0;
}

.payment-options .form-check1 > label > div.title{

      padding-top: 0px !important;
}
.payment-options .form-check1-input {
    /* position: relative; */
    margin-left: 4px;
    margin-top: 0px;
    margin-right: 0px;
    position: absolute !important;
    width: 100%;
    height: 100%;
    top: 0px;
    left: 0px;
    bottom: 0px;
    z-index: 9999;
}


</style>
</head>
<body>
<%-- <%@include file="header4.jsp" %> --%>
<%@include file="myacc_header.jsp" %> 
 <form action="insertOnlineTransaction" id="pay" method="post">
		<input type="hidden" name="msidnInformationId" value="${msidnInformationId}">
		<input type="hidden" id="fee" name="fee" value="${txnDetails.quiqsendFee}">
 <input type="hidden" name="nextPageName" id="nextPageName" value=""/>	
  <input type="hidden" name="selectedMop" id="selectedMop" value="${selectedMop}"/>	
  		 <input type="hidden" name="collectionPointName" value="${txnDetails.collectionPointName}">
		 <input type="hidden" name="collectionPointCode" value="${txnDetails.collectionPointCode}">
		 <input type="hidden" name="collectionPointBank" value="${txnDetails.collectionPointBank}">
		 <input type="hidden" name="collectionPointAddress" value="${txnDetails.collectionPointAddress}">
		 <input type="hidden" name="collectionPointCity" value="${txnDetails.collectionPointCity}">
		 <input type="hidden" name="collectionPointState" value="${txnDetails.collectionPointState}">
		 <input type="hidden" name="collectionPointTelephone" value="${txnDetails.collectionPointTelephone}">
		 <input type="hidden" name="collectionPin" value="${txnDetails.collectionPin}">
		 <input type="hidden" name="beneficiaryAccountTransfer" value="${txnDetails.beneficiaryAccountTransfer}">
		 <input type="hidden" name="bankDetails" value="${txnDetails.bankDetails}">
		 <input type="hidden" name="bank" value="${txnDetails.bank}">
		 <input type="hidden" name="swiftCode" value="${txnDetails.swiftCode}">
		 <input type="hidden" name="iBAN" value="${txnDetails.iBAN}">
		 <input type="hidden" name="branch" value="${txnDetails.branch}">
		 <input type="hidden" name="branchCity" value="${txnDetails.branchCity}">
		 <input type="hidden" name="beneficiaryIdDetails" value="${txnDetails.beneficiaryIdDetails}">
		 <input type="hidden" name="deliveryNote" value="${txnDetails.deliveryNote}">
		 <input type="hidden" name="branchState" value="${txnDetails.branchState}">
		 <input type="hidden" name="telephone" value="${txnDetails.telephone}">
		 <input type="hidden" name="branchManager" value="${txnDetails.branchManager}">
		 <input type="hidden" name="cardNumber" value="${txnDetails.cardNumber}">
		 <input type="hidden" name="beneficiaryAddress1" value="${txnDetails.beneficiaryAddress1}">
		 <input type="hidden" name="beneficiaryAddress2" value="${txnDetails.beneficiaryAddress2}">
		 <input type="hidden" name="beneficiaryAddress3" value="${txnDetails.beneficiaryAddress3}">
		 <input type="hidden" name="beneficiaryCity" value="${txnDetails.beneficiaryCity}">
		 <input type="hidden" name="beneficiaryIdType" value="${txnDetails.beneficiaryIdType}">
		 <input type="hidden" name="beneficiaryPostCode" value="${txnDetails.beneficiaryPostCode}">
		 <input type="hidden" name="utilityCompany" value="${txnDetails.utilityCompany}">
		 <input type="hidden" name="customerAccountNumber" value="${txnDetails.customerAccountNumber}">
		 <input type="hidden" name="invoiceNumber" value="${txnDetails.invoiceNumber}">
		 <input type="hidden" name="bankToPay" value="${txnDetails.bankToPay}">
		 <input type="hidden" name="iBan" value="${txnDetails.iBan}">
		 <input type="hidden" name="bankBicCode" value="${txnDetails.bankBicCode}">
		 <input type="hidden" name="addressLine1" value="${txnDetails.addressLine1}">
			 <input type="hidden" name="addressLine2" value="${txnDetails.addressLine2}">
			 <input type="hidden" name="addressLine3" value="${txnDetails.addressLine3}">
			 <input type="hidden" name="city" value="${txnDetails.city}">
			 <input type="hidden" name="state" value="${txnDetails.state}">
			 <input type="hidden" name="billDescription" value="${txnDetails.billDescription}">
			 <input type="hidden" name="postCode" value="${txnDetails.postCode}">
			 <input type="hidden" name="mobileTrnsferNumber" value="${txnDetails.mobileTrnsferNumber}">
			 <input type="hidden" name="transferNetWork" value="${txnDetails.transferNetWork}">
			 <input type="hidden" name="transferNetWorkCreditType" value="${txnDetails.transferNetWorkCreditType}">
  
 
		 <input type="hidden" name ="modeOfPayment" id="modeOfPayment" value="${txnDetails.modeOfPayment}">	
		<input type="hidden" id="paymentType" name="paymentType" value="${txnDetails.paymentType}">	
		<input type="hidden" id="toCountry" name="receivingBranch" value="${txnDetails.receivingBranch}"/>
		<input type="hidden" id="fromCountry" name="sendingBranch" value="${txnDetails.sendingBranch}"/> 
		<input type="hidden" id="adminId" name="adminId" value="${txnDetails.adminId}"/>
		<input type="hidden" name="sendingAmount" id="sendingAmount" value="${txnDetails.sendingAmount}"/>
		 <input type="hidden" name="deliveryTime" value="${txnDetails.deliveryTime}">
		 <input type="hidden" name="sourceOfFund" value="${txnDetails.sourceOfFund}">
		
		
		<%-- <input type="hidden" name="occupation" value="${occupation}"> --%>
		<input type="hidden" name="sendingReason" value="${beneficiary.sendingReason}">
		
		<input type="hidden" name="firstName" value="${beneficiary.firstName}">
		<input type="hidden" name="lastName" value="${beneficiary.lastName}">
		<input type="hidden" name="idProof" value="${beneficiary.idProof}">
		<input type="hidden" name="idProofNo" value="${beneficiary.idProofNo}">
		<input type="hidden" name="mobileNumber" value="${beneficiary.mobileNumber}">
		<input type="hidden" name="emailId" value="${beneficiary.emailId}">
		<input type="hidden" name="addressLine1" value="${beneficiary.addressLine1}">
		<input type="hidden" name="addressLine2" value="${beneficiary.addressLine2}">
		<input type="hidden" name="cityOrTown" value="${beneficiary.cityOrTown}">
		<input type="hidden" name="postCode" value="${beneficiary.postCode}">
		<input type="hidden" name="relationShip" value="${beneficiary.relationShip}">
		<%-- <input type="hidden" name="purpose" value="${purpose}"> --%>
		<input type="hidden" name="bankName" value="${beneficiary.bankName}">
		<input type="hidden" name="branchName" value="${beneficiary.branchName}">
		<input type="hidden" name="bankAccountNumber" value="${beneficiary.bankAccountNumber}">
   		<input type="hidden" name="issuerCode" value="${beneficiary.issuerCode}">
 		  <input type="hidden" id="towhome" name="towhome" value="${towhome}"/>
  		<input type="hidden" name="eWalletNo" value="${beneficiary.eWalletNo}">
  	  		<input type="hidden" name="bankBranchCode" value="${beneficiary.bankBranchCode}">
  		
 <input type="hidden" name="existedbeneficiary" value="${existedbeneficiary}">
   </form>
<div id="main-wrapper"> 
<!-- <div class="container">
  <nav aria-label="breadcrumb w100">
        <ol class="breadcrumb">
          <li class="breadcrumb-item" aria-current="page"><a href="">Amount</a></li>
          <li class="breadcrumb-item"><a href="">You</a></li>
          <li class="breadcrumb-item active"><a href="">Recipient</a></li>
          <li class="breadcrumb-item active"><a href="">Review</a></li>
          <li class="breadcrumb-item active"><a href="">Pay</a></li>
        </ol>
      </nav> 
   </div>
    -->
  
  <div class="container">
  <div id="content">
   
    <div class="row pb-5 ">
    <div class="col-md-3"></div>
      <div class="payment-options col-md-6 map-places">
        <div class="text-center mb-5">
            <div class="liketopay text-center">
          <h3>How would you like to pay? ${txnDetails.modeOfPayment.split(",")[0]}</h3>
          </div>
        </div>
        
        <c:forEach var="modeOfPaymentFee" items="${modeOfPaymentFeesList}">
        <c:choose>
					<c:when test="${modeOfPaymentFee.modeOfPaymentId.modeOfPayment eq selectedMop}">
				  <div class="form-check1 active" style="background-color: rgb(45, 190, 96);">
          <input class="form-check1-input custom-radio-button" type="radio" name="paymentMethod" id="${modeOfPaymentFee.modeOfPaymentId.modeOfPayment}" onchange="validateModeOfPaymentFee('${modeOfPaymentFee.fee}','${modeOfPaymentFee.modeOfPaymentId.modeOfPayment}','${modeOfPaymentFee.rateType}','${srfee}')"value="${modeOfPaymentFee.modeOfPaymentId.modeOfPayment}">  
          <label class="form-check1-label" for="POLi">
            <div class="title">
              ${modeOfPaymentFee.modeOfPaymentId.modeOfPayment}
            </div>
            <span>Fees:
             ${mfee2}</span>
            <span>Processing: Instant</span>
          </label>
        </div><br></c:when>
        <c:otherwise>
					 <div class="form-check1 active">
          <input class="form-check1-input custom-radio-button" type="radio" name="paymentMethod" id="${modeOfPaymentFee.modeOfPaymentId.modeOfPaymentId}" onchange="validateModeOfPaymentFee('${modeOfPaymentFee.fee}','${modeOfPaymentFee.modeOfPaymentId.modeOfPayment}','${modeOfPaymentFee.rateType}','${srfee}')"value="${modeOfPaymentFee.modeOfPaymentId.modeOfPayment}" >  
          <label class="form-check1-label" for="POLi">
            <div class="title">
              ${modeOfPaymentFee.modeOfPaymentId.modeOfPayment}
            </div>
            <span>Fees: ${modeOfPaymentFee.fee}</span>
            <span>Processing: Instant</span>
          </label>
        </div> 
        </c:otherwise>
        </c:choose>
				
					<%--  <div class="form-check1 active">
          <input class="form-check1-input custom-radio-button" type="radio" name="paymentMethod" id="${list.modeOfPayment}" onchange="validateModeOfPaymentFee('${list.fee}')"value="${list.modeOfPayment}" >  
          <label class="form-check1-label" for="POLi">
            <div class="title">
              ${list.modeOfPayment}
            </div>
            <span>Fees: $${list.fee }</span>
            <span>Processing: Instant</span>
          </label>
        </div>  --%>
			
        </c:forEach>
        
      <br>
      
          <div class=""><strong>Transfer details</strong></div>
         
          <div class="clearfix"></div>
          <div class="col-sm-6">You send</div>
          <div class="col-sm-6 text-right text-lg mb-2 mt-2">${txnDetails.sendingAmount} ${txnDetails.sendingCurrencyCodeCode}</div>
            <div class="clearfix"></div>
          <div class="col-sm-6">Fee</div>
          <div class="col-sm-6 text-right"><label id="totalfeeshow">${txnDetails.totalTransactionFee}</label>${txnDetails.sendingCurrencyCodeCode}</div>
            <div class="clearfix"></div>
          <div class="col-sm-6"><b>Total to pay us</b></div>
          <div class="col-sm-6 text-right"><b><span id='ttpay'>${fee}</span> ${txnDetails.sendingCurrencyCodeCode}</b></div>
            <div class="clearfix"></div>
          <div class="col-sm-6">Guaranteed rate (48 hours)</div>
          <div class="col-sm-6 text-right">${txnDetails.txnRate} ${txnDetails.sendingCurrencyCodeCode}</div>
            <div class="clearfix"></div>
          <div class="col-sm-6">${beneficiary.firstName} gets</div>
          <div class="col-sm-6 text-right text-lg" style="padding: 0px;">${txnDetails.receivingAmount} ${txnDetails.receivingCurrencyCode}</div>
            <div class="clearfix"></div>
          <div class="col-sm-12">
            <hr>  
          </div>
          
             <c:if test="${beneficiary ne null and beneficiary ne ''}">
          <c:if test="${txnDetails.paymentType eq 'bank' or txnDetails.paymentType eq 'urgent local deposit' or txnDetails.paymentType eq '10' or txnDetails.paymentType eq 'Urgent Local Deposit'}">
          <div class="col-sm-12 pt-2" style="    padding: 0px;margin-top: -23px;"><strong>Recipient bank details</strong></div>
<div class="clearfix"></div>
          <div class="col-sm-6">Bank name</div>
          <div class="col-sm-6 text-right">${beneficiary.bankName}</div>
          <div class="col-sm-6">Branch name</div>
          <div class="col-sm-6 text-right">${beneficiary.branchName}</div>
          <div class="col-sm-6">Account number</div>
          <div class="col-sm-6 text-right">${beneficiary.bankAccountNumber}</div>
          </c:if>
           <c:if test="${txnDetails.paymentType eq 'cash' or txnDetails.paymentType eq '  5' }">
         
          <div class="col-sm-6 pt-2" style="position: relative;margin-top: -24px;"><strong>Cash Pickup</strong></div>
          
          <div class="col-sm-6 text-right"><!-- <a href="send-1">Change</a> --></div>
          <div class="col-sm-6">Name</div>
          <div class="col-sm-6 text-right">${beneficiary.firstName} ${beneficiary.lastName}</div>
          
          <div class="col-sm-6">Pickup from</div>
          <div class="col-sm-6 text-right">${beneficiary.bankName}</div>
          
          </c:if>
            <c:if test="${txnDetails.paymentType eq 'eWallet' }">
          <div class="col-sm-6 pt-2"style="position: relative;margin-top: -24px;"><strong>eWallet</strong></div>
          <div class="col-sm-6 text-right"><!-- <a href="send-1">Change</a> --></div>
          <div class="col-sm-6">Name</div>
          <div class="col-sm-6 text-right">${beneficiary.firstName} ${beneficiary.lastName}</div>
          
          <div class="col-sm-6">eWallet name</div>
          <div class="col-sm-6 text-right">${beneficiary.bankName}</div>
          <div class="col-sm-6">eWallet number</div>
          <div class="col-sm-6 text-right">${beneficiary.eWalletNo}</div>
       
          </c:if>
          </c:if>
          
          <div class="col-sm-6">Should arrive</div>
          <div style="margin-bottom:20px;"class="col-sm-6 text-right">${txnDetails.deliveryTime}</div>
       <br>

   <button type="button"  id="cnf" class="continue-payment btn btn-primary btn-block">Continue to payment</button>

         <button type="button" id="cnf" class="Cancel-this btn btn-primary btn-block">Cancel this transfer</button>
     <br> </div>
  </div>
   </div></div><br><br>
</div><!--/#main-wrapper ENDs-->
<br>
    <%@include file="frontendfooter.jsp" %>  
    
 <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"> 

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    
<script>
/* $(document).ready(function(){
    $(".custom-radio-button").change(function(){
        $(this).css("background-color", "red");
    });
   
}); */
/* $(".custom-radio-button").on("change", function() {
    var that = this;
    $(this).parent().css("background-color", function() {
        return that.checked ? "#ff0000" : "";
    });
}); */
$(document).ready(function() {
	  $('.custom-radio-button').on('change', function() {
	    $('.custom-radio-button').not(this).prop('checked', false);
	    //$('#result').html($(this).data("id"));
	    if ($(this).is(":checked")) {
	      //$('#result').html($(this).data("id"));
	      $('.custom-radio-button').not(this).parent().css('background-color', 'inherit');
	      $(this).parent().css('background-color', '#2dbe60');
	    }
	  });
	});
</script>
</body>
</html>