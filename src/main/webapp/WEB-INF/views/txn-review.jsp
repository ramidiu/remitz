<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

 <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"> 

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<head>
<meta charset="ISO-8859-1">
<title>Review123</title>
<style>
.map-places{
box-shadow: 0 20px 40px 0 rgba(21, 12, 181, 0.3);

}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#you').addClass('active');
	$('#rec').addClass('active');
	$('#review').addClass('active');
	
	$('#cnf').click(function(){
		var purpose=$('#purpose').val();
		var sourceOfFund=$('#sourceOfFund').val();
		if(sourceOfFund==''){
			$('#sourceOfFund').focus().css('outline' , 'solid red 2px');
			return false;
		}
	    if(purpose==''){
	    	$('#purpose').focus().css('outline' , 'solid red 2px');
	    	return false;
	    }
		$('#pay').attr('action','pay');
		$('#pay').submit();
	});
	$('#changerec').click(function(){
		$('#pay').attr('action','newrecipient');
		$('#pay').submit();
	})
});

</script>
<script type="text/javascript">
function removeError(id){
	$('#'+id).css('outline','#B0C4DE');
}
</script>
<style>

</style>



</head>
<body>
<%-- <%@include file="header4.jsp" %> --%>
<%@include file="myacc_header.jsp" %> 
<div id="main-wrapper01" style="padding:0 0 100px "> 
   <form id="pay" method="post">
			<input type="hidden" id="dob" name="dob" value=""/>													
		<input type="hidden" name="msidnInformationId" value="${msidnInformationId}">
		<input type="hidden" name ="modeOfPayment" id="modeOfPayment" value="${txnDetails.modeOfPayment}">	
		<input type="hidden" id="paymentType" name="paymentType" value="${txnDetails.paymentType}">	
		<input type="hidden" id="toCountry" name="receivingBranch" value="${txnDetails.receivingBranch}"/>
		<input type="hidden" id="fromCountry" name="sendingBranch" value="${txnDetails.sendingBranch}"/> 
		<input type="hidden" id="adminId" name="adminId" value="${txnDetails.adminId}"/>
		<input type="hidden" name="sendingAmount" value="${txnDetails.sendingAmount}"/>
		 <input type="hidden" name="deliveryTime" value="${txnDetails.deliveryTime}">
