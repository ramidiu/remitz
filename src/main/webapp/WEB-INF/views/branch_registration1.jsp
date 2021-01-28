<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<!DOCTYPE html>
<html >
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Branch Registration</title>
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
				
				
	.address.nicEdit-panelContain{
			display:none;
		}
		.address text-area{
			display:block !important;
		}
		.card-body {
    width: 1030px !important;
    margin: 22px -45px -1px 148px !important;
    overflow: hidden;
}
.branchtransaction{    width: 1000px;}
		</style>
		
	<script type="text/javascript">bkLib.onDomLoaded(function() {
	 nicEditors.editors.push(new nicEditor().panelInstance(document.getElementById('details')));
    
    
    $("div.nicEdit-main").keydown(function(event) {
       
    });
 });
</script> 
<script type="text/javascript">
	$(document).ready(function (){
				$.getJSON("https://api.ipify.org/?format=json", function(e) {
				    console.log(e.ip);
				   //alert("ioplhgfszd"+e.ip);
				    $('#myIp').val(e.ip);
				});
		
		var pMode=$('#pMode').val();
		var pm=pMode.split(',');
		var ops='';
			var ops1='';
		for(var i=0 ; i<pm.length;i++){
			ops1=ops1+'<option value="'+pm[i]+'">'+pm[i]+'</option>';
		}
		$('#profitMode').empty();
		$('#profitMode').append(ops+ops1);
		
	
		
		var modeOfPayments=$('#modeOfPayments').val();
		var branchModeOfPayments=$('#branchModeOfPayments').val();
		if(branchModeOfPayments!=''){
			branchModeOfPayments=branchModeOfPayments.split(',');
		}
		
	
		var pModes=modeOfPayments.split(',');
		ops='<label class="">Mode Of Payments:</label><br>';
			ops1='';
			if(branchModeOfPayments!=''){ 
				
				for(var i=0 ; i<pModes.length;i++){
					var count=0;
					
					for(var j=0;j<branchModeOfPayments.length;j++){
						
				if(pModes[i]==branchModeOfPayments[j]){
					if(count==3)
						{
						ops1=ops1.substr(0,ops1.length-118);
						}
					ops1=ops1+'<div class="checkbox"><label><input type="checkbox" checked name="modeOfPayment" value="'+pModes[i]+'">'+pModes[i]+'</label></div>';	
					count=2;
					
				}
				if(count==0)
				{
					op='<div class="checkbox"><label ><input type="checkbox" name="modeOfPayment" value="'+pModes[i]+'">'+pModes[i]+'</label></div>';
					
					ops1=ops1+op;
                 count=3;
				}
				
			}
				 
					}		
			
		
				}else{
					for(var i=0 ; i<pModes.length;i++){
					ops1=ops1+'<div class="checkbox"><label class=""><input type="checkbox" name="modeOfPayment" value="'+pModes[i]+'">'+pModes[i]+'</label></div>';
					}
				}
			
		$('#modeOfPaymentDiv').empty();
		$('#modeOfPaymentDiv').append(ops+ops1);
		
		
		$('#msg').hide();
		var buttonName=$('#buttonName').val();
		//alert("button name:"+buttonName);
		if(buttonName == ''){
			$('#submitBtn').show();
			$('#updatebtn').hide();	
		}
		if(buttonName!=''){
			$('#submitBtn').hide();
			$('#updatebtn').show();
			
		}
		$('#radio1').click(function(){
			$('#radio1').css('outline','#B0C4DE');
			$('#radio2').css('outline','#B0C4DE');
		});
		$('#radio2').click(function(){
			$('#radio1').css('outline','#B0C4DE');
			$('#radio2').css('outline','#B0C4DE');
		});
		$('#submitBtn').click(function (){
			var count=$('#counts').val();
			var branchName = $('#branchName').val();
			var mobileNumber = $('#mobileNumber').val();
			var emailId = $('#emailId').val();
			var password = $('#password').val();
			var fcountry = $('#fcountry').val();
			var address = $('#address').val();
			var maxLimit = $('#maxLimit').val();
			var radio1=$('#radio1').is(':checked');
			var radio2=$('#radio2').is(':checked');
			var profitMode=$('#profitMode').val();
			var functionality=$('#functionality').val();
			/* var cashDeleiveryTime=$('#cashDeleiveryTime').val();
			var bankDeliveryTime=$('#bankDeliveryTime').val();
			var ewalletDeliverytime=$('#ewalletDeliverytime').val(); */
				var pModes=[];
				 $.each($("input[name='modeOfPayment']:checked"), function(){
					 pModes.push($(this).val());
			    });
				 $('#pmtMode').val(pModes);
				/*  var bStatus=[];
				 $.each($("input[name='bankStatus']:checked"), function(){
					 bStatus.push($(this).val());
			    });
				 var cStatus=[];
				 $.each($("input[namecashStatus']:checked"), function(){
					 cStatus.push($(this).val());
			    });
				 var ewStaus=[];
				 $.each($("input[name='ewalletStaus']:checked"), function(){
					 ewStaus.push($(this).val());
			    }); */
				 
				 
			if(fcountry==''){
				$('#fcountry').focus().css('outline','solid red 2px');
				return false;
			}
			if(functionality==''){
				$('#functionality').focus().css('outline','solid red 2px');
				return false;
			}
			if(branchName == "")	{
				$('#branchName').focus().css('outline', '2px solid red');
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
				$('#emailId').focus().css('outline' , 'solid red 2px');
				$('#emsg').empty();
				$('#emsg').append("<font color='red'>Email address already exist!</font>");
				
				return false;
			}
			if(validateEmail(emailId)==false){
				$('#emailId').focus().css('outline', '2px solid red');
				$('#emsg').empty();
				$('#emsg').append("<font color='red'>Invalid Email</font>");
				
				return false;
			}
			if(password == "")	{
				$('#password').fo
				cus().css('outline', '2px solid red');
				return false;
			}
			if(address == "")	{
				$('#address').focus().css('outline', '2px solid red');
				return false;
			}
			if(mobileNumber == "")	{
				$('#mobileNumber').focus().css('outline', '2px solid red');
				return false;
			}
	
			if(!radio1 && !radio2){
				$('#radio1').focus().css('outline','2px solid red');
				$('#radio2').focus().css('outline','2px solid red');
				return false;
			}
			var isThisAnActualBank=$('#isThisAnActualBank').val();
			//alert('isThisAnActualBank====='+isThisAnActualBank);
			if(isThisAnActualBank=='yes'){
				  if(isThisAnActualBank==""){
						$('#isThisAnActualBank').focus().css('outline','solid red 2px');
						return false;
				  }
				  
				  if(fullBankName==""){
						$('#fullBankName').focus().css('outline','solid red 2px');
						return false;
				  }
				  
				  if(abbrevName==""){
						$('#abbrevName').focus().css('outline','solid red 2px');
						return false;
				  }
				  
				  if(bankCode==""){
						$('#bankCode').focus().css('outline','solid red 2px');
						return false;
				  }
				  
				  if(address1==""){
						$('#address1').focus().css('outline','solid red 2px');
						return false;
				  }
				  
				  if(emailAddress==""){
						
						$('#emailAddress').focus().css('outline','solid red 2px');
						return false;
				  }

			}
			if(functionality!='receiving'){
/* 				if(profitMode==''){
					$('#profitMode').focus().css('outline','2px solid red');
					return false;
				}
 */				if(pModes==''){
					alert('please select atleast one mode of payment...!');
					return false;
				}	
			}
	
		
			/* 
			if(cStatus=='active'){
				if(cashDeleiveryTime==""){
					$('#cashDeleiveryTime').focus().css('outline','solid red 2px');
					return false;
				}	
			}
			
			if(bStatus=='active'){
				if(bankDeliveryTime==""){
					$('#bankDeliveryTime').focus().css('outline','solid red 2px');
					return false;
				}	
			}
			if(ewStaus=='active'){
				if(ewalletDeliverytime==""){
					$('#ewalletDeliverytime').focus().css('outline','solid red 2px');
					return false;
				}	
			} */
			
			 $('#submitForm').attr("action", "insertbranch");
			 $('#submitForm').submit(); 
			
		});
		
		$('#updatebtn').click(function(){
			var branchName = $('#branchName').val();
			var mobileNumber = $('#mobileNumber').val();
			//var emailId = $('#emailId').val();
	
			var password = $('#password').val();
			//var fcountry = $('#fcountry').val();
			var address = $('#address').val();
			var maxLimit = $('#maxLimit').val();
			var radio1=$('#radio1').is(':checked');
			var radio2=$('#radio2').is(':checked');
			
			var profitMode=$('#profitMode').val();
			var functionality=$('#functionality').val();
			/* var cashDeleiveryTime=$('#cashDeleiveryTime').val();
			var bankDeliveryTime=$('#bankDeliveryTime').val(); */
			
			var pModes=[];
			 $.each($("input[name='modeOfPayment']:checked"), function(){
				 pModes.push($(this).val());
		    }); 
			/*  var ewStaus=[];
			 $.each($("input[name='ewalletStaus']:checked"), function(){
				 ewStaus.push($(this).val());
		    }); */
			 
			 
/* 		if(fcountry==''){
			$('#fcountry').focus().css('outline','solid red 2px');
			return false;
		}
		if(functionality==''){
			$('#functionality').focus().css('outline','solid red 2px');
			return false;
		}
 */		
 if(branchName == "")	{
			$('#branchName').focus().css('outline', '2px solid red');
			return false;
		}
/* 		var testVal='';
		if(emailId == "")	{
			$('#emailId').focus().css('outline', '2px solid red');
			return false;
		}else{
			var data="emailId="+emailId;
			$.ajax({
				url : "${pageContext.request.contextPath}/common/checkEmail",
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
		if(validateEmail(emailId)==false){
			$('#emailId').focus().css('outline', '2px solid red');
			return false;
		}
 */		
 if(password == "")	{
			$('#password').focus().css('outline', '2px solid red');
			return false;
		}
		if(address == "")	{
			$('#address').focus().css('outline', '2px solid red');
			return false;
		}
		if(mobileNumber == "")	{
			$('#mobileNumber').focus().css('outline', '2px solid red');
			return false;
		}

		if(!radio1 && !radio2){
			$('#radio1').focus().css('outline','2px solid red');
			$('#radio2').focus().css('outline','2px solid red');
			return false;
		}
		
		if(functionality!='receiving'){
/* 			if(profitMode==''){
				$('#profitMode').focus().css('outline','2px solid red');
				return false;
			}
 */			
            if(pModes==''){
            	
				alert('please select atleast one mode of payment...!');
				return false;
			}
		}
	else{
		$('#modeOfPaymentDiv').hide();

			}
		
 
			 $('#submitForm').attr("action", "updatebranch");
			 $('#submitForm').submit(); 
		});
		var adminId=$('#adminId').val();
		//alert(adminId);
		
$('#isThisAnActualBank').change(function(){
var isThisAnActualBank=$('#isThisAnActualBank').val();
//alert('isThisAnActualBank====='+isThisAnActualBank);
if(isThisAnActualBank=='yes'){
$('#pDiv1').show();
}
if(isThisAnActualBank=='no'){
	$('#pDiv1').hide();
	}

});
		
		$('#fcountry').change(function(){
			var data = $(fcountry).val();
			//alert('data==='+data);
			$.ajax({
				url : "/common/getTimeZones",
				type : "GET",
				data : "iso="+data,
				success : function (response){
					//alert('response==='+response);
					$('#zone').empty();
					for (var i=0 ; i < response.length ; i++)	{
						var zone = response[i];
						$('#zone').append("<option value='"+zone.zoneId+"'>"+zone.zoneName+"</option>");
					}
				},
				error: function(xhr,error,status){
					alert("getTimeZones error = "+error);
				}
			});

			
			if ($.trim(data) != "")	{
				$('#fcountry').css('outline', '#B0C4DE');
			}
		});
		
 
		 var bcountries=$('#bcountries').val();
//		 alert("business countries:"+bcountries);
		 bcountries=bcountries.split(',');
		 $('#fcountry').empty();
		 $('#fcountry').append("<option value=''>-- Select Country --</option>");
		 for(var i=0;i<bcountries.length+1;i++){
			 var country=bcountries[i].split('-');
			 
			 $('#fcountry').append("<option value='"+country[0]+"'>"+country[1]+"</option>");
		 }
		
		
});
	
