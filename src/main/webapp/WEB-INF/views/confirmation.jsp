<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>

<head>
 <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
 <meta name="viewport" content="width=device-width,intial-scale=1.0">



  <!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>  -->
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.js"></script>
<script>
  function checkForm(form)
  {
   
     document.getElementById("mydiv").style.display="block";
      return true;
  }

    </script>
<!-- <a href="https://icons8.com/icon/61443/customer-support"></a> -->
<style> 

.ListingCountry button.dropdown-item:hover{
background:#74BBFB;
color:white;
}.banner h1{
    color: #fff;
    position: relative;
    font-size: 30px;
    margin-bottom: 20px;
}
   .banner {
    background-image:none !important;
 
     
     
    
  background-color: #cccccc !IMPORTANT; /* Used if the image is unavailable */
  height: 883px ; /* You must set a specified height */
  background-position: center; /* Center the image */
  background-repeat: no-repeat; /* Do not repeat the image */
  background-size: cover; /* Resize the background image to cover the entire container */
      margin-top: 18px
}

.A-Selected {
    color: #534c62;
    font-weight: 500;
    padding: 5px;
    padding-left: 0px;
    padding-top: 0px !important ;
    margin-top: 0px !important ;
}


.alert{
    padding: 0px !important ;
    margin-bottom: 0px !important ;
    border: 1px solid transparent;
    border-radius: 4px;
}


.Getstarted{  
  margin-top: 20px  !important;}
.started0{width: 392px !important;
    background-color: #ffd800 !important;
    color: #811e68  !important;
    border: 0px !important;
    height: 41px !important;
    position: relative;
    left: -12px;}
    #register  {
   background-image: url(resources/images/bgslider1.jpg) !important; 
  background-color: #cccccc;
  height: 410px !important; 
  background-size: cover;
    background-position: center top;
    background-repeat: no-repeat;
    background-attachment: fixed;
}
.flex-fill {
    -ms-flex: 1 1 auto!important;
    flex: 1 1 auto!important;
    border: 0px;
}
input:focus, textarea:focus, select:focus{
        outline: none !important;
    }
    
@media (max-width:767px){
	.container {
    width: 100%  !important;
}


.banner {
    padding: 10% 0 5%;
    margin-top: 15px;
        height: auto !important;
}

.banner.v3 .tagline {
    color: #fff;
    font-weight: 400;
    text-align: center;
    margin-top: 10px;
}

.banner .ban-content h1 {
    color: #fff;
       font-size: 28px !important;
    line-height: 50px !important;
        text-align: center !important;
}

.banner .ban-content p {
    color: #fff;
    font-size: 15px;
    line-height: 26px !important;
    text-align: center;
    margin-top: 10px;
}

 .send-receive-money {
  padding-right: 0px !important;
  margin-top: 0px;
} 


a.btn.btn-outline.btn-round {
    text-align: center;
    margin: 0 auto;
    display: block;
    margin-top: 30px;
    width: 60%;
}

.oneee {
    background-color: #f7f8f9 !important;

}

button#send {
    margin-left: 0px !important;
    margin-right: 0px !important;
    width: 100% !important;
    display: block;
    margin: 0px !important;
    left: 0px !important;
    right: 0px !important;
}

.media.iconBox.listBox-shadow {
    padding: 30px 15px 20px 46px;
}

.overview img {
    position: relative;
    left: -35px;
    width: 70px;
    height: 70px;
    object-fit: contain;
}

ul.steps li:last-child {
    margin-top: 30px;
   
}

.iconBox.boxed-shadow.text-center {
   
    height: auto;
    padding-bottom: 10px;
}
section.access-money.bg-offwhite {
    padding-top: 20px;
    text-align: center;
}
a.btn.btn-default {
    margin-bottom: 30px;
    margin-top: 10px;
}

.bg-offwhite {
    background-color: #f7faff;
    padding-top: 30px;
}

section.easy-steps{
 padding-top: 30px;
}

.services {
    background-color: white;
    padding-top: 0px;
}

.sec-heading {
    text-align: center;
    margin-bottom: 30px !important;
}

section.online-payment {
    text-align: center;
    margin-top: 0px;
    padding-top: 30px;
}


img.lappy {
    margin: 0 auto !important;
    display: block !important;
    left: auto !important;
    right: auto !important;
    width: auto !important;
}


.col-md-6.nopadd-rth {
    left: auto !important;
    margin-bottom: 25px;
}


.content-box-fluid.left {
    padding: 0px !important;
}

.footer .col-xs-6.col-md-2.col-md-offset-4.col-sm-4.col-sm-offset-2 {
    left: auto !important;
}

.col-xs-6.col-md-2.col-sm-4 {
    left: auto !important;
    margin-bottom: 15px;
}
button.navbar-toggler.collapsed {
    position: absolute;
    right: 15px;
}
.header-column.justify-content-start {
    margin-bottom: -180px !important;
}
.header03 {
    background-color: #fff;
    position: relative;
    height: auto;
    z-index: 9999;
}



.header03 .container {
    position: relative;
    height: 100%;
    margin-bottom: -50px;
}

.navbar-toggler {
    position: absolute !important;
    right: 15px;
}
ul.navbar-nav.mr-auto {
  margin-top: 0px !important;
    left: 0px !important;
    top: 0px !important;
    margin-top: 50px !important;
}

.header03 .primary-menu ul li a {
    color: #000 !IMPORTANT;
    line-height: 30px !important;
}

.header03 .login {
    text-transform: capitalize;
    top: 15px !important;
}

/* .steps li {
    font-size: 12px;
    -ms-flex-preferred-size: 50%;
    flex-basis: 50%;
    }
    .steps li {
    margin-bottom: 30px;
    } */
    

	
}

@media (min-width: 768px) and (max-width:991px){

.container {
    width: 100%  !important;
}
.ban-content {
    top: 60px !important;
    position: inherit !important;
}
.banner {
    padding: 0px !important ;
    margin-top: 0px;
        height: auto !important;
}

.banner.v3 .tagline {
    color: #fff;
    font-weight: 400;
    text-align: center;
    margin-top: 10px;
}

.banner .ban-content h1 {
    color: #fff;
       font-size: 28px !important;
    line-height: 50px !important;
        text-align: center !important;
}

.banner .ban-content p {
    color: #fff;
    font-size: 15px;
    line-height: 26px !important;
    text-align: center;
    margin-top: 10px;
}

 .send-receive-money {
  padding-right: 15px !important;
  margin-top: 155px;
} 


a.btn.btn-outline.btn-round {
    text-align: center;
    margin: 0 auto;
    display: block;
    margin-top: 30px;
    width: 60%;
}

.oneee {
    background-color: #f7f8f9 !important;

}

button#send {
    margin-left: 0px !important;
    margin-right: 0px !important;
    width: 100% !important;
    display: block;
    margin: 0px !important;
    left: 0px !important;
    right: 0px !important;
}

.media.iconBox.listBox-shadow {
    padding: 30px 15px 20px 46px;
    height:175px;
}

.overview img {
    position: relative;
    left: -35px;
    width: 70px;
    height: 70px;
    object-fit: contain;
}

/* ul.steps li:last-child {
    margin-top: 30px;
   
} */
.steps li:not(:last-child):after {
    content: '';
    position: absolute;
    top: 15px;
    left: 108px !important;
    right: -10px;
    bottom: 0;
    background-color: #f5f5f5;
    border-top: 1px solid #e0e0e0;
    border-bottom: 1px solid #e0e0e0;
    height: 5px;
    width: 74%;
}

.iconBox.boxed-shadow.text-center {  
    height: auto;
    padding-bottom: 10px;
}
section.access-money.bg-offwhite {
    padding-top: 20px;
    text-align: center;
}
a.btn.btn-default {
    margin-bottom: 30px;
    margin-top: 10px;
}

.bg-offwhite {
    background-color: #f7faff;
    padding-top: 30px;
}

section.easy-steps{
 padding-top: 30px;
}

.services {
    background-color: white;
    padding-top: 0px;
}

.sec-heading {
    text-align: center;
    margin-bottom: 30px !important;
}

section.online-payment {
    text-align: center;
    margin-top: 0px;
    padding-top: 30px;
}


img.lappy {
    margin: 0 auto !important;
    display: block !important;
    left: auto !important;
    right: auto !important;
    width: auto !important;
}


.col-md-6.nopadd-rth {
    left: auto !important;
    margin-bottom: 25px;
}


.content-box-fluid.left {
    padding: 0px !important;
}

.footer .col-xs-6.col-md-2.col-md-offset-4.col-sm-4.col-sm-offset-2 {
    left: auto !important;
        margin: 0 0 0 220px;
    
}

