<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Registration</title>
 <link href="${pageContext.request.contextPath}/resources/br/daterangepicker.css" rel="stylesheet" /> 
<style>
.bg-primary{
	color:#fff;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
.card-body {
  margin: 30px -76px 58px 146px;
    flex: 1 1 auto;
    padding: 1.25rem;
}
</style>
  <!-- <script type="text/javascript">
$( function() {
	$(function () {
	    $("#dob").datepicker({
	        changeMonth: true,
	        changeYear: true,
	        dateFormat: 'yy-mm-dd',
	    });
} );
</script> -->
<script type="text/javascript">
</script>
	
	
	
	
	
	
	
<script type="text/javascript">
		 $('#submitbtn').click(function(){
			 var paymentGatewayName = $('#paymentGatewayName').val();
			 var userName = $('#userName').val();
			var password = $('#password').val();
			 var apiKey = $('#apiKey').val();
			var link=$('#link').val();
			var paymentPage=$('#paymentPage').val();
			
			if(paymentPage==""){
				$('#paymentPage').focus().css('outline','2px solid red');
				return false;
			}
			
			if(link==""){
			$('#link').focus().css('outline','2px solid red');
			return false;
			
			}
			if(paymentGatewayName==""){
				$('#paymentGatewayName').focus().css('outline', '2px solid red');
				return false;
			}
			
	    if(userName==""){
				$('#userName').focus().css('outline', '2px solid red');
				return false;
			}
			
			if(password==""){
				$('#password').focus().css('outline', '2px solid red');
				return false;
			}
			
			 if(apiKey==""){
				$('#apiKey').focus().css('outline', '2px solid red');
				return false;
			}
			
			
	
	});
</script>
</head>
<body>
<%@include file="headerNew.jsp" %>
<div class="container">
  <main id="main-container">
              
                <div class="content">
                    	<div class="row">
                    		<div class="col-md-12 ">
                                    
                                    <form action="insertOnlineMop" method="POST"  enctype="multipart/form-data">
                                    	
				<section class="block p-20">
				<h5  style="background: #2e287b;color:white;padding:5px;text-align:center">Online REGISTRATION</h5>
				</section>
            			<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">paymentGatewayName:</label>
                						<input type="text" class="form-control" name="paymentGatewayName" id="paymentGatewayName" placeholder="Enter paymentGatewayName *" onkeyup="removeError('paymentGatewayName');"> 
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">User Name:</label>
                						<input type="text" class="form-control" name="userName" id="userName"  placeholder="Enter userName *" onkeyup="removeError('userName');"> 
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Password:</label>
                						<input type="text" class="form-control" name="password" id="password"  placeholder="Enter password *" onkeyup="removeError('password');"> 
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">API:</label>
                						<input type="text" class="form-control" name="apiKey" id="apiKey"  placeholder="Enter apiKey *" onkeyup="removeError('apiKey');"> 
              					</div><br>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Link:</label>
                						<input type="text" class="form-control" name="link" id="link"  placeholder="Enter link *" onkeyup="removeError('link');"> 
              					</div><br>
               					<div class="form-group col-md-4">
                					<label for="inputEmail4">PaymentPageName:</label>
                						<input type="text" class="form-control" name="paymentPage" id="paymentPage"  placeholder="Enter paymentPageName *" onkeyup="removeError('paymentPage');"> 
              					</div><br>
              					
              					
             	<div class="form-group col-md-4">
					<label>Upload logo:</label>
<%--             			<c:if test="${om.onlineId ne null }">
				     	<img src="images/onlineMopUrl/${om.onlineId}/${om.logo}" width="100" height="55">
            </c:if>
 --%>            <input type="file" name="logo1" id="logo" class="form-control " placeholder="logo" title="logo" onclick="removeError('logo');"> 
					
					</div>
              					
              					
            			</div>
            			<c:if test="${om.onlineId eq null }">
 				<div class="form-row">
            			<div class="col-md-12 text-left">
            			<button type="Submit" id="submitbtn" class="btn btn-primary btn-primary waves-effect waves-light" >SUBMIT</button>
            			</div>
            			</div>
            			
            			</c:if>
            			<c:if test="${om.onlineId ne null }">
          <a class="btn btn-primary btn-alt-primary" href="updateOnlineMop?onlineId=${om.onlineId}">update</a>
            			
</c:if>            			
				</form>
				
                                 
                               </div>
                  
                           </div>
                        
                         
                       </div>

                           
<%--                             <div class="col-lg-10">
                               	<h5 style="margin: 28px 155px;">Online Listing</h5>
                                         <div class="card-body shadow p-3 mb-5 bg-white rounded">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
                                                <thead class="thead-light">
                                                  <tr>
                                                    <th scope="col">onlineId</th>
                                                    <th scope="col">paymentGatewayName</th>
                                                    <th scope="col">UserName</th>
                                                    <th scope="col">Password</th>
                                                    <th scope="col">ApiKey</th>
                                                    <th scope="col">Logo</th>
                                                    <th scope="col">Update</th>
                                                  </tr>
                                                </thead>
                                                <tbody>
 
                                                
     <c:forEach items="${list}" var="list">
      <tr>
         <td>${list.onlineId}</td>
         <td>${list.paymentGatewayName}</td>
         <td>${list.userName}</td>
         <td>${list.password}</td>
         <td>${list.apiKey}</td>
         <td>
     	<img src="images/onlineMopUrl/${list.onlineId}/${list.logo}" width="100" height="55">
         
         </td>
         <td>
          <a class="btn btn-alt-primary" href="updateOnlineMop?onlineId=${list.onlineId}">update</a></td>
         
         </td>
      
      </tr>
                  </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div> <!-- end card-body -->
                                </div>
 --%>                            </div> <!-- end col -->
                        </div>
                        </div>                    
                    
<script src="assets/js/plugins/pwstrength-bootstrap/pwstrength-bootstrap.min.js"></script>
        <script src="assets/js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script src="assets/js/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
        <script src="assets/js/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
        <script src="assets/js/plugins/select2/js/select2.full.min.js"></script>
        <script src="assets/js/plugins/jquery-tags-input/jquery.tagsinput.min.js"></script>
        <script src="assets/js/plugins/jquery-auto-complete/jquery.auto-complete.min.js"></script>
        <script src="assets/js/plugins/masked-inputs/jquery.maskedinput.min.js"></script>
        <script src="assets/js/plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
        <script src="assets/js/plugins/dropzonejs/dropzone.min.js"></script>
        <script src="assets/js/plugins/flatpickr/flatpickr.min.js"></script>


</body>
</html>