</script>
<script type="text/javascript">
function removeError(id){
	$('#msg').hide();
	$('#'+id).css('outline','#B0C4DE');
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
function validateProfitMode() {
	var functionality=$('#functionality').val();
	var fcountry=$('#fcountry').val();
	var adminId=$('#adminId').val();
	if(functionality=='receiving'|| functionality=='both'){
		if(functionality=='receiving'){

	    $('#modeOfPaymentDiv').hide();
		$('#nsanoDiv').show();
		$('#pDiv').show();
		$('#pDiv1').hide();
		}else{
			$('#modeOfPaymentDiv').show();
			$('#nsanoDiv').hide();
			$('#pDiv').hide();
			$('#pDiv1').hide();
		}
		//$('#profitModeDiv').hide();
		var count=$('#counts').val();
		
		for(var i=1;i<=count-1;i++)
		{
			$('input[name=paymentStatus'+i+']:last').attr('checked', true);
		}
		
		$('#paymentType').show();
		
	}else if (functionality=='sending'||functionality=='both'){
		if(functionality=='sending'){
		$('#paymentType').hide();
		$('#nsanoDiv').hide();
		$('#pDiv').hide();
		$('#pDiv1').hide();
		}else {
			$('#nsanoDiv').hide();
			$('#paymentType').show();
			$('#pDiv1').hide();
			
	}
		$('#modeOfPaymentDiv').show();
		$('#pDiv1').hide();
		}
	
	
	var pMode=$('#pMode').val();
	var pm=pMode.split(',');
	var ops='';
		var ops1='';
	for(var i=0 ; i<pm.length;i++){
		/* if(functionality=='both'){
			if(pm[i]=='Currency Difference'){
				ops1=ops1+'<option value="'+pm[i]+'" selected>'+pm[i]+'</option>';		
			}
		}else{ */
			ops1=ops1+'<option value="'+pm[i]+'">'+pm[i]+'</option>';	
		/* } */
		
	}
	$('#profitMode').empty();
	$('#profitMode').append(ops+ops1);
	
}

</script>
</head>
<body> 
<%-- <%@include file="sidenav.jsp" %> --%>
<%@include file ="headerNew.jsp" %>
<div class="container">
  <main id="main-container">
              
                <div class="content">
                    
             <h5 class="header-title mb-3" style="background: #2e287b;color:white;padding:5px;text-align:center">Branch Registration</h5>                  
<section class="block">
	<div class="">
        <div class="row">
             <div class="col-12">        
              
                  <div class="">
                      <input type="hidden" id="bcountries" value="${admin.businessCountries}"/>
			         <input type="hidden" id="adminId" name="adminId" value="${admin.adminId}">    
			              <form id="submitForm" method="post">	
							<input type="hidden" name="myIp" id="myIp">
								<input type="hidden" value="${branch.fromCountry.countryName}" id="selectedCountry" />
								<input type="hidden" value="${branch.fromCountry.countryISO}" id="selectedCountryISO" />-
								<input type="hidden" value="${buttonName}" id="buttonName"/>
								  
								
								<input type="hidden" name="pmtMode" id="pmtMode" value=""> 
			                        <div class="">        
			                        <div class="col-xl-4 col-lg-4">
                                         <div>
                                            <div class="form-group">
                                                <label for="showEasing">Country</label>
                                                <c:choose>
                                                	<c:when test="${branch.fromCountry ne null}">
                                                	<!-- <select class="form-control" disabled="true" data-plugin="customselect" name="fromCountry.countryISO" id="fcountry" onclick="removeError('fcountry')"></select> -->
                                                	</c:when>
                                                	<c:otherwise>
                                                	<select class="form-control"  data-plugin="customselect" name="fromCountry" id="fcountry" onclick="removeError('fcountry')"></select>
                                                	</c:otherwise>
                                                </c:choose>
                                                    
                                             </div>
                                        </div>
                                     </div> 
                                     <div class="col-xl-4 col-lg-4">
                                        <div>
                                            <div class="form-group">
                                                <label for="showEasing">Current Time Zone</label>
                                                <c:choose>
                                                	<c:when test="${branch.zone.zoneId ne null}">
                                                	<!-- <select class="form-control" disabled="true" data-plugin="customselect" name="zone.zoneId" id="zone" onclick="removeError('zone')"> -->
                                                       <option value="${branch.zone.zoneId}">${branch.zone.zoneName}</option>
                                                    </select>
			                                        </c:when>
			                                        <c:otherwise>
			                                        <select class="form-control" data-plugin="customselect" name="zone" id="zone" onclick="removeError('zone')">
                                                       <option value="${branch.zone.zoneId}">${branch.zone.zoneName}</option>
                                                    </select>
			                                        
			                                        </c:otherwise>
                                                
                                                </c:choose>
                                                   
                                                    </div> 
                                            </div>
                                        </div>   
                                        <div class="col-xl-4 col-lg-4" >
									<label class="pull-left ml-0 ">Sending/Receiving</label>
							<c:choose>
								<c:when test="${branch.functionality ne null}">
							<select  class="form-control" name="functionality" id="functionality" onchange="validateProfitMode();removeError('functionality')">	
								<option value="${branch.functionality}">${branch.functionality}</option>
								
<%-- 										<option value="sending" ${branch.functionality=='sending'?'selected':''}>Sending Branch</option>
										<option value="receiving" ${branch.functionality=='receiving'?'selected':''}>Receiving Branch</option>
										<option value="both" ${branch.functionality=='both'?'selected':''}>Both Sending and Receiving Branch</option>
 --%>							</select> 
								</c:when>
								<c:otherwise>
								<select class="form-control" name="functionality" id="functionality" onchange="validateProfitMode();removeError('functionality')">
								<option value="">-- Select Functionality --</option>
										<option value="sending" ${branch.functionality=='sending'?'selected':''}>Sending Branch</option>
										<option value="receiving" ${branch.functionality=='receiving'?'selected':''}>Receiving Branch</option>
										<option value="both" ${branch.functionality=='both'?'selected':''}>Both Sending and Receiving Branch</option>
							</select> 
								</c:otherwise>
							</c:choose>
							
									 	
									</div> 
									
									<div class="clearfix"></div>                              
                                        <div class="col-xl-4 col-lg-4">
                                            <div>
                                                <div class="form-group">
                                                    <label for="showEasing">Branch Name</label>
                                                        <input  type="text" name="branchName" id="branchName" value="${branch.branchName}" placeholder="Enter Branch Name" onkeyup="removeError('branchName')"class="form-control" />
                                                 </div>
                                             </div>
                                        </div>  
                                        <div class="col-xl-4 col-lg-4">
                                            <div>
                                               <div class="form-group">
                                                  <label for="showEasing">Email Id/Username</label>
                                                  
                                                    <c:choose>
                                                  <c:when test="${branch.emailId ne null }">
                                                  
                                                   	<input type="email" name="emailId" disabled="true"  id="emailId" value="${branch.emailId}"  onkeyup="removeError('emailId');"  placeholder="Enter Email Address/Username *" class="form-control"  />
                                                  
                                                  
                                                  </c:when>
                                                  
                                                  <c:otherwise>
                                            	<input type="email" name="emailId"  id="emailId"  onkeyup="removeError('emailId');"  placeholder="Enter Email Address/Username *" class="form-control"  />
                                                                  <label id="emsg"></label>
                                                  </c:otherwise>
                                                  </c:choose>
                                                  
                                                  
                                                     
                                               </div>
                                            </div>
                                        </div>
                                        
    									
                                       <div class="col-xl-4 col-lg-4">
                                          <div>
                                             <div class="form-group">
                                                 <label for="showEasing">Password</label>
                                                    <input  type="password" name="password" id="password" value="${branch.password}" onkeyup="removeError('password');" placeholder="Enter Password *" class="form-control"  />
                                              </div> 
                                         </div>
                                      </div>
                                      <div class="row">
                                      <div class="col-md-6"></div>
                                      <div class="col-md-6"></div>
                                      </div>
                                      <div class="col-xl-4 col-lg-4">
                                            <div>
                                               <div class="form-group">
                                                   <label for="showEasing">Address</label>
                                                       <textarea  class="form-control" maxlength="225" rows="3" name="address" id="address" onkeyup="removeError('address');" placeholder="Enter Your Address *">${branch.address}</textarea>
                                                </div>
                                           </div>
                                        </div>
                                      <div class="col-xl-4 col-lg-4">
                                            <div>
                                               <div class="form-group">
                                                   <label for="showEasing">Mobile Number</label>
                                                        <input type="text" placeholder="Enter your phone no"name="mobileNumber" id="mobileNumber" value="${branch.mobileNumber}" maxlength="13" onkeyup="removeError('mobileNumber');" placeholder="Enter Mobile  Number" onkeypress="return onlyNumber(event)" class="form-control" value="swing" />
                                                </div>
                                            </div>
                                       </div>
                                     <div class="col-xl-4 col-lg-4  ">
                                          <div>
                                             <div class="form-group">
                                                <label>Status</label><br>
                                                  <input type="radio" name="status" id="radio1" value="active" ${branch.status=='active'?'checked':''}/>
                                                     <label for="radio5">Active</label>
                                                         <input type="radio" name="status" id="radio2" value="inActive" ${branch.status=='inActive'?'checked':''}/>
                                                            <label for="radio5">InActive</label>
                                               </div>
                                           </div>
                                      </div>
                            <div class="row">
                            <div class="col-md-6"></div>
                            
                            <div class="col-md-6"></div>
                            </div>
					<c:choose>
					<c:when test="${branch.status ne null and branch.status ne '' }">
					<c:if test="${nsano eq 'yes' }">
					<div id="nsanoDiv" class="form-group col-md-4">
					<label >Nsano:</label>
				
					<div class="checkbox">
						<label><input type="radio" name="nsano" value="yes"  ${branch.nsano=='yes'?'checked':''}/>Yes</label>
						</div>
						<div class="checkbox">
						<label>
						<input type="radio" name="nsano"  value="no" ${branch.nsano=='no'?'checked':''}/>No
						</label>
						</div>
						
					</div>
					</c:if></c:when>
					<c:otherwise>
										<c:if test="${nsano eq 'yes' }">
					<div id="nsanoDiv" class="form-group col-md-4">
					<label>Nsano:</label>
					
					<div class="checkbox">
						<label><input type="radio" name="nsano" value="yes">Yes</label>
						</div>
						<div class="checkbox">
						<label>
						<input type="radio" name="nsano" checked value="no">No
						</label>
						</div>
					</div>
					
					
					</c:if>
					</c:otherwise>
					</c:choose>
					          
                                      <div class="clearfix"></div>
                                        
                                     
                                     
                                     
                                     
                                     
                                      <div class="col-xl-4 col-lg-4 "  id="profitModeDiv">
<!-- 									<label class="pull-left ml-0 ">Profit Mode</label>
 -->									<c:choose>
										<c:when test="${branch.profitMode ne null }">
										<input type="hidden"  name="profitMode"   value="{branch.profitMode}" id="profitMode" onchange="removeError('profitMode');">
										</c:when>
										<c:otherwise>
										<input type ="hidden" name="profitMode" id="profitMode" value="Flat fee"   onchange="removeError('profitMode');">
										</c:otherwise>
									</c:choose>
									</div>
									<br>
								
										<div class="col-xl-4 col-lg-4">
                                            <div>
                                                <div class="form-group">
<!--                                                     <label for="showEasing">Min Transaction</label>
 -->                                                        <input  type="hidden" name="minimumTransaction" id="minimumTransaction" value="1" placeholder="Enter min trans" onkeyup="removeError('minimumTransaction')" onkeypress="return onlyNumber(event)"class="form-control" />
                                                 </div>
                                             </div>
                                        </div>  
                                        <div class="col-xl-4 col-lg-4">
                                            <div>
                                                <div class="form-group">
<!--                                                     <label for="showEasing">Max Transaction</label>
 -->                                                        <input  type="hidden" name="maximumTransaction" id="maximumTransaction" value="100000" placeholder="Enter max trans" onkeyup="removeError('maximumTransaction')" onkeypress="return onlyNumber(event)" class="form-control" />
                                                 </div>
                                             </div>
                                        </div>   
                                      <table class="table table-bordered" >  
                                       <tr>
                                       <td>
                                   
                                      <div class="col-xl-6 col-lg-6 " id="paymentType">
                                          <div>
                                             <div class="form-group">
                                             <label >Payment Type</label><br><%-- <c:out value="${admin.getPaymentTypes()}"></c:out> --%>
                                           <br> <c:set var="counts" value="1"></c:set>
                                                
                                             <c:choose>
                                             <c:when test="${branch.paymentMode ne null }">
                                             
                                             
                                       <c:forTokens var="paymenttypes" items="${admin.getPaymentTypes()}" delims="," varStatus="count">
                                                <div class="row mt-10">
                                                 
                                                <div class="col-md-2">
                                               <input type="hidden" name="paymentType${counts}" id="PaymentType${counts}" value="${paymenttypes}">
                                             
                                                <label>${paymenttypes.toUpperCase()}</label>
                                                  </div>
                                                   <div class="col-md-4">
                                                  <input type="radio" name="paymentStatus${counts}" id="paymentStatus${counts}" disabled="true" value="active"/>Active
                                                     <input type="radio" name="paymentStatus${counts}" id="paymentStatus${counts}" disabled="true" value="inactive"/>InActive
                                                      </div>
                                                       <div class="col-md-5">
                                                      <input type="text" placeholder="delivery time"name="DeleiveryTime${counts}" disabled="true" id="DeleiveryTime${counts}" <%-- value="${branch.cashDeleiveryTime}" --%> onkeyup="removeError('cashDeleiveryTime');" class="form-control" style="">
                                                    </div>
                                                    </div>
                                                     <c:set var="counts" value="${counts+1}"></c:set>
                                                    
                                             </c:forTokens>
                                             
                                             </c:when>
                                             <c:otherwise>
                                            <c:set var="counts" value="1"></c:set>
                                             <c:forTokens var="paymenttypes" items="${admin.getPaymentTypes()}" delims="," varStatus="count">
                                                 <div class="row mt-10">
                                                 <div class="col-md-2">
                                               <input type="hidden" name="paymentType${counts}" id="PaymentType${counts}" value="${paymenttypes}">
                                                <label>${paymenttypes.toUpperCase()}&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                  </div>
                                                   <div class="col-md-4">
                                                  <input type="radio" name="paymentStatus${counts}" id="paymentStatus${counts}" value="active"/>Active
                                                     <input type="radio" name="paymentStatus${counts}" id="paymentStatus${counts}" value="inactive"/>InActive
                                                      
                                                      </div>
                                                       <div class="col-md-5">
                                                      <input type="text" placeholder="delivery time"name="DeleiveryTime${counts}" id="DeleiveryTime${counts}" <%-- value="${branch.cashDeleiveryTime}" --%> onkeyup="removeError('cashDeleiveryTime');" class="form-control" style="">
                                                    </div>
                                                    </div>
                                                     <c:set var="counts" value="${counts+1}"></c:set>
                                                    </c:forTokens></c:otherwise>
                                                                                                  </c:choose>
                                             
                                                    <c:out value="${branch.branchId}"></c:out>
                                               </div>
                                           </div>
                                      </div>
                                      <div class="col-md-6">
                                      <div class="row ">
                                       <div class="col-xl-12 col-lg-12 mt-10" id="modeOfPaymentDiv"></div>
                                      </div>
                                      </div>
                                      
                                      </td>
									</tr>
									</table>				
				
<div class="row form-group">
<div class="col-md-12">
<h5 style="background: #2e287b;color:white;padding:5px;text-align:center;font-size:15px;">IP ACCESS CONTROL</h5>
<div class="row">
<div class="col-md-3">
<label>Allowed IP Addresses</label>
</div>
<div class="col-md-4">
<input type="text" name="allowedIPAddresses" value="${branch.allowedIPAddresses}" id="allowedIPAddresses" class="form-control">
	

Comma separated IP Addresses, eg. 192.168.1.67,10.0.0.*,192.168.2.0/24. Or a dynamic DNS name, eg. agent1.dyndns.org. Leave blank to allow any IP Address.

</div>
</div>

</div>
</div>


<div class="row">
<div class="col-md-12">
<h5 style="background: #2e287b;color:white;padding:5px;text-align:center;font-size:15px;">ACCESS TIME CONTROL</h5>
<div class="row">
<div class="col-md-3">
<label>Start time</label>
</div>
<div class="col-md-4">
<input type="text" name="startTime" value="${branch.startTime}" id="startTime" class="form-control">
	
Format should be : HH:MM, using 24hr format, eg. 09:30 or 15:45.
If Start time is provided, End time must also be provided.
</div>
</div>
<div class="row form-group">
<div class="col-md-3">
<label>End time</label>
</div>
<div class="col-md-4">
<input type="text" name="endTime" value="${branch.endTime}" id="endTime" class="form-control">
	Format should be : HH:MM, using 24hr format, eg. 09:30 or 15:45
</div>
</div></div>
<div id="pDiv">
<div class="row form-group">
<div class="col-md-3 ">
<label>Is this an actual bank?*</label>
</div>
<div class="col-md-4">
<select name="isThisAnActualBank" id="isThisAnActualBank" class="form-control">

<option value="no">No</option>
<option value="yes">Yes</option>
</select>
<p>Yes if this ia an acutal bank, No if this is a payout agent</p>
</div>
</div>
	</div>

<c:choose>
<c:when test="${branch.isThisAnActualBank eq 'yes'  and branch.functionality ne 'sending'}">
<h4 style="background: #2e287b;color:white;padding:5px;text-align:center;font-size:20px;">Processing Bank Details</h4>
				
<div class="row form-group">

<div class="col-md-3">
<label>Full Bank Name *</label>
</div>
<div class="col-md-4">
<input type="text" name="fullBankName" value="${branch.fullBankName}" id="fullBankName" class="form-control">
</div>
</div>

<div class="row form-group">

<div class="col-md-3">
<label>Abbrev. Name *</label>
</div>
<div class="col-md-4">
<input type="text" name="abbrevName" value="${branch.abbrevName}" id="abbrevName"  class="form-control">
</div>
</div>

<div class="row form-group">

<div class="col-md-3">
<label>Bank Code *</label>
</div>
<div class="col-md-4">
<input type="text" name="bankCode" id="bankCode" value="${branch.bankCode}" class="form-control">
<p>needed for auto-routing by Delivery Bank.Recommended to be the same as the Abbreviated Name)</p>
</div>
</div>


