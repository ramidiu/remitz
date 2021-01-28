<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <link rel="stylesheet" href="/superadmin/style.css">
<title>New User Registration</title>
<style>

</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#submitBtn').click(function(){
		var firstName = $('#firstName').val();
		var lastName = $('#lastName').val();
		var emailId = $('#emailId').val();
		 var Place=$('#Place').val();
        var toCountrys=$('#toCountrys').val();
		var password = $('#password').val();
		var countryCode = $('#countryCode').val();
		var phoneNumber = $('#phonenumber').val();
		var role = $('#role').val();
		var country = $('#country').val();
		var zoneId=$('#zoneId').val();
		var baseCurrency=$('#baseCurrency').val();
		var businessCountries=$('#businessCountries').val();
		var userc=$('#userc').val();
		var bcountries1=$('#bcountries1').val();
		 
		
		if(firstName==""){
			$('#firstName').focus().css('outline','solid red 2px');
			return false;
		}
		if(lastName==""){
			$('#lastName').focus().css('outline','solid red 2px');
			return false;
		}
		var testVal='';
		if(emailId == "")	{
			$('#emailId').focus().css('outline', '2px solid red');
			return false;
		}else{
			var data="emailId="+emailId;
			$.ajax({
				url : "checkadminemailid",
				type : "POST",
				data : data, 
				 async : false,
				success : function(response){
					if(response == "exist"){
						$('#emailId').focus().css('outline', '2px solid red');
						$('#msg').show();
						testVal = '1';
						return false; 
					}
				},
				error : function(xhr,error,status){
					alert(xhr.responseText);
				}
				
			});
			
		}
		if(testVal!=''){
			return false;
		}

		if(countryCode==""){
			$('#countryCode').focus().css('outline','solid red 2px');
			return false;
		}
		if(mobileNo==""){
			$('#mobileNo').focus().css('outline','solid red 2px');
			return false;
		}
		if(address==""){
			$('#address').focus().css('outline','solid red 2px');
			return false;
		}
		if(country==""){
			$('#country').focus().css('outline','solid red 2px');
			return false;
		}
		if(zoneId==""){
			$('#zoneId').focus().css('outline','solid red 2px');
			return false;
		}
		if(baseCurrency==""){
			$('#baseCurrency').focus().css('outline','solid red 2px');
			return false;
		}
		if(companyName==''){
			$('#companyName').focus().css('outline','solid red 2px');
			return false;
		}
		if(businessCountries==''){
			$('#toCountrys').focus().css('outline','solid red 2px');
			return false;
		}
	});
	var userc=$('#userc').val();
 
	 var bcountries1=$('#bcountries1').val();
	 var toCountrys=$('#toCountrys').val();
	 //alert("business countries1:"+bcountries1);
	 //alert('userc......'+userc);
	 bcountries1=bcountries1.split(',');
	 
	 for(var i=0;i<=bcountries1.length-1;++i){
		
		 //$('#toCountrys').empty();
		 
		 var countrys=bcountries1[i].split('-');

		 $('#toCountrys').append("<option value='"+bcountries1[i]+"'>"+countrys[1]+"</option>");
	
	 }
	 
 
 var buisnesscountries=$('#buisnesscountries').val();
 //alert("business countries:"+buisnesscountries);
 
 buisnesscountries=buisnesscountries.split(',');
	 
	 $('#Place').empty();
	 

	 for(var i=0;i<buisnesscountries.length-1;++i){
 
		 var country=buisnesscountries[i].split('-');
		 
			$('#Place').append("<option value='"+buisnesscountries[i]+"'>"+country[1]+"</option>");	
		 
 }
 	
});
</script>
<script type="text/javascript">
function moveoutid(source,detination,main,TextBOX){
	var sda = document.getElementById(source);
	//var len = sda.length;
	var sda1 = document.getElementById(detination);
	var main1= document.getElementById(main);
	var TotText=document.getElementById(TextBOX); 
	var b;
	var i;
	var toCountryCount = $('#toCountrys option').length;
	var toCountryLimitPerAdmin = $('#toCountryLimitPerAdmin').val();
	
	
	for (i = 0; i < sda.length; i++) {		
		if (sda.options[i].selected){
			b = 1;
		}		
	}

	if(!b) {
		
        alert("Please select atleast one Country");
        sda.focus();
        return false; 
	 }else if(b == 1){
		 $('#moveoutid').attr('disabled', false);
		var tmp =sda.options[sda.selectedIndex].text;
		var tmp1 = sda.options[sda.selectedIndex].value;
		var TotT="";
		sda.remove(sda.selectedIndex);
		
		var y=document.createElement('option');
				y.text=tmp;
				y.value=tmp1;
				try{
				sda1.add(y,null);
				}catch(e){
				sda1.add(y);
				}
	 }
	
	 if(main1.options.length!=0){
	    	
			for(var j=0;j< main1.options.length; j++){
			  if(main1.options[j].text=="Any"){
			   main1.remove(main1.options[j]);
			   }	 
			 }	
	 } else{
		var y=document.createElement('option');
			y.text="Any";
			y.value="";
			try{
			main1.add(y,null);
			} catch(e){
			main1.add(y);
			};
	 }
				
	for(var j=0;j< main1.options.length; j++){
			 
		  if(j==0){ 
		   TotT=main1.options[j].value;
		   } else{
		   TotT=TotT+","+main1.options[j].value;
		   }
	 }
	TotText.value=TotT;		 
	var counting = '0';
	$('#toCountrys option').each(function(){
		if(this.value!=''){
			counting = parseInt(counting)+1;
		}
	});
	
	/*  alert('counting:::::'+counting);
	 alert('toCountryLimitPerAdmin:::::'+toCountryLimitPerAdmin); */
	 if(parseInt(counting) == toCountryLimitPerAdmin){
		 $('#addBtn').prop('disabled',true);
		 $('#removeBtn').prop('disabled',false);
	 }else if(counting == '0'){
		 $('#addBtn').prop('disabled',false);
		 $('#removeBtn').prop('disabled',true);
	 }else if(counting<toCountryLimitPerAdmin){
		 $('#addBtn').prop('disabled',false);
		 $('#removeBtn').prop('disabled',false);
	 }
}
</script>
<script type="text/javascript">
function removeError(id){
	$('#'+id).css('outline','#B0C4DE');
}
</script>
</head>
<body>
<%-- <jsp:include page="${request.contextPath}/superadmin/header"></jsp:include> --%>
<%@include file ="backendheader.jsp" %>
<%-- <%@include file="sidenav.jsp" %> --%>
<div class="registration mt-60">
	<div class="container">
		<div class="row">
			<div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12" >
				<h5 class="admin-heading" style="padding:10px 0px;margin:0px -15px 15px -14px;border-top-left-radius:4px;border-top-right-radius:4px;">NEW USER REGISTRATION</h5>
				<div style="margin: 0 0 -59px -181px;">
				</div>
				     
 				<form  method="POST" action="updateUser" enctype="multipart/form-data"> 
 				<input type="hidden" id="bcountries" value="${admin.businessCountries}"/>
 				<input type="hidden" name="newUserId"  id="newUserId" value="${addNewUser.newUserId}">
 				<input type="hidden" name="bcountries1" id="bcountries1" value="${addNewUser.businessCountries}">
					<input type="hidden"name="buisnesscountries" id="buisnesscountries" value="${buisnesscountries}">