.col-xs-6.col-md-2.col-sm-4 {
    left: auto !important;
    margin-bottom: 15px;
}
button.navbar-toggler.collapsed {
    position: absolute;
    right: 15px;
}
.header-column.justify-content-start {
    margin-bottom: -180px !important;
}
.header03 {
    background-color: #fff;
    position: relative;
    height: auto;
    z-index: 9999;
}



.header03 .container {
    position: relative;
    height: 100%;
    margin-bottom: -50px;
}

.navbar-toggler {
    position: absolute !important;
    right: 15px;
}
ul.navbar-nav.mr-auto {
  margin-top: 0px !important;
    left: 0px !important;
    top: 0px !important;
    margin-top: 50px !important;
}

.header03 .primary-menu ul li a {
    color: #000 !IMPORTANT;
    line-height: 30px !important;
}

.header03 .login {
    text-transform: capitalize;
    top: 15px !important;
}

.services .btn {
    color: #fff;
    font-weight: 500;
    line-height: 0.8;
    text-transform: capitalize;
    min-width: 138px;
    padding: 12px 25px;
    position: relative;
    overflow: hidden;
    text-align: center;
    margin: 0 auto;
    display: block;
    position: relative;
    left: -13px;
    width: 6px !important;
}
    .access-money .offset-lg-1 {
    margin-left: 0% !important;
}
.access-money .content-box-fluid h2 {
    margin-bottom: 20px;
    color: #262934;
    font-size: 27px;
    text-align: left;
}
.access-money p{
     text-align: left;
}
.access-money .btn{    
    float: left;
}
.online-payment .content-box-fluid h2 {
    margin-bottom: 20px;
    color: #262934;
    font-size: 27px;
    text-align: left;
}
.online-payment p{
     text-align: left;
}
.online-payment .btn{    
    float: left;
}


}
</style>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
<meta charset="ISO-8859-1">
<title>Quick Send</title>
<script type="text/javascript">
$(document).ready(function(){
	$('#login').click(function(){
		$('#loginsignup').attr('action' , 'login');
		$('#loginsignup').submit();
	});
$('#signup').click(function(){
	$('#loginsignup').attr('action' , 'signup');
	$('#loginsignup').submit();
	});
	
});
</script>
<script type="text/javascript">
/* function setReceivingCountry(crCode,countryName,crName){ */
	function setReceivingCountry(tocountrydata){
		$('#toCountry').val(tocountrydata);
		tocountrydata=tocountrydata.split('-');
		$('#paymentMethod').val('');
	 $('.TooSearch').removeClass('ShowSearch')
	 $('#reciveClick').empty();
	 var i='<span><img src="resources/images/countryimages/'+tocountrydata[2].toLowerCase()+'.jpg" width="30px" height="30px"" class="rounded-circle"><span>'+tocountrydata[2]+'</span><i class="fa fa-chevron-down"></i></span>';
	 $('#reciveClick').append(i);
	 $('.ReciveInSendFrom').empty();
	// alert('tocountrydata[3]  ='+tocountrydata[3]);
	 $('#tocCode').empty();
	 $('#tocCode').append('<strong>'+tocountrydata[3]+'</strong>');
 	 //alert('<img src="AndorraFlag.png">'+countryName+'<span class="float-right">'+crName+'</span>');
	$('.ReciveInSendFrom').append('<img src="resources/images/countryimages/'+tocountrydata[2].toLowerCase()+'.jpg" width="30px" height="30px"">'+tocountrydata[3]+'<span class="float-right">'+tocountrydata[11]+' '+tocountrydata[2]+'</span>');
	resetCountries('receivingCountry'); 
}
function hideAndSelected(){
	$('.frmSearch').removeClass('ShowSearch')
	
}
</script>
<script type="text/javascript">
	$(document).ready(function(){

	
		var sendingBranch=$('#fromCountry').val();
		//alert('sendingBranch= = ='+sendingBranch);   
		sendingBranch=sendingBranch.split('-');
		  var modeOfPmt=sendingBranch[4].split(',');
		   var opt='';
		   
		   $.ajax({
			 url : "getmodeofpaymentlist",
			 type : 'get',
			 async :false,
			 success : function(response){
				// alert('response is = '+response);
				 var mopList = JSON.stringify(response, undefined, '\t');
				 //alert('mopList = '+mopList);
				 for(var i=0;i<modeOfPmt.length;i++){
					 //alert('modeOfPmt = '+modeOfPmt[i]);
					 $.each($.parseJSON(mopList),function(idx,obj){
					 if(obj.modeOfPayment==modeOfPmt[i]){
						 //alert('modeOfPayment = '+mopList.modeOfPayment);
					 //opt=opt+'<option value="'+obj.modeOfPayment+','+obj.fee+'">'+obj.modeOfPayment.toUpperCase()+'</option>';
						 var hlght_mop='';
						 if(i==0){
								   $('#paywith').empty();
								   $('#paywith').append(obj.modeOfPayment);
								   $('#modeOfPayment').val(obj.modeOfPayment+','+obj.fee);
								   hlght_mop=obj.modeOfPayment.replace(/\s/g,"&nbsp;");
								   $('#cnf_payment').empty();
									$('#cnf_payment').append(hlght_mop);
						 }
						 if(hlght_mop==obj.modeOfPayment){
							 opt=opt+'<button type="button" id="'+obj.modeOfPayment+'" onclick=getModeOfPaymentFee("'+obj.modeOfPayment.replace(/\s/g,"&nbsp;")+'","'+obj.fee+'"); class="dropdown-item_high"><li><i class="fa fa-bank"></i> '+obj.modeOfPayment+'</li></button>';
						 }else{
							 opt=opt+'<button type="button" id="'+obj.modeOfPayment.replace(/\s/g,'_')+'" onclick=getModeOfPaymentFee("'+obj.modeOfPayment.replace(/\s/g,"&nbsp;")+'","'+obj.fee+'"); class="dropdown-item"><li><i class="fa fa-bank"></i> '+obj.modeOfPayment+'</li></button>';
						 }
					 }
					 });
					 //opt=opt+'<option value="'+modeOfPayment[i]+'">'+modeOfPayment[i].toUpperCase()+'</option>';
				   } 
			 },
			 error : function(error){
				 alert('getModeOfPaymentError = '+error);
			 }
			 
		  });
		  /// alert('opt = '+opt);
		   $('.pay-with-class').empty();
		   $('.pay-with-class').append(opt);
		   
		   var selectedBr=$('#selected-rec-br').val();
		   var adminId=$('#adminId').val();
		   //alert('adminId = '+adminId);
		   /* -----------------get all receiving branches------------- */
		   var options="";
		    $.ajax({
				url : "getallRecevingBrannches",
				type : "POST",
				data : "branchId="+sendingBranch[1]+"&adminId="+adminId,
		       async  : false,
				success : function(response) {
					//alert('response = '+response);
					var branchList = JSON.stringify(response, undefined, '\t');
					//alert('branchList = '+branchList);
					var i=1;
					 $.each($.parseJSON(branchList),function(idx,obj){
							 if(i==1){
								 $('#reciveClick').empty();
								 $('#reciveClick').append('<span><img src="resources/images/countryimages/'+obj.fromCountry.currencyCode.toLowerCase()+'.jpg" width="30px" height="30px"" class="rounded-circle"><span>&nbsp;&nbsp;'+obj.fromCountry.currencyCode+'</span><i class="fa fa-chevron-down"></i></span>');
								 $('#toCountry').val(obj.fromCountry.countryISO+'-'+obj.branchId+'-'+obj.fromCountry.currencyCode+'-'+obj.fromCountry.countryName+'-'+obj.paymentMode+'-'+obj.modeOfPayment+'-'+obj.cashStatus+'-'+obj.cashDeleiveryTime+'-'+obj.bankStatus+'-'+obj.bankDeliveryTime+'-'+obj.ewalletStaus+'-'+obj.ewalletDeliverytime);
								 $('#receivein').empty();
								 $('#receivein').append('<small>They Recieve in '+obj.fromCountry.currencyCode+'</small>');
								 $('.ReciveInSendFrom').empty();
								 $('.ReciveInSendFrom').append('<img src="resources/images/countryimages/'+obj.fromCountry.currencyCode.toLowerCase()+'.jpg" width="30px" height="30px"">&nbsp;&nbsp;'+obj.fromCountry.countryName+'<span class="float-right">'+obj.fromCountry.countryName+' '+obj.fromCountry.currencyCode+'</span>');
								 
								 $('#tocCode').empty();
								 $('#tocCode').append('<strong>'+obj.fromCountry.countryName+'</strong>');
							 }
							 options=options+'<li  id="li-'+i+'-'+obj.fromCountry.countryISO+'"><button type="button" class="dropdown-item" onclick=setReceivingCountry("'+obj.fromCountry.countryISO+'-'+obj.branchId+'-'+obj.fromCountry.currencyCode+'-'+obj.fromCountry.countryName.replace(/\s/g,"&nbsp;")+'-'+obj.paymentMode.replace(/\s/g,"&nbsp;")+'-'+obj.modeOfPayment.replace(/\s/g,"&nbsp;")+'-'+obj.cashStatus+'-'+obj.cashDeleiveryTime.replace(/\s/g,"&nbsp;")+'-'+obj.bankStatus+'-'+obj.bankDeliveryTime.replace(/\s/g,"&nbsp;")+'-'+obj.ewalletStaus.replace(/\s/g,"&nbsp;")+'-'+obj.ewalletDeliverytime.replace(/\s/g,"&nbsp;")+'-'+obj.fromCountry.currencyName.replace(/\s/g,"&nbsp;")+'")><img src="resources/images/countryimages/'+obj.fromCountry.currencyCode.toLowerCase()+'.jpg" width="30px" height="30px"">&nbsp;'+obj.fromCountry.countryName+'<span class="float-right" style="font-size: 14px;font-weight: lighter;">'+obj.fromCountry.currencyName+' '+obj.fromCountry.currencyCode+'</span></button></li>';
					 i++;
					 });
					 /* i=Number(i)+1; */
					
				},
				error : function(xhr, status, error) {
					alert("status code:"+status);
					alert("error::"+error);
				}
			});  
		    //alert('options = ='+options);
			 $('#tcountry').empty();
			 $('#tcountry').append(options);
			// alert('options after= =');
			/* ----------------get payment type -------------- */
		 
		   /* ------------------- calculate transaction amount ---------------------- */
		 	 	getCurrencyRates();
		   
		   /* ________________send button onclick_____________________ */
		   
		 		
		   
	});
	</script>
	<script type="text/javascript">
	function validate(){
		var delivery_time=$('#delivery_time').val();
		var sendingAmount=$('#sendingAmount').val();
		 var receivingAmount=$('#receivingAmount').val();
			var sBranchMinLimit=$('#sendingBranchMinimumPerTransactionLimit').val();
		   	var rBranchMinLimit=$('#receivingBranchMinimumPerTransactionLimit').val();
		 if(Number(sendingAmount)>Number(sBranchMinLimit) && Number(receivingAmount)>Number(rBranchMinLimit)){
			 $('#sendForm').attr("method","POST");
				$('#sendForm').attr("action","newrecipient");
			   $('#sendForm').submit();
			
		   return true;
		}else{
			return false;
		} 
	}
	</script>
	
	<script type="text/javascript">
	function resetCountries(type){
		 var adminId=$('#adminId').val();
	 if(type=='sendingCountry'){
		var fromCountry=$('#fromCountry').val();
		var toCountry=$('#toCountry').val();
		fromCountry=fromCountry.split('-');
		 $('#fromCurrCode').empty();
		 $('#fromCurrCode').append('<strong>'+fromCountry[2]+'</strong>');
		toCountry=toCountry.split("-");
		var data="branchId="+fromCountry[1];
		var options='';
		 $.ajax({
			url : "getAllBranchesExceptGivenBranch",
			type : "POST",
			data : data,
			async : false,
			success : function(response){
				var branchList = JSON.stringify(response, undefined, '\t');
				$.each($.parseJSON(branchList),function(idx,obj){
					 if(toCountry[1]==obj.branchId){
						 $('#reciveClick').empty();
						 $('#reciveClick').append('<span><img src="resources/images/countryimages/'+obj.fromCountry.currencyCode.toLowerCase()+'.jpg" width="30px" height="30px"" class="rounded-circle"><span>&nbsp;&nbsp;'+obj.fromCountry.currencyCode+'</span><i class="fa fa-chevron-down"></i></span>');
						 $('#toCountry').val(obj.fromCountry.countryISO+'-'+obj.branchId+'-'+obj.fromCountry.currencyCode+'-'+obj.fromCountry.countryName+'-'+obj.paymentMode+'-'+obj.modeOfPayment+'-'+obj.cashStatus+'-'+obj.cashDeleiveryTime+'-'+obj.bankStatus+'-'+obj.bankDeliveryTime+'-'+obj.ewalletStaus+'-'+obj.ewalletDeliverytime);
						 $('#receivein').empty();
						 $('#receivein').append('<small>They Recieve in '+obj.fromCountry.currencyCode+'</small>');
						 $('.ReciveInSendFrom').empty();
						 $('.ReciveInSendFrom').append('<img src="resources/images/countryimages/'+obj.fromCountry.currencyCode.toLowerCase()+'.jpg" width="30px" height="30px"">&nbsp;&nbsp;'+obj.fromCountry.countryName+'<span class="float-right">'+obj.fromCountry.countryName+' '+obj.fromCountry.currencyCode+'</span>');
					 }
					 options=options+'<li  id="li-'+i+'-'+obj.fromCountry.countryISO+'"><button type="button" class="dropdown-item" onclick=setReceivingCountry("'+obj.fromCountry.countryISO+'-'+obj.branchId+'-'+obj.fromCountry.currencyCode+'-'+obj.fromCountry.countryName.replace(/\s/g,"&nbsp;")+'-'+obj.paymentMode.replace(/\s/g,"&nbsp;")+'-'+obj.modeOfPayment.replace(/\s/g,"&nbsp;")+'-'+obj.cashStatus+'-'+obj.cashDeleiveryTime.replace(/\s/g,"&nbsp;")+'-'+obj.bankStatus+'-'+obj.bankDeliveryTime.replace(/\s/g,"&nbsp;")+'-'+obj.ewalletStaus.replace(/\s/g,"&nbsp;")+'-'+obj.ewalletDeliverytime.replace(/\s/g,"&nbsp;")+'-'+obj.fromCountry.currencyName.replace(/\s/g,"&nbsp;")+'")><img src="resources/images/countryimages/'+obj.fromCountry.currencyCode.toLowerCase()+'.jpg" width="30px" height="30px"">&nbsp;'+obj.fromCountry.countryName+'<span class="float-right" style="font-size: 14px;font-weight: lighter;">'+obj.fromCountry.currencyName+' '+obj.fromCountry.currencyCode+'</span></button></li>';
					 
				 });
				 $('#toCountry').empty();
				 $('#toCountry').append(options);
				 $('.selectpicker').selectpicker('refresh');
			},
			error : function(xhr,error,status){
				alert("this error from getAllBranchesExceptGivenBranch11111 :"+error);
			}
		}); 
	}
	if(type=='receivingCountry'){
		//alert('under receiving');
		var toCountry=$('#toCountry').val();
		//alert('toCountry = '+toCountry);
		var fromCountry=$('#fromCountry').val();
		//alert('fromCountry = '+fromCountry);
		fromCountry=fromCountry.split('-');
		toCountry=toCountry.split('-');
		 $('#toCurrCode').empty();
		 $('#toCurrCode').append('<strong>'+toCountry[2]+'</strong>');
		 $('#tocCode').empty();
		 $('#tocCode').append('<strong>'+toCountry[3]+'</strong>');
		var data="branchId="+toCountry[1]+"&adminId="+adminId;
		var options='';
		$.ajax({
			url : "${pageContext.request.contextPath}/common/getAllSendingBranchesExceptGivenBranch",
			type : "POST",
			data : data,
			async : false,
			success : function(response){
				var branchList = JSON.stringify(response, undefined, '\t');
				var i=1;
				//alert('branchList  = '+branchList );
				  $.each($.parseJSON(branchList),function(idx,obj){
					  if(i==1){																	
						 
						 $('#clickk').empty();
						 $('#clickk').append('<span><img src="resources/images/countryimages/'+obj.fromCountry.currencyCode.toLowerCase()+'.jpg" width="30px" height="30px"" class="rounded-circle"><span>&nbsp;&nbsp;'+obj.fromCountry.currencyCode+'</span><i class="fa fa-chevron-down"></i></span>');
						 $('#fromCountry').val(obj.fromCountry.countryISO+'-'+obj.branchId+'-'+obj.fromCountry.currencyCode+'-'+obj.fromCountry.countryName+'-'+obj.paymentMode+'-'+obj.modeOfPayment+'-'+obj.cashStatus+'-'+obj.cashDeleiveryTime+'-'+obj.bankStatus+'-'+obj.bankDeliveryTime+'-'+obj.ewalletStaus.replace(/\s/g,"&nbsp;")+'-'+obj.ewalletDeliverytime.replace(/\s/g,"&nbsp;"));
						 $('#sendin').empty();
						 $('#sendin').append('<small>They Recieve in '+obj.fromCountry.currencyCode+'</small>');
// 						 $('.ReciveInSendFrom').empty();
// 						 $('.ReciveInSendFrom').append('<img src="resources/images/countryimages/'+obj.fromCountry.currencyCode.toLowerCase()+'.jpg" width="30px" height="30px"">&nbsp;&nbsp;'+obj.fromCountry.countryName+'<span class="float-right">'+obj.fromCountry.countryName+' '+obj.fromCountry.currencyCode+'</span>');
					 }
					 options=options+'<li  id="li-'+i+'-'+obj.fromCountry.countryISO+'"><button type="button" class="dropdown-item" onclick=xyz("'+obj.fromCountry.currencyCode+'","'+obj.fromCountry.countryName.replace(/\s/g,"&nbsp;")+'","'+obj.fromCountry.currencyName.replace(/\s/g,"&nbsp;")+'")><img src="resources/images/countryimages/'+obj.fromCountry.currencyCode.toLowerCase()+'.jpg" width="30px" height="30px"">&nbsp;'+obj.fromCountry.countryName+'<span class="float-right" style="font-size: 14px;font-weight: lighter;">'+obj.fromCountry.currencyName+' '+obj.fromCountry.currencyCode+'</span></button></li>';	 
					 
				 });
				 $('#fromcountry').empty();
				 $('#fromcountry').append(options);
				//$('.selectpicker').selectpicker('refresh'); 
			},
			error : function(xhr,error,status){
				alert("this error from getAllBranchesExceptGivenBranch :"+error);
			}
		}); 
	}
	getCurrencyRates(); 
	}
	</script>
	<script type="text/javascript">
	function setPaymentType(ptype){
			var pt_to_show='';
			if(ptype=='cash'){
				   pt_to_show='Cash Pickup';
			   }else if(ptype=='bank'){
				   pt_to_show='Bank Deposit';
			   }else{
				   pt_to_show=ptype;
			   }
		   $('#deliveryto').empty();
		   $('#deliveryto').append(pt_to_show); 
		   $('#paymentMethod').val(ptype);
		   $('.CardSearch').removeClass('ShowCard'); 
		   $('#rotate4').removeClass('RotateTransForm');
		   $('#rotate4').addClass('RotateTransFormBack');
		   resetCountries('receivingCountry');
	}
	</script>
	 <script type="text/javascript">
