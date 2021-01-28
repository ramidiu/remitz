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
<title>Remit Admin Update</title>
<style>

</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#submitBtn').click(function(){
		var firstName = $('#firstName').val();
		var lastName = $('#lastName').val();
		var emailId = $('#emailId').val();
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
		 
		 
		 
		 var paymentModes=[];
		 var paymentTypes=[];
		 $.each($("input[name='paymentTypes']:checked"), function(){
			 paymentTypes.push($(this).val());
	    });
		 $('#pTypes').val(paymentTypes);
		 
		 $.each($("input[name='paymentModes']:checked"), function(){
			 paymentModes.push($(this).val());
	    });
		 $('#modeOfPayments').val(paymentModes);
		 
		 
		 
		
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
		if(toCountryDetails==''){
			$('#toCountrys').focus().css('outline','solid red 2px');
			return false;
		}
		
		/* if(profitMode==""){
			alert("please choose atleast one profit mode..!");
			return false;
		}
		if(paymentTypes==""){
			alert("please choose atleast one payment types..!");
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
		 */
		
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
	 if(parseInt(counting) === 5){
		 $('#addBtn').prop('disabled',true);
		 $('#removeBtn').prop('disabled',false);
	 }else if(counting == '0'){
		 $('#addBtn').prop('disabled',false);
		 $('#removeBtn').prop('disabled',true);
	 }else if(counting<5){
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
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/adm/dashforge.demo.css">
<link href="${pageContext.request.contextPath}/adm/ionicons.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> --%>
 
 
<!--  <link rel="stylesheet"  href="/css/superadmin/style.css">
<link rel="stylesheet"  href="/css/superadmin/shortcut.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
<%-- -<link href="${pageContext.request.contextPath}/adm/all.min.css" rel="stylesheet"> --%>
 <%-- <link href="${pageContext.request.contextPath}/adm/ionicons.min.css" rel="stylesheet"> --%>
<%-- <link href="${pageContext.request.contextPath}/adm/dashforge.css"  rel="stylesheet">  --%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/adm/dashforge.demo.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/adm/shortcuts.css"> 
<!-- link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->

<%--  <link href="${pageContext.request.contextPath}/adm/all.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/adm/ionicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/adm/dashforge.css"  rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/adm/dashforge.demo.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/adm/shortcuts.css"> --%>
<!-- <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->


<%--<link href="${pageContext.request.contextPath}/adm/all.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/adm/ionicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/adm/dashforge.css"  rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/adm/dashforge.demo.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/adm/shortcuts.css">
<link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

 <link href="${pageContext.request.contextPath}/adm/all.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/adm/ionicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/adm/dashforge.css"  rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/adm/dashforge.demo.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/adm/shortcuts.css">
<link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
 --%>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

</head>
<body>

<main id="main-container">
              
                <div class="content"><h3 class="header-title mb-3">ADMIN UPDATE</h3> 
	<section class="block p-10">
		<div class="row">
			<div class="col-lg-12" >

			
				     
 				<form  method="POST" action="updateremitdetails" enctype="multipart/form-data"> 
 					
					<div class="form-group col-md-4">
						<label >Address:</label>
						
						<textarea class="form-control" name="address" id="address" placeholder="Enter Your Address *" onclick="removeError('address');"></textarea>
						
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
						<!-- <div class="form-group col-md-4">
					<label>Upload company logo:</label>
					
						<input type="file" name="logo1" id="logo" class="form-control " placeholder="Upload logo"  onclick="removeError('logo');">
					
					</div> -->
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
						
					</div>
					 				<input type="hidden" name="pTypes" id="pTypes" value="">
					
				<div class="form-group col-md-4">
					<label>Payment Types:</label>
					<div class="checkbox">
					<c:forEach var="list" items="${pTypesList}">
					<label><input type="checkbox" name="paymentTypes"   value="${list.paymentType}">${list.paymentType}</label>
					</c:forEach>
						
					</div>
					</div>
					
					
					<div class="form-group col-md-12 text-center">
						<button type="submit" id="submitBtn" class="btn btn-alt-primary center-block" >SUBMIT</button>
					</div>
 				</form> 
			</div>
		</div>
	</div>
</div>
</body>
</html>