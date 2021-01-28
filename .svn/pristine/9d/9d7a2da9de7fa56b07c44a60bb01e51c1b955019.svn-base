<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<title>newrecipient</title>
<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/stylesheet1.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="ui/jquery.ui.core.js"></script>
<script src="ui/jquery.ui.datepicker.js"></script>
     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
   <script src="js/jquery-1.4.2.js"></script>
<link rel="stylesheet" href="./admin/themes/ui-lightness/jquery.ui.all.css" />
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
  <script src="${pageContext.request.contextPath}/resources/js/cleave.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.70/jquery.blockUI.min.js"></script>

<style>
label{
font-size:10px;
}

</style>
</head>
<body>
<%@include file="headerNew.jsp" %>

<div class="recipient">
	<div class="container">
		<div class="row">
		     <div class="col-md-12 ">
		<div class="profile-info">
			<div  id="" class="col-lg-9 col-md-9 col-sm-9 col-xs-9 new-recipient-in">
			
			</div>
			<div class="clear"></div>	
			<div class="row">
			<div class="col-md-12  my-5">
		    <form id="bForm" action="editnewbene" method="post">
		    <input type="hidden" name="beneficiaryId" id="beneficiaryId" value="${beneficiary.beneficiaryId}">
		    <input type="hidden" name="accountHolderName" id="accountHolderName" value="${beneficiary.accountHolderName}">
		    <input type="hidden" name="addressLine1" id="addressLine1" value="${beneficiary.addressLine1}">
		    <input type="hidden" name="bankBranchCode" id="bankBranchCode" value="${beneficiary.bankBranchCode}">
		    <input type="hidden" name="bankId" id="bankId" value="${beneficiary.bankId}">
		    <%-- <input type="hidden" name="beneficiaryCountry" id="beneficiaryCountry" value="${beneficiary.beneficiaryCountry}"> --%>
		    <input type="hidden" name="accountHolderName" id="accountHolderName" value="${beneficiary.accountHolderName}">
		    <input type="hidden" name="benificiaryStatus" id="benificiaryStatus" value="${beneficiary.benificiaryStatus}">
		    <input type="hidden" name="createdBy" id="createdBy" value="${beneficiary.createdBy}">
		    <input type="hidden" name="gender" id="gender" value="${beneficiary.gender}">
   		    <input type="hidden" name="createdDate" id="createdDate" value="${beneficiary.createdDate}">
          
          <div id="firstDiv">
          <div class="row">
          <div class="col-md-6">
          <h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">Beneficiary Details</h5>
                	<div class="form-row">
     <div class="form-group col-md-4" id="cp">
    <label for="email">Country :</label>
     <input type="text" class="form-control" id="countryISO" value="${beneficiary.beneficiaryCountry.countryName}" name="countryISO" onchange="getBanksbasedOnIso()">
  </div>
              					<div class="form-group col-md-4" id="cp">
    <label for="email">Reciever's First and Middle Name :</label>
   <input type="text" class="form-control" name="firstName" value="${beneficiary.firstName}" id="firstName" placeholder="Reciever's First and Middle Name" >
   </div>
   
              					<div class="form-group col-md-4" id="cp">
    <label for="email">Reciever's Last Name :</label>
   <input type="text" class="form-control" name="lastName" 
   value="${beneficiary.lastName}" id="lastName" placeholder="Reciever's Last Name" >
  </div>
   </div>
   <div class="row">
   
   <div class="col-md-4"></div>
   <div class="col-md-4"></div>
   <div class="col-md-4"></div>
   </div>
   
                	<div class="form-row ">
              					<div class="form-group col-md-4" id="cp">
    <label for="email">Reciever's Mobile Number :</label>
   <input type="number" class="form-control" name="mobileNumber" 
   value="${beneficiary.mobileNumber}" id="mobileNumber" 
   placeholder="Reciever's Mobile Number" >
  </div>
              					<div class="form-group col-md-4" id="cp">
    <label for="email">Reciever's email :</label>
   <input type="text" class="form-control" name="emailId" value="${beneficiary.emailId}" id="emailId" placeholder="Reciever's email" >
  </div>
              					<div class="form-group col-md-4" id="cp">
    <label for="email">Relationship :</label>
     <input  type="text" class="form-control" name="relationShip" value="${beneficiary.relationShip }" id="relationShip">
  </div>
   </div>
                	<div class="form-row">
              					<div class="form-group col-md-4" id="cp">
    <label for="email">Id-Proof :</label>
     <select class="form-control" id="idProof" name="idProof">
                                                         <c:if test="${beneficiary.idProof eq '1'}">
                                                                <option value="${beneficiary.idProof}">Work Permit</option>
                                                         </c:if>
                                                         <c:if test="${beneficiary.idProof eq '2'}">
                                                                <option value="${beneficiary.idProof}">International Passport</option>
                                                         </c:if>
                                                         <c:if test="${beneficiary.idProof eq '3'}">
                                                                <option value="${beneficiary.idProof}">Identification ID</option>
                                                         </c:if>
                                                         <c:if test="${beneficiary.idProof eq '4' }">
                                                               <option value="${beneficiary.idProof}">Residence Permit</option>
                                                         </c:if>
                                                          <c:if test="${beneficiary.idProof eq '5' }">
                                                               <option value="${beneficiary.idProof}">Passport</option>
                                                         </c:if>
                                                          <c:if test="${beneficiary.idProof eq '6' }">
                                                               <option value="${beneficiary.idProof}">Social Security</option>
                                                         </c:if>
                                                          <c:if test="${beneficiary.idProof eq '01' }">
                                                               <option value="${beneficiary.idProof}">Driver Licence</option>
                                                         </c:if>
                                                          <c:if test="${beneficiary.idProof eq '7' }">
                                                               <option value="${beneficiary.idProof}">System ID</option>
                                                         </c:if>
                                                          <c:if test="${beneficiary.idProof eq '8' }">
                                                               <option value="${beneficiary.idProof}">Company Registration No.</option>                                                       </c:if>
                                                         

  </select>
  </div>
 
   
    <div class="form-group col-md-4" id="cp">
    <label for="email">Id-Proof No :</label>
   <input type="text" name="idProofNo" value="${beneficiary.idProofNo}" id="idProofNo" class="form-control" placeholder="Id-Proof No" >
   </div>
   </div></div><div class="col-md-6">
  										<span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">CARD Transfer Details</h5></span>
 									     <div class="form-row " id="CardTrDiv2">
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">cardNumber </label>
                					<input type="text" name="cardNumber" id="cardNumber" value="${beneficiary.cardNumber}" class="form-control">
              					</div></div></div>
   
 	<div class="col-md-6">
 										<span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">Mobile Transfer Details</h5></span>
                               
                               <div class="form-row " id="mbTrDiv1">
										
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Mobile Transfer Number</label>
                					<input type="text" name="mobileTrnsferNumber" value="${beneficiary.mobileTrnsferNumber}" id="mobileTrnsferNumber" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Mobile Transfer Network</label>
                					<input type="text" name="transferNetWork" value="${beneficiary.transferNetWork }" id="transferNetWork" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Mobile Transfer Network CreditType</label>
                					<input type="text" name="transferNetWorkCreditType" value="${beneficiary.transferNetWorkCreditType }" id="transferNetWorkCreditType" class="form-control">
              					</div>
              					</div></div>
  									<div class="col-md-6">	
  										<span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">Home Delivery Details</h5></span>
                              <div class="form-row " id="homeTrDiv1">
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Address1</label>
              					<input type="text" class="form-control" name="beneficiaryAddress1" value="${beneficiary.beneficiaryAddress1 }" id="beneficiaryAddress1">			
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Address2</label>
              					<input type="text" class="form-control"  name="beneficiaryAddress2" value="${beneficiary.beneficiaryAddress2 }" id="beneficiaryAddress2">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Address3</label>
              					<input type="text" class="form-control"  name="beneficiaryAddress3" value="${beneficiary.beneficiaryAddress3 }" id="beneficiaryAddress3">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BeneficiaryCity</label>
              					<input type="text" class="form-control"  name="beneficiaryCity" value="${beneficiary.beneficiaryCity }" id="beneficiaryCity">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BeneficiaryPostCode</label>
              					<input type="text" class="form-control"  name="beneficiaryPostCode" value="${beneficiary.beneficiaryPostCode }" id="beneficiaryPostCode">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BeneficiaryIdType</label>
              					<input type="text" class="form-control"  name="beneficiaryIdType" value="${beneficiary.beneficiaryIdType }" id="beneficiaryIdType">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Id Details</label>
              					<input type="text" class="form-control"  name="beneficiaryIdDetails" value="${beneficiary.beneficiaryIdDetails }" id="beneficiaryIdDetails">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">deliveryNote</label>
              					<input type="text" class="form-control"  name="deliveryNote" value="${beneficiary.deliveryNote}" id="deliveryNote">			
              					</div>
              					</div></div>
              					</div><div class="row">            
              					  					<div class="col-md-6">


										<span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">Account Transfer Details1</h5></span>
               					    <div id="AccountTrDiv1">
									<div class="form-row">
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Account Transfer </label>
                					<input type="text" class="form-control"  name="beneficiaryAccountTransfer" value="${beneficiary.beneficiaryAccountTransfer }" id="beneficiaryAccountTransfer" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank Details</label>
              					<input type="text" class="form-control"  name="bankDetails" value="${beneficiary.bankDetails }" id="bankDetails">			
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank Name</label>
              					<input type="text" class="form-control"  name="bank" value="${beneficiary.bank }" id="bank">			
              					</div></div>
 									<div class="form-row">
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">swiftCode</label>
              					<input type="text" class="form-control"  name="swiftCode" value="${beneficiary.swiftCode}" id="swiftCode">			
              					</div>
