<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!--<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script> -->
<title>newrecipient</title>
<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/stylesheet1.css">
<style>

/* .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 8px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 0 !important;
}
.table>tbody>tr.info>td, .table>tbody>tr.info>th, .table>tbody>tr>td.info, .table>tbody>tr>th.info, .table>tfoot>tr.info>td, .table>tfoot>tr.info>th, .table>tfoot>tr>td.info, .table>tfoot>tr>th.info, .table>thead>tr.info>td, .table>thead>tr.info>th, .table>thead>tr>td.info, .table>thead>tr>th.info {
    background-color: transparent !important;
}
/*  .myDiv{
 	display:none;
 } */
/* form label {
  display: inline-block;
  width: 100px;
}

form div {
  margin-bottom: 10px;
}

.error {
  color: red;
  margin-left: 5px;
 
}

label.error {
  display: inline;
} */
#bForm{

    margin: 211px auto 0;
   
}

 #fromCountryDiv{
 	margin: 0 0 38px;
 }
 
 .recipient{
 	    margin-top: 0px;
    padding: 0px 50px;
 }
 .recipient .btn.btn-blue.btn-submit {
    color: #fff;
    margin: 0 10px;
    font-size: 16px;
    padding: 10px 27px 13px 32px;
    background-color: #2dbe60;
    border-radius: 0px;
    border: none;
    font-weight:600 !important;
    font-family: 'Lato', sans-serif;
}
 .recipient .btn.btn-blue.btn-submit:hover {
    color: #fff !important;
    margin: 0 10px;
    font-size: 16px;
     font-weight:600 !important;
    padding: 10px 27px 13px 32px;
    background-color: #2dbe60 !important;
    border-radius: 0px;
    border: none;
    font-family: 'Lato', sans-serif;
}
 .modal {
    background: transparent !important;
    height: 100%;
    left: 0;
    padding: 12px;
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 2;
}
.recipient button#cnf {
    color: #fff;
    margin: 0 10px;
    font-size: 16px;
    padding: 8px 23px 12px 25px;
    background-color: #2dbe60;
    border-radius: 0px;
    border: none;
    font-weight: 600 !important;
    font-family: 'Lato', sans-serif;
    margin-top: 20px;
}
.recipient button#cnf:hover{
    color: #fff;
    margin: 0 10px;
    font-size: 16px;
    padding: 8px 23px 12px 25px;
    background-color: #2dbe60;
    border-radius: 0px;
    border: none;
    font-weight: 600 !important;
    font-family: 'Lato', sans-serif;
    margin-top: 20px;
}

@media only screen and (max-width:767px){

.profile-info {
   
    margin: 15px 0 0 !important;
    padding: 0px !important;
}

.profile-info .form-group {
    padding: 0px;
}




}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#cnf').click(function(){
	var bFirstName=$('#bFirstName').val();
	var lastName=$('#lastName').val();
    var bmobileNumber=$('#bmobileNumber').val();
    var email=$('#email').val();
    var relationShip=$('#relationShip').val();
    var idProof=$('#idProof').val();
    var idProofNo=$('#idProofNo').val();
   	var countryISO=$('#countryISO').val();
    var bnkName=$('#bnkName').val();
   	var branchName=$('#branchName').val();
   	var accountNo=$('#accountNo').val();
    if(countryISO==''){
    	$('#countryISO').focus().css('outline' , 'solid red 2px');
    	return false;
    }
