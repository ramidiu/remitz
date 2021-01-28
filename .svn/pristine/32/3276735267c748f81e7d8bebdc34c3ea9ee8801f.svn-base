<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.70/jquery.blockUI.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <link rel="stylesheet" href="/superadmin/style.css">
<title>IdTypes</title>
<style>

</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#submitBtn').click(function(){
		alert('jnhjbhjbhjhj');
	
		var toCountryDetails = $('#toCountryDetails').val();
		alert('toCountryDetails=='+toCountryDetails);
			 var bcountries=$('#bcountries').val();
	
});
</script>
<script type="text/javascript">
function setIdFields(){
var country=$('#country').val();
//alert('country===='+country);
$.ajax({
	url : "getBranchByBranchId",
	type : "get",
	data :"branchId="+country.split(",")[2],
	async : false,
	success : function(response){
		var branchList = JSON.stringify(response, undefined, '\t');
		//alert('branchList==='+branchList);
		var opt1='';
		 $.each($.parseJSON(branchList),function(idx,obj){
			 
 			opt1=opt1+'<option value="'+obj.functionality+'">'+obj.functionality+'</option>';
       	 
		
	 });
 		//	$('#emsg').empty();
			//$('#emsg').append(opt1);
 
	$('#functionality').empty();
		 $('#functionality').append(opt1);
	},
	error : function(error , xhr , status){
		//alert('getAllCountries error = '+xhr);
	}
	
	
});


}
</script>



