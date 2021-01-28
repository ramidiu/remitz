<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>New User Registration</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/adm/js/nicEdit-latest.js" ></script>
  <script src="${pageContext.request.contextPath}/resources/adm/js/modal-windowRTF.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  

<style>

</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#submitBtn').click(function(){
		var firstName = $('#firstName').val();
		var lastName = $('#lastName').val();
		var emailId = $('#emailId').val();
		 var Place=$('#Place').val();

		var password = $('#password').val();
		var countryCode = $('#countryCode').val();
		var phoneNumber = $('#phonenumber').val();
		var role = $('#role').val();
		var country = $('#country').val();
		var zoneId=$('#zoneId').val();
		var baseCurrency=$('#baseCurrency').val();
		var toCountryDetails=$('#toCountryDetails').val();
		 
		
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
				url : "${pageContext.request.contextPath}/common/CheckUsersEmail",
				type : "POST",
				data : data, 
				 async : false,
				success : function(response){
					if(response == "exist"){
						testVal='exist';
					}
				},
				error : function(xhr,error,status){
					//alert(xhr.responseText);
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
			


		}
		

	});
/* 	$.ajax({
		url : "${pageContext.request.contextPath}/common/getallcountrys",
		type : "POST",
        dataType: 'json',
		success : function(response) {
			var countrylist = JSON.stringify(response, undefined, '\t');
			$("#Place").empty();
			
			
			for (var i=0 ; i <=response.length; i++)	{
				var country = response[i];
				$('#Place').append("<option value='"+country.countryISO+"'>"+country.countryName+"</option>");
			}
		},
		error : function(xhr, status, error) {
			alert("error::::"+error);
		}
	}); 
 */
	
	 var bcountries=$('#bcountries').val();
	 var Place=$('#Place').val();
	 //alert("business countries:"+bcountries);
	 
	 bcountries=bcountries.split(',');
	 
	 $('#Place').empty();
	 
	// $('#Place').append("<option value=''>-- Select Country --</option>");
	 
	 for(var i=0;i<=bcountries.length;i++){
		// alert("business countries:"+bcountries);
 
	var country=bcountries[i].split('-');
		 
		 $('#Place').append("<option value='"+bcountries[i]+"'>"+country[1]+"</option>");
		 
		 //alert("country::::"+Place);

 }
	
});
</script>


<script type="text/javascript">

function validateEmail(emailId) {
	var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if(regex.test(emailId)) {
	return true;
	}
	else {
	return false;
	}
}
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
<%@include file ="headerNew.jsp" %>
<%-- <%@include file="sidenav.jsp" %> --%>
<div class="container">
<main id="main-container">
              
                <div class="content"><h3  style="background: #2e287b;color:white;padding:5px;text-align:center" class="header-title mb-3">NEW USER REGISTRATION</h3> 
	<section class="block p-20">
				     <div class="row">
 				<form  method="POST" action="insertNewUser" enctype="multipart/form-data"> 
 				<input type="hidden" id="bcountries" value="${admin.businessCountries}"/>
 				<input type="hidden" name="bcountries1" id="bcountries1" value="${addNewUser.businessCountries}">
					<div class="form-group col-md-4">
					<label>First Name:</label>
					
						<input type="text" class="form-control" name="firstname" id="firstname" placeholder="Enter First Name *" onkeyup="removeError('firstName');">
					
					</div>
					<div class="form-group col-md-4">
						<label>Last Name:</label>
						
						<input type="text" class="form-control" name="lastname" id="lastname" placeholder="Enter Last Name" onkeyup="removeError('lastName');">
						
					</div>
					<div class="form-group col-md-4">
						<label>Email</label>
						
						<input type="text" class="form-control" name="emailId" id="emailId" placeholder="Enter Email Address *" onkeyup="removeError('emailId');">
              					               <label id="emsg"></label>
						
					</div>
					<div class="form-group col-md-4">
						<label>Password</label>
						
						<input type="text" class="form-control" name="password" id="password" placeholder="Enter Passowrd *" onkeyup="removeError('password');">
						
					</div>
					<div class="form-group col-md-4">
					<label>Mobile Number:</label>
					
						<input type="text" class="form-control mml-19 w-439" name="phonenumber" id="phonenumber" placeholder="Mobile Number *" maxlength="15" onkeyup="removeError('mobileNo');">
					
					</div>
					
					
					
					
										
						<div class="form-group col-md-4">
					<label>Upload profileImage:</label>
					
            <input type="file" name="profileImage1" id="profileImage" class="form-control " placeholder="ID Proof Image" title="ID PROOF IMAGE" onclick="removeError('profileImage');"> 
					
					</div>
					
					
					<div class="form-group col-md-12">
					<label>Select business countries:</label>
					<table class="table">
					    <tr>
								<td>To Country</td>
								<td id="toCountriesRow1">
									<div class="col-md-4">
									<select id="Place" name="Place" class="form-control" size="5" style="width: 150px;height: 182px important;">
									</select>
									</div>
									<div class="col-md-4">
										<button type="button" class="btn btn-success" id="addBtn" onclick="moveoutid('Place','toCountrys','toCountrys','toCountryDetails');">add >></button>
										<button type="button" class="btn btn-danger" id="removeBtn" onclick="moveoutid('toCountrys','Place','toCountrys','toCountryDetails');">remove <<  </button>
									</div>
									<div class="col-md-4">
									<select id="toCountrys" name="toCountrys" class="form-control" size="5" style="width: 150px">
										<option value="">Any</option>
									</select>
									<input type="hidden" id="toCountryDetails" name="toCountryDetails">
									<input type="hidden" id="toCountryISOs" name="toCountryISOs" value="">
									<input type="hidden" id="toCountryNames" name="toCountryNames" value="">
									</div>
								</td>
								
							</tr>
							</table>
					</div>
					
					
				<div class="form-group col-md-5">
                <label for="inputEmail4">Roles *</label>
              <select class="custom-select" name="role" id="role">
  <option selected>Open this select menu</option>
  <option value="Compliance Officer">Compliance Officer</option>
  <option value="General Manager">General Manager</option>
  <option value="Assistant Manager">Assistant Manager</option>
  <option value="Staff">Staff</option>
  <option value="Cashier">Cashier</option>
  <option value="Auditor">Auditor</option>
</select>
              					</div>
              					
              					
              					<div class="clearfix"></div>
         
					
					
					
					
					
					
					
			<div class="form-group col-md-12 text-center">
						<button type="submit" id="submitBtn" class="btn btn-primary btn-alt-primary" >REGISTER</button>
					</div>
 				</form> 
 				                                    <div class="col-md-12 mt-30" style="    border-top: 16px solid #f0f2f5;
    padding-top: 15px;">
                                            <div class="row">
                           
                            <div class="col-md-12">
                               	<h5  style="background: #2e287b;color:white;padding:5px;text-align:center">New User Listing</h5>
                                         <div class="">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-1">
                                                <thead class="table-primary">
                                                  <tr  style="background: #2e287b;color:white;padding:5px;text-align:center">
                                                     <th scope="col">New UserId</th>
                                                  
                                                    <th scope="col">First Name</th>
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
         <td>${List.emailId}</td>
         <td>${List.phonenumber}</td>
         <td>${List.role}</td>
         <td>
     	<img src="resources/images/newuserprofile/${List.newUserId}/${List.profileImage}" width="100" height="55">
       </td> <td>
       <a class="btn btn-primary btn-alt-primary" href="updateNewUser?newUserId=${List.newUserId}">update</a></td>
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
                        </section>
                        </div>                    
       
 				
 				
 				
 				
 				
 				
 			
 		</main>
</body>
</html>