/*    	if(bnkName==''){
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
 */    
	
    if(bFirstName==''){
    	$('#bFirstName').focus().css('outline' , 'solid red 2px');
    	return false;
    }
    if(lastName==''){
    	$('#lastName').focus().css('outline' , 'solid red 2px');
    	return false;
    }
    if(bmobileNumber==''){
    	$('#bmobileNumber').focus().css('outline' , 'solid red 2px');
    	return false;
    }
 /*    if(email==''){
    	$('#email').focus().css('outline' , 'solid red 2px');
    	return false;
    }
    if(IsEmail(email)==false){
		$('#email').focus().css('outline' , 'solid red 2px');
		$('#emsg').empty();
		$('#emsg').append("<font color='red'>Invalid Email</font>");
          return false;
        } */
  
    if(relationShip==''){
    	$('#relationShip').focus().css('outline' , 'solid red 2px');
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
   

    $('#bForm').submit();
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
	//alert("id is "+id);
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
<%@include file="frontendheader.jsp" %>

<div class="recipient">
	<div class="container">
		<div class="row">
		     <div class="col-md-8 col-md-offset-2">
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
          
          
          	  	   <div class="col-md-6">
  <div class="form-group">
    <label for="email">ReceipentType :</label>
        <input type="text" class="form-control" name="accType" id="accType" value="${beneficiary.accType}"/>
          </div></div>
                 
	  	   <div class="col-md-6">
  <div class="form-group">
    <label for="email">Country :</label>
     <select class="form-control" id="countryISO" name="countryISO" onchange="getBanksbasedOnIso()">
   <option value=""></option>
    <c:forEach items="${list}" var="list">
             <c:choose>
	 <c:when test="${list.fromCountry.countryISO eq beneficiary.beneficiaryCountry.countryISO}">
	<option selected value="${list.fromCountry.countryISO},${list.branchId}">${list.fromCountry.countryName}</option>
</c:when>
<c:otherwise>
    <option value= "${list.fromCountry.countryISO},${list.branchId}">${list.fromCountry.countryName}</option>
	 </c:otherwise>
</c:choose> 
   
     </c:forEach>
  </select>
  </div>
   </div>
	<c:if test="${beneficiary.accType eq 'bank' || beneficiary.accType eq 'Urgent Local Deposit'}">
   <div id="bank">
	   <div class="col-md-6" >
  <div class="form-group">
    <label for="email">Bank name  :</label>
     <select class="form-control" id="bankName" name="bankName">
     <option value="${beneficiary.bankName}">${beneficiary.bankName}</option>
 </select>
  </div>
   </div>
 <div class="col-md-6">
  <div class="form-group">
    <label for="email">Branch name </label>
 <input type="email" class="form-control" id="branchName" name="branchName" value="${beneficiary.branchName}" placeholder="Branch name">
  </div>
   </div>
   
   
 <div class="col-md-6">
  <div class="form-group">
    <label for="email">Account number :</label>
   <input type="text" class="form-control" name="bankAccountNumber"  value="${beneficiary.bankAccountNumber}" id="bankAccountNumber" placeholder="Account number" >
  </div>
   </div></div></c:if>
   
   	<c:if test="${beneficiary.accType eq 'cash' ||beneficiary.accType eq 'eWallet' }">
   
   <div id="cash">
   	   <div class="col-md-6">
  <div class="form-group">
    <label for="email">Cash Pickup  :</label>
     <select class="form-control" id="cashpickup" name="bankName">
    <c:forEach items="${clist}" var="clist">
          <c:choose>
	 <c:when test="${clist.cashPickupFrom eq beneficiary.bankName}">
	<option selected value="${clist.cashPickupFrom}">${clist.cashPickupFrom}</option>
</c:when>
<c:otherwise>
  <option value="${clist.cashPickupFrom}">${clist.cashPickupFrom}</option>
	 </c:otherwise>
</c:choose> 
    
    </c:forEach>
    
  </select>
  </div>
   </div>
   </div></c:if>
 <div class="col-md-6">
  <div class="form-group">
    <label for="email">Reciever's First and Middle Name :</label>
   <input type="text" class="form-control" name="firstName" value="${beneficiary.firstName}" id="firstName" placeholder="Reciever's First and Middle Name" >
  </div>
   </div>
   
    <div class="col-md-6">
  <div class="form-group">
    <label for="email">Reciever's Last Name :</label>
   <input type="text" class="form-control" name="lastName" value="${beneficiary.lastName}" id="lastName" placeholder="Reciever's Last Name" >
  </div>
   </div>
      <div class="col-md-6">
  <div class="form-group">
    <label for="email">Reciever's Mobile Number :</label>
   <input type="number" class="form-control" name="mobileNumber" value="${beneficiary.mobileNumber}" id="mobileNumber" placeholder="Reciever's Mobile Number" >
  </div>
   </div>
   
       <div class="col-md-6">
  <div class="form-group">
    <label for="email">Reciever's email :</label>
   <input type="text" class="form-control" name="emailId" value="${beneficiary.emailId}" id="emailId" placeholder="Reciever's email" >
  </div>
   </div>
   <div class="col-md-6">
  <div class="form-group">
    <label for="email">Relationship :</label>
     <select class="form-control" name="relationShip" id="relationShip">
    <c:forEach items="${relationshipList}" var="rlist">
      <c:choose>
	 <c:when test="${rlist.relationShip eq beneficiary.relationShip}">
	<option selected value="${rlist.relationShip}">${rlist.relationShip}</option>
</c:when>
<c:otherwise>
  <option value="${rlist.relationShip}">${rlist.relationShip}</option>
	 </c:otherwise>
</c:choose> 
   </c:forEach>
   
  </select>
  </div>
   </div>
   <div class="col-md-6">
  <div class="form-group">
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
   </div>
 
   
        <div class="col-md-6">
  <div class="form-group">
    <label for="email">Id-Proof No :</label>
   <input type="number" name="idProofNo" value="${beneficiary.idProofNo}" id="idProofNo" class="form-control" placeholder="Id-Proof No" >
  </div>
   </div>
   
			</form>
			<div class="clearfix"></div><br>
<div class="col-md-6" >
<a href="recipients" class="btn btn-blue btn-submit mt-20 back" >Back</a>
			              	  
<button type="button" class="btn " id="cnf">Submit</button>
                    
                    
                    
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

	<%@include file="frontendfooter.jsp"%>

</html>