<div class="row form-group">

<div class="col-md-3">
<label>Address 1*</label>
</div>
<div class="col-md-4">
<input type="text" name="address1" id="address1" value="${branch.address1 }" class="form-control">
</div>
</div>



<div class="row form-group">

<div class="col-md-3">
<label>Address 2</label>
</div>
<div class="col-md-4">
<input type="text" name="address2" id="address2" value="${branch.address2 }"  class="form-control">
</div>
</div>

<div class="row form-group">

<div class="col-md-3">
<label>Address 3</label>
</div>
<div class="col-md-4">
<input type="text" name="address3" id="address3" value="${branch.address3 }"  class="form-control">
</div></div>
<div class="row form-group">
<div class="col-md-3 ">
<label>Email address *</label>
</div>
<div class="col-md-4">
<input type="text" name="emailAddress" value="${branch.emailAddress }"  id="emailAddress" class="form-control">
</div>
</div>

<div class="row form-group">
<div class="col-md-3 ">
<label>Telephone Number</label>
</div>
					<div class="row">
					<div class="col-md-1">
					<select name="dailingCode" id="dailingCode" class="form-control">
					<c:forEach items="${list}" var="list">
					<option value="${list.dalingCode}">${list.dalingCode}</option>
					</c:forEach>
					</select>
					</div>
					<div class="col-md-3 ">
						<input type="text" class="form-control" value="${branch.telePhoneNumber}" name="telePhoneNumber" id="telePhoneNumber" placeholder="Mobile Number *" maxlength="15" onkeyup="removeError('mobileNo');">
					</div>
					</div>

