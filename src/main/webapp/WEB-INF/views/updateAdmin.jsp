<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Update Admin Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script async src="js/user_timeline.json"></script>

<script type="text/javascript">
$(function() {
	
	$( "#packageExpiryDate" ).datepicker({
		changeMonth: true,
		changeYear: true,
		maxDate : new Date(),
		//numberOfMonths: 1,
		dateFormat: 'yy-mm-dd',
		onSelect: function( selectedDate ) {
			
		}
	});
	 
});
</script>
<!-- <script type="text/javascript">
$(document).ready(function(){
	if($('#idOptional').prop('checked') == true){
		$('#idFlag').hide();
		$('#firstIds').hide();
		$('#secondIds').hide();
	}else{
		$('#idFlag').show();
		$('#firstIds').show();
		$('#secondIds').show();
	}
	
	if($('#custSecondIdFlag').prop('checked') == true){
		$('#secondIds').show();
	}else{
		$('#secondIds').hide();
	}
	
	var toCountryLimitPerAdmin = $('#toCountryLimitPerAdmin').val();
	var toCountryListCount = $('#toCountrys').children('option').length;
	var superAdminId = $('#superAdminId').val();
	/* alert('superAdminId::::::'+superAdminId); */
	if(toCountryLimitPerAdmin==toCountryListCount || superAdminId==null || superAdminId==''){
		$('#addBtn').prop('disabled',true);
		$('#removeBtn').prop('disabled',true);
		$('#Place').prop('disabled',true);
		$('#toCountrys').prop('disabled',true);
	}
	if(superAdminId!=null && superAdminId!=''){
		$('#addBtn').prop('disabled',false);
		$('#removeBtn').prop('disabled',false);
		$('#Place').prop('disabled',false);
		$('#toCountrys').prop('disabled',false);
	}
	
	var toCountryCount = $('#toCountryCount').val();
	if(toCountryCount=='0'){
		$('#addBtn').prop('disabled',true);
	}else{
		$('#addBtn').prop('disabled',false);
	}
	
	var toCountryVals = '';
	$('#toCountrys option').each(function(){
		toCountryVals = this.value;
	});
	
	if(toCountryVals == ''){
		$('#removeBtn').prop('disabled',true);
	}else{
		$('#removeBtn').prop('disabled',false);
	}
});
</script> -->
<!-- <script type="text/javascript">
$(document).ready(function(){
	$('#idOptional').click(function(){
		$('#idFlag').hide();
		$('#firstIds').hide();
		$('#secondIds').hide();
		$('#custFirstIdFlag').prop('checked',false);
		$.each($("input[name='firstId']:checked"), function(){            
			 $(this).prop('checked', false);
       });
		$('#custSecondIdFlag').prop('checked',false);
		$.each($("input[name='secondId']:checked"), function(){            
			 $(this).prop('checked', false);
       });
	});
	
	$('#idRequired').click(function(){
		$('#idFlag').show();
	});
	
	$('#custFirstIdFlag').click(function(){
		if($('#custFirstIdFlag').prop('checked')==true){
			$('#firstIds').show();
			/* $('#errorMsg').text(""); */
		}
		if($('#custFirstIdFlag').prop('checked')==false){
			$.each($("input[name='firstId']:checked"), function(){            
				 $(this).prop('checked', false);
	        });
			$('#firstIds').hide();
			$('#custSecondIdFlag').prop('checked', false);
			$('#secondIds').hide();
			$.each($("input[name='secondId']:checked"), function(){            
				 $(this).prop('checked', false);
	       });
		}
	});
	
	$('#custSecondIdFlag').click(function(){
		if($('#custSecondIdFlag').prop('checked')==true){
			if($('#custFirstIdFlag').prop('checked')==true){
				/* $('#errorMsg').text(""); */
				$('#secondIds').show();
			}else{
				/* $('#errorMsg').text("Please select First ID Proof"); */
				alert("Please select First ID Proof");
				$('#custSecondIdFlag').prop('checked', false);
				$('#secondIds').hide();
				
			}
			
		}
		if($('#custSecondIdFlag').prop('checked')==false){
			$('#secondIds').hide();
			$.each($("input[name='secondId']:checked"), function(){            
				 $(this).prop('checked', false);
	        });
		}
	});
});
</script> -->
<!-- <script type="text/javascript">
$(document).ready(function(){
	if($('#passwordExpiryFlag').prop('checked') == false){
		$('#passwordExpiryDuration').hide();
		$('#passwordExpiryDuration').val('');
	}else{
		$('#passwordExpiryDuration').show();
	}
	$("#passwordExpiryFlag").click(function(){
		if($("#passwordExpiryFlag").prop('checked') == true){
			$('#passwordExpiryDuration').show();
		}else{
			$('#passwordExpiryDuration').hide();
			$('#passwordExpiryDuration').val('');
		}
	});
});
</script> -->
<script type="text/javascript">
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
$(document).ready(function(){
	$('#updateBtn').click(function(){
		$('#updateBtn').attr('disabled','disabled');
		var fromCountryISO = $('#fromCountryISO').val();
		/* alert("fromCountryISO:"+fromCountryISO); */
		var fromCountryName = $('#fromCountryName').val();
		var timeZone = $('#timeZone').val();
		var toCountryISOs = '';
		var toCountryNames = '';
		var adminId=$('#adminId').val();
		var adminStatus=$("input[name='adminStatus']:checked"). val();
		
		/* alert("adminid"+adminId); */
		var n;
		//for(n=0;n<toCountrys.length;n++){
			/* var toCountriesSplit = toCountrys[n].split('-');
			 toCountryISOs = toCountryISOs+toCountriesSplit[0]+",";
			toCountryNames = toCountryNames+toCountriesSplit[1]+","; 
			 alert('toCountryISOs:::'+toCountriesSplit[0]);
			alert('toCountryNames:::::::::'+toCountriesSplit[1]);*/ 
		/* 	alert('toCountrys::::'+toCountrys[n]);
		}  *
		if(superAdminId!=null && superAdminId!=''){
			var fromCountry = $('#fromCountry').val().split('-');
			fromCountryISO = fromCountry[0];
			fromCountryName = fromCountry[1];
		}
		$('#toCountrys option').each(function(){
			//alert('Country::::::::'+$(this).val());
			
			if($(this).val()!=''){
				var toCountriesSplit = $(this).val().split('-');
				toCountryISOs = toCountryISOs+toCountriesSplit[0]+",";
				toCountryNames = toCountryNames+toCountriesSplit[1]+","; 
			  alert('toCountryISOs:::'+toCountryISOs);
				alert('toCountryNames:::::::::'+toCountryNames); } */
			
			
		
		
		/* if(toCountryISOs==''){
			alert("Please Select atleast one Country as To Country");
			$('#updateBtn').attr('disabled',false);
			return false;
		} */
		
		if($('#idRequired').prop('checked') == true){
			if($('#custFirstIdFlag').prop('checked') == false){
				alert("Please Select First ID Proof");
				$('#updateBtn').attr('disabled',false);
				return false;
			}
		}
		var custFirstIdTypes = '';
		$.each($("input[name='firstId']:checked"), function(){            
			custFirstIdTypes = custFirstIdTypes+$(this).val()+',';
      	});
		if($('#custFirstIdFlag').prop('checked')==true){
			if(custFirstIdTypes == ''){
				alert("Select atleast one First ID Proof");
				$('#updateBtn').attr('disabled',false);
				return false;
			}
		}
		
		var custSecondIdTypes = '';
		$.each($("input[name='secondId']:checked"), function(){            
			custSecondIdTypes = custSecondIdTypes+$(this).val()+',';
      	});
		if($('#custSecondIdFlag').prop('checked')==true){
			if(custSecondIdTypes == ''){
				alert("Select atleast one Second ID Proof");
				$('#updateBtn').attr('disabled',false);
				return false;
			}
		}
		
		var modeOfPayment = '';
		$.each($("input[name='modeOfPayments']:checked"), function(){            
			modeOfPayment = modeOfPayment+$(this).val()+',';
      	});
		if(modeOfPayment == ''){
			alert("Please select atleast one Mode of Payment");
			$('#updateBtn').attr('disabled',false);
			return false;
		}
		
		var paymentType = '';
		$.each($("input[name='paymentTypes']:checked"), function(){            
			paymentType = paymentType+$(this).val()+',';
      	});
		if(paymentType == ''){
			alert("Please select atleast one Payment type");
			$('#updateBtn').attr('disabled',false);
			return false;
		}
		
		var tnxIDPrefix = $('#tnxIDPrefix').val();
		var tnxIDPrefixLength = $('#tnxIDPrefix').val().length;
		
		if(tnxIDPrefixLength!=3){
			$('#tnxIDPrefixSpan1').show();
			$('#tnxIDPrefixSpan2').hide();
			$('#tnxIDPrefix').focus().css('outline', '2px solid red');
			$('#updateBtn').attr('disabled',false);
			return false;
		}else{
			$('#tnxIDPrefixSpan1').hide();
			$('#tnxIDPrefix').css('outline', '');
			$('#updateBtn').attr('disabled',false); 
			if(!checkTxnId(tnxIDPrefix)){
				$('#updateBtn').attr('disabled',false);
				return false;
			}
			/* var admind=$('#adminId').val();
			alert("admind:"+admind);
			var queryString="adminid="+admind+"&tnxIDPrefix="+tnxIDPrefix;
			alert(queryString);
			 $.ajax({
				url : 'checkIdPrefix',
				type : 'POST',
				data : queryString,
				success : function(response){
					if(response == "notfound"){
						$('#errorMsg').text('');
						$('#tnxIDPrefix').css('outline', '');
					}
					
					else{
						$('#errorMsg').text(response);
						$('#tnxIDPrefix').focus().css('outline', '2px solid red');
						alert('This Transaction ID Prefix is already Registered, Please Try Another');
						return false;
					}
				},
				error : function(err){
					alert(err);
				}
			});  */
		}
		/* var sendEmail = '';
		if($('#sendEmail').prop('checked') == true){
			sendEmail = 'YES';
		}else{
			sendEmail = 'NO';
		}
		
		var sendSms = '';
		if($('#sendSms').prop('checked') == true){
			sendSms = 'YES';
		}else{
			sendSms = 'NO';
		} */
		
		var passwordExpiryDuration = '';
		if($('#passwordExpiryFlag').prop('checked') == true){
			passwordExpiryDuration = $('#passwordExpiryDuration').val();
			if(passwordExpiryDuration == ''){
				alert("Please Enter Password Expiry duration");
				$('#updateBtn').attr('disabled',false);
				return false;
			}
		}else{
			passwordExpiryDuration = '';
		}
		
		var ipSecurity = '';
		if($('#ipSecurity').prop('checked') == true){
			ipSecurity = 'YES';
		}else{
			ipSecurity = 'NO';
		}
		
		/* var agentTypes = '';var agentRoles = '';
		if($('#Branch').prop('checked') == true){
			agentTypes = agentTypes+"Branch"+",";
			agentRoles = agentRoles+'Remit Agent'+",";
		}
		if($('#Agent').prop('checked') == true){
			agentTypes = agentTypes+"Agent"+",";
			agentRoles = agentRoles+'Agent'+",";
		} */
		var logo = '';
		if($('#removeAdminLogo').prop('checked') == true){
			$('#removeAdminLogoDiv').hide();
			logo = 'remove';
		}
		
		var cLPAdmin = $('#cLPAdmin').val();
		if(cLPAdmin==''){
			alert('Enter Customer Limit');
			return false;
		}
		
		var toCountryLimit = $('#toCountryLimit').val();
		if(toCountryLimit==''){
			alert('Enter To Countries Limit');
			return false;
		}
		
		var tLPAdminPerMonth = $('#tLPAdminPerMonth').val();
		if(tLPAdminPerMonth==''){
			alert('Enter Transactions Limit');
			return false;
		}
		
		var tALPAdminPerMonth = $('#tALPAdminPerMonth').val();
		if(tALPAdminPerMonth==''){
			alert('Enter Transaction Amount Limit');
			return false;
		}
		
		var rALPAdmin = $('#rALPAdmin').val();
		if(rALPAdmin==''){
			alert('Enter Remit Agents Limit');
			return false;
		}
		
		var dALPAdmin = $('#dALPAdmin').val();
		if(dALPAdmin==''){
			alert('Enter Delivery Agents Limit');
			return false;
		}
		
		var packageType = $('#packageType').val();
		var packageExpiryDate = $('#packageExpiryDate').val();
		if(packageType==''){
			alert('Enter Package type');
			return false;
		}

		/* var roleOverMonths = $('#roleOverMonths').val();
		if(roleOverMonths==''){
			alert('Enter Role Over Months');
			return false;
		} */
		var toCountries = [];

		$('#toCountrys option').each(function() {
			toCountries.push($(this).val());
		});
		var bcountries=toCountries.toString();
		/* alert("bcountries"+bcountries);
		alert("before formfromCountryISO:"+fromCountryISO); */
		var formData = new FormData();
	        formData.append('file', $('input[type=file]')[0].files[0]);
	        formData.append('fromCountryISO', fromCountryISO);
	        formData.append('fromCountryName', fromCountryName);
	        formData.append('timeZone', timeZone);
	        formData.append('toCountryISOs', toCountryISOs);
	        formData.append('toCountryNames', toCountryNames);
	        formData.append('custFirstIdTypes', custFirstIdTypes);
	        formData.append('custSecondIdTypes', custSecondIdTypes);
	        formData.append('modeOfPayment', modeOfPayment);
	        formData.append('paymentType', paymentType);
	        formData.append('tnxIDPrefix', tnxIDPrefix);
	      /*   formData.append('sendSms', sendSms);
	        formData.append('sendEmail', sendEmail);
	        formData.append('passwordExpiryDuration', passwordExpiryDuration); */
	       /*  formData.append('ipSecurity', ipSecurity); */
	      /*   formData.append('agentTypes', agentTypes);
	        formData.append('agentRoles', agentRoles); */
	        formData.append('adminId',adminId);
	        formData.append('logo', logo);
	        formData.append('adminStatus',adminStatus);
	       /*  formData.append('cLPAdmin', cLPAdmin);
	        formData.append('toCountryLimit', toCountryLimit);
	        formData.append('tLPAdminPerMonth', tLPAdminPerMonth);
	        formData.append('tALPAdminPerMonth', tALPAdminPerMonth);
	        formData.append('rALPAdmin', rALPAdmin);
	        formData.append('dALPAdmin', dALPAdmin); */
	        formData.append('packages', packageType);
	        formData.append('adminToCountries',bcountries);
	       /*  formData.append('packageExpiryDate', packageExpiryDate);
	        formData.append('roleOverMonths', roleOverMonths); */
	        /* formDate.append('packageType',packageType);
	        formDate.append('packageExpiryDate',packageExpiryDate); */
	        
	        console.log("form data " + formData);
	        /* alert("its executing"+toCountries); */
			 $.ajax({
				   url : "updateAdminDetails",
				   type : "POST",
				   processData : false,
	               contentType : false,
	               async: true,
	               data : formData,
	               success : function(response) {
	            	   
	               if(response=="success"){
	                   alert("sucess::::"+response); 
	                  /*  var toCountryLimitPerAdmin = $('#toCountryLimitPerAdmin').val();
						var toCountryListCount = $('#toCountrys').children('option').length;
						
						if(toCountryLimitPerAdmin==toCountryListCount){
							$('#addBtn').attr('disabled','disabled');
							$('#removeBtn').attr('disabled','disabled');
							$('#Place').attr('disabled','disabled');
							$('#toCountrys').attr('disabled','disabled'); 
						} */
						$('#updateBtn').attr('disabled',false); 
						location.reload(true);}
	               },
	               error : function(err) {
	                   alert("Error:m::::::::"+err);
	                   $('#updateBtn').attr('disabled',false);
	               }
	           });
	 }); 
});
</script>

