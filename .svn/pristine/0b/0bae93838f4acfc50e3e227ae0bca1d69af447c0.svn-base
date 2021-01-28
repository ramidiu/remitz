<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recipient</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
#main-wrapper {
    overflow: hidden;
    background: #fff !important;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#you').addClass('active');
	$('#rec').addClass('active');
	$('#cnf').click(function(){
	var bFirstName=$('#bFirstName').val();
	var blastName=$('#blastName').val();
    var bmobileNumber=$('#receiverMobileNumber').val();
    var email=$('#email').val();
    var purpose=$('#purpose').val();
    var relationShip=$('#relationShip').val();
    var idProof=$('#idProof').val();
    var idProofNo=$('#idProofNo').val();
    var sourceOfFund=$('#sourceOfFund').val();
    var address1 =$('#address1').val();
    var city= $('#city').val();
    var postcode =$('#postcode').val();
    
    
   
    if(bFirstName==''){
    	$('#bFirstName').focus().css('outline' , 'solid red 2px');
    	return false;
    }
    if(blastName==''){
    	$('#blastName').focus().css('outline' , 'solid red 2px');
    	return false;
    }
    if(bmobileNumber==''){
    	$('#receiverMobileNumber').focus().css('outline' , 'solid red 2px');
    	return false;
    }
    if(email==''){
    	$('#email').focus().css('outline' , 'solid red 2px');
    	return false;
    }
    if(IsEmail(email)==false){
		$('#email').focus().css('outline' , 'solid red 2px');
		$('#emsg').empty();
		$('#emsg').append("<font color='red'>Invalid Email</font>");
          return false;
        }
   if(address1==''){
	   $('#address1').focus().css('outline' , 'solid red 2px');
   	return false;
   }
   if(city==''){
	   $('#city').focus().css('outline' , 'solid red 2px');
   	return false;
   }
   if(postcode==''){
	   $('#postcode').focus().css('outline' , 'solid red 2px');
   	return false;
   }
    if(idProof==''){
    	$('#idProof').focus().css('outline' , 'solid red 2px');
    	return false;
    }
    if(idProofNo==''){
    	$('#idProofNo').focus().css('outline' , 'solid red 2px');
    	return false;
    }
    var ewalletissuerCode=$('#ewalletissuerCode').val();
    var cashissuerCode=$('#cashissuerCode').val();
    var paymentType=$('#paymentType').val();
    
    if(paymentType=='5'){
    	if(cashissuerCode==''){
    		$('#cashissuerCode').focus().css('outline' , 'solid red 2px');
    		return false;
    	}
    	$('#issuerCode').val(cashissuerCode);
    }
	if(paymentType=='2'){
		if(ewalletissuerCode==''){
    		$('#ewalletissuerCode').focus().css('outline' , 'solid red 2px');
    		return false;
    	}
		$('#issuerCode').val(ewalletissuerCode);
    }
    
    
    if(paymentType=='1' || paymentType=='10' || paymentType=='11'){
    	
    	var bankName=$('#bnkName').val();
    	
    	
    	var branchName=$('#branchName').val();
    	var accountNo=$('#accountNo').val();
    	 if(bankName==''){
    	    	$('#bnkName').focus().css('outline' , 'solid red 2px');
    	    	return false;
    	    }
    	 if(branchName==''){
    	    	$('#branchName').focus().css('outline' , 'solid red 2px');
    	    	return false;
    	    }
    	 if(accountNo==''){
    	    	$('#accountNo').focus().css('outline' , 'solid red 2px');
    	    	return false;
    	    }
    	 bankName=bankName.split(',');
    	 $('#bankName').val(bankName[1]);
    	 $('#issuerCode').val(bankName[0]);
    }
    if(sourceOfFund==''){
		$('#sourceOfFund').focus().css('outline' , 'solid red 2px');
		return false;
	}
    if(purpose==''){
    	$('#purpose').focus().css('outline' , 'solid red 2px');
    	return false;
    }
    if(relationShip==''){
    	$('#relationShip').focus().css('outline' , 'solid red 2px');
    	return false;
    }
   
    $('#txnreview').submit();
	});
	
	
	$('#myself').click(function(){
		 $.ajax({
				url  : "getCustomerDetails",
				method : "get",
				async : false,
				success : function(response){
					$('#bFirstName').val(response.firstName);
					$('#blastName').val(response.lastName);
					$('#receiverMobileNumber').val(response.mobileNumber);
					$('#email').val(response.emailId);
					$('#purpose').val("1000");
					$('#idProof').val(response.firstIdProofType);
					$('#idProofNo').val(response.firstIdNumber);
					$('#relationShip').val("6");
				
				},
				error : function(xhr,error,status){
					alert('getCustomerError : '+error);
				}
			 });
		
		
	  $('#towhome').val('myself');
	$('#txnreview').attr('action','newrecpdetaits');
	$('#txnreview').submit();
	});
});

</script>
<script type="text/javascript">
function IsEmail(email) {
	  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  if(!regex.test(email)) {
	    return false;
	  }else{
	    return true;
	  }
	}
</script>
<script type="text/javascript">
function removeError(id){
	$('#'+id).css('outline','#B0C4DE');
}
function onlyNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode!=46) {
        return false;
    }
    return true;
}
</script>
<script type="text/javascript">
function openModel(){
	 var paymentType=$('#paymentType').val();
	 $.ajax({
		url  : "getCustomerDetails",
		method : "get",
		async : false,
		success : function(response){
			$('#bFirstName').val(response.firstName);
			$('#blastName').val(response.lastName);
			$('#receiverMobileNumber').val(response.mobileNumber);
			$('#email').val(response.emailId);
			$('#purpose').val("1000");
			$('#idProof').val(response.firstIdProofType);
			$('#idProofNo').val(response.firstIdNumber);
			$('#relationShip').val("6");
		
		},
		error : function(xhr,error,status){
			alert('getCustomerError : '+error);
		}
	 });
	 if(paymentType=='1'){
	$('#myselfModal').modal('show');	 
	 }else{
		 $('#txnreview').submit();
	 }
}
</script>
<script type="text/javascript">

