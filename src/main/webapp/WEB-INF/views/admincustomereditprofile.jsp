<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer edit</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 <link href="${pageContext.request.contextPath}/adm/daterangepicker.css" rel="stylesheet" />  
<style>
.bg-primary{
	color:#fff;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <link rel="stylesheet" href="/resources/demos/style.css"> 
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function () {
    $("#datepicker").datepicker({ 
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
    $("#datepicker1").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
    $("#datepicker2").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
    $("#datepicker3").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
    $("#datepicker4").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
});
  </script> 
  <script type="text/javascript">
	$(document).ready(function(){
		$('#datepicker').change(function(){
			$('#datepicker').css('outline', '#B0C4DE');
		});
		$('#datepicker1').click(function(){
			$('#datepicker1').css('outline', '#B0C4DE');
		});
		$('#datepicker1').change(function(){
			$('#datepicker1').css('outline', '#B0C4DE');
		});
		$('#datepicker2').click(function(){
			$('#datepicker2').css('outline', '#B0C4DE');
		});
		$('#datepicker2').change(function(){
			$('#datepicker2').css('outline', '#B0C4DE');
		});  
		
		$.ajax({
			url : "${pageContext.request.contextPath}/common/getallcountrys",
			type : "POST",
			success : function(response){
				$('#firstIdIssueCountry').empty();
				$('#firstIdIssueCountry').append("<option value=''>-- Select Country --</option>");
				for (var i=0 ; i < response.length ; i++)	{
					var country = response[i];
					$('#firstIdIssueCountry').append("<option selected value='"+primaryIdIssueCountryISO+"'>"+primaryIdIssueCountryName+"</option>");
					$('#firstIdIssueCountry').append("<option value='"+country.countryISO+"'>"+country.countryName+"</option>");
					/* alert('firstIdIssueCountry===='+firstIdIssueCountry); */

				}
			}
		
		});
		
/* 		$.ajax({
			url : "getCountry",
			type : "POST",
			
			success : function(response){
				$('#fromCountry').empty();
				$('#fromCountry').append("<option value='"+response.countryISO+"'>"+response.countryName+"</option>");
			}
		}); 
 */		var primaryIdIssueCountryISO=$('#primaryIdIssueCountryISO').val();
		var primaryIdIssueCountryName=$('#primaryIdIssueCountryName').val();
		 $('#submitbtn').click(function(){
			 var mobileNumber=$('#mobileNumber').val();
			 var gender = $('#gender').val();
			 var firstName = $('#firstName').val();
			 var lastName = $('#lastName').val();
			 var dob = $('#datepicker').val();
			 var address = $('#address').val();
			 var cityOrState = $('#cityOrState').val();
			 var postalCode = $('#postalCode').val();
			 var emailId = $('#emailId').val(); 
			 var password=$('#password').val();
			 var firstIdProofDoc = $('#firstIdProofDoc'); 
			 var firstIdProofDoc1=$('#firstIdProofDoc1');
			 var firstIdProofType = $('#firstIdProofType').val();
			 var firstIdNumber = $('#firstIdNumber').val();  
			 var firstIdIssueDate = $('#datepicker1').val();
			 var firstIdExpireDate = $('#datepicker2').val();
			 var firstIdIssueCountry = $('#firstIdIssueCountry').val();
		 
			
			 
			  if(mobileNumber==""){
				$('#mobileNumber').focus().css('outline', '2px solid red');
				return false;
			}
			
		   if(gender==""){
				$('#gender').focus().css('outline', '2px solid red');
				return false;
			}
			
			if(firstName==""){
				$('#firstName').focus().css('outline', '2px solid red');
				return false;
			}
			
			 if(lastName==""){
				$('#lastName').focus().css('outline', '2px solid red');
				return false;
			}
			
			if(dob==""){
				$('#datepicker').focus().css('outline', '2px solid red');
				return false;
			}
			
			if(address==""){
				$('#address').focus().css('outline', '2px solid red');
				return false;
			}
			if(cityOrState==""){
				$('#cityOrState').focus().css('outline', '2px solid red');
				return false;
			}
		
			if(postalCode==""){
				$('#postalCode').focus().css('outline', '2px solid red');
				return false;
			}
			
			if(firstIdProofType==""){
	           $('#firstIdProofType').focus().css('outline','2px solid red');
	           return false;
			}
			if(firstIdNumber==""){
				  $('#firstIdNumber').focus().css('outline','2px solid red');
				  return false;
			}
			if(firstIdIssueDate==""){
				$('#datepicker1').focus().css('outline', '2px solid red');
				return false;
			}
			if(firstIdExpireDate==""){
				$('#datepicker2').focus().css('outline', '2px solid red');
				return false;
			}
			if(firstIdIssueCountry==""){
				$('#firstIdIssueCountry').focus().css('outline', '2px solid red');
				return false;
			} 
	 
	  $('#submitForm').attr("enctype","multipart/form-data");
				 $('#submitForm').attr("action","adminupdatecustomerprofile");
				
		   			$('#submitForm').submit();

	});
	});
	
</script>
<script>
function removeError(id){
	$('#'+id).css('outline','#B0C4DE');
}
	function onlyNumber(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	        return false;
	    }
	    return true;
	}
	
</script>
</head>
<body>
<%@include file="headerNew.jsp" %>

	<div class="container">
<div class="customerRegistration" style="
    position: relative;
    /* left: 125px; */
    top: 20px;
    
">
		
                    	<div class="row">
                    		<div class="col-12 mt-50">
                    		
                                    
                                    <form id="submitForm" method="POST">
                                    <input type="hidden" name="primaryIdIssueCountryISO" id="primaryIdIssueCountryISO" value="${customer.issuingCountry.countryISO}">
                                     <input type="hidden" name="primaryIdIssueCountryName" id="primaryIdIssueCountryName" value="${customer.issuingCountry.countryName}">
                                     <input type="hidden" name="customerId" value="${customer.customerId}">
				<div class="card-body shadow p-3 mb-5 bg-white rounded">
				<h5 style="background: #2e287b;color:white;padding:5px;text-align:center">UPDATE CUSTOMER  PROFILE</h5>
				<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Mobile Number:</label>
                							<input type="text" class="form-control " name="mobileNumber" id="mobileNumber" maxlength="13" placeholder="Enter Telephone/Mobile *" onkeyup="removeError('mobileNumber');" onkeypress="return onlyNumber(event)" value="${customer.mobileNumber}">
              					</div>              					
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Gender:</label>
                					<select class="form-control" name="gender" id="gender">
								<option value="Male" ${custome.gender=='Male'?'selected':''}>Male</option>
								<option value="Female" ${customer.gender=='Female'?'selected':''}>Female</option>
							</select>
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputPassword4">First Name:</label>
                					<input type="text" class="form-control pull-right" name="firstName" id="firstName" placeholder="Enter Forename *" onkeyup="removeError('firstName');" value="${customer.firstName}">
              					</div> 
            			</div>
            			<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Last Name:</label>
                						<input type="text" class="form-control" name="lastName" id="lastName" placeholder="Enter Surename *" onkeyup="removeError('lastName');" value="${customer.lastName}"> 
              					</div>              					
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Date of Birth:</label>
                	<input type="text" class="form-control" name="dob" id="datepicker" placeholder="Enter Date of Birth *" value="${customer.dob}">
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputPassword4">Email Address:</label>
                					<input type="text" class="form-control" name="emailId" id="emailId" placeholder="Enter emailId Address" onkeyup="removeError('emailId');" value="${customer.emailId}">
              					</div> 
            			</div>
            			
            			
            			
			
            			<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Current Address:</label>
                						<textarea class="form-control pull-right"  name="address" id="address" placeholder="Enter Address *" onkeyup="removeError('address');">${customer.address1}</textarea>
              					</div>              					
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">City/State:</label>
                						<input type="text" class="form-control" name="cityOrState" id="cityOrState" placeholder="Enter City/State Name *" onkeyup="removeError('cityOrState');" value="${customer.cityOrState}">
              					</div>
              					
              					<div class="form-group col-md-4">
                					<label for="inputPassword4">From Country:</label>
                					<select class="form-control pull-right" name="fromCountry" id="country" onclick="removeError('fromCountry');">
                					<option value="${countryISo}">${country}</option></select>
              					</div> 
            	
            			<div class="row"></div>
            			<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Postal Code:</label>
                						<input type="text" class="form-control" name="postalCode" id="postalCode" placeholder="postal code *" onkeyup="removeError('postalCode');" value="${customer.postalCode}">
              					</div>              					
              					
              					
            			</div>
				
				</div><div class="row"></div>
				<div class="card-body shadow p-3 mb-5 bg-white rounded">
				<h5 style="background: #2e287b;color:white;padding:5px;text-align:center">PRIMARY ID PROOF</h5>
				<br><div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Primary ID Proof:</label>
                						<select class="form-control pull-right" name="firstIdProofType" id="firstIdProofType" onclick="removeError('firstIdProofType');">
								<option value="">-- Select Primary Identity Proof --</option>
     <c:forEach var ="list" items="${ids}">
 <option value="${list.idValue},${list.issuingAuthority}">${list.senderType}</option>
				          </c:forEach> 
					
							        <c:if test="${customer.firstIdProofType eq 1}">
									<option value="1" selected>Work Permit</option>
									</c:if>
                                  <c:if test="${customer.firstIdProofType eq 2}">
                                  <option value="2" selected>International Passport</option>
                                 </c:if>
                                 <c:if test="${customer.firstIdProofType eq 3}">
                                 <option value="3" selected>Identification ID</option>
                                 </c:if>
                                 <c:if test="${customer.firstIdProofType eq 4}">
                                 <option value="4" selected>Residence Permit</option>
                                  <c:if test="${customer.firstIdProofType eq 5}">
                                 <option value="5" selected>Passport</option>
                                 </c:if>
                                  <c:if test="${customer.firstIdProofType eq 6}">
                                 <option value="6" selected>Social Security</option>
                                 </c:if>
                                 
                                 <c:if test="${customer.firstIdProofType eq 01}">
                                 <option value="01" selected>Driver Licence</option>
                                 </c:if>
                                 </c:if>
						
							</select>
              					</div>              					
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Primary ID Number:</label>
                						<input type="text" class="form-control" name="firstIdNumber" id="firstIdNumber" placeholder="Enter Document Number" onkeyup="removeError('firstIdNumber');" value="${customer.firstIdNumber}">
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputPassword4">Primary Id Issue Date:</label>
                					<input type="text" class="form-control  " id="datepicker1" placeholder="Enter Issue Date" name="firstIdIssueDate" value="${customer.firstIdIssueDate}">
              					</div> 
              						<div class="form-group col-md-4">
                					<label for="inputPassword4">Primary Id Expire Date:</label>
                					<input type="text" class="form-control  " id="datepicker2" placeholder="Enter Expire Date" name="firstIdExpireDate" value="${customer.firstIdExpireDate}">
              					</div> 
            			</div>
            			<div class="form-row" id="senderId">
              					<div class="form-group col-md-4">
                <label for="idNumber" id="stateOfIssueLabel"></label>
                						<select class="form-control pull-right" name="idProofIssueCountry" id="idProofIssueCountry" onclick="removeError('firstIdIssueCountry');">
                	                 	 <option value="${customer.issuingCountry.countryISO}">${customer.issuingCountry.countryName}</option>

                </select>
                </div>
            		<div class="form-group col-md-4">
												<img src="/images/customerimages/${customer.customerId}/${customer.firstIdProofDoc}" width="100" height="55">
              					
                					<br><label for="inputEmail4">ReUpload Primary Id Proof:</label>
                						<input type="file" name="firstIdProofDoc2" id="firstIdProofDoc" class="form-control " placeholder="ID Proof Image" title="ID PROOF IMAGE" onclick="removeError('firstIdProofDoc');"> 
                						 
              					</div>
              
              					
              					
              					
              					
<%--               					<c:choose>
              					<c:when test="${ empty customer.firstIdProofDoc}">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Upload Primary Id Proof:</label>
                						<input type="file" name="firstIdProofDoc1" id="firstIdProofDoc" class="form-control " placeholder="ID Proof Image" title="ID PROOF IMAGE" onclick="removeError('firstIdProofDoc');">
              				
              					</div>
              					</c:when>
              					<c:otherwise>
              					<div class="form-group col-md-4">
<img src="${pageContext.request.contextPath}/images/customeridproofs/${customer.customerId}/${customer.firstIdProofDoc}" width="100" height="55" alt="Please Upload Primary ID Proof"/ style="position: relative; left: 89px; top: 5px;">
              					
                					<label for="inputEmail4">ReUpload Primary Id Proof:</label>
                						<input type="file" name="firstIdProofDoc2" id="firstIdProofDoc" class="form-control " placeholder="ID Proof Image" title="ID PROOF IMAGE" onclick="removeError('firstIdProofDoc');"> 
                						 
              					</div>
              					</c:otherwise>
              					</c:choose>
               --%>	</div>
              
            		
            			<div class="form-row">
            			<div class="col-md-10">
            			<button type="button" class="btn btn-primary waves-effect waves-light">RESET PRIMARY ID PROOF</button>
            			</div>
            			</div>
				
				</div>
				<div class="row"></div><br>
				<div class="card-body shadow p-3 mb-5 bg-white rounded">
					<h5 style="background: #2e287b;color:white;padding:5px;text-align:center">SECONDARY ID PROOF</h5>
				<br><div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Secondary ID Proof:</label>
             <select class="form-control pull-right" name="secondIdProofType" id="secondIdProofType">
             								<option value="BILL">BILL</option>
             
								<option value="">-- Select Secondary Identity Proof --</option>
								<option value="BILL">BILL</option>
							</select>
              					</div>              					
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Second ID Number:</label>
                						<input type="text" class="form-control" name="secondIdNumber" id="secondIdNumber" value="${customer.secondIdNumber}" placeholder="Enter Secondry ID Document Number">
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputPassword4">Issue Date:</label>
                					<input type="text" class="form-control " id="datepicker3" placeholder="Enter Issue Date" name="secondIdIssueDate" value="${customer.secondIdIssueDate}"  data-toggle="date-picker" data-single-date-picker="true">
              					</div> 
            			</div>
            			<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Expiry Date:</label>
                						
                						<input type="text" class="form-control  " id="datepicker4" placeholder="Enter Expiry Date" name="secondIdExpireDate" value="${customer.secondIdExpireDate}">
                						</div>
                						</div>
                					
                						
                	   <c:choose>
              					<c:when test="${ empty customer.secondIdProofDoc}">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Upload second Id Proof:</label>
                						<input type="file" name="secondIdProofDoc1" id="secondIdProofDoc" class="form-control " placeholder="ID Proof Image" title="ID PROOF IMAGE" onclick="removeError('secondIdProofDoc');">
              				
              					</div>
              					</c:when>
              					<c:otherwise>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">ReUpload Second Id Proof:</label>
                						<input type="file" name="secondIdProofDoc2" id="secondIdProofDoc" class="form-control " placeholder="ID Proof Image" title="ID PROOF IMAGE" onclick="removeError('secondIdProofDoc1');">&nbsp;&nbsp;&nbsp;
                						<img src="/images/customerimages/${customer.customerId}/${customer.secondIdProofDoc}" width="100" height="55" alt="Please Upload second ID Proof"/ style="position: relative; left: 89px; top: 5px;"><br><br>
                						 
              					</div>
              					</c:otherwise>
              					</c:choose>
              					
            			</div>
            		
                			
                						
                				</div>		
                						
                						
<!--               					</div>  



            					              					<div class="form-group col-md-4">
                					<label for="inputEmail4">ID Proof Image:</label>
                						<input type="file" name="secondIdProofDoc1" id="secondIdProofDoc" class="form-control pull-right" title="ID PROOF IMAGE"> 
              					</div>
              					 
            			</div>
 -->            			<div class="form-row">
            			<div class="col-md-12">
            			<button type="button" class="btn btn-primary waves-effect waves-light">RESET SECONDRY ID PROOF</button>
            			</div>
            			</div>
		 	
				<div class="form-row">
            			<div class="col-md-12 " style="margin-top:10px;">
            			<button type="button" id="submitbtn" class="btn btn-primary waves-effect waves-light" >UPDATE</button>
            			</div>
            			</div>
				
				</form>
				
                                 
                               </div>
                           </div>
                       </div>
                  </div>
                <%--   <script src="${pageContext.request.contextPath}/resources/js/daterangepicker.js"></script> --%>
        <!-- Mask input -->
<script src="assets/js/plugins/pwstrength-bootstrap/pwstrength-bootstrap.min.js"></script>
        <script src="assets/js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script src="assets/js/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
        <script src="assets/js/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
        <script src="assets/js/plugins/select2/js/select2.full.min.js"></script>
        <script src="assets/js/plugins/jquery-tags-input/jquery.tagsinput.min.js"></script>
        <script src="assets/js/plugins/jquery-auto-complete/jquery.auto-complete.min.js"></script>
        <script src="assets/js/plugins/masked-inputs/jquery.maskedinput.min.js"></script>
        <script src="assets/js/plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
        <script src="assets/js/plugins/dropzonejs/dropzone.min.js"></script>
        <script src="assets/js/plugins/flatpickr/flatpickr.min.js"></script>

</body>
<script type="text/javascript">
function setIdFields(){
	var idType=$('#firstIdProofType').val();
	alert('idType==='+idType.split(",")[1]);
	$('#id-label').empty();
	$('#stateOfIssueLabel').empty();

	
	if(idType.split(",")[1]=='none'){
		$('#senderId').hide();
	}
	if(idType.split(",")[1]!='none'){
		$('#senderId').show();
	}
	
 	
 if(idType.split(",")[1]=='country'){
		$('#id-label').append('Id Number');	
		$('#stateOfIssueLabel').append('Id Issue Country');
		$('#idProofIssueCountry').empty();
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
				 $('#idProofIssueCountry').append(opt1);
			},
			error : function(error , xhr , status){
				//alert('getAllCountries error = '+xhr);
			}
			
			
		});
		
	}else if(idType.split(",")[1]=='state'){
		$('#id-label').append('Id Number');	
		$('#stateOfIssueLabel').append('Id Issue State');

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
				$('#idProofIssueCountry').empty();
				
				$('#idProofIssueCountry').append(opt+opt1);
			},
			error : function(xhr,error,status){
				alert('get states error = '+xhr);
			}
		});
	}
	
if(idType=='03'){
	$('#id-label').append('Medicare Number');	
	$('#stateOfIssueLabel').append('Medicare State Of Issue');
	$('#cardTypeDiv').show();
 	$('#individualRefNoDiv').show();
	}else{
		$('#cardTypeDiv').hide();
	 	$('#individualRefNoDiv').hide();
	}
}
</script>

</html>