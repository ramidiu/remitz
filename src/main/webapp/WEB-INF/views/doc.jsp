<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Documents</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>img

.dropdown-menu {padding: 1px 3px 10px 24px;
    /* position: relative; */
    top: 30px;
    /* left: 126px; */
    left: auto !important ;
    margin-left: 81px !important;
    width: auto;}
    .documents {
    background-color: #fff;
    padding: 130px 0 0 !IMPORTANT;
}

  .nav-tabs>li>a {
font-family: 'DM Sans', sans-serif !important;
border: 1px solid transparent;
    background-color:transparent;
    border-color: rgba(72, 94, 144, 0.16);
    color: #596882;
    border-bottom-width: 0;
    position: relative;
    margin-bottom: -1px;
    padding: 0 0px;
    font-size: 14px;
    border-radius: 1px;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 38px;
    transition: background-color 0.2s;
   
}

.nav-tabs>li>a:hover {
    border-color: #eee #eee #ddd
}

.nav-tabs>li.active>a,
.nav-tabs>li.active>a:focus,
.nav-tabs>li.active>a:hover {
    background-color: #fff;
    z-index: 5;
    color: #0168fa;
}

.nav-tabs>li.active>a{
    color: #555 !important;
    cursor: default !important;
    background-color: #fff !important;
    border: 1px solid #ddd !important;
    border-bottom-color: transparent !important;
}
</style>
</head>
<script type="text/javascript">
$(document).ready(function(){	
	$('#cardTypeDiv1').hide();
 	$('#individualRefNoDiv1').hide();
 	$('#cardTypeDiv2').hide();
 	$('#individualRefNoDiv2').hide();
		var d = new Date();
		var month = d.getMonth()+1;
		var day = d.getDate();
		var currentDate = d.getFullYear() + '-' +
    (month<10 ? '0' : '') + month + '-' +
    (day<10 ? '0' : '') + day;
	
	$('#firstIdProofButton').click(function(){
		var firstIdNumber=$('#firstIdNumber').val();
		
		var issuedate=$('#issuedate').val();
		var issuemonth=$('#issuemonth').val();
		var issueyear=$('#issueyear').val();
		
		var expiredate=$('#expiredate').val();
		var expiremonth=$('#expiremonth').val();
		var expireyear=$('#expireyear').val();
		var firstIdStateOfIssue=$('#firstIdStateOfIssue').val();
		var firstIdProofDoc=$('#firstIdProofDoc');
		
			if(firstIdNumber==""){
				  $('#firstIdNumber').focus().css('outline','2px solid red');
				  return false;
			}
			var idType=$('#firstIdProofType').val();
			if(idType=='03'){
				var cardType=$('#cardType1').val();
			 	var individualRefNo=$('#individualRefNo1').val();
				if(cardType==''){
					$('#cardType1').focus().css('outline' , 'solid red 2px');
					return false;
				}
				if(individualRefNo==''){
					$('#individualRefNo1').focus().css('outline' , 'solid red 2px');
					return false;
				}
			}
			
			if(issuedate==''){
				$('#issuedate').focus().css('outline' , 'solid red 2px');
				return false;
			}
			if(issuemonth==''){
				$('#issuemonth').focus().css('outline' , 'solid red 2px');
				return false;
			}
			
			
			if(issueyear==''){
				$('#issueyear').focus().css('outline' , 'solid red 2px');
				return false;
			}
		
	 	var firstIdIssueDate=issueyear+"-"+issuemonth+"-"+issuedate;
	 	
	 	if(firstIdIssueDate>=currentDate){
	 		$('#issueyear').focus().css('outline','solid red 2px');
	 		return false;
	 	}
	 	$('#firstIdIssueDate').val(firstIdIssueDate);
	 	
	 	if(expiredate==''){
			$('#expiredate').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(expiremonth==''){
			$('#expiremonth').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(expireyear==''){
			$('#expireyear').focus().css('outline' , 'solid red 2px');
			return false;
		}
	
 	var firstIdExpireDate=expireyear+"-"+expiremonth+"-"+expiredate;
 	if(firstIdExpireDate<=currentDate){
 		$('#expireyear').focus().css('outline','solid red 2px');
 		return false;
 	}
 	$('#firstIdExpireDate').val(firstIdExpireDate);
		var fileLength = firstIdProofDoc[0].files.length;
		if(fileLength==0)
		{
   			$("#firstIdProofDoc").css('outline','red solid 2px').focus();
  			 return false;
		}
		
		$('#firstIdForm').submit();
		
	});
	$('#secondIdProofButton').click(function(){
		  
 		var secondIdNumber=$('#secondIdNumber').val();
		var sissuedate=$('#sissuedate').val();
		var sissuemonth=$('#sissuemonth').val();
		var sissueyear=$('#sissueyear').val();
		
		var s_expiredate=$('#s_expiredate').val();
		var s_expiremonth=$('#s_expiremonth').val();
		var s_expireyear=$('#s_expireyear').val();
		var secondIdProofDoc=$('#secondIdProofDoc');
		var secondIdProofType=$('#secondIdProofType');
		
			if(secondIdNumber==""){
				  $('#secondIdNumber').focus().css('outline','2px solid red');
				  return false;
			}
			var idType=$('#secondIdProofType').val();
			if(idType=='03'){
				var cardType=$('#cardType2').val();
			 	var individualRefNo=$('#individualRefNo2').val();
				if(cardType==''){
					$('#cardType2').focus().css('outline' , 'solid red 2px');
					return false;
				}
				if(individualRefNo==''){
					$('#individualRefNo2').focus().css('outline' , 'solid red 2px');
					return false;
				}
			 	
			}
			if(sissuedate==''){
				$('#sissuedate').focus().css('outline' , 'solid red 2px');
				return false;
			}
			if(sissuemonth==''){
				$('#sissuemonth').focus().css('outline' , 'solid red 2px');
				return false;
			}
			if(sissueyear==''){
				$('#sissueyear').focus().css('outline' , 'solid red 2px');
				return false;
			}
			if(sissuemonth=='04' || sissuemonth=='06' || sissuemonth=='11'){
				if(sissuedate<1 || sissuedate>30){
					$('#sissuedate').focus().css('outline' , 'solid red 2px');
					return false;
				}
			}else if(sissuemonth=='02'){
					if(sissuedate<1 || sissuedate>28){
						$('#sissuedate').focus().css('outline' , 'solid red 2px');
						return false;
					}
			}else{
				if(sissuedate<1 || sissuedate>31){
					$('#sissuedate').focus().css('outline' , 'solid red 2px');
					return false;
				}
			}
			
		
	 	var secondIdIssueDate=sissueyear+"-"+sissuemonth+"-"+sissuedate;
	 	
	 	if(secondIdIssueDate>=currentDate){
	 		$('#sissuedate').focus().css('outline','solid red 2px');
	 		return false;
	 	}
	 	$('#secondIdIssueDate').val(secondIdIssueDate);
	 	
	 	if(s_expiredate==''){
			$('#s_expiredate').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(s_expiremonth==''){
			$('#s_expiremonth').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(s_expireyear==''){
			$('#s_expireyear').focus().css('outline' , 'solid red 2px');
			return false;
		}
	
		if(s_expiremonth=='04' || s_expiremonth=='06' || s_expiremonth=='11'){
			if(s_expiredate<1 || s_expiredate>30){
				$('#s_expiredate').focus().css('outline' , 'solid red 2px');
				return false;
			}
		}else if(s_expiremonth=='02'){
				if(s_expiredate<1 || s_expiredate>28){
					$('#s_expiredate').focus().css('outline' , 'solid red 2px');
					return false;
				}
		}else{
			if(s_expiredate<1 || s_expiredate>31){
				$('#s_expiredate').focus().css('outline' , 'solid red 2px');
				return false;
			}
		}
 	var secondIdExpireDate=s_expireyear+"-"+s_expiremonth+"-"+s_expiredate;
 	if(secondIdExpireDate<=currentDate){
 		$('#s_expireyear').focus().css('outline','solid red 2px');
 		return false;
 	}
 	$('#secondIdExpireDate').val(secondIdExpireDate);
		
		var fileLength = secondIdProofDoc[0].files.length;
		if(fileLength==0)
		{
   			$("#secondIdProofDoc").css('outline','red solid 2px').focus();
  			 return false;
		} 
		
		$('#secondIdForm').submit();
		
	});
	
	
	$('#first_id_btn_upload').click(function(){
		var firstIdProofDoc=$('#firstIdProofDoc1');
		var fileLength = firstIdProofDoc[0].files.length;
		if(fileLength==0)
		{
   			$("#firstIdProofDoc1").css('outline','red solid 2px').focus();
  			 return false;
		}
		$('#firstIdModelForm').submit();
	});
	
	$('#second_id_btn_upload').click(function(){
		var secondIdProofDoc=$('#secondIdProofDoc1');
		var fileLength = secondIdProofDoc[0].files.length;
		if(fileLength==0)
		{
   			$("#secondIdProofDoc1").css('outline','red solid 2px').focus();
  			 return false;
		}
		$('#secondIdModelForm').submit();
	});
	
	
});

</script>
<script type="text/javascript">
function setIdFields(id){
	if(id=='1st'){
		var idType=$('#firstIdProofType').val();
		if(idType=='03'){
		$('#cardTypeDiv1').show();
	 	$('#individualRefNoDiv1').show();
		}else{
			$('#cardTypeDiv1').hide();
		 	$('#individualRefNoDiv1').hide();
		}
		var idType=$('#firstIdProofType').val();
		//alert('idType==='+idType.split(",")[1]);
		//$('#id-label').empty();
		//$('#stateOfIssueLabel').empty();

		
		if(idType.split(",")[1]=='none'){
			$('#senderId').hide();
		}
		if(idType.split(",")[1]!='none'){
			$('#senderId').show();
		}
		
	 	
	 if(idType.split(",")[1]=='country'){
		 //alert('gfhj');
			//$('#id-label').append('Id Number');	
			//$('#stateOfIssueLabel').append('Id Issue Country');
			$('#issuingCountry').empty();
			$.ajax({
				url : "/common/getallcountrys",
				type : "get",
				async : false,
				success : function(response){
					var countryList = JSON.stringify(response, undefined, '\t');
					//alert('countryList==='+countryList);
					var opt1='<option value="">--Select*--</option>';
					 $.each($.parseJSON(countryList),function(idx,obj){
	                	 opt1=opt1+'<option value="'+obj.countryISO+'">'+obj.countryName+'</option>';
					 });
					 $('#issuingCountry').append(opt1);
				},
				error : function(error , xhr , status){
					//alert('getAllCountries error = '+xhr);
				}
				
				
			});
			
		}else if(idType.split(",")[1]=='state'){
			//$('#id-label').append('Id Number');	
			//$('#stateOfIssueLabel').append('Id Issue State');

			var countryISO=$('#country').val();
			$.ajax({
				url : "/common/getStatesBasedOnCountry",
				method : "get",
				data : "countryISO="+countryISO,
				async : false,
				success : function(response){
					var list =JSON.stringify(response, undefined, '\t');
					var opt='<option value="">--Select*--</option>';
					var opt1='';
					$.each($.parseJSON(list),function(idx,obj){
						opt1=opt1+'<option value="'+obj.countryISO+'">'+obj.stateName+'</option>';
					 });
					$('#issuingCountry').empty();
					
					$('#issuingCountry').append(opt+opt1);
				},
				error : function(xhr,error,status){
					alert('get states error = '+xhr);
				}
			});
		}
		
	if(idType=='03'){
		//$('#id-label').append('Medicare Number');	
		//$('#stateOfIssueLabel').append('Medicare State Of Issue');
		$('#cardTypeDiv').show();
	 	$('#individualRefNoDiv').show();
		}else{
			$('#cardTypeDiv').hide();
		 	$('#individualRefNoDiv').hide();
		}
	

	}
	if(id=='2nd'){
		var idType=$('#secondIdProofType').val();
		if(idType=='03'){
		$('#cardTypeDiv2').show();
	 	$('#individualRefNoDiv2').show();
		}else{
			$('#cardTypeDiv2').hide();
		 	$('#individualRefNoDiv2').hide();
		}	
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
<body>
<%@include file="frontendheader.jsp" %>
<div class="documents">

	  <div class="container">
		   <div class="row">
		        <div class="col-md-8 col-md-offset-2 document1-in">
                      <ul class="nav nav-tabs" role="tablist">
                         <li class="active">
                             <a data-toggle="tab" href="#email-tab" role="tab" aria-controls="home" aria-selected="true">Primary Id Proof</a>
                         </li>
                         <li>
                            <a data-toggle="tab" href="#phone-tab" role="tab" aria-controls="phone-tab" aria-selected="false">Secondary Id Proof</a>
                         </li>
                      </ul>
                      <div class="tab-content mt-30 ">
                           
                          <div class="tab-pane fade in active" id="email-tab" role="tabpanel" aria-labelledby="email-tab">
                                <div class="row">  
                                     <form action="updatecustomerId" method="post" id="firstIdForm"  enctype="multipart/form-data">
                                       
<%--                                         <input type="hidden" id="secondIdIssueDate" name="secondIdIssueDate" value="${customer.secondIdIssueDate}">
                                          <input type="hidden" id="secondIdExpireDate" name="secondIdExpireDate" value="${customer.secondIdExpireDate}">
               <input type="hidden" id="secondIdNumber" name="secondIdNumber" value="${customer.secondIdNumber}">
                <input type="hidden" id="secondIdProofType" name="secondIdProofType" value="${customer.secondIdProofType}">
                      <input type="hidden" id="secondIdProofDoc" name="secondIdProofDoc" value="${customer.secondIdProofDoc}">
					                     
					                     
					                     
 --%>					                     
					                     
					                      <input type="hidden" id="firstName" name="firstName" value="${customer.firstName}">
                                           <input type="hidden" id="lastName" name="lastName" value="${customer.lastName}"/>
                                           <input type="hidden" id="gender" name="gender" value="${customer.gender}"/>
                                           <input type="hidden" id="dob" name="dob" value="${customer.dob}"/>
                                           <input type="hidden" id="emailId" name="emailId" value="${customer.emailId}"/>
                                           <input type="hidden" id="mobileNumber" name="mobileNumber" value="${customer.mobileNumber}"/>
                                           <input type="hidden" id="address" name="address" value="${customer.address1}"/>
                                           <input type="hidden" id="password" name="password" value="${customer.password}"/>
                                           <input type="hidden" id="userName" name="userName" value="${customer.userName}"/>
                                         <input type="hidden" id="citizenship" name="citizenship" value="${customer.citizenship}"/>
                                           <input type="hidden" id="cityOrState" name="cityOrState" value="${customer.cityOrState}"/>
                                           <input type="hidden" id="postalCode" name="postalCode" value="${customer.postalCode}"/>
                                           <input type="hidden" id="occupation" name="occupation" value="${customer.occupation}"/>
                                           <input type="hidden" id="firstIdIssueDate" name="firstIdIssueDate"/>
                                           
                                           <input type="hidden" id="firstIdExpireDate" name="firstIdExpireDate"/>
                                           <div class="col-md-12"><h3>Primary Id Proof</h3></div>
                                           <div class="form-group col-md-6">
                                                <label for="idType">Primary ID Proof:</label>
                                                <select class="form-control" name="firstIdProofType" id="firstIdProofType" onchange="setIdFields('1st');removeError('firstIdProofType')">
                                            <c:forEach var ="list" items="${ids}">
 <option value="${list.idValue},${list.issuingAuthority}">${list.senderType}</option>
				                                    </c:forEach> 
						
							             <input type="hidden" name="country" id="country" value="${customer.country.countryISO}">      
							                    </select>
                                           </div>
              
                                           <div class="form-group col-md-6">
                                                 <label for="idNumber">Licence/Card/Passport Number:</label>
                                                 <input type="text" class="form-control" name="firstIdNumber" id="firstIdNumber" onkeyup="removeError('firstIdNumber')" placeholder="Enter Document Number">
                                            </div>
                                            <!-- <div class="form-group col-md-6">
                                                      <label for="idExpiry">Issue Date</label>
                                                      <input type="text" class="form-control" id="datepicker" name="firstIdIssueDate" onchange="removeError('datepicker')" placeholder="Enter Issue Date">
                                                  </div> -->
                                            <div class="form-group col-md-6" id="cardTypeDiv1">
                                                 <label for="idNumber">Card type</label>
                                                 <input type="text" class="form-control" id="cardType1" name="cardType" placeholder="G" onkeyup="removeError('cardType1');">
                                             </div>
                                             <div class="form-group col-md-6" id="individualRefNoDiv1">
                                                  <label for="idNumber">Individual Reference Number</label>
                                                  <input type="text" class="form-control" id="individualRefNo1" name="individualRefNo" placeholder="1" onkeyup="removeError('individualRefNo1');">
                                              </div>
                                              <div class="form-group col-md-2">
                                                   <label for="date">Issue Date</label>
                                                   <input type="text" class="form-control" maxlength="2" onkeypress="return onlyNumber(event)" placeholder="DD" onkeyup="removeError('issuedate');" id="issuedate">
                                              </div>
                                              <div class="col-md-2">
                                                   <label for="month">&nbsp;</label>
                                                   <div class="form-group">
                                                       <select class="custom-select form-control" id="issuemonth">
                                                               <option value="01" selected="selected">January</option>
                                                               <option value="02">February</option>
                                                               <option value="03">March</option>
                                                               <option value="04">April</option>
                                                               <option value="05">May</option>
                                                               <option value="06">June</option>
                                                               <option value="07">July</option>
                                                               <option value="08">August</option>
                                                               <option value="09">September</option>
                                                               <option value="10">October</option>
                                                               <option value="11">November</option>
                                                               <option value="12">December</option>
                                                       </select>
                                                  </div>
                                             </div>
                                             <div class="form-group col-md-2">
                                                  <div class="">
                                                       <label for="">&nbsp;</label>
                                                       <input type="text" class="form-control" id="issueyear" onkeypress="return onlyNumber(event)" maxlength="4" placeholder="YYYY" onkeyup="removeError('issueyear');">
                                                  </div>
                                             </div>
            
                                             <div class="form-group col-md-2">
                                                  <label for="date">Expiry Date</label>
                                                  <input type="text" class="form-control" maxlength="2" onkeypress="return onlyNumber(event)" placeholder="DD" onkeyup="removeError('expiredate');" id="expiredate">
                                             </div>
                                             <div class="col-md-2">
                                                  <label for="month">&nbsp;</label> 
                                                  <div class="form-group">
                                                       <select class="custom-select form-control" id="expiremonth">
                                                               <option value="01" selected="selected">January</option>
                                                               <option value="02">February</option>
                                                               <option value="03">March</option>
                                                               <option value="04">April</option>
                                                               <option value="05">May</option>
                                                               <option value="06">June</option>
                                                               <option value="07">July</option>
                                                               <option value="08">August</option>
                                                               <option value="09">September</option>
                                                               <option value="10">October</option>
                                                               <option value="11">November</option>
                                                               <option value="12">December</option>
                                                       </select>
                                                 </div>
                                           </div>
                                           <div class="form-group col-md-2">
                                                <div class="">
                                                     <label for="">&nbsp;</label>
                                                     <input type="text" class="form-control" id="expireyear" onkeypress="return onlyNumber(event)" maxlength="4" placeholder="YYYY" onkeyup="removeError('expireyear');">
                                                </div>
                                           </div>
                            <div id="senderId">  
              
              <div class="form-group col-md-6 col-xs-12" id="soIssueDiv">
                <label for="idNumber" id="stateOfIssueLabel"></label>
                <!-- <input type="text" class="form-control" id="idIssuer" placeholder="ID Issuer"> -->
                <select class="form-control custom-select" id="issuingCountry" name="issuingCountry" onchange="removeError('issuingCountry');">
                	 <option value="">--Select*--</option>
                	                	 <c:forEach var="list" items="${statesList}">
                <option value="${list.countryISO}">${list.stateName}</option>
              </c:forEach>
                </select>
              </div></div>
                                           <div class="form-group col-md-6">
                                                <label for="idNumber">First ID Proof Image</label>
                                                <input type="file" class="form-control" name="firstIdProofDoc1" id="firstIdProofDoc" onclick="removeError('firstIdProofDoc')" placeholder="ID Proof Image" title="ID PROOF IMAGE">
                                           </div>
                                          <div class="col-md-12 text-right">
                                               <button class="btn btn-primary d-none d-sm-block" type="button" id="firstIdProofButton">Submit</button>
                                           </div>
                                           <div class="clearfix"></div>
                                     </form>
                                     <div class="col-md-12">
                                         <table class=" table table-bordered mt-30 table-responsive">
                                                 <thead class="thead-light">  
                                                        <tr>
                                                           <th>Primary Id Proof</th>
                                                           <th>First ID Number</th>
                                                           <th>Issue Date</th>
                                                           <th>Expire Date</th>
                                                           <th>State of Issue</th>
                                                           <th>First ID Proof Image</th>
                                                         </tr>
                                                 </thead>
                                                 <tbody>
                                                       <tr>
                                                         <c:if test="${customer.firstIdProofType eq '1'}">
                                                                <td>Work Permit</td>
                                                         </c:if>
                                                         <c:if test="${customer.firstIdProofType eq '2'}">
                                                                <td>International Passport</td>
                                                         </c:if>
                                                         <c:if test="${customer.firstIdProofType eq '3'}">
                                                                <td>Identification ID</td>
                                                         </c:if>
                                                         <c:if test="${customer.firstIdProofType eq '4' }">
                                                               <td>Residence Permit</td>
                                                         </c:if>
                                                          <c:if test="${customer.firstIdProofType eq '5' }">
                                                               <td>Passport</td>
                                                         </c:if>
                                                          <c:if test="${customer.firstIdProofType eq '6' }">
                                                               <td>Social Security</td>
                                                         </c:if>
                                                          <c:if test="${customer.firstIdProofType eq '8' }">
                                                               <td>Driver Licence</td>
                                                         </c:if>
                                                         
                                                         
                                                            <c:if test="${customer.firstIdNumber ne ''}">
                                                         <td>${customer.firstIdNumber}</td>
                                                         </c:if>
                                                         
                                                         
                                                             <c:if test="${customer.firstIdNumber eq ''}">
                                                         <td></td>
                                                         </c:if>
                                                         
                                                          <c:if test="${customer.firstIdIssueDate eq ''}">
                                                         <td></td>
                                                         </c:if>
                                                         
                                                         
                                                         
                                                         
                                                        <c:if test="${customer.firstIdIssueDate ne ''}">
                                                         <td>${customer.firstIdIssueDate}</td>
                                                         </c:if>
                                                         
                                                         
                                                         
                                                         
                                                        <c:if test="${customer.firstIdExpireDate eq ''}">
                                                               <td></td>
                                                         </c:if> 
                                                         
                                                             
                                                         <c:if test="${customer.firstIdExpireDate ne ''}">
                                                         <td>${customer.firstIdExpireDate}</td>
                                                         </c:if>
                                                         
                                                         
                                                         
                                                         <c:if test="${customer.issuingCountry ne 'dummy'}">
                                                             <td>${customer.issuingCountry.countryName}</td>
                                                         </c:if>
                                                         
                                                         
                                                         <c:if test="${customer.issuingCountry eq 'dummy'}">
                                                               <td></td>
                                                         </c:if> 
                                                         
                                                         
                                                         <c:if test="${customer.issuingCountry eq ''}">
                                                               <td></td>
                                                         </c:if>     
                                                             
                                                         <c:if test="${customer.firstIdProofDoc ne ''}">
                                                               <td><img src="/images/customerimages/${customer.customerId}/${customer.firstIdProofDoc}"
                                                               alt="No Logo" width="100" height="55" class="xvx-logo__image"><br>
                                                               <a href="#"  data-toggle="modal" data-target="#uploadfirstidModal">upload</a>
                                                               </td>
                                                         </c:if>
                                                         <c:if test="${customer.firstIdProofDoc eq ''}">
                                                               <td><img src="/images/no_img.jpg" alt="No Logo" width="100" height="55" class="xvx-logo__image"><br>
                                                               <a href="#"  data-toggle="modal" data-target="#uploadfirstidModal">upload</a>
                                                               </td>
                                                         </c:if>     
                                                      </tr>
                                               </tbody>
                                         </table>
                                    </div>
                                    <!-- Modal -->
                                    <div id="uploadfirstidModal" class="modal" role="dialog">
                                         <div class="modal-dialog">
                                              <!-- Modal content-->
                                              <div class="modal-content">
                                                   <div class="modal-header">
                                                         <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                   </div>
                                                   <div class="modal-body">
                                                        <!-- Form -->
                                                         <form method='post' action='uploadidproofimage' id="firstIdModelForm" enctype="multipart/form-data">
                                                                Select file : <input type='file' name="firstIdProofDoc1" id="firstIdProofDoc1" onclick="removeError('firstIdProofDoc1')" placeholder="ID Proof Image" title="ID PROOF IMAGE" class='form-control' ><br>
                                                                <button type='button' class='btn btn-info' id='first_id_btn_upload'>Upload</button>
                                                         </form>
                                                         <!-- Preview-->
                                                         <div id='preview'></div>
                                                   </div>
                                             </div>
                                       </div>
                                  </div>
                                  
                                  
                                  
                                  
                            </div>
                      </div>
               
               
               
               
                     <div class="tab-pane" id="phone-tab">
                         <form action="updateSecondIdProof" method="post" id="secondIdForm"  enctype="multipart/form-data">
                                        <input type="hidden" id="firstIdIssueDate" name="firstIdIssueDate" value="${customer.firstIdIssueDate}">
                                          <input type="hidden" id="firstIdExpireDate" name="firstIdExpireDate" value="${customer.firstIdExpireDate}">
               <input type="hidden" id="firstIdNumber" name="firstIdNumber" value="${customer.firstIdNumber}">
                <input type="hidden" id="firstIdProofType" name="firstIdProofType" value="${customer.firstIdProofType}">
                      <input type="hidden" id="firstIdProofDoc" name="firstIdProofDoc" value="${customer.firstIdProofDoc}">
                          <input type="hidden" id="issuingCountry" name="issuingCountry" value="${customer.issuingCountry}">
                                        
                                           <input type="hidden" id="lastName" name="lastName" value="${customer.lastName}"/>
                                           <input type="hidden" id="gender" name="gender" value="${customer.gender}"/>
                                           <input type="hidden" id="dob" name="dob" value="${customer.dob}"/>
                                           <input type="hidden" id="emailId" name="emailId" value="${customer.emailId}"/>
                                           <input type="hidden" id="mobileNumber" name="mobileNumber" value="${customer.mobileNumber}"/>
                                           <input type="hidden" id="address" name="address" value="${customer.address1}"/>
                                           <input type="hidden" id="password" name="password" value="${customer.password}"/>
                                           <input type="hidden" id="userName" name="userName" value="${customer.userName}"/>
                                         <input type="hidden" id="citizenship" name="citizenship" value="${customer.citizenship}"/>
                                           <input type="hidden" id="cityOrState" name="cityOrState" value="${customer.cityOrState}"/>
                                           <input type="hidden" id="postalCode" name="postalCode" value="${customer.postalCode}"/>
                                           <input type="hidden" id="occupation" name="occupation" value="${customer.occupation}"/>
                              
                              <div class="row">
                                    <div class="col-md-12"><h3>Secondary ID Proof:</h3></div>
                                         <input type="hidden" name="indexno" value="2">
                                               <div class="form-group col-md-6">
                                                    <label for="idType">Secondary ID Proof</label>
                                                    <select class="form-control" name="secondIdProofType" id="secondIdProofType" onchange="setIdFields('2nd');removeError('secondIdProofType');">
									                        <option value="1">BILL</option>
									                        <option value="2">Bank Statement</option>
						                    	    </select>
                                                </div>
                                                <input type="hidden" id="secondIdIssueDate" name="secondIdIssueDate"/>
                                                <input type="hidden" id="secondIdExpireDate" name="secondIdExpireDate"/>
                                                      <div class="form-group col-md-6">
                                                           <label for="idNumber">Licence/Card/Passport Number:</label>
                                                           <input type="text" class="form-control"  name="secondIdNumber" id="secondIdNumber" onkeyup="removeError('secondIdNumber')" placeholder="Enter Document Number">
                                                      </div>
                                                      <div class="form-group col-md-6" id="cardTypeDiv2">
                                                           <label for="idNumber">Card type</label>
                                                           <input type="text" class="form-control" id="cardType2" name="cardType" placeholder="G" onkeyup="removeError('cardType2');">
                                                      </div>
                                                      <div class="form-group col-md-6" id="individualRefNoDiv2">
                                                           <label for="idNumber">Individual Reference Number</label>
                                                           <input type="text" class="form-control" id="individualRefNo1" name="individualRefNo" placeholder="1" onkeyup="removeError('individualRefNo2');">
                                                      </div>
                                                 <!-- <div class="form-group col-md-6">
                                                                <label for="idExpiry">Issue Date</label>
                                                                <input type="text" class="form-control" id="datepicker" name="firstIdIssueDate" onchange="removeError('datepicker')" placeholder="Enter Issue Date">
                                                       </div> -->
                                                       <div class="form-group col-md-2">
                                                            <label for="date">Issue Date</label>
                                                            <input type="text" class="form-control" maxlength="2" onkeypress="return onlyNumber(event)" placeholder="DD" onkeyup="removeError('sissuedate');" id="sissuedate">
                                                       </div>
                                                       <div class="col-md-2">
                                                            <label for="month">&nbsp;</label>
                                                            <div class="form-group">
                                                                 <select class="custom-select form-control" id="sissuemonth">
                                                                         <option value="01" selected="selected">January</option>
                                                                         <option value="02">February</option>
                                                                         <option value="03">March</option>
                                                                         <option value="04">April</option>
                                                                         <option value="05">May</option>
                                                                         <option value="06">June</option>
                                                                         <option value="07">July</option>
                                                                         <option value="08">August</option>
                                                                         <option value="09">September</option>
                                                                         <option value="10">October</option>
                                                                         <option value="11">November</option>
                                                                         <option value="12">December</option>
                                                                  </select>
                                                             </div>
                                                       </div>
                                                       <div class="form-group col-md-2">
                                                            <div class="">
                                                                 <label for="">&nbsp;</label>
                                                                 <input type="text" class="form-control" id="sissueyear" onkeypress="return onlyNumber(event)" maxlength="4" placeholder="YYYY" onkeyup="removeError('sissueyear');">
                                                             </div>
                                                        </div>
                                                   <!-- <div class="form-group col-md-6">
                                                              <label for="idNumber">Expire Date</label>
                                                              <input type="text" class="form-control" id="datepicker1" name="firstIdExpireDate" onchange="removeError('datepicker1')" placeholder="Enter Expire Date">
                                                         </div> -->
                                                         <div class="form-group col-md-2">
                                                              <label for="date">Expiry Date</label>
                                                              <input type="text" class="form-control" maxlength="2" onkeypress="return onlyNumber(event)" placeholder="DD" onkeyup="removeError('s_expiredate');" id="s_expiredate">
                                                          </div>
                                                          <div class="col-md-2">
                                                               <label for="month">&nbsp;</label> 
                                                                      <div class="form-group">
                                                                            <select class="custom-select form-control" id="s_expiremonth">
                                                                                    <option value="01" selected="selected">January</option>
                                                                                    <option value="02">February</option>
                                                                                    <option value="03">March</option>
                                                                                    <option value="04">April</option>
                                                                                    <option value="05">May</option>
                                                                                    <option value="06">June</option>
                                                                                    <option value="07">July</option>
                                                                                    <option value="08">August</option>
                                                                                    <option value="09">September</option>
                                                                                    <option value="10">October</option>
                                                                                    <option value="11">November</option>
                                                                                    <option value="12">December</option>
                                                                             </select>
                                                                        </div>
                                                            </div>
                                                            <div class="form-group col-md-2">
                                                                 <div class="">
                                                                      <label for="">&nbsp;</label>
                                                                      <input type="text" class="form-control" id="s_expireyear" onkeypress="return onlyNumber(event)" maxlength="4" placeholder="YYYY" onkeyup="removeError('s_expireyear');">
                                                                 </div>
                                                            </div>
<%--                                                             <div class="form-group col-md-6">
                                                                 <label for="idNumber">State of Issue</label>
                                                                 <select class="form-control" name="secondIdStateOfIssue" id="secondIdStateIssue" onkeyup="removeError('secondIdStateIssue')">
                                                                         <c:forEach var="list1" items="${list}">
                                                                                    <option value="${list1.stateId}">${list1.stateName}</option>
                                                                          </c:forEach>
                                                                 </select>
                                                             </div> 
 --%>                                                             <div class="form-group col-md-6">
                                                                  <label for="idNumber">Second ID Proof Image</label>
                                                                  <input type="file" class="form-control" name="secondIdProofDoc1" id="secondIdProofDoc" onclick="removeError('secondIdProofDoc')" placeholder="ID Proof Image" title="ID PROOF IMAGE">
                                                             </div> 
                                                            <div class="col-md-12 text-right">
                                                                 <button class="btn btn-primary d-none d-sm-block" type="button" id="secondIdProofButton">Submit</button>
                                                            </div><div class="clearfix"></div>
                                                        </div>
                                                  </form>
                                                  <table class="table table-bordered mt-30">
    		                                             <thead class="thead-light">
                                                                <tr>
                                                                   <th>Second Id Proof</th>
                                                                   <th>Second ID Number</th>
                                                                   <th>Issue Date</th>
                                                                   <th>Expire Date</th>                                                                    
                                                                  <th>Second ID Proof Image</th>
                                                              </tr>
                                                         </thead>
                                                         <tbody>
                                                              <tr>

                                                                <c:if test="${customer.secondIdProofType eq '1'}">
                                                                       <td>BILL</td></c:if>
 
                                                                 <c:if test="${customer.secondIdProofType eq '2'}">
                                                                       <td>BANK STATEMENT</td></c:if>
                                                                 <c:if test="${customer.secondIdNumber ne ''}">
 
                                                              <td>${customer.secondIdNumber}</td>
                                                              </c:if>
                                                                  <c:if test="${customer.secondIdNumber eq ''}">
                                                              <td></td>
                                                              </c:if>
                                                              
                                                                  <c:if test="${customer.secondIdIssueDate ne ''}">
                                                                 <td>${customer.secondIdIssueDate}</td>
                                                                 </c:if>
                                                                 
                                                                    <c:if test="${customer.secondIdIssueDate eq ''}">
                                                                 <td></td>
                                                                 </c:if>
                                                                   <c:if test="${customer.secondIdExpireDate ne ''}">
                                                                 <td>${customer.secondIdExpireDate}</td>
                                                                 </c:if>
                                                                    <c:if test="${customer.secondIdExpireDate eq ''}">
                                                                 <td></td>
                                                                 </c:if>
                                                                 
                                                            <%-- <td>${customer.secondIdStateIssue.stateName}</td>
                                                                 <td><img src="${pageContext.request.contextPath}/resources/images/customerimages/${customer.customerId}/${customer.secondIdProofDoc}" alt="No Logo" width="100" height="55" class="xvx-logo__image"><br><a href="#"  data-toggle="modal" data-target="#uploadsecondidModal">upload</a></td> --%>
     
<%--                                                                  <c:if test="${customer.issuingCountry.countryName ne 'dummy'}">
                                                                        <td>${customer.issuingCountry.countryName}</td>
                                                                 </c:if>
                                                                 <c:if test="${customer.issuingCountry.countryName eq 'dummy'}">
                                                                       <td></td>
                                                                 </c:if>   
 --%>                                                                 
 
                                                                 <c:if test="${customer.secondIdProofDoc ne ''}">
                                                                       <td><img src="/images/customerimages/${customer.customerId}/${customer.secondIdProofDoc}" alt="No Logo" width="100" height="55" class="xvx-logo__image"><br>
                                                                       <a href="#"  data-toggle="modal" data-target="#uploadfirstidModal">upload</a>
                                                                       </td>
                                                                 </c:if>
                                                                 <c:if test="${customer.secondIdProofDoc eq ''}">
                                                                       <td><img src="/images/no_img.jpg" alt="No Logo" width="100" height="55" class="xvx-logo__image"><br>
                                                               <a href="#"  data-toggle="modal" data-target="#uploadfirstidModal">upload</a>
                                                                       </td>
                                                                 </c:if>
                                                             </tr>
                                                      </tbody>
                                              </table>
                                          <!-- Modal -->
                                              <div id="uploadsecondidModal" class="modal" role="dialog">
                                                   <div class="modal-dialog">
                                                        <!-- Modal content-->
                                                        <div class="modal-content">
                                                             <div class="modal-header">
                                                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                             </div>
                                                             <div class="modal-body">
                                                                   <!-- Form -->
                                                                   <form method='post' action='uploadidproofimage' id="secondIdModelForm" enctype="multipart/form-data">
                                                                         Select file : <input type='file' name="secondIdProofDoc1" id="secondIdProofDoc1" onclick="removeError('secondIdProofDoc1')" placeholder="ID Proof Image" title="ID PROOF IMAGE" class='form-control' ><br>
                                                                         <input type="hidden" name="indexno" value="2">
                                                                         <button type='button' class='btn btn-info' id='second_id_btn_upload'>Upload</button>
                                                                    </form>
                                                                        <!-- Preview-->
                                                                    <div id='preview'></div>
                                                              </div>
                                                        </div>
                                                   </div>
                                              </div>
                     </div>

    
    
                </div>
             </div>
         </div>
     </div>
</div>
       
         
</body>
<%@include file="frontendfooter.jsp" %>

</html>