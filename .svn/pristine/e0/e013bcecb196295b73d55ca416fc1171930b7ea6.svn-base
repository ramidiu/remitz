<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fill DetailS</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <style type="text/css">
  
  .fill-details .panel-body {
    padding-left: 15px !important;
    padding-right: 15px !important;
    padding-bottom: 0px !important;
}
  .fill-details{
  margin-top: 30px;
  }
  
  nav.navbar.navbar-default {
    border-bottom: 1px solid #e0e0e0 !important;
    padding-bottom: 10px;

}
.map-places{
    box-shadow: 0 20px 40px 0 rgba(21, 12, 181, 0.3);

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
    var dailingCode=$('#dailingCode').val();
    var bankBranchCode=$('#bankBranchCode').val();
   var email=$('#email').val();
   var bankName=$('#bankName').val();
    var purpose=$('#purpose').val();
    var relationShip=$('#relationShip').val();
    var idProof=$('#idProof').val();
    var idProofNo=$('#idProofNo').val();
    var sourceOfFund=$('#sourceOfFund').val();
    var address1 =$('#address1').val();
    var city= $('#city').val();
    var postcode =$('#postcode').val();
    var eWalletNumber=$('#eWalletNumber').val();
    //alert('email====='+email);

   	var towhome=$('#towhome').val();
   	if(towhome!='myself'){
    if(bFirstName==''){
    	$('#bFirstName').focus().css('outline' , 'solid red 2px');
    	return false;
    }
    if(blastName==''){
    	$('#blastName').focus().css('outline' , 'solid red 2px');
    	return false;
    }
   /*  if(bankBranchCode==''){
    	$('#bankBranchCode').focus().css('outline' , 'solid red 2px');
    	return false;
    }
 */
    if(bmobileNumber==''){
    	$('#receiverMobileNumber').focus().css('outline' , 'solid red 2px');
    	return false;
    }
    bmobileNumber=dailingCode+bmobileNumber;
     if(email!=''){
    if(IsEmail(email)==false){
		$('#email').focus().css('outline' , 'solid red 2px');
		$('#emsg').empty();
		$('#emsg').append("<font color='red'>Invalid Email</font>");
          return false;
        }
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
   	}
    var ewalletissuerCode=$('#ewalletissuerCode').val();
    var cashissuerCode=$('#cashissuerCode').val();
    var bankBranchCode=$('#bankBranchCode').val();
    //alert('bankBranchCode=='+bankBranchCode);
    var paymentType=$('#paymentType').val();
    if(paymentType=='cash'){
    	if(cashissuerCode==''){
    		$('#cashissuerCode').focus().css('outline' , 'solid red 2px');
    		return false;
    	}
    	$('#bankBranchCode').val(bankBranchCode);
    	$('#issuerCode').val(cashissuerCode);
		$('#bankName').val(cashissuerCode);
    }
	if(paymentType=='eWallet'){
		//alert('if payment type is 2. . . . ');
		if(ewalletissuerCode==''){
    		$('#ewalletissuerCode').focus().css('outline' , 'solid red 2px');
    		return false;
    	}
// 		alert('issuer code = = '+ewalletissuerCode.split('-')[0]);
// 		alert('bankName = = '+ewalletissuerCode.split('-')[1]);
		$('#issuerCode').val(ewalletissuerCode.split('-')[0]);
		$('#bankName').val(ewalletissuerCode.split('-')[1]);
		
    }
    
    
    if(paymentType=='bank' || paymentType=='10' || paymentType=='Urgent Local Deposit'){
    	var bankName=$('#bankName').val();
    	//alert("bannkname:::"+bankName);
    	
    	var branchName=$('#branchName').val();
    	var accountNo=$('#accountNo').val();
    	var bankBranchCode=$('#bankBranchCode').val();
    	 /* if(bankName===''){
    		 alert("bannk name conditionnnnnnn");
    	    	$('#bankName').focus().css('outline' , 'solid red 2px');
    	    	return false;
    	    } */
    	 if(branchName===''){
    	    	$('#branchName').focus().css('outline' , 'solid red 2px');
    	    	return false;
    	    }
    	 if(bankBranchCode===''){
 	    	$('#bankBranchCode').focus().css('outline' , 'solid red 2px');
 	    	return false;
 	    }

    	 if(accountNo==''){
    	    	$('#accountNo').focus().css('outline' , 'solid red 2px');
    	    	return false;
    	    }
    	 bankName=bankName;
    	// alert('bankName = = == '+bankName);
    	// $('#bankName').val(bankName);
    	 $('#issuerCode').val(bankName);
    	 $('#bankBranchCode').val(bankBranchCode);
    }
    /* if(sourceOfFund==''){
		$('#sourceOfFund').focus().css('outline' , 'solid red 2px');
		return false;
	}
    if(purpose==''){
    	$('#purpose').focus().css('outline' , 'solid red 2px');
    	return false;
    } */
    
    if(eWalletNumber==''){
    	$('#eWalletNumber').focus().css('outline' , 'solid red 2px');
    	return false;
    }
    if(towhome!='myself'){
    if(relationShip==''){
    	$('#relationShip').focus().css('outline' , 'solid red 2px');
    	return false;
    }
    }else{
    	var relation=$('#relation').val();
    	//$('#relationShip').val(relation);
    }
   // alert("tttttttttttttttttttttttttt");
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
</head>
<body>
<%-- <%@include file="header4.jsp" %> --%>
<%@include file="myacc_header.jsp" %> 
 <div id="main-wrapper01"> 
 



<!--  <div class="container">
 <div class="row">
 <nav aria-label="breadcrumb w100">
        <ol class="breadcrumb">
          <li class="breadcrumb-item" aria-current="page"><a href="">Amount</a></li>
          <li class="breadcrumb-item"><a href="">You</a></li>
          <li class="breadcrumb-item active"><a href="">Recipient111</a></li>
          <li class="breadcrumb-item active">Review</li>
          <li class="breadcrumb-item active">Pay</li>
        </ol>
      </nav> 
</div>
</div>
 -->
   
   <div class="container">
    <div id="content" class="main-form">
   
          <form action="txnreview" method="post" id="txnreview">
			<input type="hidden" id="dob" name="dob" value=""/>													
		<input type="hidden" name ="modeOfPayment" id="modeOfPayment" value="${model.modeOfPayment}">	
		<input type="hidden" id="paymentType" name="paymentType" value="${model.paymentType}">
		<input type="hidden" id="toCountry" name="receivingBranch" value="${model.receivingBranch}"/>
		<input type="hidden" id="fromCountry" name="sendingBranch" value="${model.sendingBranch}"/> 
		<input type="hidden" id="adminId" name="adminId" value="${model.adminId}"/>
		<input type="hidden" name="sendingAmount" value="${model.sendingAmount}"/>
		<%-- <input type="hidden" name="receivingAmount" value="${receivingAmount}"/> --%>
		<input type="hidden" name="msidnInformationId" value="${msidnInformationId}">
		 <input type="hidden" name="deliveryTime" value="${model.deliveryTime}">
		<input type="hidden" name="towhome" id="towhome" value="${towhome}">
		<input type="hidden" name="firstIdExpireDate" id="firstIdExpireDate" value=""/> 
		<input type="hidden" id="bankName" name="bankName" value=""/>
		<input type="hidden" id="issuerCode" name="issuerCode"  value=""/>
		<input type="hidden" name="relation" id="relation"value="${relationShip}"> 
		<c:if test="${towhome eq 'myself'}">
		
		</c:if>
             <c:if test="${towhome ne 'myself'}">
             <div class="fill-details">
            
      <div class="row">
      
        <div class="container my-5 col-md-8 col-md-offset-2 map-places">
        
        <div class="row">
  
       <div class="fillin text-center"><br>
        <h3>Fill in receiver details</h3>
        <p>Please enter the details as they appear in your receiver's government issued ID</p>
      </div>
      
            <div class=" form-row">
             <div class="panel-body">
             <div class="form-row rec">
              <div class="form-group col-md-6">
                <label for="fname">Reciever's First and Middle Name</label>
                <input type="text" class="form-control" id="bFirstName" value="${bFirstName}" onkeyup="removeError('bFirstName');" name="firstName" placeholder="First and Middle Name">
              </div>
              <div class="form-group col-md-6">
                <label for="lname">Full legal last name(s)</label>
                <input type="text" class="form-control" placeholder="Last name" name="lastName" value="${blastName}"id="blastName" onkeyup="removeError('blastName');">
              </div>
          
             
                <div class="col-md-6">
                <label for="month">Reciever's email (optional)</label>
                <div class="form-group">
                 <input type="text" class="form-control" id="email"  value="${email}"name="emailId" placeholder="Email address"onkeyup="removeError('email');"><label id="emsg"></label>
                </div>
              </div>
               <%-- <div class="form-group col-md-6">
                <label for="date">Mobile</label>
                <input type="text" class="form-control" value="${dailingCode}" placeholder="Mobile Number" name="mobileNumber" id="receiverMobileNumber" onkeyup="removeError('receiverMobileNumber');" onkeypress="return onlyNumber(event)" size="20">
				<br>
              </div> --%>
                  <div class="form-group col-md-2">
                  <label for="month">Mobile </label>
                  
                          <input type="text" id="dailingCode" value="+${dailingCode}" class="form-control" readonly/>
                       
            	 </div>
              <div class="form-group col-md-4"> 
                <div class="mob">
                  <label for="">&nbsp;</label>
                 <input type="phone" class="form-control" id="mobileNumber" name="mobileNumber" value="${customer.mobileNumber}" placeholder="Mobile number"onkeyup="removeError('mobileNumber');" onkeypress="return onlyNumber(event)"> 
                  <span class="text-secondary">we'll send the transaction update on this number</span>
                </div>
              </div>
             <div class="clearfix"></div>
              <c:if test="${towhome ne 'myself'}">
              
         	  <div class="form-group col-md-6">
         	  
           	 <label for="theiremail">Relationship with you</label>
        		 <select class="form-control" name="relationShip" id="relationShip" onchange="removeError('relationShip');">
				<option value="">--Select *--</option>
				<c:forEach var ="list" items="${relationshipList}">
				<option value="${list.relationId}">${list.relationShip}</option>
				</c:forEach> 
				</select>
         	 </div>
         	 </c:if>
			</div>
            </div>
  </div>
</div>



       <div class=" ">
            <div class="">
                  <div class="hfive col-md-12">
                       <h5>Receiver Address</h5>
                  </div>       
                   
                  <div class="">
                       <div class="form-row">
                            <div class="form-group col-md-6">
                                 <label for="country">Address-Line 1</label>
                                 <input type="text" class="form-control" id="address1" name="addressLine1" placeholder="Address line 1"onkeyup="removeError('address1');">
                             </div>
                             <div class="form-group col-md-6">
                                  <label for="Address">Address-Line 2</label>
                                  <input type="text" class="form-control" id="address2" name="addressLine2" placeholder="Address line 2"onkeyup="removeError('address2');">
                             </div>
                       </div>

                       <div class="form-row">
                            <div class="form-group col-md-6">
                                 <label for="suburb">City</label>
                                 <input type="text" class="form-control" id="city" name="cityOrTown" placeholder="City"onkeyup="removeError('city');">
                            </div>
                            <div class="form-group col-md-6">
                                 <label for="postcode">Post Code</label>
                                 <input type="text" class="form-control" id="postcode" name="postCode" placeholder="Postcode"onkeyup="removeError('postcode');">
                            </div>
                      </div>
                      
                       <div class="form-row">
                            <div class="form-group col-md-6">
                                 <label for="suburb">Country</label>
                                 <input type="text" class="form-control" id="country" name="cityOrTown" value="${rCountryName}" readonly>
                            </div>
                            
                      </div>
                 </div>
                 
             </div>
         </div>
         
         <div class="clearfix"></div>
            
			  <div class="">
				   <div class=""> 
                        <div class="hfive col-md-12">
                             <h5>Receiver ID Details</h5>
                         </div>
                                 
                         <div class="">
                              <div class="form-row">
                                   <div class="form-group col-md-6">
                                        <label for="idType">ID Type</label>
                                        <select class="form-control custom-select"  name="idProof" id="idProof" onchange="removeError('idProof');">
                                                <option value="">--Select*--</option>
                                                <c:forEach var="list" items="${idList}">
                                                <option value="${list.idValue}">${list.senderType}</option>
                                                </c:forEach>
                                           <!-- <option value="03">Medicare</option> -->
                                        </select>
                                   </div>
                                   <div class="form-group col-md-6" id="dl">
                                        <label for="idNumber">ID No </label>
                                        <input type="text" class="form-control" name="idProofNo" id="idProofNo"  placeholder="123PKOJ" onkeyup="removeError('idProofNo');">
                                   </div>
                              </div>
                        </div>
                        
                  </div>
             </div>
             </c:if>
             
 
          	<c:if test="${model.paymentType eq 'Card Transfer' or model.paymentType eq 'Card?Transfer'}">
         	    <div class="hfive col-md-12 ">
                            <h5>Receiver Card Transfer Details</h5>
                       </div>
 										<div class="form-row ">
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">cardNumber </label>
                					<input type="text" name="cardNumber1" id="cardNumber1" class="form-control">
  </div></div>                      
 </c:if>
           	<c:if test="${model.paymentType eq 'Mobile?Money' or model.paymentType eq 'Mobile Money'}">
         	    <div class="hfive col-md-12 ">
                            <h5>Receiver Mobile Money Details</h5>
                       </div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Mobile Transfer Number</label>
                					<input type="text" name="mobileTrnsferNumber" id="mobileTrnsferNumber" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Mobile Transfer Network</label>
                					<input type="text" name="transferNetWork" id="transferNetWork" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Mobile Transfer Network CreditType</label>
                					<input type="text" name=transferNetWorkCreditType id="transferNetWorkCreditType" class="form-control">
              					</div>
              					</div>

 </c:if>
          	<c:if test="${model.paymentType eq 'Home Delivery' or model.paymentType eq'Home?Delivery'}">
         	    <div class="hfive col-md-12 ">
                            <h5>Receiver Home Delivery Details</h5>
                       </div>
 										<div class="form-row " >
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Address1</label>
              					<input type="text" name="beneficiaryAddress1" id="beneficiaryAddress1" class="form-control">			
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Address2</label>
              					<input type="text" name="beneficiaryAddress2" id="beneficiaryAddress2" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Address3</label>
              					<input type="text" name="beneficiaryAddress3" id="beneficiaryAddress3" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BeneficiaryCity</label>
              					<input type="text" name="beneficiaryCity" id="beneficiaryCity" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BeneficiaryPostCode</label>
              					<input type="text" name="beneficiaryPostCode" id="beneficiaryPostCode" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BeneficiaryIdType</label>
              					<input type="text" name="beneficiaryIdType" id="beneficiaryIdType" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Id Details</label>
              					<input type="text" name="beneficiaryIdDetails" id="beneficiaryIdDetails" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">deliveryNote</label>
              					<input type="text" name="deliveryNote" id="deliveryNote" class="form-control">			
              					
              					</div></div>
 
 </c:if>  
          	<c:if test="${model.paymentType eq 'Account Transfer' or model.paymentType eq 'Bank Deposit' or model.paymentType eq 'Bank?Deposit'}">
         	    <div class="hfive col-md-12 ">
                            <h5>Receiver Account Transfer Details</h5>
                       </div>
  									<div class="form-row">
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Account Transfer </label>
                					<input type="text" name="beneficiaryAccountTransfer" id="beneficiaryAccountTransfer" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank Details</label>
              					<input type="text" name="bankDetails" id="bankDetails" class="form-control">			
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank Name</label>
              					<input type="text" name="bank" id="bank" class="form-control">			
              					</div></div>
 									<div class="form-row">
              					
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">swiftCode</label>
              					<input type="text" name="swiftCode" id="swiftCode" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">IBAN </label>
              					<input type="text" name="iBAN" id="iBAN" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">branch Name</label>
              					<input type="text" name="branch" id="branch" class="form-control">			
              					</div></div>
              			<div class="form-row">
              					
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch City</label>
              					<input type="text" name="BranchCity" id="BranchCity" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch State</label>
              					<input type="text" name="branchState" id="branchState" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch Telephone</label>
              					<input type="text" name="telephone" id="telephone" class="form-control">			
              					</div></div>
              				<div class="form-row">
              					
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch Manager</label>
              					<input type="text" name="branchManager" id="branchManager" class="form-control">			
              					</div>
              					
              					</div>
                       
 </c:if>
          	<c:if test="${model.paymentType eq 'Bill Payment' or model.paymentType eq 'Bill?Payment'}">
         	    <div class="hfive col-md-12 ">
                            <h5>Receiver Bill Payment Details</h5>
 									<div class="form-row">
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Utility Company </label>
                					<input type="text" name="utilityCompany" id="utilityCompany" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Customer AccountNumber</label>
              					<input type="text" name="customerAccountNumber" id="customerAccountNumber" class="form-control">			
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Invoice Number</label>
              					<input type="text" name="invoiceNumber" id="invoiceNumber" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank To Pay</label>
              					<input type="text" name="bankToPay" id="bankToPay" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BANK IBAN/SWIFT CODE</label>
              					<input type="text" name="iBan" id="iBan" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank Bic Code</label>
              					<input type="text" name="bankBicCode" id="bankBicCode" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Address Line1</label>
              					<input type="text" name="addressLine1" id="addressLine1" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Address Line2</label>
              					<input type="text" name="addressLine2" id="addressLine2" class="form-control">			
              					</div>
              					
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Address Line3</label>
              					<input type="text" name="addressLine3" id="addressLine3" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">City</label>
              					<input type="text" name="city" id="city" class="form-control">			
              					</div>
                					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">State</label>
              					<input type="text" name="state" id="state" class="form-control">			
              					</div>
                 					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">PostCode</label>
              					<input type="text" name="postCode" id="postCode" class="form-control">			
              					</div>
                  					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BillDescription</label>
              					<input type="text" name="billDescription" id="billDescription" class="form-control">			
              					</div>
              					
              					</div>
                       </div>
 </c:if>                    
         	<c:if test="${model.paymentType eq 'Cash Collection'}">
         	    <div class="hfive col-md-12 ">
                            <h5>Receiver CashCollection Details</h5>
                       </div>
									<div class="form-row">
              					<div class="form-group col-md-4" id="btr1">
                					<label for="inputEmail4">Collection Point</label>
                					<input type="text" name="collectionPointName" id="collectionPointName" class="form-control">
              					</div>              					
              					<div class="form-group col-md-4" id="btr2">
                					<label for="inputEmail4">collectionPointCode</label>
                					<input type="text" name="collectionPointCode" id="collectionPointCode" class="form-control" placeholder="Enter collectionPointName*" onkeyup="removeError('bankState')">
              					</div> 
              					<div class="form-group col-md-4" id="btr3">
                					<label for="inputEmail4">collectionPointBank</label>
                					<input type="text" name="collectionPointBank" id="collectionPointBank" class="form-control" placeholder="Enter collectionPointBank*" onkeyup="removeError('branchCode')">
              					</div> 
              					<div class="form-group col-md-4" id="btr4">
                					<label for="inputEmail4">collectionPointAddress</label>
                					<input type="text" name="collectionPointAddress" id="collectionPointAddress" class="form-control" placeholder="Enter collectionPointAddress  *" onkeyup="removeError('accountNo')">
              					</div> </div>
              														<div class="form-row">
              					             					
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPointCity</label>
                					<input type="text" name="collectionPointCity" id="collectionPointCity"class="form-control" placeholder="Enter collectionPointCity   *" onkeyup="removeError('accountHolderName')">
              					</div> 
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPointState</label>
                					<input type="text" name="collectionPointState" id="collectionPointState"class="form-control" placeholder="Enter collectionPointState" onkeyup="removeError('accountHolderName')">
              					</div> 
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPointTelephone</label>
                					<input type="text" name="collectionPointTelephone" id="collectionPointTelephone"class="form-control" placeholder="Enter collectionPointTelephone" onkeyup="removeError('accountHolderName')">
              					</div> </div>
              	<div class="form-row">
              					
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPin</label>
                					<input type="text" name="collectionPin" id="collectionPin"class="form-control" placeholder="Enter collectionPin   *" onkeyup="removeError('accountHolderName')">
              					</div> 
               					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">ConfirmcollectionPin</label>
                					<input type="text" name="confrmcollectionPin" id="confrmcollectionPin"class="form-control" placeholder="Enter ConfirmcollectionPin   *" onkeyup="removeError('accountHolderName')">
              					</div> 
              					 </div>
           </c:if>
           <div class="form-row">
                <c:if test="${model.paymentType eq '5' or model.paymentType eq 'cash'}">
                  <div class="hfive col-md-12">
                            <h5>Receiver Cash Pickup Details</h5>
                       </div>
                      <div class="form-group col-md-6">
           	               <label for="theiremail">Select cash pickup location</label>
        		           <select class="form-control" name="cashissuerCode" id="cashissuerCode" onchange="removeError('cashissuerCode');">
				                   <option value="">--Select *--</option>
				                   <c:forEach var ="list" items="${cashIssuerCodeList}">
				                              <option value="${list.cashPickupFrom}">${list.cashPickupFrom}</option>
			                  	    </c:forEach> 
				           </select>
         	         </div>
         	    </c:if> 
         	    <c:if test="${model.paymentType eq 'eWallet'}"> 
         	      <div class="hfive col-md-12">
                            <h5>Receiver eWallet Details</h5>
                       </div>
                      <div class="form-group col-md-6">
           	               <label for="theiremail">Select mobile eWallet</label>
        		           <select class="form-control" name="ewalletissuerCode" id="ewalletissuerCode" onchange="removeError('cashissuerCode');">
				                   <option value="">--Select *--</option>
				                           <c:forEach var ="list" items="${ewalletIssuerCodeList}">
				                                      <option value="${list.issuerCode}-${list.bankName}">${list.bankName}</option>
				                           </c:forEach> 
				           </select>
                     </div>
         	         <div class="form-group col-md-6" >
                          <label for="idNumber">eWallet Number</label>
                          <input type="text" class="form-control" name="eWalletNo" id="eWalletNumber" onkeypress="return onlyNumber(event)" placeholder="86527841" onkeyup="removeError('eWalletNumber');">
                     </div>
         	   </c:if> 
           </div>
           </div>
          
            <div class="clearfix"></div>
            <div class="text-center">
            <button type="button" class="btn btn-primary btn-lg" id="cnf">Confirm</button>
            </div>
          </form>  <br>

        </div><!-- /.container ENDs -->


   
  </div>
     </div>
      </div> 
       </div>
   </div></div>
   </div> <br />
   <%@include file="frontendfooter.jsp" %>
      
 <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"> 

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    
</body>
</html>