function gotonewrecpage(){
	$('#towhome').val('someoneelse');
	$('#txnreview').attr('action','newrecpdetaits');
	$('#txnreview').submit();
};
</script>
<script type="text/javascript">

function gototxnreviewpage(id){
	$('#existedbeneficiary').val(id);
	$('#txnreview').attr('action','txnreview');
	$('#txnreview').submit();
};
</script>
</head>
<body>
<%-- <%@include file="header4.jsp" %> --%>
<%@include file="myacc_header.jsp" %> 
<div id="main-wrapper01"> 
  
<!-- <div class="container">
    <nav aria-label="breadcrumb w100">
        <ol class="breadcrumb">
          <li class="breadcrumb-item" aria-current="page"><a href="">Amount</a></li>
          <li class="breadcrumb-item"><a href="">You</a></li>
          <li class="breadcrumb-item active"><a href="">Recipient</a></li>
          <li class="breadcrumb-item active">Review</li>
          <li class="breadcrumb-item active">Pay</li>
        </ol>
      </nav> 
   </div>
    -->
  
  <div id="content">
    <div class="text-center">
  
                       <div class="rechead text-center">
                            <h3>Who are you sending money to?${list} </h3>
                       </div>
                      
     <%--  <h3>Who are you sending money to?${list} </h3> --%>
      
    </div>
   
   <c:if test="${beneficiaryList.size() gt 0}">
   
    <div class="row pb-5">
      <div class="container"> 
      <div class="newrec">
      <h5 class="page-header pb-2 mb-4 border-bottom">Choose One Recipient</h5>
        </div>
      <div class="row">
  
      <c:set var="idx" value="0"/>
    <c:forEach var="list" items="${beneficiaryList}">
   
    <c:if test="${idx eq '0' }">
    <div class="col-md-3" style="margin-top: 14px!important;"> 
    </c:if>
    <c:if test="${idx ne '0' }">
    <div class="col-md-3" style="margin-top: 14px!important;">
    </c:if>
      
        <a href="#" class="someoneBtn box" onclick="gototxnreviewpage('${list.beneficiaryId}');" >
        <span class="image">
          <i class="fas fa-user-alt"></i>
        </span>
        <span>${list.firstName}  </span>
        <c:if test="${list.accType eq 'bank'}">
        <c:set var="startindex" value="${fn:length(list.bankAccountNumber)}"/>
        <span>Account ends with ${fn:substring(list.bankAccountNumber,startindex-4,startindex)}</span>
      
        </c:if>
        <c:if test="${list.accType eq '1'}">
        <span>${list.bankName}</span>
        </c:if>
        <c:if test="${list.accType eq '2'}">
        <span>${list.bankName}</span>
        </c:if>
        
        
      </a>  
      </div>
      
      <c:set var="idx" value="${idx+1}"/>
      </c:forEach>
     
      </div>
      </div><!-- /.container ENDs -->
      </c:if>
      
      
      
    </div>
    <div class="row pb-5">
      <div class="container"> 
      <div class="newrec">
      <h5 class="page-header pb-2 mb-4 border-bottom">New Recipient</h5>
      </div>
      
      <div class="row">
    <c:if test="${model.paymentType eq '1' }"> 
      <div class="col-md-4">
    <div class="thumbnail">
        <a href="#" class="myselfBtn box" id="myself">
        <span class="image">
          <i class="fas fa-user-alt"></i>
        </span>
        <span>To myself</span>
      </a> 
      </div> 
      </div>
    </c:if> 
      <div class="col-md-4">
        <div class="thumbnail">
        <a href="#" class="someoneBtn box" onclick="gotonewrecpage();">
        <span class="image">
          <i class="fas fa-user-alt"></i>
        </span>
        <span>To someone else</span>
      </a>   </div> 
      </div>
      
      <div class="col-md-4">
        <div class="thumbnail">
        <a href="#" class="disabled box">
        <span class="image">
          <i class="far fa-hospital"></i>
        </span>
        <span>Business or charity</span>
      </a>  </div>  
      </div>
      </div>
      </div><!-- /.container ENDs -->
    </div>

  </div><!-- /.content ENDs -->
  
</div><!--/#main-wrapper ENDs-->


<form method="post" id="txnreview">
		<input type="hidden" name ="modeOfPayment" id="modeOfPayment" value="${model.modeOfPayment}">	
		<input type="hidden" id="paymentType" name="paymentType" value="${model.paymentType}">
		<input type="hidden" id="toCountry" name="receivingBranch" value="${model.receivingBranch}"/>
		<input type="hidden" id="fromCountry" name="sendingBranch" value="${model.sendingBranch}"/> 
		<input type="hidden" id="adminId" name="adminId" value="${model.adminId}"/>
		<input type="hidden" name="sendingAmount" value="${model.sendingAmount}"/>
		<input type="hidden" name="deliveryTime" value="${model.deliveryTime}">
		<input type="hidden" name="towhome" id="towhome" value=""> 
		<input type="hidden" name="existedbeneficiary" id="existedbeneficiary" value=""/>
</form>
<%@include file="frontendfooter.jsp" %>
</body>
</html>