function getCurrencyRates(){
	var receivingBranch=$('#toCountry').val();
	   receivingBranch=receivingBranch.split('-');
	  // alert('receivingBranch = '+receivingBranch);
	   opt='';
	   var paymentType=receivingBranch[4].split(',');
		//alert('paymentType = '+paymentType);		  
	   var pt=$('#paymentMethod').val();
	   var pt_to_show='';
	   var exiested_pt_show='';
	   if(pt=='cash'){
		   exiested_pt_show='Cash Pickup';
	   }else if(pt=='bank'){
		   exiested_pt_show='Bank Deposit';
	   }else{
		   exiested_pt_show=pt;
	   }
	   for(var i=0;i<paymentType.length;i++){
		  // alert('paymentType'+paymentType[i]);
		   if(paymentType[i]=='cash'){
			   pt_to_show='Cash Pickup';
		   }else if(paymentType[i]=='bank'){
			   pt_to_show='Bank Deposit';
		   }else{
			   pt_to_show=paymentType[i];
		   }
		   
		   
		   if(pt==paymentType[i]){
	   $('#deliveryto').empty();
	   $('#deliveryto').append(pt_to_show); 
	   $('#paymentMethod').val(paymentType[i]);
	   }
	   if(pt=='' && i==0){
			   $('#deliveryto').empty();
			   $('#deliveryto').append(pt_to_show); 
			   $('#paymentMethod').val(paymentType[i]);
		   }else if(pt!='' && i==0){
			   $('#deliveryto').empty();
			   $('#deliveryto').append(exiested_pt_show); 
			   $('#paymentMethod').val(pt);
		   } 
	   var pm=$('#paymentMethod').val();
//	    alert('pm ='+pm);
//	    alert("pt ="+paymentType[i]);
	    if(pm.replace(/\s/g,"&nbsp;")==paymentType[i].replace(/\s/g,"&nbsp;")){
	    //	alert('cond1');
	    	opt=opt+'<button type="button" id="'+paymentType[i].replace(/\s/g,"_")+'" onclick=setPaymentType("'+paymentType[i].replace(/\s/g,"&nbsp;")+'"); class="dropdown-item_high"><li>'+pt_to_show+'<span id="inr" class="float-right"></span></li></button>';
	    }else{
	    	opt=opt+'<button type="button" id="'+paymentType[i].replace(/\s/g,"_")+'" onclick=setPaymentType("'+paymentType[i].replace(/\s/g,"&nbsp;")+'"); class="dropdown-item"><li>'+pt_to_show+'<span id="inr" class="float-right"></span></li></button>';
	    }  
	   }
	   
	   $('#list-pmt-method').empty();
	   $('#list-pmt-method').append(opt);
	 	var sendingBranch=$('#fromCountry').val();
	   	sendingBranch=sendingBranch.split('-');
	   //	alert('sendingBranch = '+sendingBranch);
	   	$('#profitMode').val(sendingBranch[7]);
	   	
	    var receivingBranch=$('#toCountry').val();
	    receivingBranch=receivingBranch.split('-');
	  var paymentType=$('#paymentMethod').val();

	   $.ajax({
			url : "getrecevingbranchlimits",
			type : "POST",
	       data : "toBranchId="+receivingBranch[1]+"&paymentType="+paymentType,
	       async : false,
			success : function(response) {
				 if(response==''){
					 alert("sorry receiving branch don't have the currency rates");
					 $('#receivingBranchCurrencyRate').val("");
					 return false;	 
				 }
				 var toCountryCurrencyRatesList = JSON.stringify(response, undefined, '\t');
				// alert('toCountryCurrencyRatesList = '+toCountryCurrencyRatesList);
				 $("#toCountryCurrencyRatesList").val(toCountryCurrencyRatesList);
					$.each($.parseJSON(toCountryCurrencyRatesList ),function(idx,obj){
						$('#receivingBranchCurrencyRate').val(obj.finalCurrencyRate);
						$('#receivingBranchCurrencyRateRev').val(obj.finalCurrencyRateRev);
						$('#trangloAUD').val(obj.trangloAUD);												
					});
			},
			error : function(xhr, status, error) {
				alert("staus code:"+status);
				alert("error::"+error);
			}
		}); 
	   $.ajax({
			url : 'getBranchBasedOnBranchId',
			method : "get",
			data : "branchId="+receivingBranch[1],
			async : false,
			success : function(response){
				if(paymentType=='bank'){
					$('#receivingBranchPerTransactionLimit').val(response.bankMaxLimitPerTxn);
					$('#receivingBranchMinimumPerTransactionLimit').val(response.bankMinLimitPerTxn);
				}
				if(paymentType=='cash'){
					$('#receivingBranchPerTransactionLimit').val(response.cashMaxLimitPerTxn);
					$('#receivingBranchMinimumPerTransactionLimit').val(response.cashMinLimitPerTxn);
				}
				if(paymentType=='eWallet'){
					$('#receivingBranchPerTransactionLimit').val(response.ewalletMaxLimitPerTxn);
					$('#receivingBranchMinimumPerTransactionLimit').val(response.ewalletMinLimitPerTxn);
				}
				if(paymentType=='bKash'){
					$('#receivingBranchPerTransactionLimit').val(response.bkashMaxLimitPerTxn);
					$('#receivingBranchMinimumPerTransactionLimit').val(response.bkashMinLimitPerTxn);
				}
				
			},
			error : function(xhr,error,status){
				alert('getBranchBasedOnBranchIdError = '+error);
			}
		}); 
	   $.ajax({
			url : 'getBranchBasedOnBranchId',
			method : "get",
			data : "branchId="+sendingBranch[1],
			async : false,
			success : function(response){
				if(paymentType=='bank'){
					$('#sendingBranchPerTransactionLimit').val(response.bankMaxLimitPerTxn);
					$('#sendingBranchMinimumPerTransactionLimit').val(response.bankMinLimitPerTxn);
				}
				if(paymentType=='cash'){
					$('#sendingBranchPerTransactionLimit').val(response.cashMaxLimitPerTxn);
					$('#sendingBranchMinimumPerTransactionLimit').val(response.cashMinLimitPerTxn);
				}
				if(paymentType=='eWallet'){
					$('#sendingBranchPerTransactionLimit').val(response.ewalletMaxLimitPerTxn);
					$('#sendinggBranchMinimumPerTransactionLimit').val(response.ewalletMinLimitPerTxn);
				}
				if(paymentType=='bKash'){
					$('#sendingBranchPerTransactionLimit').val(response.bkashMaxLimitPerTxn);
					$('#sendingBranchMinimumPerTransactionLimit').val(response.bkashMinLimitPerTxn);
				}
				
			},
			error : function(xhr,error,status){
				alert('getBranchBasedOnBranchIdError = '+error);
			}
		});
	   
 		
	   doCalculation('send'); 
}