<input type="hidden" name="deliveryTime" value="${details.deliveryTime}">
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
		
		
		<%-- <input type="hidden" name="occupation" value="${occupation}"> --%>
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
		<input type="hidden" name="bankBranchCode" value="${beneficiary.bankBranchCode}">
		
		<input type="hidden" name="bankAccountNumber" value="${beneficiary.bankAccountNumber}">
   		<input type="hidden" name="issuerCode" value="${beneficiary.issuerCode}">
   		<%-- <input type="hidden" id="totalFee" name="totalFee" value="${totalFee}"/> --%>
 		  <input type="hidden" id="towhome" name="towhome" value="${towhome}"/>
   <%-- <input type="hidden" id="trangloAUD" name="trangloAUD" value="${trangloAUD}"> --%>
  		<input type="hidden" name="eWalletNo" value="${beneficiary.eWalletNo}">
 		 <input type="hidden" name="existedbeneficiary" value="${existedbeneficiary}">
  
  <div id="content">
  <div class="container">
       <div class="col-md-6 map-places col-md-offset-3">
            <div class="text-center">
                  <div class="reviewdel text-center">
                 <h3>Review details of your transfer</h3>
                 </div>
            </div>
            <div class=" pb-5">
                 <div class="">
                      <div class="details-table   row">
                           <div class="col-sm-6">
                                <strong>Transfer details</strong>
                           </div>
                           <div class="col-sm-6 text-right">
                                <a href="home" style="color:#007bff">Edit</a>
                           </div>
                           <div class="col-sm-6">
                                You send
                           </div>
                           <div class="col-sm-6 text-right text-lg mb-2 mt-2">
                                ${txnDetails.sendingAmount} ${txnDetails.sendingCurrencyCodeCode}
                           </div>
                      <!-- <div class="col-sm-6">Fee (included):</div> -->
                           <div class="col-sm-6">Fees:</div>
                           <div class="col-sm-6 text-right">
                                ${txnDetails.totalTransactionFee} ${txnDetails.sendingCurrencyCodeCode}
                           </div>
                      <!-- <div class="col-sm-6">Amount we'll convert:</div> -->
                           <div class="col-sm-6" ><b>Total to pay us:</b></div>
                           <div class="col-sm-6 text-right" style="font-size: 1.32em;">
                              <b>  ${txnDetails.totalToPay} ${txnDetails.sendingCurrencyCodeCode}</b>
                           </div>
                    <%--   <div class="col-sm-6">Guaranteed rate (48 hours)</div>
                           <div class="col-sm-6 text-right">${exchRate} ${fromBranch.fromCountry.currencyCode}</div> --%>
                           <div class="col-sm-6">
                                <b>${beneficiary.firstName} gets</b>
                           </div>
                           <div class="col-sm-6 text-right text-lg">
                                ${txnDetails.receivingAmount} ${txnDetails.receivingCurrencyCode}
                           </div>
                      <%-- <div class="col-sm-6">Should arrive</div>
                           <div class="col-sm-6 text-right">${delivery_time}</div> --%>
                           <div class="col-sm-6">
                                Should arrive
                           </div>
                           <div class="col-sm-6 text-right">
                                ${details.deliveryTime}
                           </div>
                         <c:if test="${beneficiary ne null and beneficiary ne ''}">
                           <c:if test="${txnDetails.paymentType eq 'Cash Collection' or txnDetails.paymentType eq 'Cash?Collection'}">
                                 <div class="col-sm-12">
                                      <hr>  
                                 </div>  
                                 <div class="col-sm-6 pt-2">
                                      <strong>Recipient Cash Collection' details</strong>
                                 </div>
                                 <div class="col-sm-6 text-right" >
                                      <button type="button" id="changerec" 
                                      style="color:#007bff">
                                              Change
                                      </button>
                                 </div>
                                 <div class="row">
                                 
                                 <div class="col-md-6">
                                 <label for="inputEmail4">
                					<b>Collection PointName:</b></div>
                					<div class="col-md-6 text-right">${txnDetails.collectionPointName}
                					</label>
                					</div></div>
                					
                					
                					
                <div class="row">
                                 
                  <div class="col-md-6">
                          <label for="inputEmail4">
                					<b>collectionPointAddress:</b></div>
                   <div class="col-md-6 text-right">
                					${txnDetails.collectionPointAddress}
                		   </label>
                					</div>
                					</div>
                					
                					
                					
                					
                					<div class="row">
                                    <div class="col-md-6">
                                 <p for="inputEmail4">
                					collectionPointCity:</div>
                					<div class="col-md-6 text-right">${txnDetails.collectionPointCity}
                					</p>
                					</div></div>
                					
                					
                					
                					<div class="row">
                                    <div class="col-md-6">
                                 <pfor="inputEmail4">
                					Bank:</div>
                					<div class="col-md-6 text-right">${txnDetails.collectionPointBank}
                					</p>
                					</div></div>
                					
                					
                					
                					<div class="row">
                                    <div class="col-md-6">
                                           <label for="inputEmail4">
                					<b>collectionPointCode:</b></div>
                					<div class="col-md-6 text-right">${txnDetails.collectionPointCode}
                					</label>
                					</div>
                					</div>
                					
                					
                					
               <div class="row">
                      <div class="col-md-6">
                             <label for="inputEmail4">
                				<b>CollectionPin:</b></div>
               						<div class="col-md-6 text-right">${txnDetails.collectionPin}
                					</label>
                			  </div>
                		</div>
                </div>

                           </c:if>
                           <c:if test="${txnDetails.paymentType eq 'Mobile?Money'  or txnDetails.paymentType eq 'Mobile Money'}">
                                <div class="col-sm-12">
                                     <hr>  
                                </div> 
                                 
                               <div class="col-sm-6 pt-2">
                                    <p>Mobile Money Transfer Details</p>
                               </div>
                             
                               <div class="col-sm-6 text-right">
                                    <button type="button" id="changerec" style="color:#007bff">
                                            Change
                                    </button>
                               </div>
                               <div class="row"></div>
                           <div class="col-sm-6  ">
              					<label><b>TransferNetWork:</b></label>
              					</div>
                           <div class="col-sm-6 text-right ">
              					<label>${txnDetails.transferNetWork}</label>
              					</div>
              					
              					
              					<div class="col-sm-6  ">
              					<label><b>TransferNetWork:</b></label>
              					</div>
                           <div class="col-sm-6 text-right ">
              					<label>${txnDetails.transferNetWork}</label>
              					</div>
              					
                         </c:if>
                         <c:if test="${txnDetails.paymentType eq 'Bill Payment' or txnDetails.paymentType eq 'Bill?Payment' }">
                               <div class="col-sm-12">
                                    <hr>  
                               </div>  
                               <div class="col-sm-6 pt-2">
                                    <strong>Bill Payment Details</strong>
                               </div>
                               <div class="col-sm-6 text-right" >
                                    <button type="button" id="changerec" style="color:#007bff" >
                                            Change
                                    </button>
                               </div>
                               
                               <div class="row">
                               
                               <div class="col-md-6"><p for="inputEmail4">utilityCompany:</p>
                               </div>
                               <div class="col-md-6" style="text-align:right">${txnDetails.utilityCompany}</div>
                               </div>
                               
                               <div class="row">
                               
                               <div class="col-md-6">CustomerAccountNumber:</div>
                               <div class="col-md-6" style="text-align:right">
              					${txnDetails.customerAccountNumber}</div>
                               </div>
                               
                               
                               <div class="row">
                               
                               <div class="col-md-6">InvoiceNumber:</div>
                               <div class="col-md-6" style="text-align:right">${txnDetails.invoiceNumber}
              					</div>
                               </div>
                               
                               
                               <div class="row">
                               <div class="col-md-6">BankToPay:
                               </div>
                               <div class="col-md-6" style="text-align:right">
                               ${txnDetails.bankToPay}
                               </div>
                               
                               </div>
                               
                               <div class="row">
                               
                               <div class="col-md-6">BankBicCode:</div>
                               <div class="col-md-6" style="text-align:right">${txnDetails.bankBicCode}
              					</div>
                               </div>
                               <div class="row">
                               
                               <div class="col-md-6">Adress:</div>
                               <div class="col-md-6" style="text-align:right">${txnDetails.addressLine1}
              					</div>
                               </div>
                               
                               
                               <div class="row">
                               
                               <div class="col-md-6">
                               <label><b></b></label>
                               <div class="col-md-6">
                               <label></label>
              					</div>
                               </div>
                               </div>
                               
                               
                               
                              
                         </c:if>
                         <c:if test="${txnDetails.paymentType eq 'Home Delivery' or txnDetails.paymentType eq 'Home?Delivery' }">
                               
                                <div class="col-sm-6 pt-2">
                                    
                               </div>
                               <div class="col-sm-6 " >
                                    
                               </div>
                        
                               <div class="row">
                               <div class="col-md-6"></div>
                               <div class="col-md-6 "></div>
                               </div>
                               
                                <div class="row">
                               <div class="col-md-6">
                               	<P>
                               <strong>Home DeliveryDetails</strong>
                               	</P>
              					
                               </div>
                               <div class="col-md-6 text-right">
                               <button type="button" id="changerec" style="color:#007bff">
                                            Change
                                    </button></div>
                               </div>
                               
                               
                               <div class="row">
                               <div class="col-md-6">
                               	<P for="inputEmail4">
                               BeneficiaryAddress:
                               	</P>
              					
                               </div>
                               <div class="col-md-6 text-right">
                               ${txnDetails.beneficiaryAddress1},${txnDetails.beneficiaryAddress2},
                					${txnDetails.beneficiaryAddress3}</div>
                               </div>
                               
                               <div class="row">
                               <div class="col-md-6">
                               BeneficiaryCity:
                               </div>
                               <div class="col-md-6 text-right">${txnDetails.beneficiaryCity}</div>
                               </div>
                               
                               <div class="row">
                               
                               <div class="col-md-6">BeneficiaryPostCode:</div>
                               <div class="col-md-6 text-right">${txnDetails.beneficiaryPostCode}</div>
                               </div>
                               
                               
                              
                             
                         
                         </c:if>
                         <c:if test="${txnDetails.paymentType eq 'Card Transfer' or txnDetails.paymentType eq 'Card?Transfer' }">
                                
                               
                               </div>
                               <div class="row" style="margin:6px;">
                               
                               
                               <div class="col-md-6">
                               
                              <strong>Card Transfer Details</strong>
                               
                               </div>
                               
                               
                               <div class="col-md-6 text-right"> <button type="button" id="changerec" style="color:#007bff">
                                            Change
                                    </button></div>
                               </div>
                               <div class="row" style="margin:6px;">
                               <div class="col-md-6"><b>CardNumber:</b></div>
                               <div class="col-md-6">${txnDetails.cardNumber}</div>
                               </div>
                               
                               
                               <div class="col-sm-6 text-right">
              					<label></label>
              					</div>
              					
                               