</div>

<div class="row form-group">
<div class="col-md-3 ">
<label>Fax Number</label>
</div>
					<div class="row">
					<div class="col-md-1">
					<select name="dailingCode" id="dailingCode" class="form-control">
					<c:forEach items="${list}" var="list">
					<option value="${list.dalingCode}">${list.dalingCode}</option>
					</c:forEach>
					</select>
					</div>
					<div class="col-md-3 ">
						<input type="text" class="form-control" name="faxNumber" id="faxNumber" value="${branch.faxNumber}" placeholder="Fax Number *" maxlength="15" onkeyup="removeError('mobileNo');">
					</div>
					</div>

</div>



</div>
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose>
<c:if test="${branch eq null or branch eq '' }">
	<div id="pDiv1">		 
<h4 style="background: #2e287b;color:white;padding:5px;text-align:center;font-size:20px;">Add Processing Bank</h4>
				
<div class="row form-group">

<div class="col-md-3">
<label>Full Bank Name *</label>
</div>
<div class="col-md-4">
<input type="text" name="fullBankName" id="fullBankName" class="form-control">
</div>
</div>

<div class="row form-group">

<div class="col-md-3">
<label>Abbrev. Name *</label>
</div>
<div class="col-md-4">
<input type="text" name="abbrevName" id="abbrevName"  class="form-control">
</div>
</div>

