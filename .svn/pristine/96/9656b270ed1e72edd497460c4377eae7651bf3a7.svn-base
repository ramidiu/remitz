<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>You</title>


	<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/them
	
	es/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css"> -->
  	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.70/jquery.blockUI.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/cleave.min.js"></script>
 
 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  -->
 <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script> 

 -->
 <style>
 span#dailingCode {
    border: none !important;
    padding-top: 0px !important;
    padding-bottom: 0px !important;
    height: 40px !important;
}
.file{position: relative;
    top: 22px;
    left: -99px;}
    .aud{width: 20px;
    position: relative;
    top: 7px;
}
span.ccode {
    position: relative;
    left: 3px;
    top: 7px;
}
.upload{position: relative;
    top: -25px;
 
 
 }
 
 .form-group.col-md-6.mbl-id {
    margin-bottom: 0px;
}



    .form-group.col-md-4.mbl-dob {
    margin-bottom: 0px;
}
   .map-places{
       box-shadow: 0 20px 40px 0 rgba(21, 12, 181, 0.3);

   
   } 
   
   
</style>
	<script type="text/javascript">
function IsEmail(email) {
	  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  if(!regex.test(email)) {
	    return false;
	  }else{
	    return true;
	  }
	}
</script>
<script>
  $( function() {
    $( "#datepicker" ).datepicker({
    	 changeMonth: true,
    	    changeYear: true,
    	    dateFormat:'yy-mm-dd',
    	    	onSelect: function( selectedDate ) {
    				$( "#datepicker1" ).datepicker( "option", "minDate", selectedDate );
    			}
    });
   
  } );
  </script>
  <script>
  $( function() {
    $( "#datepicker1" ).datepicker({
   	 changeMonth: true,
     changeYear: true,
     dateFormat:'yy-mm-dd',
     onSelect: function( selectedDate ) {
			$( "#datepicker" ).datepicker( "option", "maxDate", selectedDate );
		}
    });
  } );
  </script>