<!--                					<div class="form-group col-md-4" id="cp">
 --><%--                 					<label for="inputEmail4">IBAN </label>
              					<input type="text"  class="form-control" name="iBAN" value="${beneficiary.iBAN}" id="iBAN">			
 --%>              					
<!--  </div>
 -->               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">branch Name</label>
              					<input type="text" class="form-control"  name="branch" value="${beneficiary.branch}" id="branch">			
              					</div></div>
              			<div class="form-row">               					
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch City</label>
              					<input type="text" class="form-control"  name="branchCity" value="${beneficiary.branchCity}" id="branchCity">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch State</label>
              					<input type="text" class="form-control"  name="branchState" value="${beneficiary.branchState}" id="branchState">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch Telephone</label>
              					<input type="text" class="form-control"  name="telephone" value="${beneficiary.telephone}" id="telephone">			
              					</div></div>
              				<div class="form-row">
              					
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch Manager</label>
              					<input type="text" class="form-control" name="branchManager" id="branchManager" value="${beneficiary.branchManager}">			
              					</div>
              					</div>
              					</div></div>
              					<div class="col-md-6">
              					  
										<span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">Utility Bill </h5></span>
                                <div  id="utilityTrDiv1">
									<div class="form-row">
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Utility Company </label>
                					<input  class="form-control" type="text" name="utilityCompany" value="${beneficiary.utilityCompany}" id="utilityCompany" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Customer AccountNumber</label>
              					<input type="text" name="customerAccountNumber" value="${beneficiary.customerAccountNumber}" id="customerAccountNumber" class="form-control">			
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Invoice Number</label>
              					<input  class="form-control" type="text" name="invoiceNumber" value="${beneficiary.invoiceNumber}" id="invoiceNumber" class="form-control">			
              					</div>
              					<div class="form-row">
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank To Pay</label>
              					<input  class="form-control" type="text" name="bankToPay" value="${beneficiary.bankToPay}" id="bankToPay" class="form-control">			
              					</div>
