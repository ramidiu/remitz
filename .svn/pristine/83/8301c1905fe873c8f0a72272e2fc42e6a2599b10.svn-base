<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Registration</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 <link href="${pageContext.request.contextPath}/resources/br/daterangepicker.css" rel="stylesheet" /> 
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
<style>
.card-body {
  margin: 30px -76px 58px 146px;
    flex: 1 1 auto;
    padding: 1.25rem;
}
</style>
  <!-- <script type="text/javascript">
$( function() {
	$(function () {
	    $("#dob").datepicker({
	        changeMonth: true,
	        changeYear: true,
	        dateFormat: 'yy-mm-dd',
	    });
} );
</script> -->
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
  function removeError(id){
		$('#'+id).css('outline', '#B0C4DE');
	}
  </script>
  <script type="text/javascript">
	$(document).ready(function(){
		$.getJSON("https://api.ipify.org/?format=json", function(e) {
		    console.log(e.ip);
		   // alert("ioplhgfszd"+e.ip);
		    $('#myIp').val(e.ip);
		});


		$('#secondidproofDiv').hide();
		$('#trulioIdDiv').hide();
		$('#datepicker').click(function(){
			$('#datepicker').css('outline', '#B0C4DE');
		});
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
	/* 	$.ajax({
			url : "getAllCountries",
			type : "POST",
			success : function(response){
				$('#firstIdIssueCountry').empty();
				//$('#bcountry').empty();
				$('#firstIdIssueCountry').append("<option value=''>-- Select Country --</option>");
				//$('#bcountry').append("<option value=''>-- Select Country --</option>");
				for (var i=0 ; i < response.length ; i++)	{
					var country = response[i];
					$('#firstIdIssueCountry').append("<option value='"+country.countryISO+"'>"+country.countryName+"</option>");
					//$('#bcountry').append("<option value='"+country.countryISO+"'>"+country.countryName+"</option>");
				}
			}
		
		});
		$.ajax({
			url : "getAllCountries",
			type : "POST",
			success : function(response){
				$('#firstIdIssueCountry').empty();
				//$('#bcountry').empty();
				$('#firstIdIssueCountry').append("<option value=''>-- Select Country --</option>");
				//$('#bcountry').append("<option value=''>-- Select Country --</option>");
				for (var i=0 ; i < response.length ; i++)	{
					var country = response[i];
					$('#firstIdIssueCountry').append("<option value='"+country.countryISO+"'>"+country.countryName+"</option>");
					//$('#bcountry').append("<option value='"+country.countryISO+"'>"+country.countryName+"</option>");
				}
			}
		
		}); */
		/* $.ajax({
			url : "getAllCountries",
			type : "POST",
			success : function(response){
				$('#birthCountry').empty();
				//$('#bcountry').empty();
				$('#birthCountry').append("<option value=''>-- Select Country --</option>");
				//$('#bcountry').append("<option value=''>-- Select Country --</option>");
				for (var i=0 ; i < response.length ; i++)	{
					var country = response[i];
					$('#birthCountry').append("<option value='"+country.countryISO+"'>"+country.countryName+"</option>");
					//$('#bcountry').append("<option value='"+country.countryISO+"'>"+country.countryName+"</option>");
				}
			}
		
		}); */
		$.ajax({
			url : "getCountry",
			type : "POST",
			success : function(response){
				$('#fromCountry').empty();
				/* $('#fromCountry').append("<option value=''>-- Select Country --</option>"); */
				$('#fromCountry').append("<option value='"+response.countryISO+"'>"+response.countryName+"</option>");
			}
		}); 
		
		 $('#submitbtn').click(function(){
			 var mobileNumber=$('#mobileNumber').val();
			 var gender = $('#gender').val();
			 var firstName = $('#firstName').val();
			 var lastName = $('#lastName').val();
			 var dob = $('#datepicker').val();
			/*  var birthCountry = $('#birthCountry').val(); */
			 var address = $('#address').val();
			 var cityOrState = $('#cityOrState').val();
			 var postalCode = $('#postalCode').val();
			 var emailId = $('#emailId').val();
			 var userName = $('#userName').val();
			 var userPassword = $('#userPassword').val();
			 var firstIdProofDoc = $('#firstIdProofDoc');
			 var firstIdProofType = $('#firstIdProofType').val();
			 var firstIdNumber = $('#firstIdNumber').val();  
			 var firstIdIssueDate = $('#datepicker1').val();
			 var firstIdExpireDate = $('#datepicker2').val();
			 var firstIdIssueCountry = $('#firstIdIssueCountry').val();
		var opt='';
			 
			 
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
			
			
			/* if(birthCountry==""){
				$('#birthCountry').focus().css('outline', '2px solid red');
				return false;
			} */
			
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
			/* if(emailId==""){
	            $('#emailId').focus().css('outline','2px solid red');
	            return false;
			} */
			/* if(validateEmail(emailId)==false){
				$('#emailId').focus().css('outline', '2px solid red');
				return false;
			} */
			
			
			var testVal='';
			$.ajax({
				url : "${pageContext.request.contextPath}/common/CheckUsersEmail",
				method : "post",
				data : "emailId="+emailId,
				async : false,
				success : function(response){
					if(response=='exist'){
						testVal='exist';
					}
				},
				error : function(xhr,error,status){
					//alert('checkemailid error = '+error+status);
				}
				
			});
			if(testVal!=''){
				$('#emailId').focus().css('outline' , 'solid red 2px');
				$('#emsg').empty();
				$('#emsg').append("<font color='red'>Email address already exist!</font>");
				return false;
			}
			if(validateEmail(emailId)==false){
				$('#emailId').focus().css('outline', '2px solid red');
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
			var fileLength = firstIdProofDoc[0].files.length;
			if(fileLength==0)
			{
	   			alert("Please Select First Id Proof");
	   			$("#firstIdProofDoc").css('outline','red solid 2px').focus();
	  			 return false;
			}
			var result='';
			var data="firstName="+firstName+"&lastName="+lastName+"&dob="+dob+"&emailId="+emailId+"&address1="+address;
			//alert('daata===='+data);
			$.ajax({
				url : "getDuplicateCustomer",
				type : "POST",
				data : "firstName="+firstName+"&lastName="+lastName+"&dob="+dob+"&emailId="+emailId+"&address1="+address+"&mobileNumber="+mobileNumber,
				async : false,
				success : function(response)	{
					//alert(response);
					if(response=='yes'){
						result='yes';
					}
				}
			});
			//alert('result===='+result);
			if(result!=''){
				$('#firstName').focus().css('outline', '2px solid red');
				$('#dupid').empty();
				$('#dupid').append("<font color='red'>Duplicate Remitter.....!</font>");
				return false;

			}


			
		}); 
	
	});
</script>
<script type="text/javascript">

function validateEmail(userName) {
	var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if(regex.test(userName)) {
	return true;
	}
	else {
	return false;
	}
}
</script>


<script>
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
  <main id="main-container">
              
                <div class="content">
                    
                    

		
                    	<div class="row">
                    		<div class="col-md-12 ">
                    		
              <form id="trulioForm" action="trulioredirect" method="POST"  enctype="multipart/form-data">
    </form>                                
          <form id="form" action="insertRemitter" method="POST"  enctype="multipart/form-data">
     <input type="hidden" id="trid" name="trid" value="${trid}">
     <input type="hidden" name="myIp" id="myIp">
  <input type="hidden" id="emai" name="email" value="${customer.emailId}"/>
  <input type="hidden" id="tname" name="tname" value="${tr.firstName}">
  <input type="hidden" id="custID" name="custID" value="noreg">
  <input type="hidden" id="branchId" name="branchId" value="${branchId}">
    <input type="hidden"  id="customerfrom" name="customerfrom" value="boot">
                                    	
				<section class="block p-20">
				<h5 style="text-align:center;padding:5px;font-size: 16px;background:#2e287b;color:white;">REMITTER REGISTRATION</h5>
				<div class="form-row">
                    <div class="form-group col-md-4">
                <label for="inputPassword4">First Name:</label>
          <input type="text" class="form-control pull-right" name="firstName" id="firstName" placeholder="Enter Forename *" onkeyup="removeError('firstName');">
                          			   <label id="dupid"></label>
              
              </div> 

              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Last Name:</label>
                						<input type="text" class="form-control" name="lastName" id="lastName" placeholder="Enter Surename *" onkeyup="removeError('lastName');"> 
              					</div>              					
              				       <div class="form-group col-md-4">
                <label for="inputPassword4">Email Address:</label>
                					<input type="text" class="form-control" name="emailId" id="emailId" placeholder="Enter emailId Address" onkeyup="removeError('emailId');">
              					               <label id="emsg"></label>
              					
              					</div> </div>
              			<div class="form-row">
              					
              					<div class="form-group col-md-4">
              					
              					
                					<label for="inputEmail4">Date of Birth:</label>
                					
               <input type="text" class="form-control" name="dob" id="datepicker" placeholder="Enter Date of Birth *" >
              					</div>
              					
               					<div class="form-group col-md-4">
                					<label for="inputPassword4">From Country:</label>
                					<select class="form-control pull-right" name="fromCountryISO" id="fromCountryISO" onclick="removeError('fromCountry');">
                					<option value="${countryISo}">${country}</option></select>
              					</div> 


                            <div class="form-group col-md-4">
                <label for="state">State</label>
                <select class="custom-select form-control" value=" " name="state" id="state" onchange="removeError('state');">
                 <option value="">--select---</option>
                <c:forEach var="list" items="${states}">
                <option value="${list.stateId}">${list.stateName}</option>
                </c:forEach>
                  </select>
              </div>

</div>
            			<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Postal Code:</label>
                						<input type="text" class="form-control" name="postalCode" id="postalCode" placeholder="postal code *" onkeyup="removeError('postalCode');">
              					</div>              					

                      					<div class="form-group col-md-4">
                					<label for="inputPassword4">Password:</label>
                					<input type="password" class="form-control" name="password" id="password" placeholder="Enter userPassword">
              					</div> 
              					
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Mobile Number:</label>
                							<input type="text" class="form-control " name="mobileNumber" id="mobileNumber" maxlength="13" placeholder="Enter Telephone/Mobile *" onkeyup="removeError('mobileNumber');" onkeypress="return onlyNumber(event)">
              					</div></div>
              					  <div class="form-row">
              					              					
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Gender:</label>
                					<select class="form-control" name="gender" id="gender">
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</select>
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Current Address:</label>
                						<textarea class="form-control pull-right" name="address" id="address" placeholder="Enter Address *" onkeyup="removeError('address');"></textarea>
              					</div>
              					              					<div class="form-group col-md-4">
                					<label for="inputEmail4">City/State:</label>
                						<input type="text" class="form-control" name="cityOrState" id="cityOrState" placeholder="Enter City/State Name *" onkeyup="removeError('cityOrState');">
              					</div></div>
              					        <div class="row">
              					         <div class="col-md-4"></div> <div class="col-md-4"></div>
              					        
              					        <div class="col-md-4"></div>
              					        </div>      					
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Street Name:</label>
                						<input type="text" class="form-control pull-right" name="streetName" id="streetName" placeholder="Enter Street Name">
              					</div>
               					<div class="form-group col-md-4">
                					<label for="inputEmail4">Street Type:</label>
                						<input type="text" class="form-control pull-right" name="streetType" id="streetType" placeholder="Enter Street Type">
              					</div>
               					<div class="form-group col-md-4">
                					<label for="inputEmail4">houseNumber:</label>
                						<input type="text" class="form-control pull-right" name="houseNumber" id="houseNumber" placeholder="Enter House/building Number">
              					</div>
                					<div class="form-group col-md-4">
                					<label for="inputEmail4">buildingName:</label>
                						<input type="text" class="form-control pull-right" name="buildingName" id="buildingName" placeholder="Enter Building Name">
              					</div>
                 					<div class="form-group col-md-4">
                					<label for="inputEmail4">Suburb:</label>
                						<input type="text" class="form-control pull-right" name="suburb" id="suburb" placeholder="Enter suburb Name">
              					</div>
 
                   					<div class="form-group col-md-4">
                					<label for="inputEmail4">unitNumber:</label>
                						<input type="text" class="form-control pull-right" name="unitNumber" id="unitNumber" placeholder="Enter unitNumber">
              					</div>
              					
  
                   					<div class="form-group col-md-4">
                					<label for="inputEmail4">Occupation:</label>
                						<input type="text" class="form-control pull-right" name="occupation" id="occupation" placeholder="Enter occupation">
              					</div>
              					
              					
                    					<c:if test="${tr.telephone eq 'yes' }">
                    					<div class="form-group col-md-4">
                					<label for="inputEmail4">telephone:</label>
                						<input type="text" class="form-control pull-right" name="telephone" id="telephone" placeholder="Enter telephone">
              					</div></c:if>
                      					<c:if test="${tr.telephone2 eq 'yes' }">
              					
                     					<div class="form-group col-md-4">
                					<label for="inputEmail4">telephone2:</label>
                						<input type="text" class="form-control pull-right" name="telephone2" id="telephone2" placeholder="Enter telephone2">
              					</div>
 </c:if>
  
            			</div>
			
				
				
				</section><br>
				<div class="row">
				<div class="col-md-12" ><h5 style="text-align:center;padding:5px;font-size: 16px;background:#2e287b;color:white;">PRIMARY ID PROOF</h5>
				</div>
				</div><br>
				<section class="block p-20">
				<div class="form-row">
            <div class="form-group col-md-4">
            <label for="inputEmail4">Primary ID Proof:</label>
                   <select class="form-control" name="firstIdProofType" id="firstIdProofType" onchange="setIdFields();removeError('firstIdProofType')">
				<option value="">-- Select Primary Identity Proof --</option>
     <c:forEach var ="list" items="${ids}">
 <option value="${list.idValue},${list.issuingAuthority}">${list.senderType}</option>
				          </c:forEach> 
						
							</select>
              					</div>              					
              <div class="form-group col-md-4">
            <label for="inputEmail4">Primary ID Number:</label>
      <input type="text" class="form-control" name="firstIdNumber" id="firstIdNumber" placeholder="Enter Document Number" onkeyup="removeError('firstIdNumber');">
              					</div>
                
                </div>
                
                            			<div class= "form-row"  id="senderId">
              					<div class="form-group col-md-4">
                					<label for="inputPassword4">Issue Date:</label>
                					<input type="text" class="form-control  " id="datepicker1" placeholder="Enter Issue Date" name="firstIdIssueDate" >
              					</div>
              						<div class="form-group col-md-4">
                					<label for="inputPassword4">Expire Date:</label>
                					<input type="text" class="form-control  " id="datepicker2" placeholder="Enter Expire Date" name="firstIdExpireDate" >
              					</div> 
            			</div>
                
                   <div class="form-row" id="nationalId">
                  <div class="form-group col-md-4">
                <label for="nationalIdType" id="nationalIdTypeLabel"></label>
              <select class="form-control pull-right" name="nationalIdType" id="nationalIdType" onclick="removeError('nationalIdType');">
                	 <option value="">--Select*--</option>
                </select>
                </div></div>
                
              					<div class="form-group col-md-4">
                <label for="idNumber" id="stateOfIssueLabel"></label>
              <select class="form-control pull-right" name="idProofIssueCountry" id="idProofIssueCountry" onchange="setTrulioResponse();removeError('idProofIssueCountry')">
                	 <option value="">--Select*--</option>
                	             <c:forEach var="list" items="${statesList}">
                <option value="${list.countryISO}">${list.stateName}</option>
              </c:forEach>
                </select>
                </div>
                
                
                
                
                
                         <div class="form-row" id="trulioIdDiv">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">First ID Proof Image:</label>
                						<input type="file" name="firstIdProofDoc1" id="firstIdProofDoc" class="form-control " placeholder="ID Proof Image" title="ID PROOF IMAGE" onclick="removeError('firstIdProofDoc');"> 
              					</div></div>
              					
            			<div class="form-row">
            			<div class="col-md-12">
            			<button type="button" class="btn btn-primary waves-effect waves-light">RESET PRIMARY ID PROOF</button>
            			</div>
            			</div>

				</section>
				<section class="block p-20">
				<div id ="secondidproofDiv">
					<h5 style="font-size: 16px;">SECONDARY ID PROOF</h5>
				<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Secondary ID Proof:</label>
                						<select class="form-control pull-right" name="secondIdProofType" id="secondIdProofType">
								<option value="">-- Select Secondry Identity Proof --</option>
									<option value="1">BILL</option>
									<option value="2">BANK STATEMENT</option>
							</select>
              					</div>              					
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Second ID Number:</label>
                						<input type="text" class="form-control" name="secondIdNumber" id="secondIdNumber" placeholder="Enter Secondry ID Document Number">
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputPassword4">Issue Date:</label>
                					<input type="text" class="form-control " id="datepicker3" placeholder="Enter Issue Date" name="secondIdIssueDate" data-toggle="date-picker" data-single-date-picker="true">
              					</div> 
            			</div>
            			<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Expiry Date:</label>
                						<input type="text" class="form-control  " id="datepicker4" placeholder="Enter Expiry Date" name="secondIdExpireDate" >
              					</div>              					
              					<div class="form-group col-md-4" id="idproofimageDiv">
                					<label for="inputEmail4">ID Proof Image:</label>
                						<input type="file" name="secondIdProofDoc1" id="secondIdProofDoc" class="form-control pull-right" title="ID PROOF IMAGE"> 
              					</div>
              					 
            			</div>
            			<div class="form-row">
            			<div class="col-md-12">
            			<button type="button" class="btn btn-primary waves-effect waves-light">RESET SECONDRY ID PROOF</button>
            			</div>
            			</div>
            			<div class="form-row">
   <label id="emsg1"></label>
   </div>
            			
</div>
				</section>
				<div class="form-row">
            			<div class="col-md-12 text-right">
            			
            			<button type="Submit" id="submitbtn" class="btn btn-primary waves-effect waves-light" style="margin: 19px 0 26px 159px;">SUBMIT</button>
            			</div>
            			</div>
				<!-- <div class="col-lg-12 col-md-12">
					<button type="submit" id="submitbtn" class="btn btn-blue center-block mb-15"><font color="red">SUBMIT</font></button>
				</div> -->	
				</form>
				
                                 
                               </div>
                           </div>
                        
                         
                       </div>
                  </div>
</main>


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
	//alert('idType==='+idType.split(",")[1]);
	$('#id-label').empty();
	$('#stateOfIssueLabel').empty();

	
	if(idType.split(",")[1]=='none'){
		$('#senderId').hide();
		$('#nationalId').show();
		var countryISO=$('#country').val();
		$('#nationalIdType').empty();
		$('#nationalIdTypeLabel').append('National IdType');
		$.ajax({
			url : "/common/getNationalIdTypes",
			type : "get",
			data : "countryISO="+countryISO,
			async : false,
			success : function(response){
				var nationalIdlist = JSON.stringify(response, undefined, '\t');
				//alert('nationalIdlist==='+nationalIdlist);
				var opt1='<option value="">--Select*--</option>';
				 $.each($.parseJSON(nationalIdlist),function(idx,obj){
                	 opt1=opt1+'<option value="'+obj.nationalIdType+'">'+obj.nationalIdType+'</option>';
				 });
				 $('#nationalIdType').append(opt1);
			},
			error : function(error , xhr , status){
				//alert('getAllCountries error = '+xhr);
			}
			
			
		});
		

		

	}
	if(idType.split(",")[1]!='none'){
		$('#senderId').show();
		$('#nationalId').hide();

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
		//alert('its is state===');
		//$('#stateOfIssueLabel').append('Id Issue State');

		var countryISO=$('#fromCountryISO').val();
		//alert('countryISO==='+countryISO);
		$.ajax({
			url : "/common/getStatesBasedOnCountry",
			method : "get",
			data : "countryISO="+countryISO,
			async : false,
			success : function(response){
				var list =JSON.stringify(response, undefined, '\t');
				//alert('list===='+list);
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
<script type="text/javascript">
function setTrulioResponse(){
//alert('truliojkmkk===');
	
	var customerfrom=$('#customerfrom').val();
	//alert('customerfrom==='+customerfrom);
	var mobileNumber=$('#mobileNumber').val();
	//alert('mobileNumber===='+mobileNumber);
	var gender = $('#gender').val();
	//alert('gender===='+gender);
	var occupation=$('#occupation').val();
	var firstName = $('#firstName').val();
	//alert('firstName===='+firstName);
	var lastName = $('#lastName').val();
	//alert('lastName===='+lastName);
	var dob = $('#datepicker').val();
	var dd=dob.split("/")[1];
	var mm=dob.split("/")[0];
	var yyyy=dob.split("/")[2];
	var  firstIdIssueDate=$('#datepicker1').val();
	//alert('firstIdIssueDate==='+firstIdIssueDate);
 var firstIdExpireDate = $('#datepicker2').val();
// alert('firstIdExpireDa===='+firstIdExpireDate);
var nationalIdType=$('#nationalIdType').val();	
 var address = $('#address').val();
 //alert('address===='+address);
	var city = $('#cityOrState').val();
	//alert('city====='+city);
	var postalCode = $('#postalCode').val();
	//alert('postacode===='+postalCode);
	var email = $('#emailId').val();
	//alert('email====='+email);
	var userName = $('#userName').val();
	var password = $('#password').val();
	//alert('password====+password');
	var idType = $('#firstIdProofType').val();
	//alert('id====='+idType);
	var firstIdNumber = $('#firstIdNumber').val();  
	var trid = $('#trid').val();
	//alert('trid====='+trid);
	var tname = $('#tname').val();
	//alert('tname====='+tname);
	var streetName=$('#streetName').val();
	var streetType=$('#streetType').val();
	var buildingName=$('#buildingName').val();
	var houseNumber=$('#houseNumber').val();
	var suburb=$('#suburb').val();
	var telephone=$('#telephone').val();
	var telephone2=$('#telephone').val();
	var unitNumber=$('#unitNumber').val();
	var countryISO = $('#fromCountryISO').val();
	var custID=$('#custID').val();
	var state=$('#state').val();
	var branchId=$('#branchId').val();
	var testVal1='';
	data = "countryISO="+countryISO+"&firstName="+firstName+"&lastName="+lastName+"&dd="+dd+"&mm="+mm+"&yyyy="+yyyy+"&state="+state+"&firstIdNumber="+firstIdNumber+"&postalCode="+postalCode+"&streetName="+streetName+"&streetType="+streetType+"&unitNumber="+unitNumber+"&suburb="+suburb+"&buildingNumber="+houseNumber+"&buildingName="+buildingName+"&city="+city+"&nationalIdType="+nationalIdType+"&telephone="+telephone+"&telephone2="+telephone2+"&mobileNumber="+mobileNumber+"&idType="+idType.split(",")[0]+"&firstIdExpireDate="+firstIdExpireDate+"&customerId="+custID+"&email="+email+"&customerfrom="+customerfrom+"&firstIdIssueDate="+firstIdIssueDate+"&password="+password+"&branchId="+branchId+"&occupation="+occupation;
//alert('data===='+data);
		if(trid=='yes' && tname=='yes'){
			//alert('condition satisfied..');	
			$.ajax({
					url : "validateBackendCustomer",
					type : "get",
					data : "countryISO="+countryISO+"&firstName="+firstName+"&lastName="+lastName+"&dd="+dd+"&mm="+mm+"&yyyy="+yyyy+"&state="+state+"&firstIdNumber="+firstIdNumber+"&postalCode="+postalCode+"&streetName="+streetName+"&streetType="+streetType+"&unitNumber="+unitNumber+"&suburb="+suburb+"&buildingNumber="+houseNumber+"&buildingName="+buildingName+"&city="+city+"&nationalIdType="+nationalIdType+"&telephone="+telephone+"&telephone2="+telephone2+"&mobileNumber="+mobileNumber+"&idType="+idType.split(",")[0]+"&firstIdExpireDate="+firstIdExpireDate+"&customerId="+custID+"&email="+email+"&customerfrom="+customerfrom+"&firstIdIssueDate="+firstIdIssueDate+"&password="+password+"&branchId="+branchId+"&address="+address,
					async : false,
					success : function(response){
					//alert('response===='+response);
					if(response=='match'){
						testVal1='match';
						$('#trulioForm').submit();
					}

					},
					error : function(error , xhr , status){
						alert('trulio error = '+xhr);
					}
					
					
				});
				
			}
if(testVal1!='match'){
	$('#secondidproofDiv').show();
	$('#trulioIdDiv').show();

}

	
	
}



</script>

<script type="text/javascript">
$(document).ready(function(){
	$('#nationalId').hide();

});
</script>
</html>