</c:if>


                         <c:if test="${txnDetails.paymentType eq 'Account Transfer' or txnDetails.paymentType eq 'Account?Transfer' or txnDetails.paymentType eq 'Bank Deposit' or txnDetails.paymentType eq 'Bank?Deposit' }">
                               <div class="row">
                                <div class="col-sm-6 pt-2">

                               </div>
                               <div class="col-sm-6 text-right" >
                                   </div>

                               </div>
                               
                               
                               <div class="row">
                               <div class="col-sm-6 ">
              					<label><b>                                    <strong>Bank Deposit Details</strong></b></label>
              					</div>
                               <div class="col-sm-6 text-right">
              					<label><b> <button type="button" style="color:#007bff" id="changerec" >
                                            Change
                                    </button></b></label>
              					</div>
              					</div>
                               
                               
                             
                               <div class="row">
                               <div class="col-sm-6 ">
              					<label><b>beneficiaryAccountTransfer:</b>
              					</label>
              					</div>
                               <div class="col-sm-6 text-right">
              					<label>
              					<b>${txnDetails.beneficiaryAccountTransfer}</b></label>
              					</div>
              					</div>
              					
              					<div class="row">
                               <div class="col-sm-6 ">
              					<label><b>BankDetails:</b></label>
              					</div>
                               <div class="col-sm-6 text-right">
              					<label><b>${txnDetails.bankDetails}</b></label>
              					</div>
              					</div>
              					
              					
              					<div class="row">
                               <div class="col-sm-6 ">
              					<label><b>beneficiaryAccountTransfer:</b></label>
              					</div>
                               <div class="col-sm-6 text-right">
              					<label><b>${txnDetails.beneficiaryAccountTransfer}</b></label>
              					</div>
              					</div>
              					
              					<div class="row">
                               <div class="col-sm-6 ">
              					<label><b>Bank:</b></label>
              					</div>
                               <div class="col-sm-6 text-right">
              					<label><b>${txnDetails.bank}</b></label>
              					</div>
              					</div>
              					
              					
              					
              					
                               <div class="row">
                               <div class="col-sm-6 ">
              					<label><b>BranchCity/State:</b></label>
              					</div>
                               <div class="col-sm-6 text-right">
              					<label><b>${txnDetails.branchCity},${tx.branchState}</b></label>
              					</div></div>
                               <div class="col-sm-6 text-right">
              					<label><b></b></label>
              					</div>
                               <div class="col-sm-6 text-right">
              					<label><b></b></label>
              					</div>
                               <div class="col-sm-6 ">
              					<label><b>SwiftCode:</b>${txnDetails.swiftCode}</label>
              					</div>
                               <div class="col-sm-6 text-right">
              					<label><b>Telephone:</b>${txnDetails.telephone}</label>
              					</div>