</script>
<script type="text/javascript">
function doCalculation(type){
		var sendingBranch=$('#fromCountry').val();
		sendingBranch=sendingBranch.split('-');
		var toCountryCurrencyRatesList=$('#toCountryCurrencyRatesList').val();
		/* var sBranchMinLimit=sendingBranch[5];
		var sBranchMaxLimit=sendingBranch[6]; */
	   	
		var receivingBranch=$('#toCountry').val();
	   	receivingBranch=receivingBranch.split('-');
	   	paymentType=$('#paymentMethod').val();
	    var pType="";
	   	if(paymentType=='cash'){
	   		$('#deliveryTime').empty();
	 		$('#deliveryTime').append(receivingBranch[7]);
	 		$('#delivery_time').val(receivingBranch[7]);
	 		pType="5";
	   	}
	   	if(paymentType=='bank'){
	   		$('#deliveryTime').empty();
	 		$('#deliveryTime').append(receivingBranch[9]);
	 		$('#delivery_time').val(receivingBranch[9]);
	 		pType="1";
	   	}
	 	if(paymentType=='eWallet'){
	   		$('#deliveryTime').empty();
	 		$('#deliveryTime').append(receivingBranch[11]);
	 		$('#delivery_time').val(receivingBranch[11]);
	 		pType="2";
	   	}
	 	if(paymentType=='Ezy Local Deposit'){
	 		$('#deliveryTime').empty();
	 		$('#deliveryTime').append("Within 24 hours");
	 		$('#delivery_time').val("Within 24 hours");
	 		pType="10";
	   	}
	 	if(paymentType=='Urgent Local Deposit'){
	   		$('#deliveryTime').empty();
	 		$('#deliveryTime').append("Within 24 hours");
	 		$('#delivery_time').val("Within 24 hours");
	 		pType="11";
	   	}
	 	
		$('#paymentType').val(pType);
		
		var modeOfPayment=$('#modeOfPayment').val();
		modeOfPayment=modeOfPayment.split(',');
		var mopFee=modeOfPayment[1];
		$('#modeOfPaymentFee').val(mopFee);
// 		$('#mopFee').empty();
// 		$('#mopFee').append('<font color="red"><strong>$'+mopFee+'</strong></font>');
		
	   	
	   	 
		var sBranchMinLimit=$('#sendingBranchMinimumPerTransactionLimit').val();
	   	var sBranchMaxLimit=$('#sendingBranchPerTransactionLimit').val();
	   	var rBranchMinLimit=$('#receivingBranchMinimumPerTransactionLimit').val();
	   	var rBranchMaxLimit=$('#receivingBranchPerTransactionLimit').val();
	    	
	   	 
	   	
	   	var toCurrencyRates=$('#receivingBranchCurrencyRate').val();
	  
 	   	
		var taxFee='';
		var baseAmount='';
		var receivingAmount='';
		var totalToPay='';
		var sendingAmount='';
		var sendingCurrencyRate='';
		var receivingCurrencyRate='';
		var rate='';
		var receivingAmt1='';
		var total_to_pay='';
		var exch_rate='';
		var diff='';
		//alert('before send');
			if(type=='send'){
				//alert('inside send');
				 sendingAmount=parseInt($('#sendingAmount').val());	
				// alert('sendingAmount = '+sendingAmount);
				if(sendingAmount!=''){
					//totalToPay=sendingAmount;
				 if(Number(sendingAmount)>Number(sBranchMaxLimit)){
				// alert('sending amount is more...!');
					$('#limitexceeded').empty();
					$('#limitexceeded').append("<span  style='margin: 0 0 0 2px;font-size: smaller;'>The most you can send is "+sBranchMaxLimit+" "+sendingBranch[2]+"</span>");
					//clearTransactionData();
					return false;
				}else{
					$('#limitexceeded').empty();	
					removeError('sendingAmount');
				}
				if(Number(sendingAmount)<Number(sBranchMinLimit)){
					//alert('sending amount is less');
					$('#limitexceeded').empty();
					$('#limitexceeded').append("<span  style='margin: 0 0 0 2px;font-size: smaller;'>The smallest amount you can send is "+sBranchMinLimit+" "+sendingBranch[2]+"</span>");
				}else{
					$('#limitexceeded').empty();
					removeError('sendingAmount');
				} 
				receivingAmount=Number(sendingAmount)*Number(toCurrencyRates);
				//alert('receivingAmount = '+receivingAmount);
				
				//alert('toCountryCurrencyRatesList = '+toCountryCurrencyRatesList);
				$.each($.parseJSON(toCountryCurrencyRatesList ),function(idx,obj){
					if(Math.ceil(receivingAmount)>=obj.minLimit && Math.ceil(receivingAmount)<=obj.maxLimit){
						taxFee=obj.quiqsendFee;
						//$('#tranlgoAUD').val(obj.trangloAUD);
						
					}
				});
				totalToPay=Number(taxFee)+Number(sendingAmount)+Number(mopFee);
				totalToPay=Number(totalToPay.toFixed(4));
	 			//alert('totalToPay = '+totalToPay);alert('totalToPay = '+totalToPay);
	 			
				if(Number(receivingAmount)>Number(rBranchMaxLimit)){
	 		//	alert('receiving amount is more...!');
	 			//alert('condi1');
				$('#limitexceeded1').empty();
				$('#limitexceeded1').append("<span  style='margin: 0 0 0 2px;font-size: smaller;'>The most can recipient get is "+rBranchMaxLimit+" "+receivingBranch[2]+"</span>");
				//clearTransactionData();
				return false;
			}else{
				//alert('condi2');
				$('#limitexceeded1').empty();	
				removeError('receiveingAmount');
			}
			if(Number(receivingAmount)<Number(rBranchMinLimit)){
				//alert('receiving amount is less');
				//alert('condi3');
				$('#limitexceeded1').empty();
				$('#limitexceeded1').append("<span  style='margin: 0 0 0 2px;font-size: smaller;'>The smallest amount a recipient can get is "+rBranchMinLimit+" "+receivingBranch[2]+"</span>");
			}else{
				//alert('condi4');
				$('#limitexceeded1').empty();
				removeError('receivingAmount');
			}
			rate=Number(receivingAmount)/Number(sendingAmount);
			//alert('receivingAmount = '+receivingAmount);
	 		$('#receivingAmount').val(receivingAmount.toFixed(4));
	 		$('#taxfee').empty();
	 		$('#taxfee').append((Number(mopFee)+Number(taxFee)).toFixed(2)+" "+sendingBranch[2]);
	 		//$('#totalFee').val((Number(mopFee)+Number(taxFee)).toFixed(2));
	 		$('#totalToPay').empty();
	 		$('#totalToPay').append(totalToPay+" "+sendingBranch[2]);
	 		$('#rate').empty();
	 		$('#rate').append("<strong>1 "+sendingBranch[2]+" = "+Number(rate).toFixed(2)+" "+receivingBranch[2]+"</strong>");
	 		//$('#amountToBeConverted').val(sendingAmount);
	 		$('#fee').val(Number(taxFee).toFixed(2));
	 		
			}
			}
			
			
			if(type=='receive'){
				receivingAmount=$('#receivingAmount').val();
				
				if(receivingAmount!=''){
					$.each($.parseJSON(toCountryCurrencyRatesList ),function(idx,obj){
						if(Math.ceil(receivingAmount)>=obj.minLimit && Math.ceil(receivingAmount)<=obj.maxLimit){
							taxFee=obj.quiqsendFee;
						}
					});
				
					if(Number(receivingAmount)>Number(rBranchMaxLimit)){
			 			//alert('condi1');
						$('#limitexceeded1').empty();
						$('#limitexceeded1').append("<span  style='margin: 0 0 0 2px;font-size: smaller;'>The most can recipient get is "+rBranchMaxLimit+" "+receivingBranch[2]+"</span>");
						//clearTransactionData();
						//return false;
					}else{
						//alert('condi2');
						$('#limitexceeded1').empty();	
						removeError('receiveingAmount');
					}
					if(Number(receivingAmount)<Number(rBranchMinLimit)){
						//alert('condi3');
						$('#limitexceeded1').empty();
						$('#limitexceeded1').append("<span  style='margin: 0 0 0 2px;font-size: smaller;'>The smallest amount a recipient can get is "+rBranchMinLimit+" "+receivingBranch[2]+"</span>");
					}else{
						//alert('condi4');
						$('#limitexceeded1').empty();
						removeError('receivingAmount');
					}
						//dollerAmt=Number(receivingAmount)*Number(toCurrencyRatesRev);
						//alert('fromCurrencyRates = '+fromCurrencyRates);
					sendingAmount=Number(receivingAmount)/Number(toCurrencyRates);
					
					totalToPay=Number(taxFee)+Number(sendingAmount)+Number(mopFee);
					totalToPay=Number(totalToPay.toFixed(4));
					
					if(Number(sendingAmount)>Number(sBranchMaxLimit)){
						$('#limitexceeded').empty();
						$('#limitexceeded').append("<span  style='margin: 0 0 0 2px;font-size: smaller;'>The most you can send is "+sBranchMaxLimit+" "+sendingBranch[2]+"</span>");
						//clearTransactionData();
						//return false;
					}else{
						$('#limitexceeded').empty();	
						removeError('sendingAmount');
					}
					if(Number(sendingAmount)<Number(sBranchMinLimit)){
						$('#limitexceeded').empty();
						$('#limitexceeded').append("<span  style='margin: 0 0 0 2px;font-size: smaller;'>The smallest amount you can send is "+sBranchMinLimit+" "+sendingBranch[2]+"</span>");
					}else{
						$('#limitexceeded').empty();
						removeError('sendingAmount');
					} 
				rate=Number(receivingAmount)/Number(sendingAmount);
				$('#sendingAmount').val(sendingAmount.toFixed(4));
		 		$('#taxfee').empty();
		 		$('#taxfee').append((Number(mopFee)+Number(taxFee)).toFixed(2)+" "+sendingBranch[2]);
		 		//$('#totalFee').val((Number(mopFee)+Number(taxFee)).toFixed(2));
		 		$('#totalToPay').empty();
		 		$('#totalToPay').append(totalToPay+" "+sendingBranch[2]);
		 		$('#rate').empty();
		 		$('#rate').append("<strong>1 "+sendingBranch[2]+" = "+Number(rate).toFixed(2)+" "+receivingBranch[2]+"</strong>");
		 		//$('#amountToBeConverted').val(sendingAmount);
		 		$('#fee').val(Number(taxFee).toFixed(2));
		 		
				}else{
					clearTransactionData();
				}
				
			}
}
</script> 
<script type="text/javascript">
function clearTransactionData(){
	$('#sendingAmount').val('');
	$('#taxfee').empty();
	$('#totalToPay').empty();
	$('#taxFeeDeductedAmount').empty();
	$('#receivingAmount').val('');
	
}

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
function makeItHighlighted(selected_item,current_id){
	$('#'+selected_item).removeClass('dropdown-item_high');
	$('#'+selected_item).addClass('dropdown-item');
	$('#'+current_id).removeClass('dropdown-item');
	$('#'+current_id).addClass('dropdown-item_high');
	
}
</script>

	<script type="text/javascript">
	  function onchangeTopUpCountry(){
		 var topupcountryvalue=$('#topupcountrys').val().split("-");
		 var totalPhoneNumber="+"+topupcountryvalue[1];
		 $('#phoneNumber').val(totalPhoneNumber);
		 
	  }   
	
	</script>

	<script type="text/javascript">
	function getModeOfPaymentFee(mop,fee){
		 $('#cnf_payment').empty();
			$('#cnf_payment').append(mop);
		
		 $('#paywith').empty();
		   $('#paywith').append(mop);
		   var oldmop=$('#modeOfPayment').val();
		$('#modeOfPayment').val(mop+','+fee);
			$('.BankSearch').removeClass('Showbanks'); 
		   $('#rotate3').removeClass('RotateTransForm');
		   $('#rotate3').addClass('RotateTransFormBack');
//		var modeOfPayment=$('#modeOfPayment').val();
//		 modeOfPayment=modeOfPayment.split(',');
		var fee=fee;
		var sendingBranch=$('#fromCountry').val();
		sendingBranch=sendingBranch.split('-');
		//alert('sendingBranch = '+sendingBranch);
		$('#modeOfPaymentFee').val(fee);
		var taxFee=$('#fee').val();
		var sendAmount=$('#sendingAmount').val();
		var totalFee=Number(fee)+Number(taxFee);
		//$('#totalFee').val(totalFee);
		/* $('#fee').val(totalFee); */
		$('#taxfee').empty();
		$('#taxfee').append(Number(totalFee).toFixed(2)+" "+sendingBranch[2]);
		var totalToPay=Number(sendAmount)+Number(fee)+Number(taxFee);
		$('#totalToPay').empty();
		$('#totalToPay').append(Number(totalToPay).toFixed(2)+" "+sendingBranch[2]);
		//$('#totalPayble').val(Number(totalToPay).toFixed(2));
		/* $('#mopFee').empty();
		$('#mopFee').append('<font color="red"><strong>$'+fee+'</strong></font>'); */
		
	
		makeItHighlighted(oldmop.split(',')[0].replace(/\s/g,'_'),mop.replace(/\s/g,'_'));
	}
