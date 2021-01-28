<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
				
 .ner{
  background-color:#0c036c;
  color: white;
  cursor: pointer;
  padding-bottom:-15px;
  font-size:12px;
  padding-top:5px;
  
 }
.accordion {
  background-color:#0c036c;
  color: white;
  cursor: pointer;
 
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
  
}
#more {display: none;}
#moree {display: none;}
#moreen {display: none;}
#moreen1 {display: none;}
.active, .accordion:hover {
  background-color: #0c036c; 
}
#moree1 {display: none;}

.panel {
  padding: 0 18px;
  display: none;
  background-color: white;
  overflow: hidden;
}
#moree12{
display: none;}
</style>
  </head>
<script type="text/javascript">
	$(document).ready(function (){
		$('#submitBtn').click(function (){
	  var firstName=$('#firstName').val();
	  
	  var lastName=$('#lastName').val();
	  
	  var userName=$('#userName').val();
	  
	  var password=$('#password').val();
	  
	  var language=$('#language').val();
	  
	  var createDeliveryBank=$('#createDeliveryBank').val();
	  
	  var status=$('#status').val();
	  
	  var userAccountLocked=$('#userAccountLocked').val();
	  
	  var isThisAnActualBank=$('#isThisAnActualBank').val();
	  
	  var fullBankName=$('#fullBankName').val();
	  
	  var abbrevName=$('#abbrevName').val();
	  
	  var bankCode=$('#bankCode').val();
	  
	  var address1=$('#address1').val();
	  
	  var emailAddress=$('#emailAddress').val();
	  

	  
	  
	  if(firstName==""){
			
			$('#firstName').focus().css('outline','solid red 2px');
			return false;
	  }
	  
	  if(lastName==""){
			
			$('#lastName').focus().css('outline','solid red 2px');
			return false;
	  }
	  
	  if(userName==""){
			
			$('#userName').focus().css('outline','solid red 2px');
			return false;
	  }
	  
	  if(password==""){
			
			$('#password').focus().css('outline','solid red 2px');
			return false;
	  }
	  
	  if(password==""){
			$('#password').focus().css('outline','solid red 2px');
			return false;
	  }
	  
	  if($.trim(createDeliveryBank)==""){
			$('#createDeliveryBank').focus().css('outline','solid red 2px');
			return false;
	  }
	  
	  if(status==""){
			$('#status').focus().css('outline','solid red 2px');
			return false;
	  }
	  
	  if(userAccountLocked==""){
			$('#userAccountLocked').focus().css('outline','solid red 2px');
			return false;
	  }
	  
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

	   $('#submitForm').submit();

  });
	});
  </script>

<body>
<%@include file ="headerNew.jsp" %>  
<form action="insertprocess" method="post" id="submitForm">
<div class="container">
<br><br>
<div class="row">
<div class="col-md-12">
<h4 style="background: #2e287b;color:white;padding:5px;text-align:center;font-size:20px;">Add Processing Bank</h4>
<p>A Processing Bank is a settlement bank in a destination country. It is possible to have multiple Processing Banks in the same country. Transactions are assigned by Admin to Processing Banks for delivery.</p>
<h5 style="background: #2e287b;color:white;padding:5px;text-align:center;font-size:15px;">USER DETAILS</h5>
<div class="row form-group">

<div class="col-md-3">
<label>First name *</label>
</div>
<div class="col-md-4">
<input type="text" name="firstName" id="firstName" class="form-control">
</div>
</div>

<div class="row form-group">

<div class="col-md-3">
<label>Last Name *</label>
</div>
<div class="col-md-4">
<input type="text" name="lastName" id="lastName" class="form-control">
</div>
</div>

<div class="row form-group">

<div class="col-md-3">
<label>User Name*</label>
</div>
<div class="col-md-4">
<input type="text" name="userName" id="userName" class="form-control">
</div>
</div>


<div class="row form-group">

