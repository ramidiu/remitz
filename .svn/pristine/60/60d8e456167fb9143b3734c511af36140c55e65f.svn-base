<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BankDetails Registration</title>
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
		 $('#submitbtn').click(function(){
			 var bankName = $('#bankName').val();
			 var payeeName = $('#payeeName').val();
			var bankCode = $('#bankCode').val();
			var internetbanktransferId=$('#internetbanktransferId').val();
			alert('internetbanktransferId==='+internetbanktransferId);
			var accountNumber = $('#accountNumber').val();
		
			if(bankName==""){
				$('#bankName').focus().css('outline', '2px solid red');
				return false;
			}
			
	    if(payeeName==""){
				$('#payeeName').focus().css('outline', '2px solid red');
				return false;
			}
			
			if(bankCode==""){
				$('#bankCode').focus().css('outline', '2px solid red');
				return false;
			}
			
			 if(accountNumber==""){
				$('#accountNumber').focus().css('outline', '2px solid red');
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
                                    
                                    <form action="insertbanktransferMop" method="POST"  enctype="multipart/form-data">
<!--                          <a href="internetbanktransferMop"  class="btn btn-alt-secondary">AddBankDetails</a><br><br>
 -->                                    	
				<section class="block p-20">
				<h5 style="background: #2e287b;color:white;padding:5px;text-align:center">BankDetails</h5>
				</section>
            			<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Bank Name:</label>
                						<input type="text" class="form-control" name="bankName" id="bankName" value="${list.bankName}" placeholder="Enter bankName *" onkeyup="removeError('bankName');"> 
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Payee Name:</label>
                						<input type="text" class="form-control" name="payeeName" id="payeeName" value="${list.payeeName}" placeholder="Enter payeeName *" onkeyup="removeError('payeeName');"> 
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">BankCode:</label>
                						<input type="text" class="form-control" name="bankCode" id="bankCode" value="${list.bankCode}" placeholder="Enter bankCode *" onkeyup="removeError('bankCode');"> 
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">accountNumber:</label>
                						<input type="text" class="form-control" name="accountNumber" value="${list.accountNumber}" id="accountNumber" placeholder="Enter accountNumber *" onkeyup="removeError('accountNumber');"> 
              					</div><br>
              				<input type="hidden" name="internetbanktransferId" value="${list.internetbanktransferId}" id="internetbanktransferId">	
            			</div>
				<div class="form-row">
            			<div class="col-md-12 text-left">
            			<button type="Submit" id="submitbtn" class="btn btn-primary waves-effect waves-light" style="">UPDATE</button>
            			</div>
            			</div>
				</form>
				
                                 
                               </div>
                  
                           </div>
                        
                         
                       </div>

                           
                            </div> <!-- end col -->
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