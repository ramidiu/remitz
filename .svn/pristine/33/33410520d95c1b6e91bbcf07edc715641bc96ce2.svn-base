<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<script type="text/javascript">
$(document).ready(function(){
	$('#submitBtn').click(function(){
		//alert('cll');
		var firstName = $('#firstName').val();
		var emailId = $('#emailId').val();
		var phoneNumber = $('#phoneNumber').val();
		var country = $('#country').val();
		if($.trim(firstName)==''){
			$('#firstName').focus().css('outline', '2px solid red');
			return false;
		}
		if(emailId==""){
			$('#emailId').focus().css('outline','solid red 2px');
			return false;
		}else{
			$.ajax({
				url : "checkExistedMails",
				method : "post",
				data : "emailId="+emailId,
				 async : false,
				success : function(response){
					result=response;
					//alert('response=='+response);
				
				},
				error : function(xhr,status,error){
					//alert("validate email error : "+error);
				}
				
			});
		 	
		}
		
	 if(result.trim() == 'exist'){
			$('#emsg').empty();
			$('#emsg').append("<font color='red'>Email address already exist!</font>");
			//alert('this email/phone is already exist...!');
			$('#emailId').focus().css('outline','solid red 2px');
			return false;
		}  

 
 
 
		
		if($('#phoneNumber')==''){
			$('#phoneNumber').focus().css('outline', '2px solid red');
			return false; 
		}
		
 });
}); 
  
  </script>
  <script type="text/javascript">

function validateEmail(emailId) {
	var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if(regex.test(emailId)) {
	return true;
	}
	else {
		alert('enter valid email');
		return false;
	}
}
 </script>
  


<body><form action="mydemoreq" method="post" id="validate" >
 <input type="text" name="firstName" id="firstName" placeholder="first name" class="form-control" ><br>
<input type="text" name="emailId" id="emailId" placeholder="email" onkeyup="removeError('emailId')" class="form-control"><br>


<input type="text" name="phoneNumber" id="phoneNumber" placeholder="Phone-number" class="form-control"><br>

<button type="submit" id="submitBtn" class="btn btn-alt-primary" >Submit</button>
</div>
</div>
</form>

</body>
</html>