<input type="hidden"name="map" id="map" value="${map}">
<input type="hidden"name="userc" id="userc" value="${userc}">
					
					<div class="form-group col-md-12 mt-30">
					<label class="col-md-3">First Name:</label>
					<div class="col-md-9">	
						<input type="text" class="form-control" name="firstname" id="firstname" value="${addNewUser.firstname}" placeholder="Enter First Name *" onkeyup="removeError('firstName');">
					</div>	
					</div>
					<div class="form-group col-md-12">
						<label class="col-md-3">Last Name:</label>
						<div class="col-md-9">
						<input type="text" class="form-control" name="lastname" id="lastname" value="${addNewUser.lastname}" placeholder="Enter Last Name" onkeyup="removeError('lastName');">
						</div>
					</div>
					<div class="form-group col-md-12">
						<label class="col-md-3">Email</label>
						<div class="col-md-9">
						<input type="text" class="form-control" name="emailId" id="emailId" value="${addNewUser.emailId}" placeholder="Enter Email Address *" onkeyup="removeError('emailId');">
						</div>
					</div>
					<div class="form-group col-md-12">
						<label class="col-md-3">Password</label>
						<div class="col-md-9">
						<input type="text" class="form-control" name="password" id="password" value="${addNewUser.password}" placeholder="Enter Passowrd *" onkeyup="removeError('password');">
						</div>
					</div>
					<div class="form-group col-lg-12 col-md-12">
					<label class="pull-left col-md-3">Mobile Number:</label>
					<div class="form-group col-md-7">
						<input type="text" class="form-control mml-19 w-439" name="phonenumber" id="phonenumber" value="${addNewUser.phonenumber}" placeholder="Mobile Number *" maxlength="15" onkeyup="removeError('mobileNo');">
					</div>
					</div>
					
					
					
					
										
						<div class="form-group col-md-12">
					<label class="col-md-3">Upload profileImage:</label>
            		<div class="form-group col-md-4">
     	<img src="/images/newuserprofile/${addNewUser.newUserId}/${addNewUser.profileImage}" width="100" height="55">
              <label for="inputEmail4">ReUpload profileImage:</label>
        	<input type="file" name="profileImage1" id="profileImage" class="form-control " placeholder="profileImage" title="PROFILE IMAGE" onclick="removeError('profileImage');"> 
                						 
              					</div>
              </div>
              
            				
					
					<div class="form-group col-md-12">
					<label class="col-md-3">Select business countries:</label>
					<table>
					    <tr>
								<td>To Country</td>
								<td id="toCountriesRow1">
									<div class="col-md-4">
									<select id="Place" name="Place" class="form-control" size="5" style="width: 150px;height: 182px important;">
									</select>
									</div>
									<div class="col-md-4">
										<button type="button" class="btn btn-success" id="addBtn" onclick="moveoutid('Place','toCountrys','toCountrys','businessCountries');">add >></button>
										<button type="button" class="btn btn-danger" id="removeBtn" onclick="moveoutid('toCountrys','Place','toCountrys','businessCountries');">remove <<  </button>
									</div>
									<div class="col-md-4">
									<select id="toCountrys" name="toCountrys" class="form-control" size="5" style="width: 150px">
									</select>
									<input type="hidden" id="businessCountries" name="businessCountries">
									<input type="hidden" id="toCountryISOs" name="toCountryISOs" value="">
									<input type="hidden" id="toCountryNames" name="toCountryNames" value="">
									</div>
								</td>
								
							</tr>
							</table>
					</div>
					
				<div class="form-group col-md-5">
                <label for="inputEmail4">Roles *</label>
              <select class="custom-select" name="role" id="role" value="${addNewuser.role}">
              <option selected="${addNewUser.role}">${addNewUser.role}</option>
  <option value="${addNewUser.role}">${addNewUser.role}</option>
  <option value="Compliance Officer">Compliance Officer</option>
  <option value="General Manager">General Manager</option>
  <option value="Assistant Manager">Assistant Manager</option>
  <option value="Staff">Staff</option>
  <option value="Cashier">Cashier</option>
  <option value="Auditor">Auditor</option>