</script>

<script type="text/javascript">
function removeShowClass(classname){
	//alert('classname = '+classname);
	$('.'+classname).removeClass('ShowSearch');
}
function removeShowClssById(id){
	//alert('id = '+id);
	$('#'+id).removeClass('RotateTransForm');
}

</script>
</head>
<body>
<%@include file="myacc_header.jsp" %>   
<input type="hidden" id="deliverytoclickflag" value="hide">
<input type="hidden" id="paywithclickflag" value="hide">
 <form id="loginsignup" method="POST">
<input type="hidden" name="page" value="home"/>
</form>
<input type="hidden" id="customerDetailsFlag" value="${customerDetailsFlag}">
<!-- Preloader -->
<input type="hidden" id="toCountryCurrencyRatesList" value=""/>
  <div id="mydiv" style="display:none;">
             <img id="demo_wait" src="resources/images/demo_wait.gif" alt="Processing..." class="ajax-loader">
          </div>
    <section class="banner v3" id="header-image">
      <div class="container">
    <h1 class="text-center">How much would you like to transfer?</h1>    
        <div class="row" >
      
          
          <!--  <div class="col-md-4 ml-md-auto "  style="    margin-top: -112px;
    background-color: white; position: relative; z-index: 1;     max-width: 334px;"> -->
    <div class="col-md-6 col-md-offset-3">
    <div class="row">
    <div class="col-md-12 blue-bg">
    
    <div class="send-receive-money tab">
    
            <!--  <ul class="nav nav-tabs nav-justified" id="myTab">
              <li class="active"> <a data-toggle="tab" href="#send-money"><i class="fa fa-paper-plane" aria-hidden="true"></i><br>Send Money</a> </li>
              <li> <a href="#topupindex" data-toggle="tab"><i class="fa fa-paper-plane" aria-hidden="true"></i><br>Send Airtime/Data</a> </li>
            </ul> -->
            <div class="tab-content" id="myTabContent">
              <div class="tab-pane fade in active" id="send-money">
              <input type="hidden" id="selected-rec-br" value="${cr_br}">
                         <form id="sendForm"> 
                <input type="hidden" name="adminId" id="adminId" value="${adminId}"> 
			    <input type="hidden" name="fee" id="fee" value=""/>
			   
				<input type="hidden" id="profitMode" name="profitMode" value=""/>
				<input type="hidden" name="page" value=""/>
						<input type="hidden" id="sendingBranchCurrencyRate" name="sendingBranchCurrencyRate" value=""/>
				<input type="hidden" id="receivingBranchCurrencyRate" name="receivingBranchCurrencyRate" value=""/>
				<input type="hidden" id="sendingBranchCurrencyRateRev" name="sendingBranchCurrencyRateRev" value=""/>
				<input type="hidden" id="receivingBranchCurrencyRateRev" name="receivingBranchCurrencyRateRev" value=""/>
				<input type="hidden" id="delivery_time" name=deliveryTime value=""/>
				
				<input type="hidden" id="receivingBranchPerTransactionLimit" value=""/>
				<input type="hidden" id="receivingBranchMinimumPerTransactionLimit" value=""/>
				
				<input type="hidden" id="sendingBranchPerTransactionLimit" value=""/>
				<input type="hidden" id="sendingBranchMinimumPerTransactionLimit" value=""/>
				
				<input type="hidden" id="modeOfPaymentFee" name="modeOfPaymentFee" value=""/>
				<input type="hidden" id="paymentType" name="paymentType" value=""/>
				<!-- <input type="hidden" id="totalFee" name="totalFee" value=""/> -->
				
				<!-- <input type="hidden" id="pType" name="pType" value=""> -->
				<input type="hidden" id="toCountry" name="receivingBranch" value="">
				<input type="hidden" id="paymentMethod" name="paymentMethod" value="">
				<input type="hidden" id="modeOfPayment" name="modeOfPayment" value="">
				
				<!-- <input type="hidden" id="trangloAUD" name="trangloAUD" value=""> -->
				<!-- <input type="hidden" id="sellRate" name="sellRate" value=""> -->
				
                <div class="row brd-t-1">
               
							<!-- <input type="hidden" id="modeOfPayment" name="modeOfPayment" value="">
							
							<input type="hidden" id="receiving_branch" name="receiving_branch" value=""> -->
                
                
                    <div class="col-md-8 col-sm-7 col-xs-7 fromNum">
                        <small class="pt-1 d-block">You send </small>
                        <input type="text" name="sendingAmount" id="sendingAmount" onkeypress="return onlyNumber(event);" onkeyup="doCalculation('send')" value="1000.00">
                  <!-- <small>The smallest amount you can send is 100 AUD</small> -->
                    </div>
                    
                    
                    <div class="col-md-4 col-sm-5 col-xs-5 toNum" >
                    
                            <img src="resources/images/countryimages/aud.jpg" width="30px" height="30px" class="rounded">
                            <span>AUD</span>
                           <!--  <i class="fa fa-chevron-down"></i> -->
                      
                      
                    </div>
                    <div class="frmSearch  inrSearch InrContainer" style=" height: 0; top: 60px;   opacity: 0 ;">
                        <div class="search d-flex">
                            <span class="flex-fill "> <i class="fa fa-search"></i> </span> <input type="text" name="search" id="searchI" placeholder="search" class="flex-fill ">
                            <span class="flex-fill ">
                                <i class="fa fa-chevron-up" onclick="removeShowClass('frmSearch');"></i>
                            </span></div>
                      <!--   <div class="ListingCountry"> -->
                           <!--  <small>You Send From AUD</small>
                            <p class="sendin">
                                <img src="resources/images/countryimages/aud.jpg" width="30px" height="30px"> Australia <span class="float-right">Australia Dollar AUD</span>
                            </p> -->
                            <small>Select another country:</small>
                           <!--  <ul class="list-unstyled" id="fromcountry"> -->
                            <c:forEach items="${sendingBranchList}" var="branch">   
                        		<%-- <li>
                                    <button type="button" class="dropdown-item" href="#" onclick="hideAndSelected('${branch.fromCountry.countryISO}-${branch.branchId}-${branch.fromCountry.currencyCode}-${branch.fromCountry.countryName}-${branch.modeOfPayment}-${branch.profitMode}')"><img src="resources/images/countryimages/${branch.fromCountry.currencyCode.toLowerCase()}.jpg"  width="30px" height="30px" >${branch.fromCountry.countryName}<span class="float-right" style="position:relative; left:27px">${branch.fromCountry.currencyName}  ${branch.fromCountry.currencyCode}</span></button>
                                    <button type="button" class="dropdown-item" href="#" onclick="hideAndSelected('${branch.fromCountry.countryISO}-${branch.branchId}-${branch.fromCountry.currencyCode}-${branch.fromCountry.countryName}-${branch.modeOfPayment}-${branch.profitMode}')"><img src="resources/images/countryimages/${branch.fromCountry.currencyCode.toLowerCase()}.jpg"  width="30px" height="30px" >${branch.fromCountry.countryName}<span class="float-right" style="position:relative; left:27px">${branch.fromCountry.currencyName}  ${branch.fromCountry.currencyCode}</span></button>
                                </li> --%>
                                <input type="hidden" id="fromCountry" name="sendingBranch" value="${branch.fromCountry.countryISO}-${branch.branchId}-${branch.fromCountry.currencyCode}-${branch.fromCountry.countryName}-${branch.modeOfPayment}-${branch.profitMode}">
                        	</c:forEach>
                            <!-- </ul> -->
                           
                        <!-- </div> -->
                    </div>
                    <div class="alert alert-danger col-md-12 col-xs-12" id="limitexceeded"><span style="margin: 0 0 0 2px;font-size: smaller;"></span></div>
               
               
                </div>
                <!--  Second Search -->
                <div class="row mnlp">
                    <div class="col-md-8 col-sm-7 col-xs-7 fromNum">
                        <small class="pt-1 d-block">Recipient gets</small> 
                        <input type="text" name="receivingAmount" id="receivingAmount"  onkeypress="return onlyNumber(event);" onkeyup="doCalculation('receive')" value="1000.00" style="position: relative;">
                    </div>
                    <div class="col-md-4 col-sm-5 col-xs-5 toNum" id="reciveClick">
                        <!-- <span>
                            <img src="AndorraFlag.png" class="rounded-circle">
                            <span>BDT</span>
                            <i class="fa fa-chevron-down"></i>
                        </span> -->
                    </div>
                    <div class="TooSearch inrSearch InrContainer" style=" height: 0; top: 60px;   opacity: 0 ;">
                        <div class="search d-flex">
                            <span class="flex-fill "> <i class="fa fa-search"></i> </span> <input type="text" name="search" id="search_receive" placeholder="search" onkeyup="myFunction()" class="flex-fill ">
                            <span class="flex-fill ">
                                <i class="fa fa-chevron-up" onclick="removeShowClass('TooSearch');"></i>
                            </span></div>
                            
                        <div class="ListingCountry">
                            <span id="receivein"></span>
                            <p class="ReciveInSendFrom">
                                <img src="AndorraFlag.png"> Andorra <span class="float-right">Euro EUR </span>
                            </p>
                            <small>Select another country:</small>
                            <ul class="list-unstyled" id="tcountry" style="height: 251px;overflow-y: scroll;">
                            </ul>
                        </div>
                    </div>
                    <div class="alert alert-danger col-md-12 col-xs-12" id="limitexceeded1"><span style="margin: 0 0 0 2px;font-size: smaller;"></span></div>
                </div>
                <!--  Second Search END -->
                <!--  Third -- Bank -->
                
                <!--  Third -- Bank END-->
                <!--  Fourth -- Cards -->
                </form>
                <div class="row">
                    <div class="p-0">
                        <p class="bg-blue p-2 text-white title-C " id="rate"></p>
                    </div>
                </div>
                
                <div class="row brd-t-1">
                    <div class="col-md-12 fromNum" id="CLickCards">
                        <small class="pt-1 d-block">Delivery to <label id="tocCode"></label></small>
                        <p class="mb-0 A-Selected" id="deliveryto"></p>
                        <span id="">
                            <i class="fa fa-chevron-down" id="rotate4" ></i>
                        </span>
                    </div>

                    <div class="CardSearch inrSearch InrContainer" style=" height: 0; top: 90px;   opacity: 0 ;">
                        <div class="ListingCountry">
                            <ul class="list-unstyled" id="list-pmt-method">
                               <!--  <li>
                                    <i class="fa fa-credit-card"></i> Debit Card <span class="float-right">INR 0</span>
                                </li>
                                <li>
                                    <i class="fa fa-credit-card"></i> Credit Card <span class="float-right">INR 0</span>
                                </li> -->
                            </ul>
                        </div>
                    </div>
                    
               
                </div>
                <div class="row brd-t-1">
                    <div class="col-md-12 fromNum" id="SelectBank">
                        <small class="pt-1 d-block">Pay us with</small>
                        <p class="mb-0 A-Selected" id="paywith"></p> 
                        <span id="">
                            <i class="fa fa-chevron-down" id="rotate3"></i>
                        </span>
                    </div>

                    <div class="BankSearch inrSearch InrContainer" style=" height: 0; top: 90px;   opacity: 0 ;">
                        <div class="ListingCountry">
                            <ul class="pay-with-class">
                               <!--  <li>
                                    <i class="fa fa-bank"></i> Bank Account
                                </li>
                                <li>
                                    <i class="fa fa-bank"></i> Bank Account
                                </li> -->
                            </ul>
                        </div>
                    </div>
                </div>
                <!--  Fourth -- Cards END-->
           <div class="row oneee">
			  <table class="table">
			  <tbody>
			  <tr>
			  <td>Delivery time</td>
			  <td id="deliveryTime"> </td>
			  </tr>
			  <tr>
			  <td>Fee</td>
			  <td id="taxfee"></td>
			  </tr>
			  <tr>
			  <td>Total to Pay</td>
			  <td id="totalToPay"></td>
			  </tr>
			  </tbody></table>
			  </div>
			  <div class="row">
			  <div class="col-md-12">
			  <div class="bs-example">
    <div class="accordion" id="couponcode">
        <div class="card">
            <div class="card-header" id="headingOne">
               
                    <button type="button" class="btn btn-link" data-toggle="collapse" data-target="#collapseOne"><i class="fa fa-plus"></i>  I Have Coupon Code ?</button>									
             
            </div>
            <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#couponcode">
                <div class="card-body">
                     <div class="input-group">
      <input type="text" class="form-control" placeholder="Coupon Code" name="Coupon">
      <div class="input-group-btn">
        <button class="btn btn-success" type="submit">Apply</button>
      </div>
    </div>
                </div>
            </div>
        </div>
       </div>
       </div>
       
    </div>