<div class="col-md-3">
<label>Password *</label>
</div>
<div class="col-md-4">
<input type="text" name="password" id="password" class="form-control">
</div>
</div>



<div class="row form-group">

<div class="col-md-3">
<label>Language *</label>
</div>
<div class="col-md-4">
<select id="language" name="language" class="form-control">
<option value="">--Select--</option>
<option value="english">English</option>
<option value="telugu">Telugu</option>
<option value="hindi">Hindi</option>
<option value="tamil">Tamil</option>
</select>
</div>
</div>

<div class="row form-group">

<div class="col-md-3">
<label>Create Delivery Bank*</label>
</div>
<div class="col-md-4">
<select name="createDeliveryBank" id="createDeliveryBank" class="form-control">
<option value="yes">yes</option>
<option value="no">no</option>
</select>
</div>
</div>


<div class="row form-group">

<div class="col-md-3">
<label>Status*</label>
</div>
<div class="col-md-4">
<select name="status" id="status" class="form-control">
<option value="enabled">Enabled</option>
<option value="disabled">Disabled</option>
</select>
</div>
</div>

<div class="row form-group">
<div class="col-md-3 ">
<label>User Account Locked *</label>
</div>
<div class="col-md-4">
<select name="userAccountLocked" id="userAccountLocked" class="form-control">
<option value="no">No</option>
<option value="yes">Yes</option>
</select>
</div>
</div>


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
</div>
<br>
<div class="row">
<div class="col-md-12">
<h5 style="background: #2e287b;color:white;padding:5px;text-align:center;font-size:15px;">Contact Details</h5>
<br>
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
</div>
</div>


<div class="row form-group">

<div class="col-md-3">
<label>Status </label>
</div>
<div class="col-md-4">
<input type="text" name="status1" id="status1" class="form-control">
</div>
</div>

<div class="row form-group">
<div class="col-md-3 ">
<label>Country  *</label>
</div>
<div class="col-md-4">
<select name="country" id="country" class="form-control">
<c:forEach items="${list}" var="list">
<option value="${list.branchId}">${list.fromCountry.countryName}</option>
</c:forEach>
</select>
</div>
</div>


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
					<option value="${list.fromCountry.dalingCode}">${list.fromCountry.dalingCode}</option>
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
					<option value="${list.fromCountry.dalingCode}">${list.fromCountry.dalingCode}</option>
					</c:forEach>
					</select>
					</div>
					<div class="col-md-3 ">
						<input type="text" class="form-control" name="faxNumber" id="faxNumber" placeholder="Fax Number *" maxlength="15" onkeyup="removeError('mobileNo');">
					</div>
					</div>

</div>


</div>
</div><br>
<div class="row">
<div class="col-md-12">
<h5 style="background: #2e287b;color:white;padding:5px;text-align:center;font-size:15px;">Other Details</h5>
<br>
<div class="row form-group"">
<div class="col-md-3">
<label>Parent Super Bank</label>
</div>
<div class="col-md-4">
<input type="text" name="parentSuperBank" id="parentSuperBank" value="None" class="form-control">
</div>
</div>


<div class="row form-group"">
<div class="col-md-3">
<label>Credit Log Currency</label>
</div>
<div class="col-md-4">
<select name="creditLogCurrency" id="creditLogCurrency" class="form-control">
<option value="default">Default</option>
<c:forEach items="${list}" var="list">
<option value="${list.fromCountry.countryISO}">${list.fromCountry.countryISO}</option>
</c:forEach>
</select>

</div>
</div>

<div class="row form-group"">
<div class="col-md-3">
<label>Charge Slab Amount Type</label>
</div>
<div class="col-md-4">
<select name="chargeSlabAmountType" id="chargeSlabAmountType" class="form-control">
<option value="destination">Destination</option>
<option value="source">Source</option>
</select>
</div>
</div>

