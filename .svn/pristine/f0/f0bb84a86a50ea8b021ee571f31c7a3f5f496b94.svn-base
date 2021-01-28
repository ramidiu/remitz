<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Banks Registration</title>
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
function setIdFields(){
	

/* 	var countryISO=$('#country').val();
	//alert('country');
	$.ajax({
		url : "/common/getStatesBasedOnCountry",
		method : "get",
		data : "countryISO="+countryISO,
		async : false,
		success : function(response){
			var list =JSON.stringify(response, undefined, '\t');
			var opt='<option value="">--Select*--</option>';
			var opt1='';
			$.each($.parseJSON(list),function(idx,obj){
				opt1=opt1+'<option value="'+obj.stateName+'">'+obj.stateName+'</option>';
			 });
			$('#bankState').empty();
			$('#bankState').append(opt+opt1);
		},
		error : function(xhr,error,status){
			alert('get states error = '+xhr);
		}
	});
}
 */</script>
	
	
	
	
	
	
	
<script type="text/javascript">
		 $('#submitbtn').click(function(){
			 var bankName = $('#bankName').val();
			 //var bankState = $('#bankState').val();
			// var bankDistrict = $('#bankDistrict').val();
			// var bankBranchName = $('#bankBranchName').val();
			 //var bankAddress = $('#bankAddress').val();
			// var bankCity = $('#bankCity').val();
			 var country = $('#country').val();
		
			if(country==""){
				$('#country').focus().css('outline', '2px solid red');
				return false;
			}
			
		/*    if(bankCity==""){
				$('#bankCity').focus().css('outline', '2px solid red');
				return false;
			}
			
			if(bankAddress==""){
				$('#bankAddress').focus().css('outline', '2px solid red');
				return false;
			}
			
			 if(bankBranchName==""){
				$('#bankBranchName').focus().css('outline', '2px solid red');
				return false;
			}
			
			if(bankDistrict==""){
				$('#bankDistrict').focus().css('outline', '2px solid red');
				return false;
			}
			
			
			
			if(bankState==""){
				$('#bankState').focus().css('outline', '2px solid red');
				return false;
			}
			 */
			 if(bankName==""){
				$('#bankName').focus().css('outline', '2px solid red');
				return false;
			}
		
			
		}); 
	
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
                                    
                                    <form action="insertbanks" method="POST"  enctype="multipart/form-data">
                                 <input type="hidden" name="myIp" id="myIp">   	
				<section class="block p-20">
				<h5 style="background: #2e287b;color:white;padding:5px;text-align:center">Bank REGISTRATION</h5>
				</section>
            			<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Bank Name:</label>
                						<input type="text" class="form-control" name="bankName" id="bankName" placeholder="Enter bankName *" onkeyup="removeError('bankName');"> 
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Short Name of Bank:</label>
                						<input type="text" class="form-control" name="bankCode" id="bankCode" placeholder="Enter bankCode *" onkeyup="removeError('bankName');"> 
              					</div>
              					
<!--               					<div>              					
                					<label for="inputPassword4">bankBranchName :</label>
                					<input type="text" class="form-control" name="bankBranchName" id="bankBranchName" placeholder="Enter bankBranchName " onkeyup="removeError('bankBranchName');">
              					</div> 
            			</div>
            			<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Bank Address:</label>
                						<textarea class="form-control pull-right" name="bankAddress" id="bankAddress" placeholder="bankAddress Address *" onkeyup="removeError('bankAddress');"></textarea>
              					</div> 
              					
              					
              					            			<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Bank District:</label>
                						<input type="text" class="form-control" name="bankDistrict" id="bankDistrict" placeholder="Enter bankDistrict *" onkeyup="removeError('bankDistrict');"> 
              					</div><br>
              					
              					             					
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">City/State:</label>
                						<input type="text" class="form-control" name="bankCity" id="bankCity" placeholder="Enter bankCity Name *" onkeyup="removeError('bankCity');">
              					</div>
 -->              					<div class="form-group col-md-4">
                					<label for="country"> Country:</label>
                						<select class="form-control pull-right" name="country" id="country" onclick="removeError('country');">
								
								<option value="">--Select country--</option>
								
								<c:forEach var="branch" items="${list}">
								
									<option value="${branch.fromCountry.countryISO}">${branch.fromCountry.countryName}</option>
                
                                 
						</c:forEach>
							</select>
              					</div> 
            			</div>
<!--             			              					<div class="form-group col-md-4">
                					<label for="inputPassword4"> BankState:</label>
                					
                					<select class="form-control pull-right" name="bankState" id="bankState" onclick="removeError('bankState');">
              					</select></div> 
            			</div>
 -->            			
				<div class="form-row">
            			<div class="col-md-12 ">
            			<button type="Submit" id="submitbtn" class="btn btn-primary waves-effect waves-light" >SUBMIT</button>
            			</div>
            			</div>
				</form>
				
                                 
                               </div>
                  
                           </div>
                        
                         
                       </div>

                           
                            <div class="col-lg-10">
                                         <div class="card-body shadow p-3 mb-5 bg-white rounded">
                                        <div class="table-responsive">
                                        
                               	<h5 style="background: #2e287b;color:white;padding:5px;text-align:center">Bank Listing</h5>
                                            <table class="table table-bordered mb-0">
                                                <thead class="thead-light">
                                                  <tr style="background: #2e287b;color:white;padding:5px;text-align:center">
                                                    <th scope="col">BankId</th>
                                                    <th scope="col">BankName</th>
                                                    <th scope="col">BankShortName</th>
                                                    <th scope="col">CountryName</th>
                                                  </tr>
                                                </thead>
                                                <tbody>
 
      <c:forEach items="${branchlist}" var="list">
                                                
     <c:forEach items="${bankslist}" var="bank">
      <tr>
           <c:choose>
           <c:when test="${list.fromCountry.countryName eq bank.country.countryName}">
         <td>${bank.bankId}</td>
         <td>${bank.bankName}</td>
         <td>${bank.bankCode}</td>
         <td>${bank.country.countryName}</td>
           </c:when>
           
           </c:choose>
      
      </tr>
                  </c:forEach></c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div> <!-- end card-body -->
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
 <script type="text/javascript">
 $(document).ready(function(){
		$.getJSON("https://api.ipify.org/?format=json", function(e) {
		    console.log(e.ip);
		   // alert("ioplhgfszd"+e.ip);
		    $('#myIp').val(e.ip);
		});

</script>
</html>