<script type="text/javascript">
function moveoutid(source,detination,main,TextBOX){
	var sda = document.getElementById(source);
	var source=$('#TextBOX').val();
	//alert('sda===='+sda.length);
	//var len = sda.length;
	var sda1 = document.getElementById(detination);
	var main1= document.getElementById(main);
	var TotText=document.getElementById(TextBOX); 
	var b;
	var i;
	var toCountryCount = $('#toCountrys option').length;
	//alert('toCountryCount==='+toCountryCount);
	var toCountryLimitPerAdmin = $('#toCountryLimitPerAdmin').val();
	//alert('toCountryLimitPerAdmin==='+toCountryLimitPerAdmin);
	
	for (i = 0; i < sda.length; i++) {	
		
		if (sda.options[i].selected){
			
		
			b = 1;
		}		
	}

	if(!b) {
		
        alert("Please select atleast one id");
        sda.focus();
        return false; 
	 }else if(b == 1){
		 $('#moveoutid').attr('disabled', false);
		var tmp =sda.options[sda.selectedIndex].text;
		var tmp1 = sda.options[sda.selectedIndex].value;
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
	 }
	
	 if(main1.options.length!=0){
	    	
			for(var j=0;j< main1.options.length; j++){
			  if(main1.options[j].text=="Any"){
			   main1.remove(main1.options[j]);
			   }	 
			 }	
	 } else{
		var y=document.createElement('option');
			y.text="Any";
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
	TotText.value=TotT;		 
	var counting = '0';
	$('#toCountrys option').each(function(){
		if(this.value!=''){
			counting = parseInt(counting)+1;
		}
	});
	
	/*  alert('counting:::::'+counting);
	 alert('toCountryLimitPerAdmin:::::'+toCountryLimitPerAdmin); */
	 if(parseInt(counting) == toCountryLimitPerAdmin){
		 $('#addBtn').prop('disabled',true);
		 $('#removeBtn').prop('disabled',false);
	 }else if(counting == '0'){
		 $('#addBtn').prop('disabled',false);
		 $('#removeBtn').prop('disabled',true);
	 }else if(counting<toCountryLimitPerAdmin){
		 $('#addBtn').prop('disabled',false);
		 $('#removeBtn').prop('disabled',false);
	 }
}
</script>
<script type="text/javascript">
function removeError(id){
	$('#'+id).css('outline','#B0C4DE');
}
</script>
</head>
<body>
<%@include file ="headerNew.jsp" %>
<main id="main-container">
              
                <div class="content"><h3 class="header-title mb-3">IdTypes</h3> 
	<section class="block p-20">
				     <div class="row">
 				<form  method="POST" action="insertSenderIds" > 
 				<input type="hidden" id="adminId" value="${adminId}"/>
					<div class="form-group col-md-12">
					<table class="table">
					    <tr>
					    <td>
					  <select class="form-control custom-select" id="country" name="country" onchange="setIdFields();removeError('country');">
					<option value="">---select------</option>
					
					<c:forEach items="${branches}" var="branches">
					<c:set var="count" value="0"/>
 					<c:forEach items="${types}" var="idtypes">
					<c:if test="${branches.branchId eq idtypes.branch.branchId and branches.admin.adminId eq idtypes.admin.adminId}">
					 <c:set var="count" value="${count + 1}"/>
					  </c:if> </c:forEach>
					<c:if test="${count eq 0}">
					<option value="${branches.fromCountry.countryISO},${branches.functionality},${branches.branchId}">${branches.fromCountry.countryName}</option>
					</c:if>
					</c:forEach></select>
	               <br>
	               <div>
	                <select class="form-control custom-select" id="functionality" readonly name="functionality" onchange="removeError('functionality');">
                </select>
                </div>
					   
					    </td>
					            <label>Select Sender idTypes:</label>
					    
					    
                                   <td id="toCountriesRow1">
                                  <label id="emsg"></label>
									<div class="col-md-4">
									<select id="Place" name="Place" class="form-control" size="5" style="width: 150px;height: 182px important;">
									<option value="Work Permit">Work Permit</option>
									<option value="International Passport">International Passport</option>
									<option value="Identification/National ID">Identification/National ID</option>
									<option value="NationalId">NationalId Type</option>
									<option value="Residence Permit">Residence Permit</option>
									<option value="System ID">System ID</option>
									<option value="Driving License">Driving License</option>
									<option value="Passport">Passport</option>
									</select>
									</div>
									<div class="col-md-4">
										<button type="button" class="btn btn-success" id="addBtn" onclick="moveoutid('Place','toCountrys','toCountrys','toCountryDetails');">add >></button>
										<button type="button" class="btn btn-danger" id="removeBtn" onclick="moveoutid('toCountrys','Place','toCountrys','toCountryDetails');">remove <<  </button>
									</div>
									<div class="col-md-4">
									<select id="toCountrys" name="toCountrys" class="form-control" size="5" style="width: 150px">
										<option value="">Any</option>
									</select>
									<input type="hidden" id="toCountryDetails" name="toCountryDetails">
									<input type="hidden" id="toCountryISOs" name="toCountryISOs" value="">
									<input type="hidden" id="toCountryNames" name="toCountryNames" value="">
									</div>
								</td>
	                                  <c:set var ="toCountriesRow1" value="${toCountriesRow1+1}"/>
								
								<td>
											<div class="form-group col-md-12 text-center">
						<button type="submit" id="submitBtn" class="btn btn-alt-primary" >REGISTER</button>
					</div>
								</td>
							</tr>
							</table></div>
					
              					
              					
		</form> 
 				</div>
 				</section>
 				</div>
 					
 		                                    <h5>SenderIdTypes Listing</h5>
                                    <div class="block col-md-12 p-10">
                                            <div class="row">
                                            
                                    	
                           
                            <div class="col-lg-12">
                               
                                         <div class="">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
                                                <thead class="table-primary">
                                                  <tr>
                                                    <th scope="col">AdminId</th>
                                                    <th scope="col">sIdNo</th>
                                                     <th scope="col">issuingAuthority</th>
                                                    <th scope="col">sIdType</th>
                                                     <th scope="col">Country</th>
                                                     <th scope="col">Functionality</th>
<!--                                                     <th scope="col">Edit</th>
 -->                                                  </tr>
                                                </thead>
                                                <tbody>
                                                  <c:set var="count" value="0"/>
                                                
     <c:forEach items="${types}" var="list">
      <tr>
          <td>${list.admin.adminId}</td>
         <td>SDT${list.senderId}</td>
         <td>${list.issuingAuthority}</td>
         <td>${list.senderType}</td>
         <td>${list.branch.fromCountry.countryName}</td>
         <td>${list.functionality}</td>
 </tr>
      
                  </c:forEach>
                                                </tbody>
                                            </table>
                                        </div></div></div></div></div></main>
      
</body>
</html>