<script type="text/javascript">
$(document).ready(function(){
	  var sendingAmount=$('#sendingAmount').val();
	 var fromCountry=$('#fromCountry').val();
	var testVal='';	
	 $.ajax({
			url : "getAml",
			type : "get",
			data : "branchId="+fromCountry.split("-")[1],
			async : false,
			success : function(response){
				testVal=response;

			},
			error : function(error , xhr , status){
				alert('trulio error = '+xhr);
			}
			
			
		});
		
	 
	  if(Number(sendingAmount)<Number(testVal)){
		  $('#idDiv').hide();
		  $('#dobDiv').hide();
	  }
	$('#you').addClass('active');
	var d = new Date();
	var month = d.getMonth()+1;
	var day = d.getDate();
	var currentDate = d.getFullYear() + '-' +
	    (month<10 ? '0' : '') + month + '-' +
	    (day<10 ? '0' : '') + day;
	$('#cardTypeDiv').hide();
 	$('#individualRefNoDiv').hide();
 	$('#nationalId').hide();
	
	$('#continue').click(function(){
		var firstName=$('#firstName').val();
	
		var lastName=$('#lastName').val();
		var email=$('#email').val();
		//var dob=$('#dob').val();
  var trid=$('#trid').val();	
		var mobileNumber =$('#mobileNumber').val();
		var emailId=$('#emailId').val();
		var tname=$('#tname').val();
		var address=$('#address').val();
		var suburb=$('#suburb').val();
		var houseNumber=$('#houseNumber').val();
		var buildingName=$('#buildingName').val();
		var unitNumber=$('#unitNumber').val();
		var postalCode=$('#postalCode').val();
		var streetName=$('#streetName').val();
		var streetType=$('#streetType').val();
		var city=$('#city').val();
		var telephone=$('#telephone').val();
		var telephone2=$('#telephone2').val();
		var state=$('#state').val();
		var nationalIdType=$('#nationalIdType').val();
		var cityOrState = $('#cityOrState').val();
		//var firstIdProofType=$('#firstIdProofType').val();
		var firstIdNumber=$('#firstIdNumber').val();
		var issuingCountry=$('#issuingCountry').val();
		//alert('issuingCountry==='+issuingCountry);
		var firstIdExpireDate=$('#firstIdExpireDate').val();
		var custID=$('#custID').val();
		
		var idType=$('#firstIdProofType').val();
		//alert('idType==='+idType);
		
		
		var dd=$('#date').val();
		var mm=$('#month').val();
		var yyyy=$('#year').val();
		//alert('dd is = '+dd+" mm is "+mm+" yyyy is = "+yyyy);
		
		
		var iddd=$('#iddate').val();
		var idmm=$('#idmonth').val();
		var idyyyy=$('#idyear').val();
		 var houseNumber=$('#houseNumber').val();
		 var unitNumber=$('#unitNumber').val();
		 var streetName=$('#streetName').val();
		 var streetType=$('#streetType').val();
		 var nationalIdType=$('#nationalIdType').val();
		 var telephone=$('#telephone').val();
		 var telephone2=$('#telephone2').val();

		
/* 		var cardType='';
		var individualRefNo='';
		if(idType.split(",")[0]=='03'){
			cardType=$('#cardType').val();
		 	individualRefNo=$('#individualRefNo').val();
			if(cardType==''){
				$('#cardType').focus().css('outline' , 'solid red 2px');
				return false;
			}
			if(individualRefNo==''){
				$('#individualRefNo').focus().css('outline' , 'solid red 2px');
				return false;
			}
		 	
		}
		
 */		//var firstIdExpireDate=$('#datepicker').val();

		//var sourceOfFund=$('#sourceOfFund').val();
		var occupation=$('#occupation').val();
		var citizenship=$('#citizenship').val();
		
		var firstIdProofDoc = $('#firstIdProofDoc').val();
		
		
		
		if(firstName==''){
			$('#firstName').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(lastName==''){
			$('#lastName').focus().css('outline' , 'solid red 2px');
			return false;
		}
	/* 	if(dob==''){
			$('#dob').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(dob>=currentDate){
	 		$('#dob').focus().css('outline','solid red 2px');
	 		return false;
	 	} */
		var customerSignUpFlag=$('#customerSignUpFlag').val();
		if(customerSignUpFlag=='email'){
			if(mobileNumber==''){
				$('#mobileNumber').focus().css('outline' , 'solid red 2px');
				return false;
			}	
		}
		if(customerSignUpFlag=='mob'){
			if(emailId==''){
				$('#emailId').focus().css('outline' , 'solid red 2px');
				return false;
			}	
		}
		if(occupation==''){
			$('#occupation').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(citizenship==''){
			$('#citizenship').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(address==''){
			$('#address').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(suburb==''){
			//$('#suburb').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(postalCode==''){
			$('#postalCode').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(cityOrState==''){
			$('#cityOrState').focus().css('outline' , 'solid red 2px');
			return false;
		}
		
		
		  var sendingAmount=$('#sendingAmount').val();
		  //alert('sendingAmount====='+sendingAmount);
			 var fromCountry=$('#fromCountry').val();
			// alert('fromCountry======='+fromCountry);
			var amount='';	
			 $.ajax({
					url : "getAml",
					type : "get",
					data : "branchId="+fromCountry.split("-")[1],
					async : false,
					success : function(response){
						amount=response;

					},
					error : function(error , xhr , status){
						alert('trulio error = '+xhr);
					}
					
					
				});
				//alert('amount====='+amount);

 if(Number(sendingAmount)>=Number(amount)){

	 
		if(dd==''){
			$('#date').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(mm==''){
			$('#month').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(yyyy==''){
			$('#year').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(dd==''){
			$('#date').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(mm==''){
			$('#month').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(yyyy==''){
			$('#year').focus().css('outline' , 'solid red 2px');
			return false;
		}
		/* --------dob vaidation------------- */
		if(mm=='04' || mm=='06' || mm=='11'){
			if(dd<1 || dd>30){
				$('#date').focus().css('outline' , 'solid red 2px');
				return false;
			}
		}else if(mm=='02'){
				if(dd<1 || dd>28){
					$('#date').focus().css('outline' , 'solid red 2px');
					return false;
				}
		}else{
			if(dd<1 || dd>31){
				$('#date').focus().css('outline' , 'solid red 2px');
				return false;
			}
		}
		if(yyyy<1920 || yyyy>2000){
			$('#year').focus().css('outline' , 'solid red 2px');
			return false;
		}

	 
		if(idType==''){
			$('#firstIdProofType').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(firstIdNumber==''){
			$('#firstIdNumber').focus().css('outline' , 'solid red 2px');
			//alert("Passport Number cann't be less than 7");
			return false;
		}
		//alert('id type===='+idType.split(",")[1]);
      	if(idType.split(",")[1]!='none'){
	
		if(iddd==''){
			$('#iddate').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(idmm==''){
			$('#idmonth').focus().css('outline' , 'solid red 2px');
			return false;
		}
		if(idyyyy==''){
			$('#idyear').focus().css('outline' , 'solid red 2px');
			return false;
		}
		
		var firstIdExpireDate=idyyyy+"-"+idmm+"-"+iddd;

	 	if(firstIdExpireDate<=currentDate){
	 		$('#idyear').focus().css('outline','solid red 2px');
	 		return false;
	 	}
 	if(issuingCountry==''){
 		$('#issuingCountry').focus().css('outline', 'solid red 2px');
 		return false;
 	}
      	}
	var agree ='';
    $.each($("input[name='agree']:checked"), function(){
    	agree='Y';
    });
	var countryISO=$('#country').val();
	var custID=$('#custID').val();
	var customerfrom=$('#customerfrom').val();

    if(agree=='Y'){
    	 $('#firstIdExpireDate').val(firstIdExpireDate);
		$('#dob').val(yyyy+"-"+mm+"-"+dd); 
    	var kycstatus='';
      	if(idType.split(",")[0]=='01'){
      		if(firstIdNumber.length<Number(7)){
    			$('#firstIdNumber').focus().css('outline' , 'solid red 2px');
    			alert("Driver licence number cann't be less than 7");
    			return false;
    		}
    		if(firstIdNumber.length>Number(10)){
    			$('#firstIdNumber').focus().css('outline' , 'solid red 2px');
    			alert("Driver licence number cann't be more than 10");
    			return false;
    		}
    		var issuingCountry=$('#issuingCountry').val();
		var customerfrom=$('#customerfrom').val();
		//alert('customerfrom===='+customerfrom);
    		var testVal='';	
		//alert('state==='+state);
			//alert('countryISO==='+countryISO);
			//data = "countryISO="+countryISO+"&firstName="+firstName+"&lastName="+lastName+"&dd="+dd+"&mm="+mm+"&yyyy="+yyyy+"&state="+state+"&firstIdNumber="+firstIdNumber+"&postalCode="+postalCode+"&streetName="+streetName+"&streetType="+streetType+"&unitNumber="+unitNumber+"&suburb="+suburb+"&buildingNumber="+houseNumber+"&buildingName="+buildingName+"&city="+city+"&nationalIdType="+nationalIdType+"&telephone="+telephone+"&telephone2="+telephone2+"&mobileNumber="+mobileNumber+"&idType="+idType.split(",")[0];
    		//alert('data===='+data);
			if(trid=='yes' && tname=='yes'){
				//alert('gfhghghghg');
    				$.ajax({
    					url : "validateCustomer",
    					type : "get",
    					data : "countryISO="+countryISO+"&firstName="+firstName+"&lastName="+lastName+"&dd="+dd+"&mm="+mm+"&yyyy="+yyyy+"&state="+state+"&firstIdNumber="+firstIdNumber+"&postalCode="+postalCode+"&streetName="+streetName+"&streetType="+streetType+"&unitNumber="+unitNumber+"&suburb="+suburb+"&buildingNumber="+houseNumber+"&buildingName="+buildingName+"&city="+city+"&nationalIdType="+nationalIdType+"&telephone="+telephone+"&telephone2="+telephone2+"&mobileNumber="+mobileNumber+"&idType="+idType.split(",")[0]+"&firstIdExpireDate="+firstIdExpireDate+"&customerId="+custID+"&email="+email+"&customerfrom="+customerfrom,
    					async : false,
    					success : function(response){
    					//alert('response===='+response);
    					if(response=='match'){
    						testVal='match';
    						$('#form').submit();
    					}

    					},
    					error : function(error , xhr , status){
    						//alert('getAllCountries error = '+xhr);
    					}
    					
    					
    				});
    				
    			}
			if(testVal=='match'){
			submitForm('false','rapidid');
			}
    		if(testVal!='match'){
     		$('#myModal').modal('show');
     		$('#kycstatus').val("N");
			$('#doneby').val('rapidid');
    		}
    	}
      
      	if(idType.split(",")[0]!='01' && idType.split(",")[0]!='2' && idType.split(",")[0]!='5'){
     	
      		var testVal='';	
    		//alert('state==='+state);
    			//alert('countryISO==='+countryISO);
    			//data = "countryISO="+countryISO+"&firstName="+firstName+"&lastName="+lastName+"&dd="+dd+"&mm="+mm+"&yyyy="+yyyy+"&state="+state+"&firstIdNumber="+firstIdNumber+"&postalCode="+postalCode+"&streetName="+streetName+"&streetType="+streetType+"&unitNumber="+unitNumber+"&suburb="+suburb+"&buildingNumber="+houseNumber+"&buildingName="+buildingName+"&city="+city+"&nationalIdType="+nationalIdType+"&telephone="+telephone+"&telephone2="+telephone2+"&mobileNumber="+mobileNumber+"&idType="+idType.split(",")[0];
        		//alert('data===='+data);
    			if(trid=='yes' && tname=='yes'){
    				//alert('gfhghghghg');
        				$.ajax({
        					url : "validateCustomer",
        					type : "get",
        					data : "countryISO="+countryISO+"&firstName="+firstName+"&lastName="+lastName+"&dd="+dd+"&mm="+mm+"&yyyy="+yyyy+"&state="+state+"&firstIdNumber="+firstIdNumber+"&postalCode="+postalCode+"&streetName="+streetName+"&streetType="+streetType+"&unitNumber="+unitNumber+"&suburb="+suburb+"&buildingNumber="+houseNumber+"&buildingName="+buildingName+"&city="+city+"&nationalIdType="+nationalIdType+"&telephone="+telephone+"&telephone2="+telephone2+"&mobileNumber="+mobileNumber+"&idType="+idType.split(",")[0]+"&firstIdExpireDate="+firstIdExpireDate+"&customerId="+custID+"&customerfrom="+customerfrom,
        					async : false,
        					success : function(response){
        					//alert('response===='+response);
        					if(response=='match'){
        						testVal='match';
        						$('#form').submit();
						
        					}

        					},
        					error : function(error , xhr , status){
        						//alert('getAllCountries error = '+xhr);
        					}
        					
        					
        				});
        				
        			}
    			if(testVal=='match'){
    				submitForm('false','rapidid');
    				}

        		
        		
        		if(testVal!='match'){
         		$('#myModal').modal('show');
         		$('#kycstatus').val("N");
    			$('#doneby').val('rapidid');
        		}

    	}
      	var gender=$('#gender').val();
      	if(idType.split(",")[0]=='5'){
      		
    		if(firstIdNumber.length>Number(9)){
    			$('#firstIdNumber').focus().css('outline' , 'solid red 2px');
    			alert("Passport number cann't be more than 10");
    			return false;
    		}
    		var testVal='';	
    		//alert('state==='+trid,tname);
    		//alert('tname===='+tname);
    			//alert('countryISO==='+countryISO);
    			//data = "countryISO="+countryISO+"&firstName="+firstName+"&lastName="+lastName+"&dd="+dd+"&mm="+mm+"&yyyy="+yyyy+"&state="+state+"&firstIdNumber="+firstIdNumber+"&postalCode="+postalCode+"&streetName="+streetName+"&streetType="+streetType+"&unitNumber="+unitNumber+"&suburb="+suburb+"&buildingNumber="+houseNumber+"&buildingName="+buildingName+"&city="+city+"&nationalIdType="+nationalIdType+"&telephone="+telephone+"&telephone2="+telephone2+"&mobileNumber="+mobileNumber+"&idType="+idType.split(",")[0];
        		//alert('data===='+data);
    			if(trid=='yes' && tname=='yes'){
    				//alert('gfhghghghg');
        				$.ajax({
        					url : "validateCustomer",
        					type : "get",
        					data : "countryISO="+countryISO+"&firstName="+firstName+"&lastName="+lastName+"&dd="+dd+"&mm="+mm+"&yyyy="+yyyy+"&state="+state+"&firstIdNumber="+firstIdNumber+"&postalCode="+postalCode+"&streetName="+streetName+"&streetType="+streetType+"&unitNumber="+unitNumber+"&suburb="+suburb+"&buildingNumber="+houseNumber+"&buildingName="+buildingName+"&city="+city+"&nationalIdType="+nationalIdType+"&telephone="+telephone+"&telephone2="+telephone2+"&mobileNumber="+mobileNumber+"&idType="+idType.split(",")[0]+"&firstIdExpireDate="+firstIdExpireDate+"&customerId="+custID+"&customerfrom="+customerfrom,
        					async : false,
        					success : function(response){
        					//alert('response===='+response);
        					if(response=='match'){
        						testVal='match';
        						//alert('match==='+testVal);
        						$('#form').submit();

        					}

        					},
        					error : function(error , xhr , status){
        						//alert('getAllCountries error = '+xhr);
        					}
        					
        					
        				});
        				
        			}
        		
    			if(testVal=='match'){
    				submitForm('false','rapidid');
    				}
	
        		
        		if(testVal!='match'){
         		$('#myModal').modal('show');
         		$('#kycstatus').val("N");
    			$('#doneby').val('rapidid');
        		}
    	}
      

     	if(idType.split(",")[0]=='2'){
     		var testVal='';	
    		//alert('state==='+state);
    			//alert('countryISO==='+countryISO);
    			//data = "countryISO="+countryISO+"&firstName="+firstName+"&lastName="+lastName+"&dd="+dd+"&mm="+mm+"&yyyy="+yyyy+"&state="+state+"&firstIdNumber="+firstIdNumber+"&postalCode="+postalCode+"&streetName="+streetName+"&streetType="+streetType+"&unitNumber="+unitNumber+"&suburb="+suburb+"&buildingNumber="+houseNumber+"&buildingName="+buildingName+"&city="+city+"&nationalIdType="+nationalIdType+"&telephone="+telephone+"&telephone2="+telephone2+"&mobileNumber="+mobileNumber+"&idType="+idType.split(",")[0];
        		//alert('data===='+data);
    			if(trid=='yes' && tname=='yes'){
    				//alert('gfhghghghg');
        				$.ajax({
        					url : "validateCustomer",
        					type : "get",
        					data : "countryISO="+countryISO+"&firstName="+firstName+"&lastName="+lastName+"&dd="+dd+"&mm="+mm+"&yyyy="+yyyy+"&state="+state+"&firstIdNumber="+firstIdNumber+"&postalCode="+postalCode+"&streetName="+streetName+"&streetType="+streetType+"&unitNumber="+unitNumber+"&suburb="+suburb+"&buildingNumber="+houseNumber+"&buildingName="+buildingName+"&city="+city+"&nationalIdType="+nationalIdType+"&telephone="+telephone+"&telephone2="+telephone2+"&mobileNumber="+mobileNumber+"&idType="+idType.split(",")[0]+"&firstIdExpireDate="+firstIdExpireDate+"&customerId="+custID+"&customerfrom="+customerfrom,
        					async : false,
        					success : function(response){
        					//alert('response===='+response);
        					if(response=='match'){
        						testVal='match';
        						$('#form').submit();
				
        					}

        					},
        					error : function(error , xhr , status){
        						//alert('getAllCountries error = '+xhr);
        					}
        					
        					
        				});
        				
        			}
    		       if(testVal=='match'){
    			submitForm('false','manual');	
    		       }
       if(testVal!='match'){
         	 $('#international_myModal').modal('show');
     		$('#kycstatus').val("N");
			$('#doneby').val('Manual');
     	}
     	}
    }
    
    else{
    	$('#agree').focus().css('outline','solid red 2px');
    	return false;
    }
 }else{
		$('#form').submit();

    }
 	
	});	
});

</script>

<script type="text/javascript">
function getStates(){
	var countryISO=$('#country').val();
	//alert('countryISO = '+countryISO);
	/* $.ajax({
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
			$('#cityOrState').empty();
			$('#cityOrState').append(opt+opt1);
		},
		error : function(xhr,error,status){
			alert('get states error = '+xhr);
		}
	});
	 */
}


</script>
<script type="text/javascript">
function setIdFields(){
	var idType=$('#firstIdProofType').val();
	//alert('idType==='+idType.split(",")[1]);
	$('#id-label').empty();
	$('#stateOfIssueLabel').empty();

	
	if(idType.split(",")[1]=='none'){
		$('#senderId').hide();
		$('#idexpire').hide();
		$('#nationalId').show();
		var countryISO=$('#country').val();
		$('#nationalIdType').empty();
		$('#nationalIdTypeLabel').append('National IdType');
		$('#id-label').append('National Id Number');
		$.ajax({
			url : "/common/getNationalIdTypes",
			type : "get",
			data : "countryISO="+countryISO,
			async : false,
			success : function(response){
				var nationalIdlist = JSON.stringify(response, undefined, '\t');
				//alert('nationalIdlist==='+nationalIdlist);
				var opt1='<option value="">--Select*--</option>';
				 $.each($.parseJSON(nationalIdlist),function(idx,obj){
                	 opt1=opt1+'<option value="'+obj.nationalIdType+'">'+obj.nationalIdType+'</option>';
				 });
				 $('#nationalIdType').append(opt1);
			},
			error : function(error , xhr , status){
				//alert('getAllCountries error = '+xhr);
			}
			
			
		});
		

		
	}
	if(idType.split(",")[1]!='none'){
		$('#senderId').show();
		$('#nationalId').hide();
		$('#idexpire').show();
	}
	
 	
 if(idType.split(",")[1]=='country'){
		$('#id-label').append('Id Number');	
		$('#stateOfIssueLabel').append('Id Issue Country');
		$('#issuingCountry').empty();
		$.ajax({
			url : "/common/getallcountrys",
			type : "get",
			async : false,
			success : function(response){
				var countryList = JSON.stringify(response, undefined, '\t');
				//alert('countryList==='+countryList);
				var opt1='<option value="">--Select*--</option>';
				 $.each($.parseJSON(countryList),function(idx,obj){
                	 opt1=opt1+'<option value="'+obj.countryISO+'">'+obj.countryName+'</option>';
				 });
				 $('#issuingCountry').append(opt1);
			},
			error : function(error , xhr , status){
				//alert('getAllCountries error = '+xhr);
			}
			
			
		});
		
	}else if(idType.split(",")[1]=='state'){
		$('#id-label').append('Id Number');	
		$('#stateOfIssueLabel').append('Id Issue State');

		var countryISO=$('#country').val();
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
					opt1=opt1+'<option value="'+obj.countryISO+'">'+obj.stateName+'</option>';
				 });
				$('#issuingCountry').empty();
				
				$('#issuingCountry').append(opt+opt1);
			},
			error : function(xhr,error,status){
				alert('get states error = '+xhr);
			}
		});
	}
	
if(idType=='03'){
	$('#id-label').append('Medicare Number');	
	$('#stateOfIssueLabel').append('Medicare State Of Issue');
	$('#cardTypeDiv').show();
 	$('#individualRefNoDiv').show();
	}else{
		$('#cardTypeDiv').hide();
	 	$('#individualRefNoDiv').hide();
	}
}
</script>
<!-- <script type="text/javascript">
$(function () {
	$('#datepicker').datepicker({
		format: "dd.mm.yyyy"
		}); 
});
</script> -->
<script type="text/javascript">
$(function () {
    $("#datepicker").datepicker({
        changeMonth: true,
        changeYear: true
    });
});

</script>
<script type="text/javascript">
function removeError(id){
	//alert("id is "+id);
	$('#'+id).css('outline','#B0C4DE');
}
function onlyNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode!=46) {
        return false;
    }
    return true;
}
</script>
<script type="text/javascript">
	function convertToUppercase(aControl)
	{
	var cursorKeys ="8;46;37;38;39;40;33;34;35;36;45;";
	aControl.value = aControl.value.toUpperCase();
	}
</script>
</head>

<body>
<%-- <%@include file="header4.jsp" %> --%>
<%@include file="myacc_header.jsp" %> 
<div id="main-wrapper01"> 
<!-- <div class="container">

     <nav aria-label="breadcrumb w100">
        <ol class="breadcrumb">
          <li class="breadcrumb-item" aria-current="page"><a href="">Amount</a></li>
          <li class="breadcrumb-item active"><a href="">You</a></li>
          <li class="breadcrumb-item active">Recipient</li>
          <li class="breadcrumb-item active">Review</li>
          <li class="breadcrumb-item active">Pay</li>
        </ol>
      </nav>  
   </div> -->
   <input type="hidden" id="custID" name="custID" value="${customer.customerId}">
 <input type="hidden" id="trid" name="trid" value="${trid}">
  <input type="hidden" id="emai" name="email" value="${customer.emailId}"/>
  <input type="hidden" id="tname" name="tname" value="${tr.firstName}">
  <input type="hidden"  id="customerfrom" name="customerfrom" value="boot">
  <div class="container fill"><br>
  <div class="row">
  <div class="col-md-8 col-md-offset-2 map-places">
    <div id="content" class="main-form">
    <div class="fill-details">
      <div class="urdetails text-center"><br>
        <h3>Fill in your details</h3>
        <p class="text-secondary">Please enter the details as they appear in your government issued ID</p>
      </div>
      <input type="hidden" id="manualIdUploadFlag" value=""/>
      <div class="row">
        <div class="col-md-12  my-5">
        		<input type="hidden" name ="modeOfPayment" id="modeOfPayment" value="${model.modeOfPayment}">	
		<input type="hidden" id="paymentType" name="paymentType" value="${model.paymentType}">
		<input type="hidden" id="toCountry" name="receivingBranch" value="${model.receivingBranch}"/>
		<input type="hidden" id="fromCountry" name="sendingBranch" value="${model.sendingBranch}"/> 
		<input type="hidden" id="adminId" name="adminId" value="${model.adminId}"/>
		<input type="hidden" name="sendingAmount" id="sendingAmount" value="${model.sendingAmount}"/>
		 <input type="hidden" name="deliveryTime" value="${model.deliveryTime}"> 
        <input type="hidden" name="amount" id="amount" value="">
          <form id="form" action="updatecustomer" method="post" enctype="multipart/form-data"/>
		<input type="hidden" name ="modeOfPayment" id="modeOfPayment" value="${model.modeOfPayment}">	
		<input type="hidden" id="paymentType" name="paymentType" value="${model.paymentType}">
		<input type="hidden" id="toCountry" name="receivingBranch" value="${model.receivingBranch}"/>
		<input type="hidden" id="fromCountry" name="sendingBranch" value="${model.sendingBranch}"/> 
		<input type="hidden" id="adminId" name="adminId" value="${model.adminId}"/>
		<input type="hidden" name="sendingAmount" value="${model.sendingAmount}"/>
		 <input type="hidden" name="deliveryTime" value="${model.deliveryTime}"> 
		<input type="hidden" name="msidnInformationId" value="${msidnInformationId}">
		 <input type="hidden" id="dob" name="dob" value=""/>	
		<input type="hidden" name="firstIdExpireDate" id="firstIdExpireDate" value=""/> 	
		<input type="hidden" name="kycstatus" id="kycstatus" value="">
		<input type="hidden" name="idUploadLaterFlag" id="idUploadLaterFlag"/>
		<input type="hidden" name="doneby" id="doneby" value="">
		<input type="hidden" id="c_country" value="${customer.country.countryName}">
		<%-- <input type="hidden" id="customerSignUpFlag" name="customerSignUpFlag" value="${customer.customerSignUpFlag}"/> --%>
		
			            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="fname">Full legal first and middle names </label>
                <input type="text" class="form-control" id="firstName" name="firstName" value="${customer.firstName}" readonly onkeyup="removeError('firstName');" placeholder="Full legal first and middle names">
              </div>
             
              <div class="form-group col-md-6">
                <label for="lname">Full legal last name(s) </label>
                <input type="text" class="form-control" id="lastName" name="lastName"value="${customer.lastName}" readonly placeholder="Full legal last name" onkeyup="removeError('lastName');">
              </div>
            </div>
		                       <div class=" col-md-6" id="dobDiv">
              <div class="row">
                <div class="form-group col-md-4 col-xs-4 mbl-zero3 mbl-dob">
                <label for="date">Date of Birth</label>
                <input type="text" class="form-control" id="date" value="${day}" maxlength="2" onkeypress="return onlyNumber(event)" placeholder="DD" onkeyup="removeError('date');">
              </div>
              <div class="col-md-5 col-xs-5 mbl-zero">
                <label for="month">&nbsp;</label>
                <div class="form-group mbl-dob">
                  <select class="form-control" name="month" id="month" >
                    <option value="01" selected="selected">January</option>
                    <option value="02">February</option>
                    <option value="03">March</option>
                    <option value="04">April</option>
                    <option value="05">May</option>
                    <option value="06">June</option>
                    <option value="07">July</option>
                    <option value="08">August</option>
                    <option value="09">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                  </select>
                </div>
                </div>
                <div class="form-group col-md-3 col-xs-3 mbl-zero2 mbl-dob">
                <div class="">
                  <label for="">&nbsp;</label>
                  <input type="text" class="form-control" id="year" value="${year}" maxlength="4" onkeypress="return onlyNumber(event)"placeholder="YYYY" onkeyup="removeError('year');">
                </div>

              </div> 
               
              </div>
              </div>
				              <div class="form-group col-md-6 mbl-dob"> 
                 <label for="month">Email Id </label>
                 <input type="phone" class="form-control" id="emailId" name="emailId" value="${customer.emailId}" readonly placeholder="Email address"onkeyup="removeError('emailId');"> 
              
              </div>
              
                           <div class="your-adress">
     <div class="hfive">
          <h5 class="page-header pb-2 mt-4 mb-3 border-bottom">Your Address</h5>
     </div>
     <div class="form-row">
          <div class="form-group col-md-6">
               <label for="country">Country</label>
               <select id="country" name="country" class="form-control custom-select" onchange="getStates()" readonly>
                <option value="${customer.country.countryISO}">${customer.country.countryName}</option>

                </select>
              </div></div>
              
                            <div class="form-group col-md-6">
                <label for="state">State</label>
                <select class="custom-select form-control" value=" " name="state" id="state" onchange="removeError('state');">
                <c:forEach var="list" items="${states}">
                <option value="${list.stateId}">${list.stateName}</option>
                </c:forEach>
                  </select>
              </div>
              
              
		<c:if test="${tr.firstName ne null || tr.firstName ne '' }">
              <div class="form-row">
            <c:if test="${tr.gender eq 'yes' }">
                 <div class=" col-md-6">
                <label for="month">Gender</label>
                <div class="form-group">
                  <select class="custom-select form-control" name="gender" id="gender"  value="${customer.gender}">
                    <option value="Male" >Male</option>
                    <option value="Female">Female</option>
                  </select>
                </div>
              </div>
            </c:if>
            
		<c:if test="${tr.mobileNumber eq 'yes' }">
		            <div class="form-row">
                  <div class="form-group col-md-2">
                  <label for="month">Mobile </label>
                        <div class="dropdown bootstrap-select form-control bg-transparent">
                          <span id="dailingCode" name="dailingCode"class="selectpicker form-control bg-transparent" required="" tabindex="-98">
                          <img src="images/countryimages/${currencyCode}.jpg" class="aud">
                          <span class="ccode">+${customer.country.dalingCode}</span>
                        </span> 
                        </div>
            	 </div>
              <div class="form-group col-md-4 mbl-dob"> 
                <div class="mob">
                  <label for="">&nbsp;</label>
                 <input type="phone" class="form-control" value="${customer.mobileNumber}" id="mobileNumber" name="mobileNumber" value="${customer.mobileNumber}"placeholder="Mobile number"onkeyup="removeError('mobileNumber');" onkeypress="return onlyNumber(event)"> 
                </div>
              </div>
              </div>
		</c:if>
		
		
	
 		<c:if test="${tr.occupation eq 'yes' }">
              <div class="form-group col-md-6 mbl-dob" id="occupationn">
                <label for="lname">Occupation</label>
                <input type="text" class="form-control" value="${customer.occupationn} " id="occupation" name="occupation" placeholder="Enter Occupation" onkeyup="removeError('occupation');">
              </div></c:if>
              
 		<c:if test="${tr.citizenship eq 'yes' }">
              
                <div class="form-group col-md-6 mbl-dob">
                <label for="lname">Citizenship</label>
              <select class="form-control custom-select" value="${customer.Citizenship} " id="citizenship" name="citizenship" onchange="removeError('citizenship');">
              <option value="">--select--</option>
              <c:forEach var="list" items="${countryList}">
              <option value="${list.countryISO}-${list.countryName}">${list.countryName}</option>
              </c:forEach>
              </select>
              </div>
              </c:if>
              </div>
            </div>
</div>
</div>

       
              
              <c:if test="${tr.address1 eq 'yes' }">
          <div class="form-group col-md-6">
                <label for="Address">Address</label>
            
                <input type="text" value="${customer.address1} " class="form-control" id="address1" name="address1" placeholder="First line of your address" onkeyup="removeError('address');">
            </div>
</c:if>

                        <div class="form-row">
              <c:if test="${tr.suburb eq 'yes' }">
              <div class="form-group col-md-6">
                <label for="suburb">Suburb</label>
                <input type="text" class="form-control" value="${customer.suburb} " id="suburb" name="suburb" placeholder="Suburb area" onkeyup="removeError('suburb');">
              </div></c:if>
              <c:if test="${tr.houseNumber eq 'yes' }">
              <div class="form-group col-md-6">
                <label for="suburb">Building Number</label>
                <input type="text" class="form-control" value="${customer.houseNumber} " id="houseNumber" name="houseNumber" placeholder="HouseNumber " onkeyup="removeError('houseNumber');">
              </div></c:if>
              <c:if test="${tr.buildingName eq 'yes' }">
              <div class="form-group col-md-6">
                <label for="suburb">BuildingName</label>
                <input type="text" class="form-control" value="${customer.buildingName} " id="buildingName" name="buildingName" placeholder="BuildingName " onkeyup="removeError('buildingName');">
              </div></c:if>


                        <div class="form-row">
              <c:if test="${tr.unitNumber eq 'yes' }">
              <div class="form-group col-md-6">
                <label for="unitNumber">unitNumber</label>
                <input type="text" class="form-control" value="${customer.unitNumber} " id="unitNumber" name="unitNumber" placeholder="UnitNumber " onkeyup="removeError('unitNumber');">
              </div></c:if>
              
                         <div class="form-row">
              <c:if test="${tr.streetName eq 'yes' }">
              <div class="form-group col-md-6">
                <label for="streetName">streetName</label>
                <input type="text" class="form-control" value="${customer.streetName}" id="streetName" name="streetName" placeholder="StreetName " onkeyup="removeError('streetName');">
              </div></c:if>
 
                          <div class="form-row">
              <c:if test="${tr.streetType eq 'yes' }">
              <div class="form-group col-md-6">
                <label for="streetType">streetType</label>
                <input type="text" class="form-control" value="${customer.streetType}" id="streetType" name="streetType" placeholder="StreetType" onkeyup="removeError('streetType');">
              </div></c:if>
                           <div class="form-row">
              <c:if test="${tr.city eq 'yes' }">
              <div class="form-group col-md-6">
                <label for="city">city</label>
                <input type="text" class="form-control" value="${customer.city}" id="city" name="city" placeholder="City" onkeyup="removeError('city');">
              </div></c:if>
                             <div class="form-row">
              <c:if test="${tr.telephone eq 'yes' }">
              <div class="form-group col-md-6">
                <label for="telephone">telephone</label>
                <input type="text" class="form-control" value="${customer.telephone} " id="telephone" name="telephone" placeholder="Telephone" onkeyup="removeError('telephone');">
              </div></c:if>
               <c:if test="${tr.telephone2 eq 'yes' }">
              <div class="form-group col-md-6">
                <label for="telephone2">telephone2</label>
                <input type="text" class="form-control" value="${customer.telephone2}" id="telephone2" name="telephone2" placeholder="Telephone2" onkeyup="removeError('telephone2');">
              </div></c:if>
                           
              
              <c:if test="${tr.postalCode eq 'yes' }">
              <div class="form-group col-md-6">
                <label for="postcode">Postcode</label>
                <input type="text" class="form-control" value="${customer.postalCode}" id="postalCode" name="postalCode" placeholder="Your postcode" onkeyup="removeError('postalCode');">
              </div></c:if>
				</c:if>
				
				
				<c:if test="${tr eq null || tr eq '' }">
		
              <div class="form-row">
                 <div class=" col-md-6">
                <label for="month">Gender</label>
                <div class="form-group">
                  <select class="custom-select form-control" name="gender" id="gender" >
                    <option value="Male" >Male</option>
                    <option value="Female">Female</option>
                  </select>
                </div>
              </div>
              
            <div class="form-row">
           
                  <div class="form-group col-md-2">
                  
                  
                  <label for="month">Mobile </label>
                        <div class="dropdown bootstrap-select form-control bg-transparent">
                          <span id="dailingCode" name="dailingCode"class="selectpicker form-control bg-transparent" required="" tabindex="-98">
                          <img src="images/countryimages/${currencyCode}.jpg" class="aud">
                          <span class="ccode">+${customer.country.dalingCode}</span>
                        </span> 
                        </div>
                       
            	 </div>
              <div class="form-group col-md-4 mbl-dob"> 
                <div class="mob">
                  <label for="">&nbsp;</label>
                 <input type="phone" class="form-control" id="mobileNumber" name="mobileNumber" value="${customer.mobileNumber}"placeholder="Mobile number"onkeyup="removeError('mobileNumber');" onkeypress="return onlyNumber(event)"> 
                </div>
              </div>
              <div class="form-group col-md-6 mbl-dob" id="occupationn">
                <label for="lname">Occupation</label>
                <input type="text" class="form-control"  id="occupation" name="occupation" value="${customer.occupation}" placeholder="Enter Occupation" onkeyup="removeError('occupation');">
              </div>
                <div class="form-group col-md-6 mbl-dob">
                <label for="lname">Citizenship</label>
              <select class="form-control custom-select" id="citizenship" name="citizenship" onchange="removeError('citizenship');">
              <option value="">--select--</option>
              <c:forEach var="list" items="${countryList}">
              <option value="${list.countryISO}-${list.countryName}">${list.countryName}</option>
              </c:forEach>
              </select>
              </div>
              </div>
            </div>
</div>
</div>

       
             <div class="your-adress">
     <div class="hfive">
          <h5 class="page-header pb-2 mt-4 mb-3 border-bottom">Your Address</h5>
     </div>
          <div class="form-group col-md-6">
                <label for="Address">Address</label>
                <input type="text" class="form-control" id="address" name="address" value="${customer.address1}" placeholder="First line of your address" onkeyup="removeError('address');">
            </div>
              <div class="form-group col-md-6">
                <label for="suburb">Building Number</label>
                <input type="text" class="form-control" id="houseNumber" name="houseNumber" value="${customer.houseNumber}" placeholder="houseNumber " onkeyup="removeError('houseNumber');">
              </div>
                        <div class="form-row">
              <div class="form-group col-md-6">
                <label for="suburb">BuildingName</label>
                <input type="text" class="form-control" id="buildingName" name="buildingName" value="${customer.buildingName}" placeholder="buildingName " onkeyup="removeError('buildingName');">
              </div>


                        <div class="form-row">
              <div class="form-group col-md-6">
                <label for="unitNumber">UnitNumber</label>
                <input type="text" class="form-control" id="unitNumber" name="unitNumber" value="${customer.unitNumber}" placeholder="UnitNumber " onkeyup="removeError('unitNumber');">
              </div>
              
                         <div class="form-row">
              <div class="form-group col-md-6">
                <label for="streetName">StreetName</label>
                <input type="text" class="form-control" id="streetName" name="streetName" value="${customer.streetName}" placeholder="StreetName " onkeyup="removeError('streetName');">
              </div>
 
                          <div class="form-row">
              <div class="form-group col-md-6">
                <label for="streetType">StreetType</label>
                <input type="text" class="form-control" id="streetType" name="streetType" value="${customer.streetType}" placeholder="StreetType" onkeyup="removeError('streetType');">
              </div>
                           <div class="form-row">
              <div class="form-group col-md-6">
                <label for="city">City</label>
                <input type="text" class="form-control" id="city" value="${city}" name="city" placeholder="City" onkeyup="removeError('city');">
              </div>
                             <div class="form-row">
              <div class="form-group col-md-6">
                <label for="telephone">Telephone</label>
                <input type="text" class="form-control" id="telephone" value="${customer.telephone}" name="telephone" placeholder="Telephone" onkeyup="removeError('telephone');">
              </div>

            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="suburb">Suburb</label>
                <input type="text" class="form-control" id="suburb" name="suburb" value="${customer.suburb}" placeholder="Suburb area" onkeyup="removeError('suburb');">
              </div>

              <div class="form-group col-md-6">
                <label for="postcode">Post code</label>
                <input type="text" class="form-control" value="${customer.postalCode}" id="postalCode" name="postalCode" placeholder="Your postcode" onkeyup="removeError('postalCode');">
              </div>

              
           </c:if>
       <div id="idDiv">
<div class="id-details">
<div class="hfive">
            <h5 class="page-header pb-2 mt-4 mb-3 border-bottom">Your ID Details</h5>
</div>
            <div class="form-row">
              <div class="form-group col-md-6 mbl-id" id="senderId1">
                <label for="idType">ID Type</label>
                 <select class="form-control custom-select" id="firstIdProofType" onchange="setIdFields();removeError('firstIdProofType');"name="firstIdProofType">
                <option value="">--Select*--</option>
     <c:forEach var ="list" items="${ids}">
 <option value="${list.idValue},${list.issuingAuthority},${list.senderType}">${list.senderType}</option>
				          </c:forEach> 
                </select>
              </div>
              <div class="form-group col-md-6" id="dl">
                <label for="idNumber" id="id-label"></label>
                <input type="text" class="form-control" id="firstIdNumber" name="firstIdNumber" placeholder="ID Number" onkeyup="removeError('firstIdNumber');">
              </div>
                     <div id="nationalId">  
              
              <div class="form-group col-md-6 col-xs-12" id="soIssueDiv">
                <label for="nationalIdType" id="nationalIdTypeLabel"></label>
                <select class="form-control custom-select" id="nationalIdType" name="nationalIdType" onchange="removeError('nationalIdType');">
                	 <option value="">--Select*--</option>
                </select>
              </div></div>
              
              
              
              
              <div class="clearfix"></div>
                 <div class="form-group col-md-6 mbl-id" id="cardTypeDiv">
                <label for="idNumber">Card type (optional)</label>
                <input type="text" class="form-control" id="cardType" name="cardType" maxlength="1" value="G" readonly placeholder="G" onkeyup="removeError('cardType');convertToUppercase(this)">
              </div>
                 <div class="form-group col-md-6" id="individualRefNoDiv">
                <label for="idNumber">Individual Reference Number</label>
                <input type="text" class="form-control" id="individualRefNo" name="individualRefNo" maxlength="1" placeholder="1" onkeyup="removeError('individualRefNo');"onkeypress="return onlyNumber(event)">
              </div>
              <div class="clearfix"></div>
              <div id="idexpire">
              <div class="form-group col-md-2 col-xs-4 col-sm-4 mbl-zero3 mbl-id">
                <label for="date">ID Expiry</label>
                <input type="text" class="form-control"  onkeyup="removeError('firstIdExpireDate');"  maxlength="2"  placeholder="DD" id="iddate" name="firstIdExpireDate" >
            
              </div>
              <div class="col-md-2 col-xs-4 col-sm-4 mbl-zero mbl-id">
                <label for="month">&nbsp;</label>
                <div class="form-group">
                  <select class="custom-select form-control" name="month" id="idmonth">
                    <option value="01" selected="selected">January</option>
                    <option value="02">February</option>
                    <option value="03">March</option>
                    <option value="04">April</option>
                    <option value="05">May</option>
                    <option value="06">June</option>
                    <option value="07">July</option>
                    <option value="08">August</option>
                    <option value="09">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                  </select>
                </div>
                </div>
                <div class="form-group col-md-2 col-xs-4 col-sm-4 mbl-zero2 mbl-id">
                <div class="">
                  <label for="">&nbsp;</label>
                  <input type="text" class="form-control" id="idyear" maxlength="4" onkeypress="return onlyNumber(event)"placeholder="YYYY" onkeyup="removeError('year');">
                </div>

              </div> </div>
                            <div id="senderId">  
              
              <div class="form-group col-md-6 col-xs-12" id="soIssueDiv">
                <label for="idNumber" id="stateOfIssueLabel"></label>
                <!-- <input type="text" class="form-control" id="idIssuer" placeholder="ID Issuer"> -->
                <select class="form-control custom-select" id="issuingCountry" name="issuingCountry" onchange="removeError('issuingCountry');">
                	 <option value="">--Select*--</option>
                	                	 <c:forEach var="list" items="${statesList}">
                <option value="${list.countryISO}">${list.stateName}</option>
              </c:forEach>
                </select>
              </div></div>
           <div class="clearfix"></div>
          
            </div></div>
            
            <div class="form-group">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" name="agree"id="agree"onkeyup="removeError('agree');" >
                <label class="form-check-label" for="gridCheck">
                  By clicking this button I confirm that I am authorised to provide the personal details presented and I consent to my information being checked with the document issuer or official record holder via third party systems for the purpose of confirming my identity.
                </label>
              </div>
            </div>
            </div>
      
      
            <div class="text-center">
  <!--            <button type="submit" class="btn btn-primary">Continue</button>  -->
           <!-- <a href="send-3" class="btn btn-primary btn-lg">Continue</a> -->  
            <button type="button" class="btn btn-primary btn-lg" id="continue">Continue</button>
            </div>
           
           
         
  
  
 			<div class="modal" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        <label for="idType" style="margin: 0 0 0 39%;color: cornflowerblue;"><b style="font-size: 224%;">Oops....!</b></label>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
        
        </div>
      <div class="modal-body">
          <p>We could not verify your ID online! To provide you a safe and secure service, please upload <br>
          the following documents to verify your ID.</p>

<p>Type A: <b>One</b> from the following<br>
		o	 driver licence<br>
		o	 passport<br>
		o	International passport<br>
<br>
<input type='file' name="firstIdProofDoc1" id="firstIdProofDoc1" onclick="removeError('firstIdProofDoc1')" placeholder="ID Proof Image" title="ID PROOF IMAGE" class='form-control'><br>
Type B: <b>One</b> from the following<br>
	o	Gas bill letter (not more than 3 months old)<br>
	o	Electricity bill (not more than 3 months old)<br>
	o	Internet/NBN/Mobile bill (not more than 3 months old)<br>
	o	Bank Statement (not more than 3 months old)<br>
</p>
         <!--  <div id="select_file_one_show"> --> 
          <!-- <span class="file">Select file :</span> -->
          <!-- <input type='file' name="firstIdProofDoc1" id="firstIdProofDoc1" onclick="removeError('firstIdProofDoc1')" placeholder="ID Proof Image" title="ID PROOF IMAGE" class='form-control'><br> -->
         
         <!-- <p>Upload your address proof.</p>
          <span class="file">Select file :</span> -->
          <input type='file' name="address_proof1" id="address_proof_one" onclick="removeError('address_proof_one')" placeholder="ID Proof Image" title="ID PROOF IMAGE" class='form-control' ><br>
         <!-- </div> -->
    </div>
    
     <div class="modal-footer">
        <!-- <button type='button' class='btn btn-info' id='first_id_btn_upload' onclick="submitForm('false','rapidid')">Upload Now</button><button type='button' class='btn btn-info' id='first_id_btn_upload_later' onclick="submitForm('true','rapidid')">Upload Later</button> -->
      <button type='button' class='btn btn-info' id='first_id_btn_upload' onclick="submitForm('false','rapidid')">Upload Now</button><!-- <button type='button' class='btn btn-info' id='first_id_btn_upload1' onclick="submitForm('false','rapidid')">Upload</button> --><button type='button' class='btn btn-info' id='first_id_btn_upload_later' onclick="submitForm('true','rapidid')">Upload Later</button>
      </div>
      
      
    </div>
  </div>
  </div>
  			<div class="modal" id="international_myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
       <label for="idType" style="margin: 0 0 0 45%;color: cornflowerblue;"><b>Oops....!</b></label>
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

<!--  <div id="select_file_two_show"> -->
          <!-- <span class="file">Select file :</span> -->
          <!-- <input type='file' name="international_passport" id="international_passport" onclick="removeError('international_passport')" placeholder="ID Proof Image" title="ID PROOF IMAGE" class='form-control' ><br> -->
    
          <!-- <p>Upload your address proof.</p>
          <span class="file">Select file :</span> -->
          <input type='file' name="address_proof" id="address_proof" onclick="removeError('address_proof')" placeholder="ID Proof Image" title="ID PROOF IMAGE" class='form-control' ><br>
    <!-- </div> -->
     <div class="modal-footer">
        <!-- <button type='button' class='btn btn-info' id='first_id_btn_upload' onclick="submitForm('false','manual')">Upload Now</button><button type='button' class='btn btn-info' id='first_id_btn_upload_later' onclick="submitForm('true','manual')">Upload Later</button> -->
        <button type='button' class='btn btn-info' id='first_id_btn_upload_second' onclick="submitForm('false','manual')">Upload Now</button><!-- <button type='button' class='btn btn-info' id='first_id_btn_upload11' onclick="submitForm('false','manual')">Upload</button> --><button type='button' class='btn btn-info' id='first_id_btn_upload_later' onclick="submitForm('true','manual')">Upload Later</button>
      </div>
      
      
    </div>
  </div>
  </div>
          </form>  

        </div><!-- /.container ENDs -->

</div>
   </div>
  </div><!-- /.container ENDs -->
  
</div></div></div>
 
</body>

<script type="text/javascript">

function submitForm(flag,vType){
	$('#first_id_btn_upload').attr('disabled',true);
	$('#idUploadLaterFlag').val(flag);
	
	if(vType=='rapidid'){
		var firstIdProofDoc = $('#firstIdProofDoc1').val();
		var address_proof_one = $('#address_proof_one').val();
		if(flag=='false'){
			if(firstIdProofDoc=='')
			{
					$("#firstIdProofDoc1").css('outline','red solid 2px').focus();
					 return false;
			}	
			if(address_proof_one=='')
			{
					$("#address_proof_one").css('outline','red solid 2px').focus();
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


function myblockUI()	{
	 $.blockUI({
		  //overlayCSS: { backgroundColor: '#e0dee0' },
		  message: '<h3><img src="${pageContext.request.contextPath}/images/demo_wait.gif" height="100" width="100"/>Verifying information...</h3>',
		  //message: '<h3><img src="${pageContext.request.contextPath}/resources/images/loader.gif" height="100" width="100"/>Verifying ID Proof...</h3>',
		  css: { 
	          border: 'none', 
	          padding: '15px', 
	          backgroundColor: '#e0dee0'
	      }
		  
		  });
}

/* function openModal(){
	$('#international_myModal').modal('show');
} */
/* function showSelectFile(id){
	$('#'+id).show();
	$('#first_id_btn_upload').hide();
	$('#first_id_btn_upload1').show();
}
function showSelectFileInternational(id){
	$('#'+id).show();
	$('#first_id_btn_upload_second').hide();
	$('#first_id_btn_upload11').show();
}
 */

</script>

<style>
    
    @media only screen and (max-width:767px){
    .mbl-zero{
    padding:0px;
    }
    .mbl-zero2{
    padding-left:0px;
    }
    
        .mbl-zero3{
    padding-right:0px;
    }
    
    div#soIssueDiv {
    margin-top: -15px;
    margin-bottom: 30px;
}
    
    
    }
   
</style>

</style>

</html>