<div class="row form-group"">
<div class="col-md-3">
<label>Require Benef. DoB for Payout Amount greater than</label>
</div>
<div class="col-md-4">
<input type="text" name="requireBenefDobForPayoutAmountGreaterThen" id="requireBenefDobForPayoutAmountGreaterThen" class="form-control">
<p>(Zero/blank indicates never require Benef DoB)</p>
</div>
</div>
<div class="row form-group">
<div class="col-md-3">
<label>Max Negative Credit Limit</label>
</div>
<div class="col-md-4">

<input type="text" name="maxNegativeCreditLimit" id="maxNegativeCreditLimit" class="form-control">
<input type="checkbox" name="enforceLimit" id="enforceLimit" value="yes">Enforce Limit
</div>
</div>
<div class="row form-group"">
<div class="col-md-3">
<label>View unprocessed Cash Collection Transactions</label>
</div>
<div class="col-md-4">

<input type="checkbox" name="viewUnprocessedCashCollectionTransactions" value="yes" id="viewUnprocessedCashCollectionTransactions">(If unchecked the user can only view CC transactions at payout
<p>(If unchecked the user can only view CC transactions at payout)</p>
</div>
</div>
<div class="row form-group">
<div class="col-md-3">
<label>Can Set Own Buy Rate</label>
</div>
<div class="col-md-4">

<select name="canSetOwnBuyRate" id="canSetOwnBuyRate" class="form-control">
<option value="no">No</option>
<option value="yes">Yes</option>
</select>
</div>
</div>


<div class="row form-group">
<div class="col-md-3">
<label>Synchronise Dest. Conversion Rate To Buy Rate</label>
</div>
<div class="col-md-4">

<select name="synchroniseDestConversionRateToBuyRate" id="synchroniseDestConversionRateToBuyRate" class="form-control">
<option value="no">No</option>
<option value="yes">Yes</option>
</select>(This will only apply if the bank is not using a Rolling Purchase Rate)
</div>
</div>

<div class="row form-group">
<div class="col-md-3">
<label>Use Bank Buy Rates as Sell Rates</label>
</div>
<div class="col-md-4">

<input type="checkbox" name="useBankBuyRatesAsSellRates" value="yes" id="useBankBuyRatesAsSellRates">
</div>
</div>

<div class="row " style="">

<!-- <div class="col-md-7">
<div class="row "  >
<div class="col-md-1 ner">
<p onclick="myyFunction()" id="myBtn" style="">[+]</p></div>
<div class="col-md-11 ner"><p>DELIVERY B
ANK SEARCH RESTRICTIONS</p></div>
</div><br>
<div class="container">
<div class="row">
<div class="col-md-7">
<span id="dots"></span>
<span  id="more">You can restrict the Processing Bank to only process transactions sent to certain Delivery Banks by checking them on the list below.
Additionally, you can add minimum and maximum amounts, to only allow the Processing Bank to process transactions by the amount set, for the given delivery bank.
Leaving them all blank will mean no restrictions are applied.
The amount restrictions are in the Processing Banks delivery currency
<br><br>
<div class="row">

<div class="col-md-3">
<p>Delivery bank</p>
<div class="form-inline">
<input type="checkbox">&nbsp Select/Unselect All
</div>
</div>
</div><br>


<div class="row">
<div class="col-md-4">
<p>Bank Name</p>
</div>
<div class="col-md-4">
<p>Minimum Restricted Amount</p>
</div>
<div class="col-md-4">
<p>Maximum Restricted Amount</p>
</div>
</div>

<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>Any Payout XPRESSMONEY-GB (XPRESSMONEYGB)</small>
</div>
<div class="col-md-4 form-inline">
<input type="text" class="form-control">
</div>
<div class="col-md-4 form-inline">
<input type="text" class="form-control">
</div>
</div>

<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>JAPAN BANK LTD (XPRESSMONEYGB)</small>
</div>
<div class="col-md-4 form-inline">
<input type="text" class="form-control">
</div>
<div class="col-md-4 form-inline">
<input type="text" class="form-control">
</div>
</div>


</span>
</div>
</div>
</div><br>
<div class="row "  >
<div class="col-md-1 ner">
<p onclick="myFunction()" id="myBtnn" style="">[+]</p></div>
<div class="col-md-11 ner"><p>SOURCE COUNTRY SEARCH RESTRICTIONS</p></div>
</div><br>
<div class="container">
<div class="row">
<div class="col-md-7">
<span id="dotss"></span>
<span  id="moree">Check a Source Country below, to restrict this Processing Bank to processing transactions from the selected country/countries only.
<br><br>
<div class="row">

<div class="col-md-3">
<p>Source country:</p>
<div class="form-inline">
<input type="checkbox">&nbsp Select/Unselect All
</div>
</div>
</div><br>



<div class="row">
<div class="col-md-4">
<p>Name</p>
</div>
<div class="col-md-4">
</div>
<div class="col-md-4">
</div>
</div>

<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>Australia (AU)</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>Netherlands (NL)</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>

<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>United Kingdom (GB)</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>


</span>
</div>
</div>
</div><br>

<div class="row"  >
<div class="col-md-1 ner">
<p onclick="my1Function()" id="myBtnn1" style="">[+]</p></div>
<div class="col-md-11 ner"><p>SERVICE LEVEL SEARCH RESTRICTIONS</p></div>
</div><br>
<div class="container">
<div class="row">
<div class="col-md-7">
<span id="dotss1"></span>
<span  id="moree1">Check a Source Country below, to restrict this Processing Bank to processing transactions from the selected country/countries only.
<br><br>
<div class="row">

<div class="col-md-3">
<p>Source country:</p>
<div class="form-inline">
<input type="checkbox">&nbsp Select/Unselect All
</div>
</div>
</div><br>
<div class="row">
<div class="col-md-4">
<p>Name</p>
</div>
<div class="col-md-4">
</div>
<div class="col-md-4">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<label><input type="checkbox"> Instant (instant)</label>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>

<div class="row form-group">
<div class="col-md-4 form-inline">
<label><input type="checkbox"> Next Day (nextday)</label>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>

<div class="row form-group">
<div class="col-md-4 form-inline">
<label><input type="checkbox">  5 Days (fivedays)</label>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>


</span>
</div>
</div>
</div><br>

<div class="row "  >
<div class="col-md-1 ner">
<p onclick="mynFunction()" id="myBtnnn" style="">[+]</p></div>
<div class="col-md-11 ner"><p>EXPORT FILE TYPES</p></div>
</div><br>
<div class="container">
<div class="row">
<div class="col-md-7">
<span id="dotssn"></span>
<span  id="moreen">


<div class="row">
<div class="col-md-4">
<p>Default Format</p>
</div>
<div class="col-md-4">
</div>
<div class="col-md-4">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>ADIB</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>BD BANKASIA</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>

<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>BD BRAC</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>BD PUBALI</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>BD BURO</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>ALLIED</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>AXIS</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>DBBL</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>GMR BRAC</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small> HABIB</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>ICICI</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>IMPS</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small> INDUS</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>JAMAICA</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>JANATA</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>KHOL BANK</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small> METROBANK</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>JANATA</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>NP NIBL</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>PH UNIONBANK CARD</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<input type="checkbox"><small>JANATA</small>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<label><input type="checkbox" id="gh">PING MONEY ECO BANK</label>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<label><input type="checkbox" id="gh">REALTRANSFER</label>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<label><input type="checkbox" id="gh">RCBC</label>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<label><input type="checkbox" id="gh"> UBL</label>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>
<div class="row form-group">
<div class="col-md-4 form-inline">
<label><input type="checkbox" id="gh"> WALLSTREET</label>
</div>
<div class="col-md-4 form-inline">
</div>
<div class="col-md-4 form-inline">
</div>
</div>



</span>
</div>
</div>
</div>
<div class="row"  >
<div class="col-md-1 ner">
<p onclick="my123Function()" id="myBt" style="">[+]</p></div>
<div class="col-md-11 ner"><p>PAYOUT TRANSACTION REFS</p></div>
</div><br>
<div class="container">
<div class="row">
<div class="col-md-7">
<span id="dotss12"></span>
<span  id="moree12">
<small>You have not set up this feature for this Processing Bank. Please see configuration CONFIG_PAYOUT_TRANS_REFS
</small>
<br><br>





</span>
</div>
</div>
</div><br>
</div>
</div>






</div>
</div>
 -->
<div class="row form-group">
<div class="col-md-12">
<h5 style="background: #2e287b;color:white;padding:5px;text-align:center;font-size:15px;">IP ACCESS CONTROL</h5>
<div class="row">
<div class="col-md-3">
<label>Allowed IP Addresses</label>
</div>
<div class="col-md-4">
<input type="text" name="allowedIPAddresses" id="allowedIPAddresses" class="form-control">
	

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
<input type="text" name="startTime" id="startTime" class="form-control">
	
Format should be : HH:MM, using 24hr format, eg. 09:30 or 15:45.
If Start time is provided, End time must also be provided.
</div>
</div>
<div class="row form-group">
<div class="col-md-3">
<label>End time</label>
</div>
<div class="col-md-4">
<input type="text" name="endTime" id="endTime" class="form-control">
	Format should be : HH:MM, using 24hr format, eg. 09:30 or 15:45
</div>
</div>
<div class="row form-group">
<div class="col-md-3">
</div>
<div class="col-md-4">
  <button type="button" id="submitBtn" class="btn btn-primary waves-effect waves-light">Register</button>
</div>
</div>

</div>
</div>

<br>

<br>









</div>
</form>
</body>

<script>
function my123Function() {
  var dotss12 = document.getElementById("dotss12");
  var moreText13 = document.getElementById("moree12");
  var btnText13 = document.getElementById("myBt");

  if (dotss12.style.display === "none") {
    dotss12.style.display = "inline";
    moreText13.style.display = "none";
  } else {
    dotss12.style.display = "none";
    moreText13.style.display = "inline";
  }
}

</script>

<script>
function my1Function() {
  var dotss1 = document.getElementById("dotss1");
  var moreText11 = document.getElementById("moree1");
  var btnText11 = document.getElementById("myBtnn1");

  if (dotss1.style.display === "none") {
    dotss1.style.display = "inline";
    moreText11.style.display = "none";
  } else {
    dotss1.style.display = "none";
    moreText11.style.display = "inline";
  }
}

</script>
<script>
function myFunction() {
  var dotss = document.getElementById("dotss");
  var moreText1 = document.getElementById("moree");
  var btnText1 = document.getElementById("myBtnn");

  if (dotss.style.display === "none") {
    dotss.style.display = "inline";
    moreText1.style.display = "none";
  } else {
    dotss.style.display = "none";
    moreText1.style.display = "inline";
  }
}

</script>
<script>
function mynFunction() {
  var dotssn = document.getElementById("dotssn");
  var moreText2 = document.getElementById("moreen");
  var btnText2 = document.getElementById("myBtnnn");

  if (dotssn.style.display === "none") {
    dotssn.style.display = "inline";
    moreText2.style.display = "none";
  } else {
    dotssn.style.display = "none";
    moreText2.style.display = "inline";
  }
}

</script>
 <script>
function myyFunction() {
  var dots = document.getElementById("dots");
  var moreText = document.getElementById("more");
  var btnText = document.getElementById("myBtn");

  if (dots.style.display === "none") {
    dots.style.display = "inline";
    moreText.style.display = "none";
  } else {
    dots.style.display = "none";
    moreText.style.display = "inline";
  }
}

</script>
</html>