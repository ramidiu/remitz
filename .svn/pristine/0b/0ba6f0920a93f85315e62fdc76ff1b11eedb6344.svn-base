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
<title>Admin Registration123</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>

</style>
<script type="text/javascript">
$(document).ready(function(){
	$.getJSON("https://api.ipify.org/?format=json", function(e) {
	    console.log(e.ip);
	   // alert("ioplhgfszd"+e.ip);
	    $('#myIp').val(e.ip);
	});

	$('#submitBtn').click(function(){
		var firstName = $('#firstName').val();
		var lastName = $('#lastName').val();
		var emailId = $('#emailId').val();
		//alert('emailId=='+emailId);
		var password = $('#password').val();
		var countryCode = $('#countryCode').val();
		var mobileNo = $('#mobileNo').val();
		var address = $('#address').val();
		var country = $('#country').val();
		var zoneId=$('#zoneId').val();
		var companyName=$('#companyName').val();
		var baseCurrency=$('#baseCurrency').val();
		var toCountryDetails=$('#toCountryDetails').val();
		var currencyMarkup=[];
		 $.each($("input[name='currencyMarkup']:checked"), function(){
			 currencyMarkup.push($(this).val());
	    });
		var profitMode=[];
		 $.each($("input[name='profitMode']:checked"), function(){
			 profitMode.push($(this).val());
	    });
		 $('#pMode').val(profitMode);
			var trulio=[];
			 $.each($("input[name='trulio']:checked"), function(){
				 trulio.push($(this).val());
		    });
				var manual=[];
				 $.each($("input[name='manual']:checked"), function(){
					 manual.push($(this).val());
			    });

			 var flutter=[];
				 $.each($("input[name='flutter']:checked"), function(){
					 flutter.push($(this).val());
			    });
					if(manual=='no' && trulio=='no'){
						alert("please choose one truiloo or manual..!");
						return false;
					}
					if(manual=='yes' && trulio=='yes'){
						alert("please choose only one  truiloo or manual..!");
						return false;
					}

		 
		 
		 var paymentModes=[];
		 var paymentTypes=[];
		 $.each($("input[name='paymentTypes']:checked"), function(){
			 paymentTypes.push($(this).val());
	    });
		 $('#pTypes').val(paymentTypes);
		 
		 $.each($("input[name='paymentModes']:checked"), function(){
			 paymentModes.push($(this).val());
	    });
		// alert('paymentModes===='+paymentModes);
		 $('#modeOfPayments').val(paymentModes);
		 //alert('modeOfPayments===='+modeOfPayments);
		 
			if(modeOfPayments==""){
				alert("please choose atleast one modeOfPayment types..!");
				return false;
				
			}
			
			if(paymentModes==""){
				alert("please choose atleast one modeOfPayment modes..!");
				return false;
			}
			if(profitMode==""){
				alert("please choose atleast one profit mode..!");
				return false;
			}
			if(paymentTypes==""){
				alert("please choose atleast one payment types..!");
				return false;
			}
		
		if(firstName==""){
			$('#firstName').focus().css('outline','solid red 2px');
			return false;
		}
		if(lastName==""){
			$('#lastName').focus().css('outline','solid red 2px');
			return false;
		}
		//var testVal='';
		if(emailId == "")	{
			$('#emailId').focus().css('outline', '2px solid red');
			return false;
		}else{
			var data="emailId="+emailId;
			//alert('data==='+data);
			var testVal='';
			$.ajax({
				url : "${pageContext.request.contextPath}/common/CheckUsersEmail",
				method : "post",
				data :data,
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
			if(IsEmail(emailId)==false){
				$('#emailId').focus().css('outline' , 'solid red 2px');
				$('#emsg').empty();
				$('#emsg').append("<font color='red'>Invalid Email</font>");
		          return false;
		        }
			
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
		if(toCountryDetails==''){
			$('#toCountrys').focus().css('outline','solid red 2px');
			return false;
		}
		
		if(profitMode==""){
			alert("please choose atleast one profit mode..!");
			return false;
		}
		if(paymentTypes==""){
			alert("please choose atleast one payment types..!");
			return false;
		}
		if(modeOfPayments==""){
			alert("please choose atleast one modeOfPayment types..!");
			return false;
			
		}
		
		if(paymentModes==""){
			alert("please choose atleast one payment modes..!");
			return false;
		}
		if(currencyMarkup==""){
			alert("please choose Yes/No Currency Markup..!");
			return false;
		}
		
		
	});
	$.ajax({
		url : "${pageContext.request.contextPath}/common/getallcountrys",
		type : "GET",
        dataType: 'json',
		success : function(response) {
			var countrylist = JSON.stringify(response, undefined, '\t');
			$("#country").empty();
			$("#baseCurrency").empty();
			$("#Place").empty();
			$("#country").append("<option value=''>-- Select Country --</option>");
			$("#baseCurrency").append("<option value=''>-- Select Currency --</option>");
			
			
			$.each($.parseJSON(countrylist), function(idx, obj) {
				 $("#country").append("<option value='" +obj.countryISO+ "'>" + obj.countryName+ "</option>");
				 $("#baseCurrency").append("<option value='" +obj.currencyCode+ "'>" + obj.currencyCode+ "</option>");
				 $("#Place").append("<option value='" + obj.countryISO + "-" + obj.countryName + "'>" + obj.countryName + "</option>");
			});
		},
		error : function(xhr, status, error) {
			alert("error::::"+error);
		}
	}); 

	
	 $('#country').change(function(){
			 var iso = $(this).val();
			 $.ajax({
				url : "/common/getTimeZones",
				type :"GET",
				data : "iso="+iso,
				success : function(response){
					$('#zoneId').empty();
					for(var i=0;i<response.length;i++){
						var timeZone=response[i];
						$('#zoneId').append("<option value='"+timeZone.zoneId+"'>"+timeZone.zoneName+"</option>");
					}
				},
				error : function(xhr, status, error) {
					alert("error::::"+error+status+xhr);
				}
			 });
			
		}); 
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
<script>
function checkprefix(prefix){
	
	var string=$('#'+prefix).val();
	$('#'+prefix).val(string.toUpperCase());
/* 	alert(string); */
	var id=string.split("");
	
	/* alert("id"+prefix); */
	if(id.length<4){
		$('#'+prefix).css('outline','#B0C4DE');
/* alert("transaction prefix"+string); */
	}else{
		alert("value shuld be 3 alpahabets ");
		$('#'+prefix).val("");
		$('#'+prefix).focus().css('outline', '2px solid red');
	return false;
}}

</script>
</head>
<body>
<%-- <jsp:include page="${request.contextPath}/superadmin/header"></jsp:include> --%>
<%@include file ="headerNew.jsp" %>
<%-- <%@include file="sidenav.jsp" %> --%>
<div class="container">
<main id="main-container">
              
                <div class="content"><h3 class="header-title mb-3">ADMIN REGISTRATION</h3> 
	<section class="block p-10">
		<div class="row">
			<div class="col-lg-12" >

			
				     
 				<form  method="POST" action="insertAdmin" enctype="multipart/form-data"> 
 						<input type="hidden" name="myIp" id="myIp">					
 				
 				<input type="hidden" name="pMode" id="pMode" value="">
 				<input type="hidden" name="modeOfPayments" id="modeOfPayments" value="">
 				<input type="hidden" name="pTypes" id="pTypes" value="">
 				
					<div class="form-group col-md-4">
					<label>First Name:</label>
					
						<input type="text" class="form-control" name="firstName" id="firstName" placeholder="Enter First Name *" onkeyup="removeError('firstName');">
					
					</div>
					<div class="form-group col-md-4">
						<label class="">Last Name:</label>
						
						<input type="text" class="form-control" name="lastName" id="lastName" placeholder="Enter Last Name" onkeyup="removeError('lastName');">
						
					</div>
					<div class="form-group col-md-4">
						<label class="">Email</label>
						
						<input type="text" class="form-control" name="emailId" id="emailId" placeholder="Enter Email Address *" onkeyup="removeError('emailId');">
               <label id="emsg"></label>
					</div>
					<div class="form-group col-md-4">
						<label class="">Password</label>
						
						<input type="text" class="form-control" name="password" id="password" placeholder="Enter Passowrd *" onkeyup="removeError('password');">
						
					</div>
					<div class="form-group col-lg-4">
					<label>Mobile Number:</label>
					
					<div class="row">
					<div class="form-group col-md-3">
						<input type="text" class="form-control" name="countryCode" id="countryCode" placeholder="+91" onkeyup="removeError('countryCode');">
					</div>
					<div class="form-group col-md-9">
						<input type="text" class="form-control" name="mobileNumber" id="mobileNo" placeholder="Mobile Number *" maxlength="15" onkeyup="removeError('mobileNo');">
					</div>
					</div>
					</div>
					<div class="form-group col-md-4">
						<label >Address:</label>
						
						<textarea class="form-control" name="address" id="address" placeholder="Enter Your Address *" onclick="removeError('address');"></textarea>
						
					</div>
 					<div class="form-group col-md-4">
						<label>Country Name:</label>
						
						<select class="form-control" name="countryIso" id="country" onclick="removeError('country')">
						</select>
						
						
					</div>
					<input type="hidden" name="country.countryISO" value="" id="countryISO" >
					<div class="form-group col-md-4">
					<label>Time Zone:</label>
				
						<select class="form-control" name="zoneId" id="zoneId" onclick="removeError('zoneId')">
						
						</select>
					
					</div>
						<div class="form-group col-md-4">
					<label>Base Currency:</label>
					
						<select class="form-control" name="baseCurrency" id="baseCurrency" onclick="removeError('baseCurrency')">
						
						</select>
					
					</div>
					<div class="form-group col-md-4">
					<label class="">Company Name</label>
					
						<input type="text" class="form-control mml-19 w-439" name="companyName" id="companyName" placeholder="companyName *" onkeyup="removeError('companyName');">
					
					</div>
						<div class="form-group col-md-4">
					<label>Upload company logo:</label>
					
						<input type="file" name="logo1" id="logo" class="form-control " placeholder="Upload logo"  onclick="removeError('logo');">
					
					</div>
					<div class="form-group col-md-12">
					<label class="col-md-3">Select business countries:</label>
					<table>
					    <tr>
								<td>To Country</td>
								<td id="toCountriesRow1">
									<div class="col-md-4">
									<select id="Place" name="Place" class="form-control" size="5" style="height: 182px important;">
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
					<div class="form-group col-md-4">
					<label>Transaction Prefix:</label>
					
					
					
					
						<input type="text" name="transactionPrefix" class="form-control" id="transactionPrefix" onKeyUp="checkprefix('transactionPrefix');" >
				
					</div>
					
						
					<div class="form-group col-md-4">
					<label>Profit Mode:</label>
					
					<div class="checkbox">
						<label><input type="checkbox" name="profitMode"   value="Flat fee">Flat fee</label>
						</div>
						
						<div class="checkbox">
						<label><input type="checkbox" name="profitMode"  value="Percentage">Percentage</label>
						</div>
						<div class="checkbox">
						<label><input type="checkbox" name="profitMode" value="Currency Difference">Currency Difference</label>
						
						</div>
					
					</div>
					<div class="form-group col-md-4">
					<label>Payment Types:</label>
					<div class="checkbox">
					<c:forEach var="list" items="${pTypesList}">
					<label><input type="checkbox" name="paymentTypes"   value="${list.paymentType}">${list.paymentType}</label>
					</c:forEach>
						
					</div>
					</div>
					
					<div class="clearfix"></div>
					<div class="form-group col-md-4">
					<label>Mode Of Payments:</label>
					
					<div class="checkbox"><c:forEach var="list" items="${pModes}">
					
						<label><input type="checkbox" name="paymentModes" value="${list.modeOfPaymentId}-${list.modeOfPayment}">${list.modeOfPayment}</label>
				
					</c:forEach>
						</div>
					</div>
					
						<div class="form-group col-md-4">
					<label >Admin Status:</label>
					
					<div class="checkbox">
						<label><input type="radio" name="adminStatus" checked  value="active" >active</label>
						</div>
						<div class="checkbox">
						<label><input type="radio" name="adminStatus" value="inactive">inactive</label>
						</div>
					</div>
					<div class="form-group col-md-4">
					<label>Package:</label>
					
					<div class="checkbox">
						<label><input type="radio" name="packages" value="trail">Trail	</label>
						</div>
						<div class="checkbox">
						<label><input type="radio" name="packages" checked value="main">Main</label>
						</div>
					</div>
					</div>
					
					<div class="form-group col-md-4">
					<label>Currency Mark Up:</label>
					
					<div class="checkbox">
						<label><input type="radio" name="currencyMarkup" checked value="Yes" >Yes</label>
						</div>
						<div class="checkbox">
						<label><input type="radio" name="currencyMarkup" value="No">No</label>
						</div>
					</div>
<!-- 					<div class="form-group col-md-4">
					<label>TopUp Transactions:</label>
					
					<div class="checkbox">
						<label><input type="radio" name="topUpTransaction" value="Yes">Yes</label>
						</div>
						<div class="checkbox">
						<label><input type="radio" name="topUpTransaction" checked value="No">No</label>
						</div>
					</div> -->
<!-- 					<div class="form-group col-md-4">
					<label >Wish Rates:</label>
					
					<div class="checkbox">
						<label><input type="radio" name="wishRate" value="Yes">Yes</label>
						</div>
						<div class="checkbox">
						<label><input type="radio" name="wishRate" checked value="No">No</label>
						</div>
					</div>
					<div class="form-group col-md-4">
					<label>Promo Code:</label>
					
					<div class="checkbox">
						<label><input type="radio" name="promoCode" value="Yes">Yes</label>
						</div>
						<div class="checkbox">
						<label><input type="radio" name="promoCode" checked value="No">No</label>
						</div>
					</div>
					<div class="form-group col-md-4">
					<label>SMS Template:</label>
					
					<div class="checkbox">
						<label><input type="radio" name="smsTemplate" value="Yes">Yes</label>
						</div>
						<div class="checkbox">
						<label><input type="radio" name="smsTemplate" checked value="No">No</label>
						</div>
					</div>
 					<div class="form-group col-md-4">
					<label>API Credential:</label>
					
					<div class="checkbox">
						<label><input type="radio" name="apiCredential" value="Yes">Yes</label>
						</div>
						<div class="checkbox">
						<label><input type="radio" name="apiCredential" checked value="No">No</label>
						</div>
					</div>
 -->					<div class="form-group col-md-4">
					<label>Flutter:</label>
					
					<div class="checkbox">
						<label><input type="radio" name="flutter" value="Yes">Yes</label>
						</div>
						<div class="checkbox">
						<label><input type="radio" name="flutter" checked value="No">No</label>
						</div>
					</div>
					<div class="form-group col-md-4">
					<label>Trulioo:</label>
					
					<div class="checkbox">
						<label><input type="radio" name="trulio" value="yes">Yes</label>
						</div>
						<div class="checkbox">
						<label>
						<input type="radio" name="trulio" checked value="no">No
						</label>
						</div>
					</div>
					
					<div class="form-group col-md-4">
					<label>Manual:</label>
					
					<div class="checkbox">
						<label><input type="radio" name="manual" value="yes">Yes</label>
						</div>
						<div class="checkbox">
						<label><input type="radio" name="manual" checked value="no">No</label>
						</div>
					</div>
					<div class="form-group col-md-4">
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
					
					<div class="form-group col-md-12 text-center">
						<button type="submit" id="submitBtn" class="btn btn-primary btn-alt-primary center-block" >REGISTER</button>
					</div>
 				</form> 
			</div>
		</div>
	</div>
</div>
</body>
</html>