<script type="text/javascript">
function moveoutid(source,detination,main,TextBOX){
	var superAdminId = $('#superAdminId').val();
	var sda = document.getElementById(source);
	//var len = sda.length;
	var sda1 = document.getElementById(detination);
	var main1= document.getElementById(main);
	var TotText=document.getElementById(TextBOX); 
	var b;
	var i;
	
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
		var tmp =sda.options[sda.selectedIndex].text;
		alert("temp"+tmp);
		var tmp1 = sda.options[sda.selectedIndex].value;
		
		var adminToCountries = $('#adminToCountries').val();
		alert("adminToCountries"+adminToCountries);
		//alert('adminToCountries::::'+adminToCountries.indexOf(tmp));
		/* if(adminToCountries.indexOf(tmp) != -1 && (superAdminId == null || superAdminId == '')){ */
			if(adminToCountries.indexOf(tmp1)!=-1){
			alert('To remove already added Country Please contact Super Admin');
			return false;
		}else{
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
					
				/* 	var toCountryLimitPerAdmin = $('#toCountryLimitPerAdmin').val();
					var toCountryListCount = $('#toCountrys').children('option').length;
					
					if(toCountryLimitPerAdmin==toCountryListCount){
						$('#addBtn').attr('disabled','disabled');
						/* $('#removeBtn').attr('disabled','disabled');
						$('#Place').attr('disabled','disabled');
						$('#toCountrys').attr('disabled','disabled'); */
					/* }else{
						$('#addBtn').attr('disabled',false);
					}  */
	 	}
		
	/*  } */
	 
	 if(main1.options.length!=0){
	    	
			for(var j=0;j< main1.options.length; j++){
			  if(main1.options[j].text==""){
			   main1.remove(main1.options[j]);
			   }	 
			 }	
	 } else{
		var y=document.createElement('option');
			y.text="";
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
	/* var counting = '0';
	$('#toCountrys option').each(function(){
		if(this.value!=''){
			counting = parseInt(counting)+1;
		}
	}); */
	
	/*  alert('counting:::::'+counting);
	 alert('toCountryLimitPerAdmin:::::'+toCountryLimitPerAdmin); */
	/*  if(parseInt(counting) == toCountryLimitPerAdmin){
		 $('#addBtn').prop('disabled',true);
		 $('#removeBtn').prop('disabled',false);
	 }else if(counting == '0'){
		 $('#addBtn').prop('disabled',false);
		 $('#removeBtn').prop('disabled',true);
	 }else if(counting<toCountryLimitPerAdmin){
		 $('#addBtn').prop('disabled',false);
		 $('#removeBtn').prop('disabled',false);
	 }
	TotText.value=TotT; */
	
	 }  } 
	 