</div>
			  
			  <div class="row" style="margin-top: 8px  !important;">
			  <button type="button" id="send" class="get01" style="" onclick="validate()"><i class="fa fa-paper-plane" aria-hidden="true"></i>
Send Now</button>
			  </div>
            </div>
           
           
           <div id="topupindex" class="tab-pane fade">
              test
           </div>
           
           
              </div>
            </div> 
          </div>
     </div>
     </div>
     </div>
           
        </div>
      </div>
    </section>

         <style>
         
        


           .bs-example{
           padding-top:15px;
           }
           
           .bs-example .form-control{
           border:1px solid #ddd !important;
               box-shadow: none;
           }
           
           
           .btn-link:hover, .btn-link:focus {
    text-decoration: none !important;

}


button.btn.btn-link {
    padding-left: 0px;
}

button.btn.btn-link i{
    margin-right: 5px;
    font-size: 13px;
    border: 1px solid green;
    padding: 3px;
    width: 22px;
}

.card-body {
    padding-left: 0px !important;
}

.input-group-btn {
    border: 1px solid #ddd !important;
    box-shadow: none !important;
}

button.btn.btn-link:focus{
outline:none;
}

         </style>   
        <script>
    $(document).ready(function(){
 		   	
    	
        // Add minus icon for collapse element which is open by default
        $(".collapse.show").each(function(){
        	$(this).prev(".card-header").find(".fa").addClass("fa-minus").removeClass("fa-plus");
        });
        
        // Toggle plus minus icon on show hide of collapse element
        $(".collapse").on('show.bs.collapse', function(){
        	$(this).prev(".card-header").find(".fa").removeClass("fa-plus").addClass("fa-minus");
        }).on('hide.bs.collapse', function(){
        	$(this).prev(".card-header").find(".fa").removeClass("fa-minus").addClass("fa-plus");
        });
    });