<div class="row form-group">

<div class="col-md-3">
<label>Bank Code *</label>
</div>
<div class="col-md-4">
<input type="text" name="bankCode" id="bankCode" class="form-control">
<p>needed for auto-routing by Delivery Bank.Recommended to be the same as the Abbreviated Name)</p>
</div>
</div>


<div class="row form-group">

<div class="col-md-3">
<label>Address 1*</label>
</div>
<div class="col-md-4">
<input type="text" name="address1" id="address1" class="form-control">
</div>
</div>



<div class="row form-group">
<div class="col-md-3">
<label>Address 2</label>
</div>
<div class="col-md-4">
<input type="text" name="address2" id="address2" class="form-control">
</div>
</div>
<div class="row form-group">
<div class="col-md-3">
<label>Address 3</label>
</div>
<div class="col-md-4">
<input type="text" name="address3" id="address3" class="form-control">
</div></div>
<div class="row form-group">
<div class="col-md-3 ">
<label>Email address *</label>
</div>
<div class="col-md-4">
<input type="text" name="emailAddress" id="emailAddress" class="form-control">
</div>
</div>

<div class="row form-group">
<div class="col-md-3 ">
<label>Telephone Number</label>
</div>
					<div class="row">
					<div class="col-md-1">
					<select name="dailingCode" id="dailingCode" class="form-control">
					<c:forEach items="${list}" var="list">
					<option value="${list.dalingCode}">${list.dalingCode}</option>
					</c:forEach>
					</select>
					</div>
					<div class="col-md-3 ">
						<input type="text" class="form-control" name="telePhoneNumber" id="telePhoneNumber" placeholder="Mobile Number *" maxlength="15" onkeyup="removeError('mobileNo');">
					</div>
					</div>

