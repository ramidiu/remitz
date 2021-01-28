
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
 <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Rubik&display=swap" rel="stylesheet">
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/> -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
.form-row{
position: relative;
  
}
.profile-info {
    padding: 21px;
    background: #fff;
    margin: 0px 0 0 !important;
}
.dropdown-menu {padding: 1px 3px 10px 24px;
    /* position: relative; */
    top: 30px;
    /* left: 126px; */
    left: auto !important ;
    margin-left: 81px !important;
    width: auto;}
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
#update{position: relative;
    top: 138px;
    left: -88px;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
function removeError(id){
	//alert("id is "+id);
	$('#'+id).css('outline','#B0C4DE');
}
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('#changepwd').click(function(){
		var currencyPwd=$('#currencyPwd').val();
		var newPwd=$('#newPwd').val();
		var cnfPwd=$('#cnfPwd').val();
		
		var password=$('#password').val();
		
		if(currencyPwd==''){
			$('#currencyPwd').focus().css('outline','solid red 2px');
			return false;
		}
		if(currencyPwd!=password){
			$('#currencyPwd').focus().css('outline','solid red 2px');
			$('#msg1').empty();
			$('#msg1').append('<font color="red">wrong password..!</font>');
			return false;
		}
		if(newPwd==''){
			$('#newPwd').focus().css('outline','solid red 2px');
			return false;
		}
		if(cnfPwd==''){
			$('#cnfPwd').focus().css('outline','solid red 2px');
			return false;
		}
		if(newPwd==cnfPwd){
			$('#updateform').submit();
		}else{
			$('#cnfPwd').focus().css('outline' , 'solid red 2px');
			$('#msg').empty();
			$('#msg').append('<font color="red">password do not match..!</font>');
			return false;
			
		}
	});
	
});
</script>
<script type="text/javascript">
function clearmsg(id){
	$('#'+id).empty();
	removeError(id);
}</script>
</head>
<body>
<%@include file="frontendheader.jsp" %>

<div class="change-password">
	<div class="container">
		<div class="row">
		
				<div class="col-md-6 col-md-offset-3">
			<input type="hidden" id="password" value="${password}"/>
				<div class="profile-info">
			<h5 class="page-header pb-2 mt-4 mb-3 border-bottom" align="center">Change Password</h5>
			<form action="changepwd" method="post" id="updateform">
			<div class="form-row">
              <div class="form-group">
                <label for="idType">Current Password</label>
                <input type="password" id="currencyPwd" onkeyup="clearmsg('msg1');" onkeyup="removeError('currencyPwd');" name="currencyPwd" class="form-control" placeholder="Enter Current Password">
              <label id="msg1"></label>
              </div>
                  </div>
                  	<div class="form-row">
              <div class="form-group">
                <label for="idNumber">New Password</label>
                <input type="password" class="form-control" onkeyup="clearmsg('msg');"onkeyup="removeError('newPwd');" id="newPwd" name="newPwd" placeholder="Minimum of 8 charecters">
               
                <span class="show-password" data-show-password="true" data-fieldname="new_password">Show Password</span>
              </div>
              </div>
              <div class="form-row">
              <div class="form-group ">
                <label for="idType">Confirm Password</label>
                <input type="password" class="form-control" onkeyup="clearmsg('msg');" onkeyup="removeError('cnfPwd');" id="cnfPwd" name="cnfPwd" placeholder="Confirm Password">
                <label id="msg"></label>
              </div>
                  </div>
             <div class="form-row">
              <div class="form-group col-md-12">
              	 <div class="text-center">
  <!--            <button type="submit" class="btn btn-primary">Continue</button>  -->
           <button type="button" class="btn btn-primary btn-lg"  id="changepwd">Change Password</button>  
            </div>
              </div>
             
			</div>
			 </form>
			</div>
		</div>
		
	</div>
</div>
</div> 
</body>
<%@include file="frontendfooter.jsp" %>

</html>