</script>         
       
  
    <%-- <%@include file="footer1.jsp" %>   --%>
    
    
     <script type="text/javascript">
        $(document).mouseup(function (e) {
            var container = $(".frmSearch");
            if (!container.is(e.target) &&
                container.has(e.target).length === 0) {
                //  container.hide();
                $('.frmSearch').removeClass('ShowSearch')
            }
        });
        $('#clickk').click(function () {
            //   $('.InrContainer').toggle()
            $('.frmSearch').addClass('ShowSearch')
        })


        // 2nd

        $(document).mouseup(function (e) {
            var container = $(".TooSearch");
            if (!container.is(e.target) &&
                container.has(e.target).length === 0) {
                //  container.hide();
                $('.TooSearch').removeClass('ShowSearch')
            }
        });
        $('#reciveClick').click(function () {
            //   $('.InrContainer').toggle()
            $('.TooSearch').addClass('ShowSearch')
        })

        //2nd

        // 3rd 
        $(document).mouseup(function (e) {
            var container = $(".BankSearch");
            if (!container.is(e.target) &&
                container.has(e.target).length === 0) {
                //  container.hide();
                $('.BankSearch').removeClass('Showbanks')
                $('#rotate3').removeClass('RotateTransForm')
            }
        });
        $('#SelectBank').click(function () {
            //   $('.InrContainer').toggle()
            		 var flag=$('#paywithclickflag').val();
            if(flag=='hide'){
         	   $('#paywithclickflag').val('show');
         	   $('.BankSearch').addClass('Showbanks');
                $('#rotate3').removeClass('RotateTransFormBack');
                $('#rotate3').addClass('RotateTransForm');
         	   }
         if(flag=='show'){
     	   $('#paywithclickflag').val('hide');
     	   $('.BankSearch').removeClass('Showbanks');
            $('#rotate3').removeClass('RotateTransForm');
            $('#rotate3').addClass('RotateTransFormBack');
     	   }
        })
        // 3rd 

        
       /* asdfjafjlajsdkljasd */ 
        // 4th
        $(document).mouseup(function (e) {
            var container = $(".CardSearch");
            if (!container.is(e.target) &&
                container.has(e.target).length === 0) {
                //  container.hide();
                $('.CardSearch').removeClass('ShowCard')
                $('#rotate4').removeClass('RotateTransForm')
            }
        });
        $('#CLickCards').click(function (e) {
            var flag=$('#deliverytoclickflag').val();
            if(flag=='hide'){
         	   $('#deliverytoclickflag').val('show');
         	   $('.CardSearch').addClass('ShowCard');
                $('#rotate4').removeClass('RotateTransFormBack');
                $('#rotate4').addClass('RotateTransForm');
         	   }
         if(flag=='show'){
     	   $('#deliverytoclickflag').val('hide');
     	   $('.CardSearch').removeClass('ShowCard');
            $('#rotate4').removeClass('RotateTransForm');
            $('#rotate4').addClass('RotateTransFormBack');
     	   }
        })
      

    </script>
    <script>
    function myFunction() {
         var input, filter, ul, li, a, i, txtValue;
        input = document.getElementById("search_receive");
        filter = input.value.toUpperCase();
        ul = document.getElementById("tcountry");
        li = ul.getElementsByTagName("li");
        for (i = 0; i < li.length; i++) {
            a = li[i].getElementsByTagName("button")[0];
           // alert(' a = '+ a);
            txtValue = a.textContent || a.innerText;
           // alert(' a = '+ txtValue);
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                li[i].style.display = "";
            } else {
                li[i].style.display = "none";
            }
        } 
    }
    </script>
    
    <style>