</div>

<div class="row form-group">
<div class="col-md-3 ">
<label>Fax Number</label>
</div>
					<div class="row">
					<div class="col-md-1">
					<select name="dailingCode" id="dailingCode" class="form-control">
					<c:forEach items="${list}" var="list">
					<option value="${list.dalingCode}">${list.dalingCode}</option>
					</c:forEach>
					</select>
					</div>
					<div class="col-md-3 ">
						<input type="text" class="form-control" name="faxNumber" id="faxNumber" placeholder="Fax Number *" maxlength="15" onkeyup="removeError('mobileNo');">
					</div>
					</div>
</div></div></c:if>

					</div>				
									 <input type="hidden" id="modeOfPayments" value="${admin.getModeOfPayments()}"/>
									 <input type="hidden" id="branchModeOfPayments" value="${branch.modeOfPayment}"/>
                                     <input type="hidden" name="counts" id="counts" value="${counts}">
									<input type="hidden" name="branchId" value="${branch.branchId}">
									
									
							<input type="hidden" name="modeOfPayments" value="${admin.getProfitMode()}" id="pMode"/>
							
		
										
                                            <div class="col-md-12 " style="top:4px;left:0px;">
                                             <button type="button" id="updatebtn" class="btn btn-primary waves-effect waves-light">Update</button>
                                               
                                            </div>
                                            
                                          <div class="col-md-12 mt-30 mb-30">
                                             <button type="button" id="submitBtn" class="btn btn-primary waves-effect waves-light">Register</button>
                                               
                                            </div>
                                       </form>
                                       
                                       </div>
                                      
                                </div> <!-- end card-->
                            </div>
                                    </div> <!-- end card-body--><br>
                                    </section>
                                    <div class="clearfix"></div>
                                    <h5 style="background: #2e287b;color:white;padding:5px;text-align:center">Branch Listing</h5>
                                    <div class="block col-md-12 p-10">
                                            <div class="row">
                                            
                                    	
                           
                            <div class="col-lg-12">
                               
                                         <div class="">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
                                                <thead class="table-primary">
                                                  <tr style="background: #2e287b;color:white;padding:5px;text-align:center">
                                                    <th style="text-align:center" scope="col">Branch Name${buttonName}</th>
                                                    <th scope="col">Sending/Receiving</th>
                                                    <th style="text-align:center" scope="col">Address</th>
                                                    <th style="text-align:center" scope="col">Country</th>
                                                    <th style="text-align:center" scope="col">Status</th>
                                                    <th style="text-align:center" scope="col">Edit</th>
                                                  </tr>
                                                </thead>
                                                <tbody>
     <c:forEach items="${branchesList}" var="branch">
      <tr>
         <td style="text-align:center">${branch.branchName}</td>
         <td style="text-align:center">${branch.functionality}</td>
         <td style="text-align:center">${branch.address}</td>
         <td style="text-align:center">${branch.fromCountry.countryName}</td>
         <td style="text-align:center">${branch.status}</td>
         <td style="text-align:center"><a href="branch_registration?branchId=${branch.branchId}&buttonName=update"  class="btn btn-primary btn-alt-primary">update</a></td>
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
                        </main>
                                     
                    
<script src="${pageContext.request.contextPath}/resources/js/summernote-bs4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/form-editor.init.js"></script>  
</div>
</body>
<script>
$(document).ready(function(){
//alert('hbhbhhjb');
	$('#pDiv1').hide();
});
</script>
</html>