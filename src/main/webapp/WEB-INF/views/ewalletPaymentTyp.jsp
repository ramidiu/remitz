<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ewallet Registration</title>
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
$(document).ready(function(){

$('#updatebtn').click(function(){
	//alert(1345678);

	 var ewalletName = $('#ewalletName').val();
	// alert('ewalletName=='+ewalletName);
	 var userName = $('#userName').val();
	var password = $('#password').val();
	 var apiKey = $('#apiKey').val();
	//alert('apikey===='+apiKey);
	 var ewalletId=$('#ewalletId').val();
	// alert('ewalletId==='+ewalletId);
		if(ewalletName==""){
			$('#ewalletName').focus().css('outline', '2px solid red');
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
		
			var querystring="ewalletId="+ewalletId+"&ewalletName="+ewalletName+"&userName="+userName+"&password="+password+"&apiKey="+apiKey;
			//alert("querystring:"+querystring);
				$.ajax({
				url:'updateEwallet',
					data:querystring,
						type:'POST',
						//async:false,
							success:function(response){
								//alert(response);
							
							location.reload(true); 
							},
								error:function(){alert("error");}
			
			
			
			});


		 //$('#udateForm').submit();


});
});

</script>
	
	
	
	
	
	
	
<script type="text/javascript">
$(document).ready(function(){

		 $('#submitbtn').click(function(){
			 
		 //alert('657878');
			 var ewalletName = $('#ewalletName').val();
			 var userName = $('#userName').val();
			var password = $('#password').val();
			 var apiKey = $('#apiKey').val();
		
			if(ewalletName==""){
				$('#ewalletName').focus().css('outline', '2px solid red');
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
});
</script>
</head>
<body>
<%@include file="backendheader.jsp" %>
  <main id="main-container">
              
                <div class="content">
                    	<div class="row">
                    		<div class="col-md-12 ">
                                       <form action="updateEwallet" method="POST" id="udateForm" enctype="multipart/form-data">
                                   <input type="hidden" name="ewalletId" id="ewalletId" value="${ew.ewalletId}">
                                    </form>
                                    
                                    <form action="insertEwallet" method="POST"  enctype="multipart/form-data">
                                    	
				<section class="block p-20">
				<h5 style="font-size: 16px;">Ewallet REGISTRATION</h5>
				</section>
            			<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Ewallet Name:</label>
                						<input type="text" class="form-control" name="ewalletName" id="ewalletName" value="${ew.ewalletName}" placeholder="Enter ewalletName *" onkeyup="removeError('ewalletName');"> 
              					</div><br>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">User Name:</label>
                						<input type="text" class="form-control" name="userName" id="userName" value="${ew.userName}" placeholder="Enter userName *" onkeyup="removeError('userName');"> 
              					</div><br>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Password:</label>
                						<input type="text" class="form-control" name="password" value="${ew.password}" id="password" placeholder="Enter password *" onkeyup="removeError('password');"> 
              					</div><br>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">API:</label>
                						<input type="text" class="form-control" name="apiKey"  id="apiKey" value="${ew.apiKey}" placeholder="Enter apiKey *" onkeyup="removeError('apiKey');"> 
              					</div><br>
              					
            			</div>
            			<c:if test="${ew.ewalletId eq null }">
				<div class="form-row">
            			<div class="col-md-12 text-right">
            			<button type="Submit" id="submitbtn"class="btn btn-primary waves-effect waves-light" style="margin: 19px 0 26px 159px;">SUBMIT</button>
            			</div>
            			</div>
            			            			</c:if>
            			<c:if test="${ew.ewalletId ne null }">
				<div class="form-row">
            			<div class="col-md-12 text-right">
            			<button type="button" id="updatebtn"class="btn btn-primary waves-effect waves-light" style="margin: 19px 0 26px 159px;">UPDATE</button>
            			
            			</div>
            			</div>
            			            			</c:if>
            			
				</form>
				
                                 
                               </div>
                  
                           </div>
                        
                         
                       </div>

                           
<%--                             <div class="col-lg-10">
                               	<h5 style="margin: 28px 155px;">Ewallet Listing</h5>
                                         <div class="card-body shadow p-3 mb-5 bg-white rounded">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
                                                <thead class="thead-light">
                                                  <tr>
                                                    <th scope="col">EwalletId</th>
                                                    <th scope="col">ewalletName</th>
                                                    <th scope="col">UserName</th>
                                                    <th scope="col">Password</th>
                                                    <th scope="col">ApiKey</th>
                                                    
                                                  </tr>
                                                </thead>
                                                <tbody>
 
                                                
     <c:forEach items="${list}" var="list">
      <tr>
         <td>${list.ewalletId}</td>
         <td>${list.ewalletName}</td>
         <td>${list.userName}</td>
         <td>${list.password}</td>
         <td>${list.apiKey}</td>
      
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