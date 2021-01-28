<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CashPickup Registration</title>
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
	

	var countryISO=$('#country').val();
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
				opt1=opt1+'<option value="'+obj.stateId+'">'+obj.stateName+'</option>';
			 });
			$('#collectionPointState').empty();
			$('#collectionPointState').append(opt+opt1);
		},
		error : function(xhr,error,status){
			alert('get states error = '+xhr);
		}
	});
}
</script>
	
	
	
	
	
	
	
 <script type="text/javascript">
		 $('#submitbtn').click(function(){
			 var contactNumber = $('#contactNumber').val();
			 var cashPickupFrom = $('#cashPickupFrom').val();
			 var country = $('#country').val();
		
			if(country==""){
				$('#country').focus().css('outline', '2px solid red');
				return false;
			}
			
		   if(cashPickupFrom==""){
				$('#cashPickupFrom').focus().css('outline', '2px solid red');
				return false;
			}			
			if(contactNumber==""){
				$('#contactNumber').focus().css('outline', '2px solid red');
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
                                    
                                    <form action="insertcash" method="POST"  enctype="multipart/form-data">
                                    	
				<section class="block p-20">
				<h5 style="background: #2e287b;color:white;padding:5px;text-align:center">CASH REGISTRATION</h5>
				</section>
            			<div class="form-row">
             			             <div class="form-group col-md-4">
                					<label for="inputPassword4"> is this CashPickupBank:</label>
                					
                					<select class="form-control pull-right" name="cashBank" id="cashBank" onclick="removeError('cashBank');">
              					<option value="yes">Yes</option>
              					<option value="no">No</option>
              					</select></div> 
              					
              					<div class="form-group col-md-4">
                					<label for="country"> Country:</label>
                						<select class="form-control pull-right" name="country" id="country" onchange="setIdFields();" onclick="removeError('country');">
								<option value="">--Select country--</option>
								<c:forEach var="branch" items="${list}">
									<option value="${branch.fromCountry.countryISO}">${branch.fromCountry.countryName}</option>
						</c:forEach>
							</select>
              					</div> 
            			             <div class="form-group col-md-4">
                					<label for="inputPassword4"> State:</label>
                					
                					<select class="form-control pull-right" name="collectionPointState" id="collectionPointState" onclick="removeError('cashState');">
              					</select>
              					
              					</div>
              					</div>
              					   <div class="form-row">
            			           <div class="form-group col-md-4">
                					<label for="inputEmail4">cashPickupFrom :</label>
                						<input type="text" class="form-control" name="cashPickupFrom" id="cashPickupFrom" placeholder="Enter cashPickupFrom *" onkeyup="removeError('cashPickupFrom');"> 
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Contact Number :</label>
                							<input type="text" class="form-control " name="contactNumber" id="contactNumber" maxlength="13" placeholder="Enter Telephone/Mobile *" onkeyup="removeError('contactNumber');" onkeypress="return onlyNumber(event)"/>
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Address1:</label>
                							<input type="text" class="form-control " name="collectionPointBank" id="collectionPointBank" maxlength="13" placeholder="Enter collectionPointBank *" onkeyup="removeError('contactNumber');" onkeypress="return onlyNumber(event)"/>
              					</div>
            			
            			</div> 
            			
              					   <div class="form-row">
            			           <div class="form-group col-md-4">
                					<label for="inputEmail4">Address2 :</label>
                						<input type="text" class="form-control" name="collectionPointAddress" id="collectionPointAddress" placeholder="Enter cashPickupFrom *" onkeyup="removeError('cashPickupFrom');"> 
              					</div>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4"> City :</label>
                							<input type="text" class="form-control " name="collectionPointCity" id="collectionPointCity" maxlength="13" placeholder="Enter collectionPointCity *" onkeyup="removeError('contactNumber');" onkeypress="return onlyNumber(event)"/>
              					</div>
               					   <div class="form-row">
            			           <div class="form-group col-md-4">
                					<label for="inputEmail4">PinCode :</label>
                						<input type="text" class="form-control" name="collectionPointCode" id="collectionPointCode" placeholder="Enter collectionPointCode *" onkeyup="removeError('cashPickupFrom');"> 
              					</div>
              					
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Pin :</label>
                							<input type="text" class="form-control " name="collectionPin" id="collectionPin" maxlength="13" placeholder="Enter collectionPin *" onkeyup="removeError('contactNumber');" onkeypress="return onlyNumber(event)"/>
              					</div>
            			
            			</div> 
 </div>           			
            			
            			
				<div class="form-row">
            			<div class="col-md-12 ">
            			<button type="Submit" id="submitbtn" class="btn btn-primary btn-primary waves-effect waves-light" style=" ">SUBMIT</button>
            			</div>
            			</div>
				</form>
				
                                 
                               </div>
                  
                           </div>
                        
                         
                       </div>
                       
                       
                       
                                                   <div class="col-lg-10">
                                         <div class="card-body shadow p-3 mb-5 bg-white rounded">
                                        <div class="table-responsive">
                                        
                               	<h5 style="background: #2e287b;color:white;padding:5px;text-align:center">Cash Listing</h5>
                                            <table class="table table-bordered mb-0">
                                                <thead class="thead-light">
                                                  <tr style="background: #2e287b;color:white;padding:5px;text-align:center">
                                                    <th scope="col">cashId</th>
                                                    <th scope="col">cashPickupFrom</th>
                                                    <th scope="col">CountryName</th>
                                                    <th scope="col">StateName</th>
                                                     <th scope="col">collectionPointCity</th>
                                                    <th scope="col">ContactNumber</th>
                                                    <th scope="col">collectionPointBank</th>
                                                    <th scope="col">collectionPointAddress</th>
                                                    <th scope="col">collectionPin</th>
                                                    
                                                  </tr>
                                                </thead>
                                                <tbody>
     <c:forEach items="${cashlist}" var="cash">
      <tr>
         <td>${cash.cashId}</td>
         <td>${cash.cashPickupFrom}</td>
          <td>${cash.country.countryName}</td>
        <td>${cash.collectionPointState.stateName}</td>
         <td>${cash.collectionPointCity}</td>
         <td>${cash.contactNumber}</td>
         <td>${cash.collectionPointBank }</td>
         <td>${cash.collectionPointAddress}</td>
         <td>${cash.collectionPin }</td>
      </tr>
                  </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div> <!-- end card-body -->
                                </div>
                            </div> <!-- end col -->
                        </div>
                        </div>                    
                    
                       
                       
                       
                       
                       
</main>
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