<%--                					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BANK IBAN/SWIFT CODE</label>
              					<input class="form-control"  type="text" name="iBan" id="iBan" value="${beneficiary.iBan}" class="form-control">			
              					</div>
 --%>               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank Bic Code</label>
              					<input type="text" name="bankBicCode" id="bankBicCode" value="${beneficiary.bankBicCode}" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Address Line1</label>
              					<input type="text" name="addressLine1" id="addressLine1" value="${beneficiary.addressLine1}" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Address Line2</label>
              					<input type="text"  class="form-control"  name="addressLine2" id="addressLine2" value="${beneficiary.addressLine2}" class="form-control">			
              					</div>
              					
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Address Line3</label>
              					<input type="text"  class="form-control"  name="addressLine3" id="addressLine3" value="${beneficiary.addressLine3}" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">City</label>
              					<input type="text"  class="form-control"  name="city" id="city" value="${beneficiary.city}" class="form-control">			
              					</div>
                					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">State</label>
              					<input type="text"  class="form-control"  name="state" id="state" value="${beneficiary.state }" class="form-control">			
              					</div>
                 					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">PostCode</label>
              					<input type="text"  class="form-control"  name="postCode" id="postCode" value="${beneficiary.postCode }" class="form-control">			
              					</div>
                  					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BillDescription</label>
              					<input type="text"  class="form-control"  name="billDescription" id="billDescription" vlue="${beneficiary.billDescription}" class="form-control">			
              					</div>
              					</div></div>
   </div></div><div class="col-md-6">
										<br><br><span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">CashCollection Details</h5></span>
               			<div  id="cashTrDiv1">
									<div class="form-row">
              					<div class="form-group col-md-4" id="btr1">
                					<label for="inputEmail4">Collection Point</label>
                					<input type="text"  class="form-control"  name="collectionPointName" id="collectionPointName" value="${beneficiary.collectionPointName}" class="form-control">
              					</div>              					
              					<div class="form-group col-md-4" id="btr2">
                					<label for="inputEmail4">collectionPointCode</label>
                					<input type="text"  class="form-control"  name="collectionPointCode" id="collectionPointCode" value="${beneficiary.collectionPointCode }" class="form-control" placeholder="Enter collectionPointName*" onkeyup="removeError('bankState')">
              					</div> 
              					<div class="form-group col-md-4" id="btr3">
                					<label for="inputEmail4">collectionPointBank</label>
                					<input type="text"  class="form-control"  name="collectionPointBank"  ${beneficiary.collectionPointBank}" id="collectionPointBank" class="form-control" placeholder="Enter collectionPointBank*" onkeyup="removeError('branchCode')">
              					</div> 
              					<div class="form-group col-md-4" id="btr4">
                					<label for="inputEmail4">collectionPointAddress</label>
                					<input type="text"  class="form-control" name="collectionPointAddress" value="${beneficiary.collectionPointAddress}" id="collectionPointAddress" class="form-control" placeholder="Enter collectionPointAddress  *" onkeyup="removeError('accountNo')">
              					</div> 
              					             					
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPointCity</label>
                					<input type="text"  class="form-control"  name="collectionPointCity" value="${beneficiary.collectionPointCity }" id="collectionPointCity"class="form-control" placeholder="Enter collectionPointCity   *" onkeyup="removeError('accountHolderName')">
              					</div> 
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPointState</label>
                					<input type="text"  class="form-control"  name="collectionPointState" value="${beneficiary.collectionPointState}" id="collectionPointState"class="form-control" placeholder="Enter collectionPointState" onkeyup="removeError('accountHolderName')">
              					</div> 
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPointTelephone</label>
                					<input type="text"  class="form-control"  name="collectionPointTelephone" value="${beneficiary.collectionPointTelephone }" id="collectionPointTelephone"class="form-control" placeholder="Enter collectionPointTelephone" onkeyup="removeError('accountHolderName')">
              					</div> 
              					
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPin</label>
                					<input type="text"  class="form-control"  name="collectionPin" value="${beneficiary.collectionPin}" id="collectionPin"class="form-control" placeholder="Enter collectionPin   *" onkeyup="removeError('accountHolderName')">
              					</div> 
              					 </div>