</c:if>



</c:if> 
<%--                          <c:if test="${txnDetails.paymentType eq 'Card Transfer' }">
                                <div class="col-sm-6 pt-2">
                                    <strong>Card Transfer Details</strong>
                               </div>
                               <div class="col-sm-6 text-right" >
                                    <button type="button" id="changerec" >
                                            Change
                                    </button>

                               </div>
                        
                   </c:if>
 --%>              <!-- /.details-table ENDs -->
         
   <!--     </a>
      --><!-- /.container ENDs -->
   
    
     <div class="clearfix"></div>
    
             <div class="" style="margin:10px;">
                  <label for="">
                          Source of Fund :<font color="red">*</font> 
                  </label>
        		  <select class="form-control" name="sourceOfFund" id="sourceOfFund" onchange="removeError('sourceOfFund');" >
				          <option value="">--Select --</option>
			          	  <c:forEach var ="list" items="${sofList}">
				                     <option value="${list.sourceOffundId}">${list.sourceOfFund}</option>
				          </c:forEach> 
				 </select>
         	</div>
            <div class="form-group " style="margin:10px;">
           	     <label for="theiremail">Reason for this transfer :<font color="red">*</font> </label>
        		 <select class="form-control" name="sendingReason" id="purpose" onchange="removeError('purpose');">
        		         <option value="">--Select --</option>
				         <c:forEach var ="list" items="${purposeCodes}">
				                   <option value="${list.reasonFortransferId}">${list.reasonForTransfer}</option>
				         </c:forEach> 
				</select>
         	
         	<div class="col-md-12 rvs" style="">
         	  <button type="button" id="cnf"class="btn btn-primary btn-block w-100" >
                    Confirm and continue
            </button><br>
         	</div>
         	</div>
         	</div>
         	</div><br>
          
     
  </div><!-- /.content ENDs -->
</form>
</div><!--/#main-wrapper ENDs-->

</div><br>
<%@include file="frontendfooter.jsp"%>
</body>
</html>