</script>

<script type="text/javascript">
$(document).ready(function(){
	$('#tnxIDPrefix').keyup(function(){
		this.value = this.value.toUpperCase();
	});
	$('#tnxIDPrefix').blur(function(){
		var tnxIDPrefixLength = $('#tnxIDPrefix').val().length;
		var tnxIDPrefix = $('#tnxIDPrefix').val();
		var adminId = $('#adminId').val();
		
		if(tnxIDPrefixLength!=3){
			$('#tnxIDPrefixSpan1').show();
			$('#tnxIDPrefixSpan2').hide();
			$('#tnxIDPrefix').focus().css('outline', '2px solid red');
			return false;
		}else{
			$('#tnxIDPrefixSpan1').hide();
			if(!checkTxnId(tnxIDPrefix)){
				return false;
			}
		} 
		/* 
		var idSize = tnxIDPrefix.size();
		alert("idSize:::::::"+idSize);
		return false; */
	});
});
</script>

<script type="text/javascript">
function checkTxnId(tnxIDPrefix){
	var adminId = $('#adminId').val();
	var supportVar = true;
	
// 	alert('111111');
	$.ajax({
		url : 'checkIdPrefix',
		type : 'POST',
		data : 'adminid='+adminId+'&tnxIDPrefix='+tnxIDPrefix,
		async: false,
		success : function(response){
			if(response =='notfound'){
				$('#errorMsg').text('');
				$('#tnxIDPrefix').css('outline', '');
				$('#updateBtn').prop('disabled',false);
				supportVar = true;
				$('#tnxIDPrefixSpan2').hide();
			}else{
				$('#errorMsg').text(response);
				$('#tnxIDPrefix').focus().css('outline', '2px solid red');
				$('#tnxIDPrefixSpan2').show();
				$('#tnxIDPrefixSpan1').hide();
				$('#updateBtn').prop('disabled',true);
				supportVar = false;
				return false;
			}
		},
		error : function(err){
			//alert(err);
		}
	});
	
	return supportVar;
}
</script>
<script type="text/javascript">
function showMyImage(fileInput) {
    var files = fileInput.files;
    for (var i = 0; i < files.length; i++) {           
        var file = files[i];
        var imageType = /image.*/;     
        if (!file.type.match(imageType)) {
            continue;
        }           
        var img=document.getElementById("imagePreview");            
        img.file = file;    
        var reader = new FileReader();
        reader.onload = (function(aImg) { 
            return function(e) { 
                aImg.src = e.target.result; 
            }; 
        })(img);
        reader.readAsDataURL(file);
    }    
}
</script>