</select>
              					</div><br><br><br>
         
			<div class="form-group col-md-12">
						<button type="submit" id="submitBtn" class="btn btn-register center-block" ><i class="fa fa-user-plus"></i>&nbsp;update</button>
					</div>
 				</form> 
 				                                    <div class="col-md-12 mt-30">
                                            <div class="row">
                           
                            <div class="col-lg-17">
                               	<h5 style="margin: 28px 155px;">New User Listing</h5>
                                         <div class="card-body shadow p-3 mb-5 bg-white rounded">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
                                                <thead class="thead-light">
                                                  <tr>
                                                     <th scope="col">New UserId</th>
                                                  
                                                    <th scope="col">First Name</th>
                                                    <th scope="col">LastName</th>
                                                    <th scope="col">EmailID</th>
                                                    <th scope="col">PhoneNumber</th>
                                                    <th scope="col">Role</th>
                                                    <th scope="col">profileImage</th>
                                                     <th scope="col">Edit</th>
                                                  </tr>
                                                </thead>
                                                <tbody>
     <c:forEach items="${List}" var="List">
      <tr>
        <td>${List.newUserId}</td>
         <td>${List.firstname}</td>
         <td>${List.lastname}</td>
         <td>${List.emailId}</td>
         <td>${List.phonenumber}</td>
         <td>${List.role}</td>
         <td>
     	<img src="images/newuserprofile/${List.newUserId}/${List.profileImage}" width="100" height="55">
       </td> <td><a href="updateNewUser?newUserId=${List.newUserId}">update</a></td>
      </tr>
                  </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div> <!-- end card-body -->
                                </div>
                            </div> <!-- end col -->
                        </div>
                        </div>                    
       
 				
 				
 				
 				
 				
 </div>
 </div>
 </div>
 </body>
 </html>				
 