</div></div> </div>
			</form>
			<div class="clearfix"></div><br>
<div class="col-md-6" >
<a href="txnConfirmation?txnid=${txId}" class="btn btn-primary btn-blue btn-submit mt-20 back" >Back</a>
			              	  
                    
                    
                    
                    </div>






	
</div>
			
			</div></div>
		</div>
		</div>
			</div>
		</div>
</div>
	
			<%--  <%@include file="footer.jsp" %> --%>
</body>
<script type="text/javascript">
function getBanksAndSetDailingCOde(){
	var countryISO=$('#countryISO').val();
	$.ajax({
		url : "${pageContext.request.contextPath}/getbanksbasedoncountry",
		type : "get",
		data : "countryISO="+countryISO,
		async : false,
		success : function(response){
			var bankList = JSON.stringify(response, undefined, '\t');
			var opt='<option value="">--select--</option>'; 
			$.each($.parseJSON(bankList),function(idx,obj){
				 opt=opt+'<option value="'+obj.issuerCode+'-'+obj.bankName+'">'+obj.bankName+'</option>';
			 });
			$('#bnkName').empty();
			$('#bnkName').append(opt);
		},
		error : function(error,xhr,status){
			alert('getbanks error  = '+xhr);
		}
		
	})
}

</script>
<script type="text/javascript">
function getBanksbasedOnIso(){
	//alert('ftghjk');
	var countryISO=$('#countryISO').val();
	//alert('countryISO====='+countryISO);
	$.ajax({
		url : "getBanksBasedOnCountry",
		type : "get",
		data : "countryISO="+countryISO.split(",")[0],
		async : false,
		success : function(response){
			var bankList = JSON.stringify(response, undefined, '\t');
			//alert('bankList==='+bankList);
			var opt='<option value=""></option>'; 
			$.each($.parseJSON(bankList),function(idx,obj){
				 opt=opt+'<option value="'+obj.bankName+'">'+obj.bankName+'</option>';
			 });
			$('#bankName').empty();
			$('#bankName').append(opt);
		},
		error : function(error,xhr,status){
			alert('getbanks error  = '+xhr);
		}
		
	})
	$.ajax({
		url : "getIdTypesBasedOnCountry",
		type : "get",
		data : "branchId="+countryISO.split(",")[1],
		async : false,
		success : function(response){
			var idList = JSON.stringify(response, undefined, '\t');
		//alert('idList==='+idList);
			var opt='<option value="">--select--</option>'; 
			$.each($.parseJSON(idList),function(idx,obj){
				 opt=opt+'<option value="'+obj.idValue+'">'+obj.senderType+'</option>';
			 });
			$('#idProof').empty();
			$('#idProof').append(opt);
		},
		error : function(error,xhr,status){
			alert('getbanks error  = '+xhr);
		}
		
	})


}

</script>


</html>