<script type="text/javascript">

$(document).ready(function(){
	
	$('#fromCountry').change(function(){
		var country = $('#fromCountry').val();
		if(country == ""){
			$('#fromCountry').focus().css('outline', '2px solid red');
			$("#timeZone").empty();
			$("#timeZone").append("<option value=''>-- Select Time Zone --</option>");
		}else{
			$('#fromCountry').css('outline', '#B0C4DE');	
			var countryISO = country.split("-")[0];
			var data = "countryISO="+countryISO;
			
			$.ajax({
				url : "getTimeZones",
				data : data,
				type : "POST",
		        dataType: 'json',
				success : function(response) {
					var zonesList = JSON.stringify(response, undefined, '\t');
					$("#timeZone").empty();
					$("#timeZone").append("<option value=''>-- Select Time Zone --</option>");
					$.each($.parseJSON(zonesList), function(idx, obj) {
						 $("#timeZone").append("<option value='" + obj.zoneName + "'>" + obj.zoneName + "</option>");
					});
				},
				error : function(xhr, status, error) {
					alert(xhr.responseText);
				}
			});
		}
	});
	
});


</script>

</head>
<body>
<%-- <%@include file="header.jsp" %> --%>
<%@include file="headerNew.jsp"%>
<div class="admin-confirmation pt-10 pb-100 ml-10">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<c:set var="admin" value="${admindetails}"/>
				
				<%-- <input type="hidden" id="toCountryLimitPerAdmin" name="toCountryLimitPerAdmin" value="${admin.toCountryLimitPerAdmin}">
				<input type="hidden" id="toCountryCount" name="toCountryCount" value="${admin.toCountryCount}"> --%>
				<input type="hidden" id="superAdminId" name="superAdminId" value="${superAdminId}">
				
				<form class="col-lg-12 col-md-12 col-sm-12 col-md-12"> <!-- action="updateAdminDetails" method="post" enctype="multipart/form-data" -->
				<input type="hidden" id="fromCountryISO" name="fromCountryISO" value="${admin.country.countryISO}">
				<input type="hidden" id="fromCountryName" name="fromCountryName" value="${admin.country.countryName}">
				<input type="hidden" id="toCountryISOs" name="toCountryISOs" >
				<input type="hidden" id="toCountryNames" name="toCountryNames" > 
<%-- 				<input type="hidden" id="timeZone" name="timeZone" value="${admin.timeZone}"> --%>
				<input type="hidden" id="adminId" name="adminId" value="${admin.adminId}">
					<div class="logo" id="logo">
					<table class="table table-bordered table-bordered">
							<tr class="bg-lightgray">
								<th class="text-center text-white" colspan="2">UPDATE ADMIN DETAILS</th>
							</tr>
					</table>
						<table class="table table-striped table-hover table-bordered">
							<tr class="bg-lightgray">
								<th class="text-center text-white" colspan="3">UPDATE YOUR LOGO </th>
							</tr>
							<tr>
								<td>Upload Your Logo :</td>
								<td><img src="resources/images/adminlogo/${admin.adminId}/${admin.logo}" style="width:100px;height:100px" id="imagePreview"/> </td>
								<td><input type="file" id="logo" name="logo" onchange="showMyImage(this)"/><%-- <c:if test="${admin.logo ne '' }"><div id="removeAdminLogoDiv"><input type="radio" id="removeAdminLogo"> Remove Logo</div></c:if> --%></td>
							</tr>
						</table>
					</div>
					<!-- COUNTRIES AND CURRENCY TABLE -->
					<div class="countries-currency" id="countries-currency">
						<table class="table table-striped table-hover table-bordered">
							<tr class="bg-lightgray text-white text-center">
								<th colspan="3" class="text-center">COUNTRIES & CURRENCY</th>
							</tr>
							<tr>
								<td>From Country</td>
								<td>
									<select class="form-control" id="fromCountry" name="country" <c:if test="${superAdminId eq null or superAdminId eq ''}">disabled="disabled"</c:if>>
									<c:forEach var="country" items="${countriesList}">
										<option value="${country.countryISO}-${country.countryName}" <c:if test="${admin.country.countryISO eq country.countryISO}">selected="selected"</c:if>>${country.countryName}</option>
									</c:forEach>
										<%-- <option value="${admin.fromCountryISO}-${admin.fromCountryName}">${admin.fromCountryName}</option> --%>
									</select>
								</td>
