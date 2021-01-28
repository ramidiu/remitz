<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Profile</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--   Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<link href="https://fonts.googleapis.com/css?family=Lato&display=swap" rel="stylesheet"> 


<script>
$(function () {
    $("#datepicker").datepicker({
        changeMonth: true,
        changeYear: true
    });
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	var dob=$('#dob').val();
	dob=dob.split('-');	
	$('#date').val(dob[2]);
	$('#month').val(dob[1]);
	$('#year').val(dob[0]);
	
	$('#update').click(function(){
		var bFirstName=$('#bFirstName').val();
		var blastName=$('#blastName').val();
	   
	    var email=$('#email').val();
		var dd=$('#date').val();
		var mm=$('#month').val();
		var yyyy=$('#year').val();
		var occupation=$('#occupation').val();
		//var dailingCode=$('#dailingCode').val();
		var bmobileNumber=$('#bmobileNumber').val();
		var suburb=$('#suburb').val();
		var postalCode=$('#postalCode').val();
		
	   
	    if(bFirstName==''){
	    	$('#bFirstName').focus().css('outline' , 'solid red 2px');
	    	return false;
	    }
	    if(blastName==''){
	    	$('#blastName').focus().css('outline' , 'solid red 2px');
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
	    if(mm=='04' || mm=='06' || mm=='11'){
			if(dd<1 || dd>30){
				$('#date').focus().css('outline' , 'solid red 2px');
				return false;
			}
		}else if(mm=='02'){
				if(dd<1 || dd>28){
					$('#date').focus().css('outline' , 'solid red 2px');
					return false;
				}
		}else{
			if(dd<1 || dd>31){
				$('#date').focus().css('outline' , 'solid red 2px');
				return false;
			}
		}
		if(yyyy<1920 || yyyy>2000){
			$('#year').focus().css('outline' , 'solid red 2px');
			return false;
		}
		$('#dob').val(yyyy+"-"+mm+"-"+dd);
		if(occupation==''){
		    	$('#occupation').focus().css('outline' , 'solid red 2px');
		    	return false;
		 }
		if(bmobileNumber==''){
	    	$('#bmobileNumber').focus().css('outline' , 'solid red 2px');
	    	return false;
	 	}
		//$('#bmobileNumber').val(dailingCode+bmobileNumber);
/* 		if(suburb==''){
	    	$('#suburb').focus().css('outline' , 'solid red 2px');
	    	return false;
	 }
 */		
 if(postalCode==''){
	    	$('#postalCode').focus().css('outline' , 'solid red 2px');
	    	return false;
	 }
	    $('#updateForm').submit();
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
<style>
body{
font-family: 'Lato', sans-serif;
}

#updateForm{    position: relative;
    top: -59px;}
    .view-profile-in {
    display: block !important;
    padding: 70px 0;
    margin: 127px auto 0 !important;
    display: block;
   /*  box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.19); */
    padding: 0 28px 0;
}

</style>
</head>
<body>
<%@include file="frontendheader.jsp" %>
<div class="view-profile"> 
	 <div class="container">
		  <div class="row">			
			   <div class="col-md-6 col-md-offset-3">
			        <form action="updatemyaccountcustomer" id="updateForm" method="post">
				          <input type="hidden" id="dob" name="dob" value="${customer.dob}"/>
				          <div class="profile-info">
				               <h5 class="page-header pb-2 mt-4 mb-3 border-bottom">Update Profile</h5>
					              <div class="form-row">
					                   <div class="form-group">
                                            <label for="idType">First Name</label>
                                            <input type="text" class="form-control" onkeyup="removeError('bFirstName');"  value="${customer.firstName}"id="bFirstName" name="firstName" placeholder="Enter First Name">
                                       </div>
                                       <div class="form-group">
                                            <label for="idType">Last Name</label>
                                            <input type="text" class="form-control"  onkeyup="removeError('blastName');"  value="${customer.lastName}" id="blastName" name="lastName" placeholder="Enter Last Name">
                                       </div>
                                       <%-- <div class="form-group col-md-6">
                                                 <label for="idType">Full Name</label>
                                                 <input type="text" class="form-control"  value="${customer.firstName} ${customer.lastName}"placeholder="Enter Name">
                                             </div> --%>
                                      <div class="form-group">
                                           <label for="idNumber">Email Address</label>
                                           <input type="email" id="email" name="emailId" onkeyup="removeError('email');" class="form-control" value="${customer.emailId}" placeholder="Enter Email">
                             	           <label id="emsg"></label>
                                      </div>
                                      <!-- <div class="form-group col-md-6">
                                                 <label for="idExpiry">Date of Birth</label>
                                                 <input type="text" class="form-control"  placeholder="yyyy/mm/dd" value="" id="dob" maxlength="10">
                                            </div> -->
                                      <!--   <div class="form-group col-md-2">
                                                  <label for="date">Date of Birth</label>
                                                  <input type="text" class="form-control"  maxlength='2' onkeypress="return onlyNumber(event)"placeholder="DD" onkeyup="removeError('date');" onkeypress="return onlyNumber(event)" id="date">
                                              </div>
                                              <div class="col-md-2">
                                                   <label for="month">&nbsp;</label>
                                              <div class="form-group">
                                                   <select class="custom-select" id="month">
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
                  <input type="text" class="form-control" id="year" onkeypress="return onlyNumber(event)" maxlength='4' placeholder="YYYY" onkeyup="removeError('year');">
                </div>

              </div> -->
                                               <div class="form-group" >
                                                    <label for="idNumber">Date Of Birth</label>
                                                    <input type="text" name="dob" id="datepicker" value="${customer.dob}" class="form-control" placeholder="Date Of Birth" readonly>
                                                    <script>
                                                    $(function () {
                                                        $("#datepicker").datepicker({ 
                                                            changeMonth: true,
                                                            changeYear: true,
                                                            dateFormat: 'yy-mm-dd'
                                                        });
  </script>
                                               </div>
                                               <div class="form-group">
                                                    <label for="idNumber">Occupation</label>
                                                    <input type="text" class="form-control" name="occupation" onkeyup="removeError('occupation');" id="occupation"placeholder="SELF EMPLOYED" value="${customer.occupation}">
                                                </div>
                                         </div>
                                         <div class="form-row">
                                              <div class="form-group">
                                                <label for="idType">Mobile</label>
                                              <div class="row">
                                                 
<!--                                                    <div class="dropdown col-md-4 col-xs-4">
                                                        <div class="dropdown bootstrap-select form-control bg-transparent">
                                                             <select id="dailingCode" name="dailingCode" data-style="custom-select bg-transparent border-0" data-container="body" class="selectpicker form-control bg-transparent" tabindex="-98" readonly>
                                                            <option data-icon="currency-flag currency-flag-aud mr-1" data-subtext="Australia" selected="selected" value="61">+61</option>
                                                              </select>                    
                                                          </div>
              </div>
 -->              <div class="form-group col-md-8 col-xs-8">
              
                  <input type="text" class="form-control" id="bmobileNumber" name="mobileNumber" value="${customer.mobileNumber}"placeholder="Mobile number" onkeyup="removeError('bmobileNumber');" onkeypress="return onlyNumber(event)" >
            
              </div>
              </div>
                </div>
              <div class="form-group">
                <label for="idNumber">Country</label>
                <input type="text" class="form-control"  value="${customer.country.countryName}" readonly>
              </div>
           <!--    <div class="form-group col-md-6">
              <div class="col-md-6" style="float:left;">
                <label for="idExpiry">House No</label>
                <input type="text" class="form-control"  placeholder="2" style="width:81px;">
                </div>
                <div class="col-md-6" style="float:right">
                	<label for="idExpiry" style="margin: 0 -72px;">Street Name</label>
                <input type="text" class="form-control"  placeholder="Newenden Street" style="width: 226px;margin: 0 -76px 0;">
                </div>
              </div> -->
              <div class="form-group">
                <label for="idNumber">State</label>
                  <select class="custom-select" name="cityOrState" id="cityOrState" value="${customer.cityOrState}">
                  <c:forEach var="list" items="${list}">
                  <option value="${customer.cityOrState}">${customer.cityOrState}</option>
              <option value="${list.stateName }" selected>${list.stateName}</option>
                  
<%--                   <c:choose>
                  	<c:when test="${list.stateId eq customer.stateId.stateId}">
                  	<option value="${list.stateId }" selected>${list.stateName}</option>
                  	</c:when>
                  	<c:otherwise>
                  	<option value="${list.stateId }">${list.stateName}</option>
                  	</c:otherwise>
                  </c:choose>
 --%>                  </c:forEach>
                  </select>
              </div>
<%--               <div class="form-group">
                <label for="idNumber">Suburb</label>
                <input type="text" class="form-control"  onkeyup="removeError('suburb');" value="${customer.suburb}"id="suburb" name="suburb"placeholder="Maddington">
              </div>
 --%>            
                    <div class="form-group">
                <label for="idNumber">Post code</label>
                <input type="text" class="form-control" onkeyup="removeError('postalCode');" value="${customer.postalCode}" id="postalCode" name="postalCode"  placeholder="6109">
              </div>
              <div class="text-center col-md-12">
  <!--            <button type="submit" class="btn btn-primary">Continue</button>  -->
           <button type="button" id="update"class="btn btn-primary btn-lg">Update Profile</button>  
            </div>
            </div>
				</div>
			</form>
			</div>
			
		</div>
	</div>
</div>
</body>
<%@include file="frontendfooter.jsp" %>

</html>