a:hover,
a:focus {
	outline: none;
	text-decoration: none;
}

.tab .nav-tabs {
	border-bottom: none;
	position: relative;
}

.tab .nav-tabs li {
	margin-bottom: 0;
}
.tab .nav-tabs li a i{
font-size:20px;
}
/* .tab .nav-tabs li a {
display: block;
   padding: 20px 0px;
    border: none;
    border-radius: 0;
    background: #fafafa;
    font-size: 17px;
    font-weight: 500;
    color: #174178;
    line-height: 28px;
    margin-right: 0px;
    text-align: center;
    z-index: 1;
    transition: all 0.3s ease 0s;
        text-transform: uppercase;
} */
.tab .nav-tabs li a {
    display: block;
    padding: 15px 0px;
    border: none;
    border-radius: 0;
    background: rgb(3, 50, 128);
    font-size: 15px;
    font-weight: 500;
    color: #fff;
    line-height: 28px;
    margin-right: 0px;
    text-align: center;
    z-index: 1;
    transition: all 0.3s ease 0s;
}


.tab .nav-tabs li.active a,
.tab .nav-tabs li a:hover {
	background: #fff;
	color: #174178;
	border: none;
	padding: 20px 0px;
    border: none !important;
    border-radius: 0;
}

/* .tab .nav-tabs li.active a,
.tab .nav-tabs li a:hover {
	background: rgb(3, 50, 128);
	color: #fff;
	border: none;
	padding: 20px 0px;
    border: none !important;
    border-radius: 0;
}
 */



.tab .tab-content {
    padding: 15px;
    margin-top: 0;
    border-radius: 0 0 5px 5px;
    font-size: 15px;
    color: #757575;
    line-height: 30px;
    padding-bottom: 0px;
    background: #fff;
    margin-top: 60px;
    margin: 30px;
}

.tab .tab-content h3 {
	font-size: 24px;
	margin-top: 0;
}

@media only screen and (max-width: 479px) {
	.tab .nav-tabs li {
		width: 50%;
    text-align: center;
    margin-bottom: 5px;
    float: left;
	}

	.tab .nav-tabs li:last-child {
		margin-bottom: 0;
	}
}


@media (max-width: 767px){
.tab .tab-content {
    padding: 15px;
    margin-top: 0;
    border-radius: 0 0 5px 5px;
    font-size: 15px;
    color: #757575;
    line-height: 30px;
    padding-bottom: 0px;
    background: #fff;
    margin-top: 0px !important;
    margin: 0px !important;
}

/* .tab .nav-tabs li a {
    display: block;
    padding: 15px 0px;
    border: none;
    border-radius: 0;
    background: #fafafa;
    font-size: 15px;
    font-weight: 500;
    color: #174178;
    line-height: 28px;
    margin-right: 0px;
    text-align: center;
    z-index: 1;
    transition: all 0.3s ease 0s;
    text-transform: uppercase;
}
 */
/* .tab .nav-tabs li.active a, .tab .nav-tabs li a:hover {
    background: rgb(3, 50, 128);
    color: #fff;
    border: none;
    padding: 15px 0px !important;
    border: none !important;
    border-radius: 0;
}
 */
.tab .nav-tabs li a {
    display: block;
    padding: 20px 0px;
    border: none;
    border-radius: 0;
    background: rgb(3, 50, 128);
    font-size: 17px;
    font-weight: 500;
    color: #fff;
    line-height: 28px;
    margin-right: 0px;
    text-align: center;
    z-index: 1;
    transition: all 0.3s ease 0s;
    text-transform: uppercase;
}
.tab .nav-tabs li.active a, .tab .nav-tabs li a:hover {
    background: #fff;
    color: #174178;
    border: none;
    padding: 20px 0px;
    border: none !important;
    border-radius: 0;
}

.oneee td {
   
}

}
</style>


 </body>
</html>