<!-- 								<td><button type="button" class="btn btn-default" onclick="document.getElementById('id01').style.display='block'" >Click</button></td> -->
							</tr>
							 <tr>
								<td>Time zone</td>
								<td>
									<select class="form-control" id="timeZone" name="timeZone">
										<option value='${admin.zone.zoneName}'>${admin.zone.zoneName}</option>
									</select>
									
								</td>
<!-- 								<td><button type="button" class="btn btn-default" onclick="document.getElementById('id01').style.display='block'" >Click</button></td> -->
							</tr>
						 <input type="hidden" name="adminToCountries" id="adminToCountries" value="${admin.businessCountries}"> 
							<tr>
								<td>To Country</td>
								<td>
									<div class="col-md-4 col-lg-4">
									<select class="form-control" size="15" style="width: 150px;height:182px !important;" id="Place" name="Place" >
										<%-- <option value="${admin.country.countryISO}-${admin.fromCountryName}">${admin.fromCountryName}</option> --%>
										<c:forEach var="country" items="${countriesList}">
											<c:if test="${!fn:contains(admin.businessCountries,country.countryName)}">
												<option value="${country.countryISO}-${country.countryName}">${country.countryName }</option>
											</c:if>
										</c:forEach>
									</select>
									</div>
									<div class="col-md-4 col-lg-4">
										<button type="button" class="btn btn-success" id="addBtn" onclick="moveoutid('Place','toCountrys','toCountrys','toCountryDetails');">add >></button>
										<button type="button" class="btn btn-danger" id="removeBtn" onclick="moveoutid('toCountrys','Place','toCountrys','toCountryDetails');"><< remove </button>
									</div>
									<div class="col-md-4 col-lg-4" >
									<%--  <c:set var="toCountryISOs" value="${fn:split(admin.country.countryISO, ',')}"/>
									 
									<c:set var="toCountryNames" value="${fn:split(admin.businessCountries, ',')}"/>
									
								 <select class="form-control" size="15" style="width: 150px;height:182px !important;" id="toCountrys" name="toCountrys" >
									<c:forEach items="${toCountryISOs}" begin="0" end="${fn:length(toCountryISOs)}" varStatus="toc">
									
										<option value="${toCountryISOs[toc.index]}-${toCountryNames[toc.index]}">${toCountryNames[toc.index]}</option>
									</c:forEach>
										
									</select>  --%> 
									  <select class="form-control" size="15" style="width: 150px;height:182px !important;" id="toCountrys" name="toCountrys" >
									<c:forEach var="country" items="${countriesList}">
											<c:if test="${fn:contains(admin.businessCountries,country.countryName)}">
												<option value="${country.countryISO}-${country.countryName}">${country.countryName }</option>
											</c:if>
										</c:forEach>
									</select> 
									</div>
								</td>
<!-- 								<td><button type="button" class="btn btn-default" onclick="document.getElementById('id02').style.display='block'">Click</button></td> -->
							</tr>
							
							<!-- <tr>
								<td colspan="3"><button type="button" class="btn btn-blue btn-submit">more countries</button></td>
							</tr> -->
						</table>
						<!-- <div class="col-lg-12 col-md-12">
							<h4 class="text-center"><span Style="color:red">NOTE:</span> To Update Countries and Currency, Please Contact SuperAdmin. </h4>
						</div> -->
					</div>
					<!-- COUNTRY AND CURRENY POP-UP START HERE-->
