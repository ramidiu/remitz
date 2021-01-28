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
   	var accType=$('#accType').val();
    if(countryISO==''){
    	$('#countryISO').focus().css('outline' , 'solid red 2px');
    	return false;
    }
    if(accType=='bank'){
   	if(bnkName==''){
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
    }
	
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
function getBanksbasedOnIso(){
	//alert('ftghjk');
	var countryISO=$('#countryISO').val();
	alert('countryISO====='+countryISO);
	$.ajax({
		url : "getBanksBasedOnCountry",
		type : "get",
		data : "countryISO="+countryISO.split(",")[0],
		async : false,
		success : function(response){
			var bankList = JSON.stringify(response, undefined, '\t');
			alert('bankList==='+bankList);
			var opt='<option value="">--select--</option>'; 
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
<script type="text/javascript">


function validateAccType() {
	//alert('something....');
	var accType=$('#accType').val();
	//alert('accType===='+accType);
	if(accType=='bank' || accType=='Urgent Local Deposit'){
		$('#bank').show();
		$('#cash').hide();
		return false;
	}else{
		$('#cash').show();
		$('#bank').hide();
	}
	
	
	
}



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
		    <form id="bForm" action="addnewbene" method="post">
                   
                   
                   <div class="form-row">
  <div class="form-group col-md-6">
    <label for="email">ReceipentType :</label>
     <select class="form-control" id="accType" name="accType" onchange="validateAccType();removeError('accType')">
    <option>--select--</option>
    <option value="bank">bank</option>
    <option value="cash">cash</option>
    <option value="eWallet">eWallet</option>
   <option value="Urgent Local Deposit">Urgent Local Deposit</option>
  </select>
  </div>
   </div>
	
	
	                   <div class="form-row">
                    <div class="form-group col-md-6">
                              <label for="Address">Country</label>
                                     <select class="form-control" name="countryISO" id="countryISO" onchange="getBanksbasedOnIso()">
                                             <option value="">--select--</option>
                                             <c:forEach var="list" items="${list}">
                                                        <option value="${list.fromCountry.countryISO },${list.branchId}">${list.fromCountry.countryName}</option>
                                             </c:forEach>
                                     </select>
                         </div>
                         
	
	
	
	<div id="bank">
	   <div class="col-md-6">
  <div class="form-group">
    <label for="email">Bank name  :</label>
     <select class="form-control" id="bankName" name="bankName">
 
 </select>
  </div>
   </div>
<div class="col-md-6">
  <div class="form-group">
    <label for="email">Branch name </label>
 <input type="email" class="form-control" id="branchName" name="branchName" placeholder="Branch name" id="email">
  </div>
   </div>
   
   
 <div class="col-md-6">
  <div class="form-group">
    <label for="email">Account number :</label>
   <input type="text" class="form-control" name="bankAccountNumber" id="bankAccountNumber" placeholder="Account number" >
  </div>
   </div></div>
  
   <div id="cash">
   	   <div class="col-md-6">
  <div class="form-group">
    <label for="email">Cash Pickup  :</label>
     <select class="form-control" id="cashpickup" name="bankName">
        <option>----select--- </option>
    <c:forEach items="${clist}" var="clist">
    <option value= "${clist.cashPickupFrom}">${clist.cashPickupFrom}</option>
    </c:forEach>
    
  </select>
  </div>
   </div>
   
   
   </div>
      
                        <div class="form-group col-md-6">
                             <label for="country">Reciever's First and Middle Name</label>
                             <input type="text" class="form-control" placeholder="First And Middile Name"id="bFirstName" onkeyup="removeError('bFirstName');" name="firstName">
                         </div>
                         <div class="form-group col-md-6">
                               <label for="Address">Reciever's Last Name</label>
                               <input type="text" class="form-control" placeholder="Last Name" id="lastName" name="lastName" onkeyup="removeError('lastName');">
                         </div>
                          <div class="clear"></div>
                         <div class="form-group col-md-6">
                              <label for="country">Reciever's Mobile Number</label>
                              <input type="text" class="form-control" placeholder="Mobile Number" name="mobileNumber" id="bmobileNumber" onkeyup="removeError('bmobileNumber');" onkeypress="return onlyNumber(event)">
                          </div>
                          <div class="form-group col-md-6">
                              <label for="Address">Reciever's email</label>
                              <input type="email" class="form-control" id="email" name="emailId" placeholder="email address"onkeyup="removeError('email');">
                          </div>
                           <div class="clear"></div>
                          <div class="form-group col-md-6 ">
                                <label for="inputEmail4">Relationship</label>
									   <select class="form-control" name="relationShip" id="relationShip" onchange="removeError('relationShip');" >
											   <option value="">--Select Relationship *--</option>
													   <c:forEach var="list" items="${relationshipList}">
													  	          <option value="${list.relationShip}">${list.relationShip}</option>
														</c:forEach>
									   </select>
              			  </div>
                          <div class="form-group col-md-6">
                               <label for="Address">Id-Proof</label>
<select class="form-control" id="idProof" name="idProof">
 
 </select>

                         </div>
                          <div class="clear"></div>
                         <div class="form-group col-md-6">
                              <label for="country">Id-Proof No</label>
                              <input type="text" class="form-control" name="idProofNo" id="idProofNo" placeholder="123PKOJ" onkeyup="removeError('idProofNo');">
                         </div>
                        
                         
			             <div class="clear"></div>
			             <div id="showFive" class="col-md-6 col-md-offset-3 mb-50 ">
			                
			              	  <a href="recipients" class="btn btn-blue btn-submit mt-20 back" >Back</a>
			              	  
			              	    
				              <button type="button" class="btn " id="cnf">Submit</button>
				             
			             <!-- <button type="submit" id="submitBtn" class="btn btn-blue btn-submit mt-20">Save</button>  -->
                         </div>
                         </div>
			</form>
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
	<%@include file="frontendfooter.jsp"%>

</html>