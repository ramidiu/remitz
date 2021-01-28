<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success</title>

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
	$('#progressbar').empty();
});
</script>
<style>
.all-done-content > h3 {
    color: white;
    margin-bottom: 20px;
}
</style>

<body>
 
 <%@include file="myacc_header.jsp" %>
<section id="main-wrapper"> 
<div class="all-done-content container text-center pt-5">
    <i class="fa fa-check-circle text-primary"></i>
    <h3 class="py-3">All done! Your money is on it's way to ${rCountry}</h3>
    <p>We'll let you know when we recieve the cleared funds from your bank.</p>
    
   <br>
   <br> 
   
      <c:if test="${idFlag eq 'no' }">
    <p>To complete this transaction, we need to identify you. </p><br>
    <button type="button" class="btn btn-primary my-5" onclick="openModel('${idType}')">Upload ID Now</button> <!-- <button type='button' class="btn btn-primary my-5"  onclick="submitForm('true','manual')">skip</button> -->
    </c:if>
 <a href="transactions" class="btn btn-primary my-5">Go to My Account</a>
  </div><!-- /.container ENDs -->
  
</section><!--/#main-wrapper ENDs-->

<form action="uploadidproofimageforuploadlater" id="form" method="post" enctype="multipart/form-data">
<input type="hidden" name="custId" value="${customerId}">
<input type="hidden" name="idUploadLaterFlag" id="idUploadLaterFlag"/>
  			<div class="modal" id="international_myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
         <label for="idType" id="pid"></label>
         <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        
        </div>
      <div class="modal-body">
        <p>We could not verify your ID online! To provide you a safe and secure service, please upload <br>
          the following documents to verify your ID.</p>

<p>Type A: <b>One</b> from the following<br>
		o	Australian driver licence<br>
		o	Australian passport<br>
		o	International passport<br>
<br>
          <input type='file' name="international_passport" id="international_passport" onclick="removeError('international_passport')" placeholder="ID Proof Image" title="ID PROOF IMAGE" class='form-control' ><br>
   Type B: <b>One</b> from the following<br>
	o	Gas bill letter (not more than 3 months old)<br>
	o	Electricity bill (not more than 3 months old)<br>
	o	Internet/NBN/Mobile bill (not more than 3 months old)<br>
	o	Bank Statement (not more than 3 months old)<br>
</p>
          <input type='file' name="address_proof" id="address_proof" onclick="removeError('address_proof')" placeholder="ID Proof Image" title="ID PROOF IMAGE" class='form-control' ><br>
    </div>
    
     <div class="modal-footer">
        <button type='button' class='btn btn-info' id='first_id_btn_upload' onclick="submitForm('false','manual')">Upload Now</button>
      </div>
    </div>
  </div>
  </div>
  </form>
  
  
    <%@include file="frontendfooter.jsp" %>  
    
  
  <style>
  section#main-wrapper {
    padding-bottom: 0px;
    padding-top: 15px;
}
  </style>  
    
</body>
<script type="text/javascript">
function openModel(type){
		var idname='';
	if(type=='01'){
		idname=' Driver Licence';
	}
	if(type=='2'){
		idname=' Passport';
	}
	if(type=='4'){
		idname='International Passport';
	}
	if(type=='03'){
		idname=' Medicare';
	}
	
		
		$('#pid').empty();
		$('#pid').append('<b>'+idname+'</b>');
		$('#pid1').empty();
		$('#pid1').append('<b>'+idname+'</b>');
		//$('#myModal').modal('show');
		$('#international_myModal').modal('show');
	
}
</script>
<script type="text/javascript">

function submitForm(flag,vType){
	$('#first_id_btn_upload').attr('disabled',true);
	$('#idUploadLaterFlag').val(flag);
	
	if(vType=='rapidid'){
		var firstIdProofDoc = $('#firstIdProofDoc1').val();
		if(flag=='false'){
			if(firstIdProofDoc=='')
			{
					$("#firstIdProofDoc1").css('outline','red solid 2px').focus();
					 return false;
			}	
		}	
	}
	
	if(vType=='manual'){
		var international_passport = $('#international_passport').val();
		var address_proof = $('#address_proof').val();
		if(flag=='false'){
			if(international_passport=='')
			{
					$("#international_passport").css('outline','red solid 2px').focus();
					 return false;
			}	
			if(address_proof=='')
			{
					$("#address_proof").css('outline','red solid 2px').focus();
					 return false;
			}	
		}	
	}
	
	
	$('#form').submit();
	
}
</script>
<script type="text/javascript">
function removeError(id){
	//alert("id is "+id);
	$('#'+id).css('outline','#B0C4DE');
}
</script>
</html>