<!-- 						<div id="id01" class="w3-modal"> -->
<!-- 						    <div class="w3-modal-content w3-animate-zoom w3-card-4"> -->
<!-- 						      <header class="w3-container bg-lightgray">  -->
<!-- 						        <span onclick="document.getElementById('id01').style.display='none'"  -->
<!-- 						        class="w3-button w3-display-topright">&times;</span> -->
<!-- 						        <h2 class="text-center text-white">Countries and currency</h2> -->
<!-- 						      </header> -->
<!-- 						      <div class="w3-container"> -->
<!-- 						        <p class="text-center">Some text..</p> -->
<!-- 						        <p class="text-center">Some text..</p> -->
<!-- 						      </div> -->
<!-- 						      <footer class="w3-container bg-lightgray"> -->
<!-- 						        <p class="text-center text-white">Modal Footer</p> -->
<!-- 						      </footer> -->
<!-- 						    </div> -->
<!-- 						  </div> -->
						  
						  
<!-- 						  <div id="id02" class="w3-modal"> -->
<!-- 						    <div class="w3-modal-content w3-animate-zoom w3-card-4"> -->
<!-- 						      <header class="w3-container bg-lightgray">  -->
<!-- 						        <span onclick="document.getElementById('id02').style.display='none'"  -->
<!-- 						        class="w3-button w3-display-topright">&times;</span> -->
<!-- 						        <h2 class="text-center text-white">Countries and currency</h2> -->
<!-- 						      </header> -->
<!-- 						      <div class="w3-container"> -->
<!-- 						        <p class="text-center">Some text..</p> -->
<!-- 						        <p class="text-center">Some text..</p> -->
<!-- 						      </div> -->
<!-- 						      <footer class="w3-container bg-lightgray"> -->
<!-- 						        <p class="text-center text-white">Modal Footer</p> -->
<!-- 						      </footer> -->
<!-- 						    </div> -->
<!-- 						  </div> -->
					<!-- COUNTRY AND CURRENY POP-UP END HERE-->
					<!-- AGENTS TABLE -->
					
					<!-- ID PROOF TABLE -->
					<%-- <div class="IDPROOF" id="IDPROOF" >
						<table class="table table-hover table-striped table-bordered">
							<tr class="bg-lightgray text-white">
								<th colspan="2">ID PROOF</th>
							</tr>
							<tr>
								<td><input type="radio"  id="idOptional" name="customerIdProof" value="no" <c:if test="${admin.custFirstIdTypes ne null and admin.custFirstIdTypes eq '' }"> checked</c:if>/>&nbsp;&nbsp;&nbsp;Customer ID Proof Optional </td>
								<td><input type="radio" id="idRequired" name="customerIdProof" value="yes" <c:if test="${admin.custFirstIdTypes ne null and admin.custFirstIdTypes ne '' }"> checked</c:if>/>&nbsp;&nbsp;&nbsp;I would like to take ID proof</td>
							</tr>
							<tr id="idFlag">	
								<td colspan="2" >
									<input type="checkbox" name="custFirstIdFlag" id="custFirstIdFlag" <c:if test="${admin.custFirstIdTypes ne null and admin.custFirstIdTypes ne '' }"> checked</c:if>/>&nbsp;&nbsp;&nbsp;First ID proof&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
									<input type="checkbox" name="custSecondIdFlag" id="custSecondIdFlag" <c:if test="${admin.custSecondIdTypes ne null and admin.custSecondIdTypes ne '' }"> checked</c:if>/>&nbsp;&nbsp;&nbsp;Second ID proof      
								</td>
								
							</tr>
							<tr id="firstIds">
								<td>First ID Proof:</td>
								<td id="firstIdProofs">
								
								<c:forEach items="${idProofslist}" var="mySplit">
								<c:if test="${idProofs.idProofFlag eq 'firstId'}">
   								<input type="checkbox" name="firstId" value="${mySplit}"  checked/>&nbsp;&nbsp;&nbsp;${mySplit}&nbsp;&nbsp;&nbsp;
   								</c:if>
								</c:forEach>
								
								<c:forEach items="${idProofslist}" var="idProofs">
									<c:if test="${idProofs.idProofFlag eq 'firstId'}">
											<input type="checkbox" name="firstId"  value="${idProofs.idProofType}" <c:if test="${fn:contains(admin.custFirstIdTypes,idProofs.idProofType)}"> checked</c:if>/>&nbsp;&nbsp;&nbsp;${idProofs.idProofType}&nbsp;&nbsp;&nbsp;
									</c:if>
								</c:forEach>
								
								<c:forEach items="${idProofslist}" var="idProofs">
									<c:if test="${idProofs.idProofFlag eq 'firstId'}">
											<input type="checkbox" name="firstId"  value="${idProofs.idProofType}" <c:if test="${fn:contains(admin.custFirstIdTypes,idProofs.idProofType) }"> checked="checked"</c:if>/>&nbsp;&nbsp;&nbsp;${idProofs.idProofType}&nbsp;&nbsp;&nbsp;
									</c:if>
								</c:forEach>
								
								
								
								
								<!-- <input type="checkbox" />&nbsp;&nbsp;&nbsp;Driving License&nbsp;&nbsp;&nbsp;
								<input type="checkbox" />&nbsp;&nbsp;&nbsp;Voter ID -->
								</td>
								
							</tr>
							<tr id="secondIds">
								<td>Second ID Proof:</td>
								<td id="secondIdProofs">
								<c:forTokens items="${admin.custSecondIdTypes}" delims="," var="mySplit">
   								<input type="checkbox" name="secondId" value="${mySplit}"  checked/>&nbsp;&nbsp;&nbsp;${mySplit}&nbsp;&nbsp;&nbsp;
								</c:forTokens>
								
								<c:forEach items="${idProofslist}" var="idProofs">
									<c:if test="${idProofs.idProofFlag eq 'secondId'}">
										<input type="checkbox" name="secondId" value="${idProofs.idProofType}" <c:if test="${fn:contains(admin.custSecondIdTypes,idProofs.idProofType) }"> checked="checked"</c:if>/>&nbsp;&nbsp;&nbsp;${idProofs.idProofType}&nbsp;&nbsp;&nbsp;
									</c:if>
								</c:forEach>
								
								</td>
							</tr>
						</table>
					</div> --%>
						<!-- PAYMENTS TABLE -->
					<div class="payments" id="payments">
						<table class="table table-striped table-hover table-bordered">
							<tr class="bg-lightgray text-white">
								<th colspan="3">PAYMENTS</th>
							</tr>
							<tr>
								<td>Mode of payments which i would like to take from the customer:</td>
								<td id="mop">
									
									
									 
   								<%-- <input type="checkbox" name="mop" value="${mySplit}"  checked/>&nbsp;&nbsp;&nbsp;${mySplit}&nbsp;&nbsp;&nbsp; --%>
								
									
									<%--  <c:set var="count" value="1"></c:set>
									 
										<c:forEach items="${modeofpayment}" var="modeOfPayments">
										<c:out value="${modeOfPayments.modeOfPayment}"></c:out>
										</c:forEach>
										<c:forTokens items="${admin.modeOfPayments}" delims="," var="mySplit">
										<c:set var="newstring" value=""></c:set>
										<c:forTokens items="${mySplit}" delims="-" var="mySplit1">
										<c:out value="her from ${mySplit1}"></c:out> 
										<c:set var ="newstring" value="${newstring+','+mySplit1}"></c:set>
										<c:out value="${newstring}"></c:out>
										<c:set var="i" value="${i+1}"></c:set>
							<c:out value="${mySplit}"></c:out>
										</c:forTokens>
										
										
										<c:forEach items="${modeofpayment}" var="modeOfPayments">
										<c:forTokens items="${admin.modeOfPayments}" delims="," var="mySplit">
										
										 <c:if test="${mySplit eq modeOfPayments }"></c:if>
										 
										<input type="checkbox" name="mop" value="${modeOfPayments.modeOfPayment}"  checked="checked"/>&nbsp;&nbsp;&nbsp;${modeOfPayments.modeOfPayment}&nbsp;&nbsp;&nbsp;		
			
									</c:forTokens> 
									
						<input type="checkbox" name="mop" value="${modeOfPayments.modeOfPayment}"  checked="checked"/>&nbsp;&nbsp;&nbsp;${modeOfPayments.modeOfPayment}&nbsp;&nbsp;&nbsp;
									
									 </c:forEach>
									 --%>
									 <c:forEach items="${modeofpayment}" var="modeOfPayments">
										<input type="checkbox" name="modeOfPayments" value="${modeOfPayments.modeOfPayment}" <c:if test="${fn:contains(admin.modeOfPayments,modeOfPayments.modeOfPayment) }"> checked="checked"</c:if>/>&nbsp;&nbsp;&nbsp;${modeOfPayments.modeOfPayment}&nbsp;&nbsp;&nbsp;		
									</c:forEach> 
								
								</td>
							</tr>
							<tr>
								<td id="payType">Payment types which i would like to give to the receiver:</td>
								<td>
									
								 <%-- <c:forEach items="${paymenttype}" var="paymentTypes">
								 <c:forTokens items="${admin.paymentTypes}" delims="," var="mySplit">
								 
								 <c:if test="${paymentTypes.paymentType eq mySplit}">
   								<input type="checkbox" name="payType" value="${paymentTypes.paymentType}"  checked/>&nbsp;&nbsp;&nbsp;${paymentTypes.paymentType}&nbsp;&nbsp;&nbsp;
								
								</c:if>
								</c:forTokens> 
								<c:if test="${count eq 1 }">
										<input type="checkbox" name="payType" value="${paymentTypes.paymentType}" />&nbsp;&nbsp;&nbsp;${paymentTypes.paymentType}&nbsp;&nbsp;&nbsp;		
									
									</c:if>
									</c:forEach>  --%>
		
									<%-- <c:forEach items="${paymenttype}" var="paymentTypes">
									
									
									<c:if test="${bpaymenttypes.paymentType.paymentTypeId eq paymentTypes.paymentTypeId}">
										<input type="checkbox" name="payType" value="${paymentTypes.paymentTypeId}" checked/>&nbsp;&nbsp;&nbsp;${paymentTypes.paymentTypeId}&nbsp;&nbsp;&nbsp;		
									</c:if>
									</c:forEach>
									</c:forEach> --%>
								<c:forEach items="${paymenttype}" var="paymenttypes">
										<input type="checkbox" name="paymentTypes" value="${paymenttypes.paymentType}" <c:if test="${fn:contains(admin.paymentTypes,paymenttypes.paymentType) }"> checked="checked"</c:if>/>&nbsp;&nbsp;&nbsp;${paymenttypes.paymentType}&nbsp;&nbsp;&nbsp;		
									</c:forEach>
								</td>
							</tr>
							
						</table>
					</div>
					<div class="transactions" id="transactions">
						<table class="table table-striped table-hover table-bordered">
							<tr class="bg-lightgray text-white">
								<th colspan="3">Admin Status</th>
							</tr>
							<!-- <tr>
								<td><input type="radio" name="r1"/>&nbsp;&nbsp;&nbsp;Default Transaction ID Prefix</td>
								<td><input type="radio" name="r1"/>&nbsp;&nbsp;&nbsp;I would like to give Transaction ID Prefix</td>
								
							</tr> -->
							
						 <tr>	
								<td><input type="radio" id="adminStatus" name="adminStatus" value="active" ${admin.adminStatus=='active'?'checked':''}>Active
								<input type="radio"  id="adminStatus" name="adminStatus" value="inactive" ${admin.adminStatus=='inactive'?'checked':''}>InActive
								</td>
								
							</tr> 
							<%-- <tr>
								<td>Transaction confirmation to the customer by</td>
								<td><input type="checkbox" name="conformation" id="sendSms" onchange="document.getElementById('id03').style.display='block'" <c:if test="${admin.sendSms eq 'YES'}"> checked</c:if>/>&nbsp;&nbsp;&nbsp;Send SMS &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" name="conformation" id="sendEmail" <c:if test="${admin.sendEmail eq 'YES'}"> checked</c:if>/>&nbsp;&nbsp;&nbsp;Send Email</td>
							</tr> --%>
							
						</table>
						<!-- <div class="col-lg-12 col-md-12">
							<h4 class="text-center"><span Style="color:red">NOTE:</span> To Update Transaction ID Prefix, Please Contact SuperAdmin. </h4>
						</div> -->
					</div>
					<!-- TRANSACTIONS TABLE -->
					<div class="transactions" id="transactions">
						<table class="table table-striped table-hover table-bordered">
							<tr class="bg-lightgray text-white">
								<th colspan="3">TRANSACTIONS</th>
							</tr>
							<!-- <tr>
								<td><input type="radio" name="r1"/>&nbsp;&nbsp;&nbsp;Default Transaction ID Prefix</td>
								<td><input type="radio" name="r1"/>&nbsp;&nbsp;&nbsp;I would like to give Transaction ID Prefix</td>
								
							</tr> -->
							
						 <tr>	
								<td>Transaction ID Prefix:</td>
								<td>
									<input type="text" name="transactionPrefix" id="tnxIDPrefix" value="${admin.transactionPrefix}" maxlength="3" class="form-control" placeholder="Enter Three Letters Prefix" <c:if test="${superAdminId eq null or superAdminId eq ''}"> readonly</c:if>/>
									<span id="tnxIDPrefixSpan1" style="color: red;display: none;">Transaction ID Prefix should contain Three letter</span>
									<span id="tnxIDPrefixSpan2" style="color: red;display: none;">This Transaction ID Prefix is already Registered, Please Try Another</span>
								</td>
							</tr> 
							<%-- <tr>
								<td>Transaction confirmation to the customer by</td>
								<td><input type="checkbox" name="conformation" id="sendSms" onchange="document.getElementById('id03').style.display='block'" <c:if test="${admin.sendSms eq 'YES'}"> checked</c:if>/>&nbsp;&nbsp;&nbsp;Send SMS &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" name="conformation" id="sendEmail" <c:if test="${admin.sendEmail eq 'YES'}"> checked</c:if>/>&nbsp;&nbsp;&nbsp;Send Email</td>
							</tr> --%>
							
						</table>
						<!-- <div class="col-lg-12 col-md-12">
							<h4 class="text-center"><span Style="color:red">NOTE:</span> To Update Transaction ID Prefix, Please Contact SuperAdmin. </h4>
						</div> -->
					</div>
					<%-- <div class="features" id="features" >
						<table class="table table-striped table-hover table-bordered">
							<tr class="bg-lightgray text-white">
								<th colspan="3">FEATURES</th>
							</tr>
							<tr>
								<td>Agent Type:</td>
								
								<td><input type="checkbox" name="agent" value="Branch" id="Branch" <c:if test="${fn:contains(admin.agentTypes,'Branch') }"> checked</c:if>/>&nbsp;Remit Agent(branch)&nbsp;&nbsp;<input type="checkbox" name="agent" value="Agent" id="Agent" <c:if test="${fn:contains(admin.agentTypes,'agent')}"> checked</c:if>/>&nbsp;Agent</td>
								
							</tr>
							
							<tr>	
								
								<td>
									<input type="checkbox" name="ipSecurity" id="ipSecurity" <c:if test="${admin.ipSecurity eq 'YES'}"> checked</c:if>/>&nbsp;IP Security
								</td>
								<td class="w-450">
								 <input type="checkbox" name="passwordExpiryFlag" id="passwordExpiryFlag" <c:if test="${admin.passwordExpiryDuration ne ''}"> checked</c:if>/>&nbsp;Password Expire
								 	<input type="text" class="form-control mt-10" placeholder="Password Expiry Duration" style="width:215px;margin-left:115px;<c:if test="${admin.passwordExpiryDuration ne ''}">display: none;</c:if>" id="passwordExpiryDuration" name="passwordExpiryDuration" value="${admin.passwordExpiryDuration}" onkeypress="return onlyNumber(event)"/>
								</td>
							</tr>
							
							
						</table>
					</div> --%>
					<%-- <div class="features" id="limitations" >
						<table class="table table-striped table-hover table-bordered">
							<tr class="bg-lightgray text-white">
								<th colspan="5">Admin Limitations</th>
							</tr>
							<tr>	
								<td>
									Customers Limit :
								</td>
								<td>
									<input type="text" id="cLPAdmin" class="form-control" name="cLPAdmin" value="${admin.cLPAdmin}" onkeypress="return onlyNumber(event)">
								</td>
								<td>
									Receiving Countries Limit :
								</td>
								<td>
									<input type="text" id="toCountryLimit" class="form-control" name="toCountryLimit" value="${admin.toCountryLimitPerAdmin}" onkeypress="return onlyNumber(event)"onkeypress="return onlyNumber(event)">
								</td>
							</tr>
							<tr>	
								<td>
									Transactions Limit per Month :
								</td>
								<td>
									<input type="text" id="tLPAdminPerMonth" class="form-control" name="tLPAdminPerMonth" value="${admin.tLPAdminPerMonth}" onkeypress="return onlyNumber(event)">
								</td>
								<td>
									Transaction Amount Limit per month :
								</td>
								<td>
									<input type="text" id="tALPAdminPerMonth" class="form-control" name="tALPAdminPerMonth" value="${admin.tALPAdminPerMonth}" onkeypress="return onlyNumber(event)">
								</td>
							</tr>
							<tr>	
								<td>
									RemitAgents Limit :
								</td>
								<td>
									<input type="text" id="rALPAdmin" class="form-control" name="rALPAdmin" value="${admin.rALPAdmin}" onkeypress="return onlyNumber(event)">
								</td>
								<td>
									Delivery Agents Limit :
								</td>
								<td>
									<input type="text" id="dALPAdmin" class="form-control" name="dALPAdmin" value="${admin.dALPAdmin}" onkeypress="return onlyNumber(event)">
								</td>
							</tr>
						</table>
					</div> --%>
					<div class="features" id="package" >
						<table class="table table-striped table-hover table-bordered">
							<tr class="bg-lightgray text-white">
								<th colspan="5">PACKAGE DETAILS</th>
							</tr>
							<tr>
								<td>
									Package Type :
								</td>	
								<td>
									<input type="text" id="packageType" class="form-control" name="packages" value="${admin.packages}">  
								</td>
								<td>
									Package Expiry Date :
								</td>	
							 <td>
								<%-- <c:set var="pkgExpiryDate" value="${fn:split(admin.packageExpireDate,' ')}"/>
									<input type="text" id="packageExpiryDate" class="form-control" name="packageExpiryDate" value="${pkgExpiryDate[0]}" readonly="readonly">   --%>
								
									<input type="text" id="packageExpiryDate" class="form-control" name="packageExpiryDate" value="${admin.packageExpireDate}"> <!-- readonly="readonly" -->  
								
								</td>
								
								</tr>
								<tr>
								<%-- <td>
									Role Over Months :
								</td>
								<td>
									<input type="text" id="roleOverMonths" class="form-control" name="roleOverMonths" value="${admin.roleOverMonths }" onkeypress="return onlyNumber(event)"> 
								</td> --%>
							</tr>
							
							
						</table>
					</div>
					<div class="buttons">
						<table class="table">
							<tr>
								<td>
									<!-- <button type="button" class="btn btn-blue btn-submit" id="backBtn" style="display: none;">Back</button> -->
									<button type="button" class="btn btn-blue btn-submit center-block" onclick="" id="updateBtn"><i class="fa fa-upload"></i>&nbsp;Update</button>
									<!-- <button type="button" class="btn btn-blue btn-submit" id="confirmBtn" style="display: none;">Confirm</button> -->
								</td>
							</tr>
						</table>
					</div>
					<!-- COUNTRY AND CURRENY POP-UP START HERE-->
						<div id="id03" class="w3-modal" >
						    <div class="w3-modal-content w3-animate-zoom w3-card-4">
						      <header class="w3-container bg-lightgray"> 
						        <span onclick="document.getElementById('id03').style.display='none'" 
						        class="w3-button w3-display-topright">&times;</span>
						        <h2 class="text-center text-white">Countries and currency</h2>
						      </header>
						      <div class="w3-container">
						        <p class="text-center">Some text..</p>
						        <p class="text-center">Some text..</p>
						      </div>
						      <footer class="w3-container bg-lightgray">
						        <p class="text-center text-white">Modal Footer</p>
						      </footer>
						    </div>
						  </div>
				</form>
			</div>
		</div>
	</div>
</div>





</body>
</html>