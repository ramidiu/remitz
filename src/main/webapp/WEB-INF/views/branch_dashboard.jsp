<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<!DOCTYPE html>
<html >
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> Agent Dashboard </title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="ui/jquery.ui.core.js"></script>
<script src="ui/jquery.ui.datepicker.js"></script>
     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
   <script src="js/jquery-1.4.2.js"></script>
<link rel="stylesheet" href="./admin/themes/ui-lightness/jquery.ui.all.css" />
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
  <script src="${pageContext.request.contextPath}/resources/js/cleave.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.70/jquery.blockUI.min.js"></script>
<script type="text/javascript">
$('#newb1').click(function (){
alert('new b');
});

</script>
<script>

   $(function () {
	    $("#datepicker").datepicker({
	        changeMonth: true,
	        changeYear: true
	    });
	    $("#datepicker1").datepicker({
	        changeMonth: true,
	        changeYear: true
	    });
	    $("#datepicker2").datepicker({
	        changeMonth: true,
	        changeYear: true
	    });
	    $("#datepicker3").datepicker({
	        changeMonth: true,
	        changeYear: true
	    });
	    $("#datepicker4").datepicker({
	        changeMonth: true,
	        changeYear: true
	    });

	    $("#datepicker5").datepicker({
	        changeMonth: true,
	        changeYear: true
	    });

	}); 
</script>
<script>
$(document).ready(function(){
	$.getJSON("https://api.ipify.org/?format=json", function(e) {
	    console.log(e.ip);
	   // alert("ioplhgfszd"+e.ip);
	    $('#myIp').val(e.ip);
	});

	//alert("executing");
	 $('#fail').hide();
	 $('#fail1').hide();
	 $('#success').hide();
	 $('#success1').hide();
	$("#subhead").keyup(function(){
	//alert("subhead=="+subhead);
		var data = $('#subhead').val();
		var subHeadArray = new Array();
 var opt='';
		if ($.trim(data) !==  "")	{
			$.ajax({
				url : "getCustomers",
				type : "GET",
				data : {q : data },
				success : function(response)	{
					//alert(response)
					var branchList = JSON.stringify(response, undefined, '\t');
				//alert('branchList===='+branchList); 
					$.each($.parseJSON(branchList),function(idx,obj){
						subHeadArray.push({
								label : obj.customerId+" "+obj.firstName+" "+obj.lastName,
						        sortable: true,
						        resizeable: true
							});
						  });
	 			  $('#subhead').autocomplete({
			              source:subHeadArray,
			               focus: function( event, ui ) {
				                  $( '#subhead' ).val( ui.item.label );
				                     return false;
				               },
				               select: function(event, ui) {
									event.preventDefault();
									$(this).val(ui.item.label);
									var subhead = ui.item.label.split(" ")[0];
									$('#subid').val(subhead);
									var c='';
									$.ajax({
										url : "custById",
										type : "POST",
										data : {subhead:subhead},
										success : function(response)	{
											//alert(response.split("-")[0]);
											opt=response;
											$('#cid').val((opt.split("-")[0]));
											$('#cflag').val("find");
											$("#cstDiv").show();
											$('#senderDiv').hide();
											$("#cst").empty();
											$("#cst").append(response);
										//alert('cid==='+cid);
										}
									});
									
									$.ajax({
										url : "cById",
										type : "POST",
										data : {subhead:subhead},
										success : function(response)	{
											//alert(response.split("-")[0]);
											opt=response;
											if(response!=' '){
												if(response=="100%"){
													$('#emsg').empty();
													$('#emsg').append("<font color='red'>Risk  Score  High..100%!</font>");
													
												}
												if(response=="88%"){
													$('#emsg').empty();
													$('#emsg').append("<font color='red'>Risk  Score  High..88%!</font>");
													
												}
												if(response=="75%"){
													$('#emsg').empty();
													$('#emsg').append("<font color='red'>Risk  Score....75%!</font>");
													
												}
												if(response=="55%"){
													$('#emsg').empty();
													$('#emsg').append("<font color='red'>Risk  Score .....55%!</font>");
													
												}
												
												
											}else{
												$('#emsg').empty();
												$('#emsg').append("<font color='green'>Risk score  Low....!</font>");
												
											}
										}
										});//ajaax
								}//select
			              
					});//autocomplete
	 	
				}//sucess
			});//ajax
		}//if
	});//function
		
	$("#collection").keyup(function(){
			//alert("subhead=="+subhead);
				var data = $('#collection').val();
				//alert('data===='+data);
				var subHeadArray = new Array();
		 var opt='';
				if ($.trim(data) !==  "")	{
					$.ajax({
						url : "getcashpickupbasedonname",
						type : "GET",
						data : {name : data },
						success : function(response)	{
							//alert(response)
							var branchList = JSON.stringify(response, undefined, '\t');
						//alert('branchList===='+branchList); 
							$.each($.parseJSON(branchList),function(idx,obj){
								subHeadArray.push({
										label : obj.cashId+" "+obj.cashPickupFrom,
								        sortable: true,
								        resizeable: true
									});
								  });
			 			  $('#collection').autocomplete({
					              source:subHeadArray,
					               focus: function( event, ui ) {
						                  $( '#collection' ).val( ui.item.label );
						                     return false;
						               },
						               select: function(event, ui) {
											event.preventDefault();
											$(this).val(ui.item.label);
											var subhead = ui.item.label.split(" ")[0];
											//$('#subid').val(subhead);
											var c='';
											$.ajax({
												url : "/common/getCashPickupByCashId",
												type : "POST",
												data : {cashId:subhead},
												success : function(obj)	{
													//alert(obj);
													$('#collectionDiv').show();
		$('#collectionPointName').val(obj.cashPickupFrom);
		$('#collectionPointCode').val(obj.collectionPointCode);
		$('#collectionPointBank').val(obj.collectionPointBank);
		$('#collectionPointAddress').val(obj.collectionPointAddress);
		$('#collectionPointCity').val(obj.collectionPointCity);
		$('#collectionPointState').val(obj.collectionPointState.stateName);
	 	$('#collectionPointTelephone').val(obj.contactNumber);
	 	$('#collectionPin').val(obj.collectionPin);
	 	$('#confrmcollectionPin').val(obj.collectionPin);
												//alert('cid==='+cid);
												}
											});//ajax
											
										}//select
					              
							});//autocomplete
			 	
						}//sucess
					});//ajax
				}//

});//function

	
	
	
	$("#bn").keyup(function(){
	var cid=$("#cid").val();
	//alert('cid==='+cid);
		var bname = $('#bn').val();
		var data="fname="+bname+"&cid="+cid;
var opt='';
		if ($.trim(data) !==  "")	{
			$.ajax({
				url : "getBen",
				type : "GET",
				data : data ,
				success : function(response)	{
					var benArray = new Array();
					var branchList = JSON.stringify(response, undefined, '\t');
				//alert('branchList===='+branchList); 
					$.each($.parseJSON(branchList),function(idx,obj){
						//alert('beneficiaryId===='+obj.firstName);
						benArray.push({
								label : obj.beneficiaryId+" "+obj.firstName,
						        sortable: true,
						        resizeable: true
							});
						  });
	 			  $('#bn').autocomplete({
			              source:benArray,
			               focus: function( event, ui ) {
				                  $( '#bn').val( ui.item.label );
				                     return false;
				               },
				               select: function(event, ui) {
									event.preventDefault();
									$(this).val(ui.item.label);
									var bn = ui.item.label.split(" ")[0];
									//alert('bn===='+bn);
									$.ajax({
										url : "benById",
										type : "POST",
										data : {bn:bn},
										success : function(response)	{
											//alert(response);
											opt=response;
											$('#bnid').val((opt.split("-")[0]));
											$("#bDiv").show();
											$('#bflag').val("exist");
											$('#bnfDiv').hide();
											$("#bnf").empty();
											$("#bnf").append(response);
										}
									});
								}
			              
					});
	 	
				}
			});
		}
});//function

	var opt='';
	var  sb=$("#subhead").val();
	$("#cst").empty();
	$("#cst").append(sb);
	$('#cashTrDiv').hide();
	$("#AccountTrDiv").hide();
	$("#CardTrDiv").hide();
	$("#CardTrDiv2").hide();
	$("#homeTrDiv").hide();
	$("#utilityTrDiv").hide();
	$("#mbTrDiv").hide();
	$("#senderDiv").hide();
	$('#collectionDiv').hide();
	$("#remDiv").hide();
	$("#bnfDiv").hide();
	$("#cstDiv").hide();
	$("#bDiv").hide();
	$('#beneficiery').prop('checked',true);
	var bid=$('#bid').val();
	$.ajax({
		url:'getCustomer',
		type:'post',
		data:'branchid='+bid,
		success:function(response){alert(response);},	
		error:function(){
			
		}
		
		
	})
	var adminid=$("#admid").val();
var functionality='sending';
var tobid=$('#tobid').val();
//alert('branchId===='+tobid);
	$.ajax({
		url:'/common/getAllBranchesBasedOnFunctionalityAndAdminIdBackend',
		type:'get',
		data:'adminId='+adminid+'&functionality='+functionality,
		success:function(response){
			
			/* alert("getting response"); */
			var opt="";
			var branchList = JSON.stringify(response, undefined, '\t');
			 $.each($.parseJSON(branchList),function(idx,obj){
			if(bid!=obj.branchId && tobid!=obj.branchId){
		opt=opt+'<option value="'+obj.branchId+'">'+obj.fromCountry.countryName+'('+obj.branchName+')</option>'
			}
			 });
			 $("#toBranchId").append(opt);
		},	
		error:function(){
			
		}
		
		
	})
	
	
});


</script>
<script>
function getptypecenters()
{

var p=$("input[name='payment']:checked").val();
//alert('p==='+p);
var branchid=$('#toBranchId').val();
//alert("tobranchid"+branchid); 
var bid=$('#bid').val();
//alert("frombranchid"+bid);
var rateFlag='selling';
var sellrate='';
$.ajax({
	url:'/common/getCurrencyRate',
	type:'get',
	data:'fromBranchId='+bid+'&toBranchId='+branchid+'&p='+p+'&rateFlag='+rateFlag,
	success:function(response){
		 sellrate = JSON.stringify(response, undefined, '\t');
		// alert("getting response"+sellrate); 
		
		 $("#exch_rate").val(sellrate);
	},	
	error:function(){
		alert("error in currency rate");
	}
	
	
})
//alert('var sellrate===='+ sellrate);
var rateFlag1='buy';
var buyrate='';
$.ajax({
	url:'/common/getBuyRates',
	type:'get',
	data:'fromBranchId='+bid+'&toBranchId='+branchid+'&p='+p+'&rateFlag='+rateFlag1,
	success:function(response){
		 buyrate = JSON.stringify(response, undefined, '\t');
		 //alert("getting response buyrate"+buyrate); 
		
		$("#buy_rate").val(buyrate);
		$("#buyingRate").val(buyrate);
	},	
	error:function(){
		alert("error in currency rate");
	}
	
	
})
var country=$('#toBranchId').val();
var adminid=$('#admid').val();
var qstring="country="+country+"&ptype="+p+"&adminid="+adminid;
var u='';
if(p=='Cash Collection')
	{
	//alert('cash');
	$('#cashTrDiv').show();
	$('#mbTrDiv').hide();
	$('#homeTrDiv').hide();
	$('#CardTrDiv').hide();
	$('#AccountTrDiv').hide();	
	$('#utilityTrDiv').hide();

	}
	if(p=='Bank Deposit'){
	$('#AccountTrDiv').show();
	$('#mbTrDiv').hide();
	$('#cashTrDiv').hide();
	$('#homeTrDiv').hide();
	$('#CardTrDiv').hide();
	$('#utilityTrDiv').hide();

	}
	if(p=='Mobile Money'){
		$('#mbTrDiv').show();
		$('#cashTrDiv').hide();
		$('#homeTrDiv').hide();
		$('#CardTrDiv').hide();
		$('#AccountTrDiv').hide();	
		$('#utilityTrDiv').hide();

	}
	if(p=='Card Transfer'){
		//alert('csrd');
		$('#CardTrDiv').show();
		$('#mbTrDiv').hide();
		$('#cashTrDiv').hide();
		$('#homeTrDiv').hide();
		$('#AccountTrDiv').hide();	
		$('#utilityTrDiv').hide();

	}
	if(p=='Mobile Airtime top up'){
		$('#mbTrDiv').show();
		$('#cashTrDiv').hide();
		$('#homeTrDiv').hide();
		$('#CardTrDiv').hide();
		$('#AccountTrDiv').hide();	
		$('#utilityTrDiv').hide();

	}
	if(p=='Bill Payment'){
		$('#utilityTrDiv').show();
		$('#mbTrDiv').hide();
		$('#cashTrDiv').hide();
		$('#homeTrDiv').hide();
		$('#CardTrDiv').hide();
		$('#AccountTrDiv').hide();	



	}
	if(p=='Home Delivery'){
		$('#homeTrDiv').show();
		$('#mbTrDiv').hide();
		$('#cashTrDiv').hide();
		$('#CardTrDiv').hide();
		$('#AccountTrDiv').hide();	
		$('#utilityTrDiv').hide();

	}

 $.ajax({
	url:u,
	type:'post',
		data:qstring,
			success:function(response){
				/* alert("response"+response); */
				var cashorbankcenters = JSON.stringify(response, undefined, '\t');
				var opt='<option value="">-select-</option>';
				if(p=='cash'){
				$.each($.parseJSON(cashorbankcenters),function(idx,obj){
					
					opt=opt+'<option value="'+obj.cashId+'">'+obj.cashPickupFrom+'</option>';
				});
				//$('#cashp').empty();
				//$('#cashp').append(opt);
				//$('.brow').hide();
				//$('.benrow').show();
				//$('.cashpickup').show();
				}if(p=='bank')
					{
					$.each($.parseJSON(cashorbankcenters),function(idx,obj){
						opt=opt+'<option value="'+obj.bankId+'">'+obj.bankName+'</option>';
					});
				//	$('#bankName').empty();
					//$('#bankName').append(opt);
					//$('.brow').show();
					/* $('.benrow').hide(); */
					//$('.cashpickup').hide();
					}
				/* alert("ptype:"+opt); */
				},
			error:function(){
				//alert("error");
			}
});
 	}

</script>
<script type="text/javascript">

function checkBankName()
{
	//alert('ghhg');
	var p=$("input[name='payment']:checked").val();
	//alert('p===='+p);
	var branchId=$('#toBranchId').val();
	//alert('branchId====='+branchId);
	var accountNumber='';
	var destinationHouse='';
	if(p=='Bill Payment'){
		accountNumber=$('#customerAccountNumber').val();
		destinationHouse=$('#bankToPay').val();
		
	}
	if(p=='Bank Deposit'){
		accountNumber=$('#beneficiaryAccountTransfer').val();
		destinationHouse=$('#bank').val();
	}
	//alert('accountNumber===='+accountNumber);
	//alert('destinationHouse===='+destinationHouse);
	var opt='';
	 $.ajax({
			url : "bankNameCheck",
			type : "POST",
			data :"accountNumber="+accountNumber+"&destinationHouse="+destinationHouse+"&branchId="+branchId+"&p="+p,
			async: false,
			success:function(response){
				//alert('response==='+response.split("-")[0]);
				if(response!='no'){
				if(response.split("-")[0] === '00'){ 
					$('#success').show();
					$('#success').empty();
					$('#success').append(response.split("-")[1]);
					$('#success1').show();
					$('#success1').empty();
					$('#success1').append(response.split("-")[1]);
				}else{
						$('#fail1').show();
						$('#fail1').empty();
						$('#fail1').append(response.split("-")[1]);
						$('#fail').show();
						$('#fail').empty();
						$('#fail').append(response.split("-")[1]);
					   $('#beneficiaryAccountTransfer').val(" ");
					   $('#bank').val("");
					   //$('#customerAccountNumber').val(" ");
					  // $('#bankToPay').val(" ");
						return false;
				   }	//return false;
				   }else{
					   
				   }
			},
			error :function(xhr,status,error){
			}
			
			 
		 });
	 
	
}

</script>
<script>
function getCurrencyRateForSendingBranch()
{
	/* alert("executing"); */
	var branchid=$('#toBranchId').val();
	 //alert("tobranchid"+branchid); 
	var bid=$('#bid').val();
 //alert("frombranchid"+bid);
  	$.ajax({
		url : "getStatesBasedOnBranch",
		method : "post",
		data : "branchId="+bid,
		async : false,
		success : function(response){
			var list =JSON.stringify(response, undefined, '\t');
			//alert('list===='+list);
			var opt='<option value="">--Select*--</option>';
			var opt1='';
			$.each($.parseJSON(list),function(idx,obj){
				opt1=opt1+'<option value="'+obj.stateName+'">'+obj.stateName+'</option>';
			 });
			$('#cState').empty();
			
			$('#cState').append(opt+opt1);
		},
		error : function(xhr,error,status){
			alert('get states error = '+xhr);
		}
	});

 	$.ajax({
		url : "getStatesBasedOnBranch",
		method : "post",
		data : "branchId="+branchid,
		async : false,
		success : function(response){
			var list =JSON.stringify(response, undefined, '\t');
			//alert('list===='+list);
			var opt='<option value="">--Select*--</option>';
			var opt1='';
			$.each($.parseJSON(list),function(idx,obj){
				opt1=opt1+'<option value="'+obj.stateName+'">'+obj.stateName+'</option>';
			 });
			$('#state').empty();
			
			$('#state').append(opt+opt1);
			$('#collectionPointState').empty();
			$('#collectionPointState').append(opt+opt1);
		},
		error : function(xhr,error,status){
			alert('get states error = '+xhr);
		}
	});

 	$.ajax({
		url:'/common/getBanksBasedOnIso',
		 data : "branchId="+branchid,
		type:'get',
		async : false,
		success:function(response){
			var bList = JSON.stringify(response, undefined, '\t');
			//alert('bList==='+bList);
				var opt='<option value="">--select--</option>'; 
				$.each($.parseJSON(bList),function(idx,obj){
					 opt=opt+'<option value="'+obj.bankCode+'">'+obj.bankName+'</option>';
				 });
				$('#bank').empty();
				$('#bank').append(opt);
				$('#collectionPointBank').empty();
				$('#collectionPointBank').append(opt);
				$('#bankToPay').empty();
				$('#bankToPay').append(opt);
			},
			error:function(){
				//alert("error");
				}
			 
			 
		 });

 var pay=$('#pay').val();
 //alert('py===='+pay);
	$.ajax({
		url:'/common/getbranchpaymenttypedetailsbasedonbranchidandstatus',
		type:'get',
		data:'branchId='+branchid+'&status=active',
		success:function(response){
			var opt="";
			/* var bpaymenttype='<option value="">-select-</option>'; */
			var paymenttype = JSON.stringify(response, undefined, '\t');
			/* alert("getting response"+paymenttype); */
			$.each($.parseJSON(paymenttype),function(idx,obj){
			 /* $("#exch_rate").val(sellrate); */
			if(pay!=obj.paymentTypes.paymentType){
			
				opt=opt+'<input  type="radio" id="payment" name="payment" onclick="getptypecenters();"  value="'+obj.paymentTypes.paymentType+'">'+obj.paymentTypes.paymentType+"&nbsp"+"&nbsp"+"&nbsp"+"&nbsp" 
			/* bpaymenttype=bpaymenttype+'<option value="'+obj.paymentTypes.paymentType+'">'+obj.paymentTypes.paymentType+'</option>'; */
			}
			});
			/* alert("payment type"+opt); */
			
			$("#pMode").empty();
			 $("#pMode").append(opt);
			 /* $("#existedBenificiery").empty();
			 $("#existedBenificiery").append(bpaymenttype);
			  $(".bcombo").hide();  */
			},
			
		error:function(){
			alert("error in payment type");
		}
		
		
	})
	
	
	var bid=$('#bid').val();
	var frombranchid=$('#bid').val();
	//alert('frombranchid===='+frombranchid);
	var sendAmount='1000';
//alert('sendAmount====='+sendAmount);
	var display='frontend';
	//alert('display====='+display);
		
	$.ajax({
		url:'/common/getmodeofpaymentlistbasedonbranchid',
		 data : "branchId="+frombranchid+"&Amount="+sendAmount.toString()+"&display="+display,
		type:'get',
		async : false,
		success:function(response){
			var mopList = JSON.stringify(response, undefined, '\t');
			//alert('mopList==='+mopList);
				var opt='<option value="">--select--</option>'; 
				$.each($.parseJSON(mopList),function(idx,obj){
					 opt=opt+'<option value="'+obj.modeOfPaymentId.modeOfPaymentId+"-"+obj.modeOfPaymentId.modeOfPayment+'">'+obj.modeOfPaymentId.modeOfPayment+'</option>';
				 });
				$('#modeOfPayment').empty();
				$('#modeOfPayment').append(opt);
			},
			error:function(){
				//alert("error");
				}
			 
			 
		 });	
	
	
	
	
	$.ajax({
		url : "getIdTypesBasedOnCountry",
		type : "get",
		data : "branchId="+branchid,
		async : false,
		success : function(response){
			var idList = JSON.stringify(response, undefined, '\t');
		//alert('idList==='+idList);
			var opt='<option value="">--select--</option>'; 
			$.each($.parseJSON(idList),function(idx,obj){
				 opt=opt+'<option value="'+obj.idValue+'">'+obj.senderType+'</option>';
			 });
			$('#idProof').empty();
			$('#idProof').append(opt);
		},
		error : function(error,xhr,status){
			alert('getbanks error  = '+xhr);
		}
		
	})


	
	
	
	}

</script>
<script type="text/javascript">
function getModeOfPayment(fromcurrencycode){
	var bid=$('#bid').val();
	var frombranchid=$('#bid').val();
	//alert('frombranchid===='+frombranchid);
	var sendAmount=$('#sendAmount').val();
//alert('sendAmount====='+sendAmount);
	var display='frontend';
	//alert('display====='+display);
		
	$.ajax({
		url:'/common/getmodeofpaymentlistbasedonbranchid',
		 data : "branchId="+frombranchid+"&Amount="+sendAmount.toString()+"&display="+display,
		type:'get',
		async : false,
		success:function(response){
			var mopList = JSON.stringify(response, undefined, '\t');
			//alert('mopList==='+mopList);
				var opt='<option value="">--select--</option>'; 
				$.each($.parseJSON(mopList),function(idx,obj){
					 opt=opt+'<option value="'+obj.modeOfPaymentId.modeOfPaymentId+"-"+obj.modeOfPaymentId.modeOfPayment+'">'+obj.modeOfPaymentId.modeOfPayment+'</option>';
				 });
				$('#modeOfPayment').empty();
				$('#modeOfPayment').append(opt);
			},
			error:function(){
				//alert("error");
				}
			 
			 
		 });

}
	
</script>
<script type="text/javascript">
function calculateEnterAmounts(){
	//alert('hjhjhj');
	var enterAmount=$('#enterAmount').val();
	var sendAmount=$('#sendAmount').val();
	var admin_fee=$('#admin_fee').val();
	var rec_fee=$('#rec_fee').val();
	var agent_fee=$('#agent_fee').val();
	var exch_rate=$('#exch_rate').val();
	var amt='';
	var amt1='';
	var amt3='';
	if(sendAmount!=''){
	if(enterAmount=='SD')
	{
		amt1=Number(admin_fee)+Number(rec_fee)+Number(agent_fee);	
		amt=Number(sendAmount)+amt1;
		 $('#total_to_pay').val(amt);
		 $('#tax_fee').val(amt1);
		 $('#cAmount').val(sendAmount);
		 amt3=Number(sendAmount)*Number(exch_rate);
			$('#receiveAmount').val(amt3);

	}else{
		amt1=Number(admin_fee)+Number(rec_fee)+Number(agent_fee);	
		amt=Number(sendAmount)-amt1;
		 $('#tax_fee').val(amt1);
		 $('#cAmount').val(amt);
		$('#total_to_pay').val(sendAmount);
		 amt3=Number(amt)*Number(exch_rate);
		$('#receiveAmount').val(amt3);
	}
	}

}
</script>
<script type="text/javascript">

function calculateFee(){
	var enterAmount=$('#enterAmount').val();
	var sendAmount=$('#sendAmount').val();
	var admin_fee=$('#admin_fee').val();
	var rec_fee=$('#rec_fee').val();
	var agent_fee=$('#agent_fee').val();
	var amt='';
	var amt1='';
	if(enterAmount=='SD')
	{
		amt1=Number(admin_fee)+Number(rec_fee)+Number(agent_fee);	
		amt=Number(sendAmount)+amt1;
		 $('#total_to_pay').val(amt);
		 $('#tax_fee').val(amt1);
		 $('#cAmount').val(sendAmount);

	}else{
		amt1=Number(admin_fee)+Number(rec_fee)+Number(agent_fee);	
		amt=Number(sendAmount)-amt1;
		 $('#tax_fee').val(amt1);
		 $('#cAmount').val(amt);
		$('#total_to_pay').val(sendAmount);
		
	}	
}

</script>
<script type="text/javascript">
function calculateAmount(){
	var sendAmount=$('#cAmount').val();
	var exch_rate=$('#exch_rate').val();
	var dollerAmt=Number(sendAmount)*Number(exch_rate);
	 //alert('dollerAmt in if condition====='+dollerAmt);
	$('#receiveAmount').val(dollerAmt.toFixed(4));
	$('#amountInDoller').val(dollerAmt.toFixed(4));

}

</script>
<script type="text/javascript">
function calculateSendingAmount(fromcurrencycode){
	var toBranchId=$('#toBranchId').val();
	var sendAmount=$('#sendAmount').val();
	var buy_rate=$('#buy_rate').val();
	//alert('toBranchId-===='+toBranchId);
  	var mfees=0;
	var amount=$('#amountToCollect').val();
	//alert('sendAmount==='+sendAmount);
	var bid=$('#bid').val();
	var adminid=$('#admid').val();
	//alert('adminid===='+adminid);
	 var mop=$('#modeOfPayment').val();
	 //alert('mop===='+mop);
		var arr=[];
		 var arr=mop.split("-"); 
		//alert("arr==="+arr[1]);
		var frombranchid=$('#bid').val();
		//alert('frombranchid==='+frombranchid);
		var querystring="adminid="+adminid+"&bid="+frombranchid+"&mop="+arr[1]+"&Amount="+sendAmount;
		//alert('querystring==='+querystring); 
		$.ajax({
			url:'/common/getMop',
			data:querystring,
			type:'get',
			async : false,
			success:function(response){
				mfees=response,
			 //alert("response"+response); 
	$('#mFee').val(response);
		 mfees=Number(response);
		 //alert('mfees====='+mfees);
		 $('#mfees').val(mfees);
		 			$('#amountToCollect').val(mfees);
			$('#modeOfPaymentFee').val(mfees);

				},
			error:function(){
				alert("error");}
			 
			 
		 });

//alert('mfee123==='+mfees);

	/* var fromCountryMaxLimit=$('#sendingBranchPerTransactionLimit').val();
	var fromCountryMinLimit=$('#sendingBranchMinimunPerTransactionLimit').val(); */
	
	
	/* var toCountryMaxLimit=$('#receivingBranchPerTransactionLimit').val();
	var toCountryMinLimit=$('#receivingBranchMinimumPerTransactionLimit').val();
	 */
	
	if(toBranchId==''){
		alert("please choose any receiving country....!");
		$('#toBranchId').focus().css('outline' , '2px solid red');
		$('#sendAmount').val('');
		return false;
	}
	var paymentmode=$('#amountToCollect').val();

/* 	if(paymentmode==''){
		 alert("please select mode of payment");
		 clearTransactionDetails();
		 return false;
	}
 */	 var pType='';
	 if($('#ptype').prop("checked")==true){
		 pType=$('#ptype').val();
	 }
	/*  if($('#cash').prop("checked")==true){
		 pType=$('#cash').val();
	 } 
	 if($('#bKash').prop("checked")==true){
		 pType=$('#bKash').val();
	 }
	 if($('#eWallet').prop("checked")==true){
		 pType=$('#eWallet').val();
	 } */
	 /* if(pType==''){
		 $('#ptype').focus().css('outline' , '1px solid red');
		/*  $('#bank').focus().css('outline' , '1px solid red');
		 $('#bKash').focus().css('outline' , '1px solid red');
		 $('#eWallet').focus().css('outline' , '1px solid red'); */
		 /* return false;
	 }  */
	 /* if(pType=="cash") {
			pType="5";
		}
		if(pType=="bank") {
			pType="1";
		}
		if(pType=="eWallet") {
			pType="2";
		} */
		$('#pType').val(pType);
		//alert('pType===='+pType);
		var maxvalue=0;
		var p=$("input[name='payment']:checked").val();
		//alert('ptype===='+p);
		var sfee="fromBranchId="+bid+"&toBranchId="+toBranchId+"&adminid="+adminid+"&p="+p;
		//alert('sfe======'+sfee);
		$.ajax({
				url : "/common/getAllAdminSpecificBranchServiceFee",
				method : "get",
				data : sfee,
				async : false,
				success : function(response){
					var servicefees = JSON.stringify(response, undefined, '\t'); 
				// alert("yes all service of branch lenght:"+response.length); 
					 $.each($.parseJSON(servicefees),function(idx,obj){
						 if(obj.maxValue>=Number(maxvalue)){
						 maxvalue=obj.maxValue;
						 }
					 });
					
				// alert("maxvalue"+maxvalue);
					/* alert("all service fee:"+servicefee); */
				},
				error : function(xhr,error,status){
					alert('get fee error first : '+error+status);
				}
				
				
			})


		
		
var entered_amount=$('#sendAmount').val();
var fromsellrate=$('#exch_rate').val();
var buyrate=$('#buy_rate').val();
/* var toCurrencyRatesRev=$('#receivingBranchCurrencyRateRev').val();
var fromCurrencyRates=$('#sendingBranchCurrencyRate').val(); */
/* var taxFee=$('#taxFee').val(); */

/* var toCountryCurrencyCode=$('#toCountryCurrencyCode').val();
var fromCountryCurrencyCode=$('#fromCountryCurrencyCode').val(); */

var dollerAmt='';
var sendingBranchCurrencyRate='';
var receivingAmt='';
var total_to_pay='';
var exch_rate='';
var servicfee='';
var servicefee='';
var pf='';
var fees='';
var afee='';
//var mfees='';
	if(entered_amount!=''){
		
		
		
		
		
		
		/* if(Number(entered_amount)>Number(toCountryMaxLimit)){
			//alert("sorry...you can't send more than amount!");
			$('#receiveAmount').css('outline' , '1px solid red');
			$('#maxReceiveAlert').empty();
			$('#maxReceiveAlert').append("<label><font color='red'>This can't be more than "+toCountryMaxLimit+" "+toCountryCurrencyCode+"</font></label>");
			clearTransactionDetails();
			return false;
		}else{ */
			$('#maxReceiveAlert').empty();
			removeError('receiveAmount');
		/* } */
		
		/* if(Number(entered_amount)<Number(toCountryMinLimit)){
			$('#receiveAmount').css('outline' , 'solid red 1px');
			$('#maxReceiveAlert').empty();
			$('#maxReceiveAlert').append("<label><font color='red'>This can't be less than "+toCountryMinLimit+" "+toCountryCurrencyCode+"</font></label>");
		} else{ */
			$('#minReceiveAlert').empty();
			removeError('receiveAmount');
		/* }  */
		
		if(entered_amount>maxvalue)
			{
			alert("amount exceeding the limit");
			clearTransactionDetails();
			return false;
			}
/* 		 dollerAmt=Number(entered_amount)*Number(fromsellrate);
 */		  /* receivingAmt=Number(dollerAmt)*Number(fromCurrencyRates); */
		 
		  

		  
		  var data="fromBranchId="+bid+"&toBranchId="+toBranchId+"&amount="+entered_amount+"&paymentType="+p;
			$.ajax({
				url : "/common/getServiceFee",
				method : "get",
				data : data,
				async : false,
				success : function(response){
				//alert(response); 
				servicfee=response;	
					servicefee=Number(response)*Number(fromsellrate);
					/* alert("after adding currency rate to service fee:"+servicefee); */
				},
				error : function(xhr,error,status){
					alert('get fee error second : '+error+status);
				}
				
				
			});
			//alert('mfeews===='+mfees);
			
			fees=Number(Number(servicefee)/Number(fromsellrate))+Number(mfees);
			//alert('fees======'+fees);
			
			
			
			  var data="fromBranchId="+bid+"&toBranchId="+toBranchId+"&fees="+fees;
				$.ajax({
					url : "/common/getAgentFee",
					method : "get",
					data : data,
					async : false,
					success : function(response){
					//alert('agentfee===='+response); 
					afee=response;	
					},
					error : function(xhr,error,status){
						alert('get fee error : '+error+status);
					}
					
					
				});

			$('#agentFee').val(Number(afee));
			$('#agent_fee').val(Number(afee));
			var adfee='';  
			var data="fromBranchId="+bid+"&toBranchId="+toBranchId+"&fees="+fees;
				$.ajax({
					url : "/common/getAdminFee",
					method : "get",
					data : data,
					async : false,
					success : function(response){
					//alert('adminfee====='+response); 
					adfee=response;	
					},
					error : function(xhr,error,status){
						alert('get fee error : '+error+status);
					}
					
				});

			$('#rec_fee').val(Number(fees)-(Number(adfee)+Number(afee)));
			$('#admin_fee').val(Number(adfee));
			var enterAmount=$('#enterAmount').val();
			if(enterAmount=='SD')
			{
				$('#cAmount').val(Number(entered_amount));
			 dollerAmt=Number(entered_amount)*Number(fromsellrate);
			 //alert('dollerAmt in if condition====='+dollerAmt);
			$('#receiveAmount').val(dollerAmt.toFixed(4));
			$('#amountInDoller').val(dollerAmt.toFixed(4));
			total_to_pay=Number(entered_amount)+Number(Number(servicefee)/Number(fromsellrate));
			total_to_pay=Number(total_to_pay)+Number(mfees);
			}
			else{
				 dollerAmt=(Number(entered_amount)-Number(fees))*Number(fromsellrate);
				//alert('dollerAmt in else condition====='+dollerAmt);	
				 $('#receiveAmount').val(dollerAmt.toFixed(4));
					$('#amountInDoller').val(dollerAmt.toFixed(4));
					$('#cAmount').val(Number(entered_amount)-Number(fees));
					total_to_pay=Number(entered_amount);
			}
			/* exch_rate=Number(Number(entered_amount)/Number(receivingAmt)); */
		$('#tax_fee').val(fees);
		 $('#taxFee').val(servicfee); 

		pf=(Number(fromsellrate)-Number(buyrate))*Number(entered_amount);
			//alert('pf==='+pf);
			$('#profitRate').val(pf.toFixed(4));
		 $('#total_to_pay').val(total_to_pay);
	}else{
		clearTransactionDetails(); 
		return false;
	}
}
</script>
<script type="text/javascript">
function calculateReceivingAmount(){
	var toBranchId=$('#toBranchId').val();
	var bid=$('#bid').val();
	var adminid=$('#admid').val();
/* 	var fromCountryMaxLimit=$('#sendingBranchPerTransactionLimit').val();
	var fromCountryMinLimit=$('#sendingBranchMinimunPerTransactionLimit').val(); */
	
	
	/* var toCountryMaxLimit=$('#receivingBranchPerTransactionLimit').val();
	var toCountryMinLimit=$('#receivingBranchMinimumPerTransactionLimit').val();
	 */
	
	if(toBranchId==''){
		alert("please choose any receiving country....!");
		$('#toBranchId').focus().css('outline' , 'solid red 2px');
		var toBranchId=$('#receiveAmount').val('');	
		return false;
	}
	var modep=$('#amountToCollect').val();
	if(modep==''){
		alert("please select mode of payment first");
		clearTransactionDetails();
		return false;}
	
	
	
	 var pType='';
	 if($('#ptype').prop("checked")==true){
		 pType=$('#ptype').val();
	 }
	/*  if($('#cash').prop("checked")==true){
		 pType=$('#cash').val();
	 }
	 if($('#bKash').prop("checked")==true){
		 pType=$('#bKash').val();
	 }
	 if($('#eWallet').prop("checked")==true){
		 pType=$('#eWallet').val();
	 } */
	/*  if(pType==''){
		 $('#ptype').focus().css('outline' , '1px solid red');
		 /* $('#bank').focus().css('outline' , '1px solid red');
		 $('#bKash').focus().css('outline' , '1px solid red');
		 $('#eWallet').focus().css('outline' , '1px solid red'); */
		/*  return false;
	 }  */
	/*  if(pType=="cash") {
			pType="5";
		}
		if(pType=="bank") {
			pType="1";
		}
		if(pType=="eWallet") {
			pType="2";
		} */
		/* $('#pType').val(pType); */
	// alert('payment type = '+pType);
	/* var toCountryCurrencyCode=$('#toCountryCurrencyCode').val();
	//alert('toCountryCurrencyCode = '+toCountryCurrencyCode);
	var fromCountryCurrencyCode=$('#fromCountryCurrencyCode').val();
//	alert('fromCountryCurrencyCode= '+fromCountryCurrencyCode); */
	var entered_amount=$('#receiveAmount').val();
	var sendingcurrencyrate=$('#exch_rate').val();
	//alert('sendingcurrencyrate==='+sendingcurrencyrate);
	var buy_rate=$('#buy_rate').val();
	//alert('buy_rate==='+buy_rate);
	var profitrate=Number(sendingcurrencyrate)-Number(buy_rate);
	//alert('profitrate==='+profitrate);
	/* var toCurrencyRates=$('#receivingBranchCurrencyRate').val();
	var fromCurrencyRatesRev=$('#sendingBranchCurrencyRateRev').val();
	var fromCurrencyRates=$('#sendingBranchCurrencyRate').val();
	var taxFee=$('#taxFee').val(); */
	/* 
	alert('toCurrencyRates = '+toCurrencyRates);
	alert('fromCurrencyRatesRev= '+fromCurrencyRatesRev);
	alert('taxFee = '+taxFee);
	 */
	 var maxvalue=0;
	 var sfee="fromBranchId="+bid+"&toBranchId="+toBranchId+"&adminid="+adminid;
	 $.ajax({
			url : "/common/getAllAdminSpecificBranchServiceFee",
			method : "get",
			data : sfee,
			async : false,
			success : function(response){
				var servicefees = JSON.stringify(response, undefined, '\t'); 
				/* alert("yes all service of branch lenght:"+response.length); */
				 $.each($.parseJSON(servicefees),function(idx,obj){
					 if(obj.maxValue>=Number(maxvalue)){
					 maxvalue=obj.maxValue;
					 }
				 });
				
			/* alert("maxvalue"+maxvalue);	 */
				
				
				/* alert("all service fee:"+servicefee); */
			},
			error : function(xhr,error,status){
				alert('get fee error : '+error+status);
			}
			
			
		})

	
	var fromCountryCurrencyCode=$('#fromCountryCurrencyCode').val();
	
	var dollerAmt='';
	var sendingBranchCurrencyRate='';
	var receivingAmt='';
	var receivingAmt1='';
	var total_to_pay='';
	var exch_rate='';
	var diff='';
	var sfee='';
	var servicefee='';
	/* entered_amount=entered_amount.replace(/\s/g,'');
	var entered_amount1=entered_amount; */
	
	if(entered_amount!=''){
	
		
		
/* 		
		if(Number(entered_amount)>Number(fromCountryMaxLimit)){
			//alert("sorry...you can't send more than amount!");
			$('#sendAmount').focus().css('outline' , '1px solid red');
			$('#maxSendAlert').empty();
			$('#maxSendAlert').append("<label><font color='red'>This can't be more than "+fromCountryMaxLimit+" "+fromCountryCurrencyCode+"</font></label>");
			clearTransactionDetails();
			return false;
		}else{
			$('#maxSendAlert').empty();
			removeError('sendAmount');
		}
		
		if(Number(entered_amount)<Number(fromCountryMinLimit)){
			$('#sendAmount').focus().css('outline' , 'solid red 1px');
			$('#minSendAlert').empty();
			$('#minSendAlert').append("<label><font color='red'>This can't be less than "+fromCountryMinLimit+" "+fromCountryCurrencyCode+"</font></label>");
			//clearTransactionDetails();
			//return false;
		} else{
			$('#minSendAlert').empty();
			removeError('sendAmount');
		} */
		  dollerAmt=Number(entered_amount)/Number(sendingcurrencyrate);
		var amou=Math.round(dollerAmt);
		  //alert("dollar:"+dollerAmt);
		 //alert("amo:"+amou); 
	/* var am="10"; */
		/*var amounstr=parseInt(dollerAmt);
		
	
		alert("amount after parsing"+amounstr); */
		/* receivingAmt=Number(dollerAmt)*Number(toCurrencyRates); */
		/* if(amou<1)
			{
			alert("you cant send this much low amount");
			clearTransactionDetails();
			return false;
			} */
		
		if(amou>maxvalue)
			{
			alert("amount exceeding the limit");
			clearTransactionDetails();
			return false;
			}
		
			

			
		
		var data="fromBranchId="+bid+"&toBranchId="+toBranchId+"&amount="+amou;
		/* var data="fromBranchId="+bid+"&toBranchId="+toBranchId+"&amount="+am; */
		/* var data="fromCurr=SGD&toCurr="+toCountryCurrencyCode+"&pType="+pType+"&amount="+receivingAmt; */
		$.ajax({
				url : "/common/getServiceFee",
				method : "get",
				data : data,
				async : false,
				success : function(response){
					/* alert(response); */
				sfee=response;	
					servicefee=Number(response)*Number(sendingcurrencyrate);
					/* alert("after adding currency rate to service fee:"+servicefee); */
				},
				error : function(xhr,error,status){
	
					
					
					
					
					
					
					alert('get fee error : '+error+status);
				}
				
				
			});		
		//var data="fromBranchId="+bid+"&toBranchId="+toBranchId+"&amount="+entered_amount;
			//
			/* if(Number(receivingAmt)>Number(toCountryMaxLimit)){
				//alert("sorry...you can't send more than amount!");
				$('#receiveAmount').css('outline' , '1px solid red');
				$('#maxReceiveAlert').empty();
				$('#maxReceiveAlert').append("<label><font color='red'>This can't be more than "+toCountryMaxLimit+" "+toCountryCurrencyCode+"</font></label>");
				clearTransactionDetails();
				return false;
			}else{ */
				$('#maxReceiveAlert').empty();
				removeError('receiveAmount');
		/* 	} */
			
			/* if(Number(receivingAmt)<Number(toCountryMinLimit)){
				$('#receiveAmount').css('outline' , 'solid red 1px');
				$('#maxReceiveAlert').empty();
				$('#maxReceiveAlert').append("<label><font color='red'>This can't be less than "+toCountryMinLimit+" "+toCountryCurrencyCode+"</font></label>");
			} else{ */
				$('#minReceiveAlert').empty();
				removeError('receiveAmount');
			/* }  */
			
			
			total_to_pay=Number(entered_amount)+Number(servicefee);
			/* alert("total dollar amonunt:"+total_to_pay); */
			total=Number(total_to_pay)/Number(sendingcurrencyrate);
			if(total>=1){
			total=Number(total)+Number(modep);
			}
			/* exch_rate=Number(Number(receivingAmt)/Number(entered_amount)); */
			/* $('#receiveAmount').val(receivingAmt.toFixed(4)); */
			 /* $('#sending_amount').empty(); */
			 $('#sendAmount').val(dollerAmt.toFixed(8));/* +" "+fromCountryCurrencyCode */
			 $('#tax_fee').val(sfee); 
			$('#taxFee').val(sfee);
			$('#total_to_pay').val(Math.round(total));
			/* $('#exch_rate').val(exch_rate.toFixed(4));  */
			$('#amountInDoller').val(entered_amount);
			/* $('#amountToCollect').val(Math.round(total)*Number(modep)); */
			
	}
	else{
		clearTransactionDetails();
		return false;
	} 
		
	
}
</script>
<script type="text/javascript">
function clearTransactionDetails(){
	$('#sendAmount').val('');
	$('#receiveAmount').val('');
	$('#tax_fee').val('');
	$('#total_to_pay').val('');
	/* $('#exch_rate').val(''); */
	$('#amountInDoller').val('');
	
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
</script>
<script type="text/javascript">
function setCollectionInfo(cashId){
	//alert('cashId===='+cashId);
	$('#collectionDiv').show();
	var opt='';
	$.ajax({
	url:'/common/getCashPickupByCashId',
	type:'post',
	data:'cashId='+cashId,
	success:function(obj){
//alert('obj====='+obj);
		$('#collectionPointName').val(obj.cashPickupFrom);
		$('#collectionPointCode').val(obj.collectionPointCode);
		$('#collectionPointBank').val(obj.collectionPointBank);
		$('#collectionPointAddress').val(obj.collectionPointAddress);
		$('#collectionPointCity').val(obj.collectionPointCity);
		$('#collectionPointState').val(obj.collectionPointState.stateName);
	 	$('#collectionPointTelephone').val(obj.contactNumber);
	 	$('#collectionPin').val(obj.collectionPin);
	 	$('#confrmcollectionPin').val(obj.collectionPin);
	},
	error:function(){
		alert("error");
	}
	});
}
</script>
<script>
function setCustomerInfo(customerid)
{
	/* alert("customerid"+customerid); */
	/* $('#myModal').modal('hide'); */
	var opt='';
$.ajax({
	
url:'/common/getSpecificCustomerDetails',
type:'post',
data:'customerid='+customerid,
success:function(obj){
	//alert('firstIdIssueCountry==='+obj.issuingCountry);
	$('#cid').val(obj.customerId);
	$('#customerId').val(obj.customerId);
	$('#mobileNo').val(obj.mobileNumber);
	$('#gender').val(obj.gender);
	$('#forName').val(obj.firstName);
	$('#surName').val(obj.lastName);
 	$('#datepicker').val(obj.dob); 
	$('#cityState').val(obj.cityOrState);
	$('#custAddress').val(obj.address);
	$('#postcode').val(obj.postalCode);
	$('#email').val(obj.emailId);
	/* $('#sourceOfFund').val(obj.); */
	$('#occupation').val(obj.occupation);
	 $('#firstIdProofType').val(obj.firstIdProofType);
	$('#firstIdNumber').val(obj.firstIdNumber);
	$('#datepicker1').val(obj.firstIdIssueDate);
	$('#datepicker2').val(obj.firstIdExpireDate); 
	$('#firstIdIssueCountry').val(obj.issuingCountry.countryISO);
	/* $('.brow').hide(); */
	$.ajax({
		url : "cById",
		type : "POST",
		data : {subhead:customerid},
		success : function(response)	{
			//alert(response.split("-")[0]);
			opt=response;
			if(response!=' '){
				if(response=="100%"){
					$('#emsg1').empty();
					$('#emsg1').append("<font color='red'>Risk  Score  High..100%!</font>");
					
				}
				if(response=="88%"){
					$('#emsg1').empty();
					$('#emsg1').append("<font color='red'>Risk  Score  High..88%!</font>");
					
				}
				if(response=="75%"){
					$('#emsg1').empty();
					$('#emsg1').append("<font color='red'>Risk  Score....75%!</font>");
					
				}
				if(response=="55%"){
					$('#emsg1').empty();
					$('#emsg1').append("<font color='red'>Risk  Score....55%!</font>");
					
				}
				
				
			}else{
				$('#emsg1').empty();
				$('#emsg1').append("<font color='green'>Risk score  Low....!</font>");
				
			}
			
			
			
			
		}
		});
	},
error:function(){
	alert("error");
}

});
	}


</script>
<script type="text/javascript">
function searchcollectionpoint(){
	var collectionPointState=$('#source').val();
	//alert('collectionPointState==='+collectionPointState);
	var data="stateid="+collectionPointState;	
	$.ajax({
			url : "getcollectionpointbystate" , 
			method : "GET",
			data : data,
			success  : function(response){
			//alert("getting response"+response); 
				var customerList = JSON.stringify(response, undefined, '\t');
				var tablerow='';
				var i=0;
				var inputFields='';
				$.each($.parseJSON(customerList),function(idx,obj){
					
					/* alert("getting response"+obj.firstName); */
					var row='<tr>';
					var td1='<td><a href="#" data-dismiss="modal" onclick=setCollectionInfo("'+obj.cashId+'");>'+obj.cashPickupFrom+'</a></td>';
					var td2='<td>'+obj.collectionPointCity+'</td>';
					var td3='<td>'+obj.contactNumber + '</td>';
					var td4='<td>'+obj.collectionPointBank+'</td>';
					var td5='<td>'+obj.collectionPointAddress+'</td></tr>';
					tablerow=tablerow+row+td1+td2+td3+td4+td5;
					
					inputFields=inputFields+'<input type="hidden" id="field'+i+'" value="'+obj.cashId+'#'+obj.cashPickupFrom+'#'+obj.collectionPointCity+'#'+obj.contactNumber+'#'+obj.collectionPointBank+'#'+obj.collectionPointAddress+'#'+obj.collectionPin+'">'	 
					i=parseInt(i)+1;
				});
				$('#ctbody').empty();
				$('#ctbody').append(tablerow);
				$('#collectionData').empty();
				$('#collectionData').append(inputFields);
				
			},
			error : function(xhr,error,status){
				alert("searchCustomerForTransaction error::"+error+status);
			}
		})	

}
</script>
<script type="text/javascript">
function searchCustomer(){
	var mobileNumber=$('#mobileNumber').val();
	var firstName=$('#firstName').val();
	var lastName=$('#lastName').val();
	var datepicker3=$('#datepicker3').val();
	var emailId=$('#emailId').val();
	var firstIdNumber=$('#firstIdNumber').val();
	var address=$('#address').val();
	var postalCode=$('#postalCode').val();
	var cityOrState=$('#cityOrState').val();

	var data="mobileNumber="+mobileNumber+"&firstName="+firstName+"&lastName="+lastName+"&dob="+datepicker3+"&emailId="+emailId+"&firstIdNumber="+firstIdNumber+"&address="+address+"&postalCode="+postalCode+"&cityOrState="+cityOrState;
	$.ajax({
		url : "/common/searchCustomerForTransaction" , 
		method : "GET",
		data : data,
		success  : function(response){
			/* alert("getting response"+response); */
			var customerList = JSON.stringify(response, undefined, '\t');
			var tablerow='';
			var i=0;
			var inputFields='';
			$.each($.parseJSON(customerList),function(idx,obj){
				
				/* alert("getting response"+obj.firstName); */
				$('#customerFirstIdDiv').empty();
				$('#customerFirstIdDiv').append('<img src=${pageContext.request.contextPath}/images/customerimages/'+obj.customerId+'/'+obj.customerId+'_1.jpg width="100" height="55">');
				var row='<tr>';
				var td1='<td><a href="#" data-dismiss="modal" onclick=setCustomerInfo("'+obj.customerId+'");>'+obj.firstName+' '+obj.lastName+'</a></td>';
				var td2='<td>'+obj.mobileNumber+'</td>';
				var td3='<td>'+obj.cityOrState + ' '+obj.address+'</td>';
				var td4='<td>'+obj.firstIdProofType+'</td>';
				var td5='<td>'+obj.firstIdNumber+'</td></tr>';
				tablerow=tablerow+row+td1+td2+td3+td4+td5;
				
				inputFields=inputFields+'<input type="hidden" id="field'+i+'" value="'+obj.customerId+'#'+obj.mobileNumber+'#'+obj.firstName+'#'+obj.lastName+'#'+obj.dob+'#'+obj.gender+'#'+obj.cityOrState+'#'+obj.address+'#'+obj.postalCode+'#'+obj.emailId+'#'+obj.firstIdProofType+'#'+obj.firstIdNumber+'#'+obj.firstIdIssueDate+'#'+obj.firstIdExpireDate+'#'+obj.issuingCountry.countryName+'">'	 
				i=parseInt(i)+1;
			});
			$('#tbody').empty();
			$('#tbody').append(tablerow);
			$('#customerData').empty();
			$('#customerData').append(inputFields);
			
		},
		error : function(xhr,error,status){
			alert("searchCustomerForTransaction error::"+error+status);
		}
	})	
}


</script>
<script>
function doTransaction1()
{
//alert('ne b');
$('#bflag').val("new");
$('#bnfDiv').show();
$("#bDiv").hide();
$('#bn').val(" ");

}

</script>
<script type="text/javascript">
function doTransaction5()
{
$('#senderDiv').hide();
$('#cstDiv').hide();
$('#cflag').val("new");
$('#subhead').val(" ");
$('#remDiv').show();
}
</script>
<script>
function doTransaction2()
{
//alert('ne b');
	$('#myModal').modal('show');
$('#cflag').val("search");
$('#senderDiv').show();
$('#cstDiv').hide();
$('#subhead').val(" ");
}

</script>
<script type="text/javascript">
function searchcollectioninfo(){
 	var branchid=$('#toBranchId').val();
 	//alert('branchid===='+branchid);
	$.ajax({
		url : "getStatesBasedOnBranch",
		method : "post",
		data : "branchId="+branchid,
		async : false,
		success : function(response){
			var list =JSON.stringify(response, undefined, '\t');
			//alert('list===='+list);
			var opt='';
			//<select name="collectionPointState" id="collectionPointState"><option value="">--Select*--</option>';
				//'<option value="">--Select*--</option>';
			var opt1='';
			$.each($.parseJSON(list),function(idx,obj){
				opt1=opt1+'<option value="'+obj.stateId+'">'+obj.stateName+'</option>';
			 });
			$('#source').empty();
			$('#source').append(opt+opt1);
			$('#collectionmyModal').modal('show');	

		},
		error : function(xhr,error,status){
			alert('get states error = '+xhr);
		}
	});


}


</script>
<script>
function doTransaction()
{
	
	
var country=$('#toBranchId').val();
var sendamount=$('#sendAmount').val();
var receiveamount=$('#receiveAmount').val();
var servicefee=$('#tax_fee').val();
var totalamountindollar=$('#total_to_pay').val();
var modeofpayment=$('#modeOfPayment').val();
var paymenttype=$("input[name='payment']:checked").val();
var senderphoneno=$('#custMobNo').val();
var senderidproof=$('#firstIdProofType').val();
var receiverfirstname=$('#bfirstName').val();
var receiverlastname=$('#blastName').val();
var receivergender=$('#bgender').val();
var mobileno=$('#receiverMobileNumber').val();
var benifecierycheck=$("input[name='beneficiery']:checked").val();
 var receiverpurpose=$('#purpose').val();
var receiverrelation=$('#relationShip').val();
 var sourceOfFund=$('#sourceOfFund').val();
 /* var existingbenficiery=$('#existedBenificiery').val(); */
 var benpaymenttype=$('#benpaymenttype').val();
 var receivercitystate=$('#bcityOrState').val();
 var cState=$('#cState').val();
 var state=$('#state').val();
var receiveraddress=$('#baddress').val();
var receiveridproof=$('#idProof').val();
var receiveridproofno=$('#idProofNo').val();
var receiverbank=$('#bankName').val();
var receiverbankstate=$('#bankState').val();
var recbranchcode=$('#branchCode').val();
var receiveraccno=$('#accountNo').val();
var bemailId=$('#bemailId').val();
var collectionPointName=$('#collectionPointName').val();
//alert('collectionPointName===='+collectionPointName);
var collectionPointCode=$('#collectionPointCode').val();
//alert('collectionPointCode==='+collectionPointCode);
var collectionPointBank=$('#collectionPointBank').val();
var collectionPointAddress=$('#collectionPointAddress').val();
var collectionPointCity=$('#collectionPointCity').val();
var collectionPointState=$('#collectionPointState').val();
var collectionPointTelephone=$('#collectionPointTelephone').val();
var collectionPin=$('#collectionPin').val();
var beneficiaryAccountTransfer=$('#beneficiaryAccountTransfer').val();
var bankDetails=$('#bankDetails').val();
var bank=$('#bank').val();
var swiftCode=$('#swiftCode').val();
var iBAN=$('#iBAN').val();
var branch=$('#branch').val();
var BranchCity	=$('#BranchCity').val();
var branchState=$('#branchState').val();
var telephone=$('#telephone').val();
var branchManager=$('#branchManager').val();
var cardNumber=$('#cardNumber').val();
var beneficiaryAddress1=$('#beneficiaryAddress1').val();
var beneficiaryAddress2=$('#beneficiaryAddress3').val();
var beneficiaryAddress3=$('#beneficiaryAddress3').val();
var beneficiaryCity=$('#beneficiaryCity').val();
var beneficiaryPostCode=$('#beneficiaryPostCode').val();
//alert('beneficiaryPostCode====='+beneficiaryPostCode);
var beneficiaryIdType=$('#beneficiaryIdType').val();
var beneficiaryIdDetails=$('#beneficiaryIdDetails').val();
var deliveryNote=$('#deliveryNote').val();
var utilityCompany=$('#utilityCompany').val();
var customerAccountNumber=$('#customerAccountNumber').val();
var invoiceNumber=$('#invoiceNumber').val();
var bankToPay=$('#bankToPay').val();
var iBan=$('#iBan').val();
var bankBicCode=$('#bankBicCode').val();
var addressLine1=$('#addressLine1').val();
var addressLine2=$('#addressLine2').val();
var addressLine3=$('#addressLine3').val();
var city=$('#city').val();
var state=$('#state').val();
var billDescription=$('#billDescription').val();
var mobileTrnsferNumber=$('#mobileTrnsferNumber').val();
var transferNetWork=$('#transferNetWork').val();
var transferNetWorkCreditType=$('#transferNetWorkCreditType').val();
var profitRate=$('#profitRate').val();
var buyingRate=$('#buyingRate').val();
var agentFee=$('#agent_fee').val();
var adminFee=$('#admin_fee').val();
var recFee=$('#rec_fee').val();
var buyRate=$('#buy_rate').val();
var txid=$('#txid').val();
var mobileNo1=$('#mobileNo1').val();
var gender1=$('#gender1').val();
var forName1=$('#forName1').val();
var surName1=$('#surName1').val();
var datepicker3=$('#datepicker3').val();
var cityState1=$('#cityState1').val();
var custAddress1=$('#custAddress1').val();
var custpostcode1=$('#custpostcode1').val();
var email1=$('#email1').val();
var cuspwd=$('#cuspwd').val();
var firstIdProofType1=$('#firstIdProofType1').val();
var firstIdNumber1=$('#firstIdNumber1').val();
var datepicker4=$('#datepicker4').val();
var datepicker5=$('#datepicker5').val();
var idProofIssueCountry=$('#idProofIssueCountry1').val();
var occupation1=$('#occupation1').val();

var confrmcollectionPin=$('#confrmcollectionPin').val();
//alert('confrmcollectionPin-===='+confrmcollectionPin);
var receiveraccountholdername=$('#accountHolderName').val();
var cflag=$('#cflag').val();
	if(country==""){
		alert("select receiving country");
		
	return false;}
	if(paymenttype==""||paymenttype==undefined){
		alert("select payment type");
		
	return false;}
	if(sourceOfFund=='')
		{
		
		alert("select source of fund");
		return false;
		}
	if(sendamount==""){
		alert("Enter Sending Amount");
		
	return false;}
	
	if(receiveamount==""){
		alert("Enter  Amount");
		
	return false;}
	
	if(totalamountindollar==""){
		alert("unable to Add total amount");
		
	return false;}
	if(modeofpayment==""){
		alert("please select mode of Payment");
		
	return false;}
	
	if(servicefee==""){
		alert("unable to process service fee");
		
	return false;}
	if(cflag=="search"){
		
	if(senderphoneno==""){
		alert("please provide Customer Phone no");
		
	return false;}
	if(senderidproof==""){
		alert("please provide Customer id proof ");
		
	return false;}
	}
	var bflag=$('#bflag').val();
	var txid=$('#txid').val();
	if(txid==""){
		if(cflag==="new"){
			if(mobileNo1==""){
				alert("please provide remitter mobile number ");
				
			return false;}
			if(cuspwd===""){
			alert("please provide remitter password...");
			return false;
			}
			if(gender1==""){
				alert("please provide remitter gender  ");
				
			return false;}
			if(forName1==""){
				alert("please provide remitter First name ");
				
			return false;}
			if(surName1==""){
				alert("please provide remitter last name ");
				
			return false;}
			if(datepicker3==""){
				alert("please provide remitter date of birth  ");
				
			return false;}
			if(datepicker4==""){
				alert("please provide remitter Id Issue Date ");
				
			return false;}
			if(datepicker5==""){
				alert("please provide remitter Id Expire Date ");
				
			return false;}
			if(cityState1==""){
				alert("please provide remitter city/state name ");
				
			return false;}
			if(custAddress1==""){
				alert("please provide remitter Address ");
				
			return false;}
			if(custpostcode1==""){
				alert("please provide remitter postcode  ");
				
			return false;}
			if(email1==""){
				alert("please provide remitter email ");
				
			return false;}
			var testVal='';
			$.ajax({
				url : "${pageContext.request.contextPath}/common/CheckUsersEmail",
				method : "post",
				data : "emailId="+email1,
				async : false,
				success : function(response){
					if(response=='exist'){
						testVal='exist';
					}
				},
				error : function(xhr,error,status){
					//alert('checkemailid error = '+error+status);
				}
				
			});
			if(testVal!=''){
				$('#email1').focus().css('outline' , 'solid red 2px');
				$('#emsg5').empty();
				$('#emsg5').append("<font color='red'>Email address already exist!</font>");
				return false;
			}
			if(validateEmail(email1)==false){
				$('#email1').focus().css('outline', '2px solid red');
				$('#emsg5').empty();
				$('#emsg5').append("<font color='red'>Email address Invalid!</font>");
				
				return false;
			}
			var result='';
			$.ajax({
				url : "getDuplicateCustomer",
				type : "POST",
				data : "firstName="+forName1+"&lastName="+surName1+"&dob="+datepicker3+"&emailId="+email1+"&address1="+custAddress1+"&mobileNumber="+mobileNo1,
				async : false,
				success : function(response)	{
					//alert(response);
					if(response=='yes'){
						result='yes';
					}
				}
			});
			//alert('result===='+result);
			if(result!=''){
				$('#forName1').focus().css('outline', '2px solid red');
				$('#dupid').empty();
				$('#dupid').append("<font color='red'>Duplicate Remitter.....!</font>");
				return false;

			}

			
			

			if(firstIdProofType1==""){
				alert("please provide remitter Id Proof  ");
				
			return false;}
			if(firstIdNumber1==""){
				alert("please provide remitter Id  Number ");
				
			return false;}

			if(idProofIssueCountry==""){
				alert("please provide remitter Id  Issue country ");
				
			return false;}

			}

	if(bflag==""||bflag==undefined)
		{
		alert("please select beneficiery ");
		return false;
		}}
	if(bflag=='new')
		{
		
	if(receiverfirstname==""){
		alert("Enter benificery first name");
		
	return false;}
	
	if(receiverlastname==""){
		alert("Enter benificery last name");
		
	return false;}
	if(receivergender==""){
		alert("select benificery Gender");
		
	return false;}
	if(mobileno==""){
		alert("enter benificery mobile no");
		
	return false;}
	 if(receiverpurpose==""){
		alert("select purpose of sending");
		
	return false;}
	if(receiverrelation==""){
		alert("select relationship");
		
	return false;}
	 if(receivercitystate==""){
		alert("Enter benificery city/State ");
		
	return false;}
	if(receiveraddress==""){
		alert("Enter Benificery address");
		
	return false;}

	if(receiveridproofno==""){
		alert("Enter benificery id proof no");
		
	return false;}
	var result='';
	if(txid==""){
	//alert('dcfsfggh');
	var data="firstName="+receiverfirstname+"&lastName="+receiverlastname+"&mobileNumber="+mobileno+"&addressLine1="+receiveraddress;
	//alert('daata===='+data);
	$.ajax({
		url : "getDuplicateBen",
		type : "POST",
		data :"firstName="+receiverfirstname+"&lastName="+receiverlastname+"&mobileNumber="+mobileno+"&addressLine1="+receiveraddress,
		async : false,
		success : function(response)	{
			//alert(response);
			if(response=='yes'){
				result='yes';
			}
		}
	});
	//alert('result===='+result);
	if(result!=''){
		$('#receiverfirstname').focus().css('outline', '2px solid red');
		$('#dupid').empty();
		$('#dupid').append("<font color='red'>Duplicate Benificiary.....!</font>");
		return false;

	}
	}
		}
	if(paymenttype=='Cash Collection')
{
		//alert('it is csh collection');
		if(collectionPointName==""){
	alert("Enter benificery collectionPointName");
	
return false;}
		if(collectionPointCity==""){
			alert("Enter collectionPointCity");
		
			return false;}

if(collectionPointCode==""){
		alert("Enter collectionPointCode");
		
	return false;}
	
	if(collectionPointBank==""){
		alert("Enter collectionPointBank");
		
		return false;}
	if(collectionPointAddress==""){
		alert("Enter collectionPointAddress");
		
		return false;}
	if(collectionPointState==""){
		alert("Enter collectionPointState");
		
		return false;}
	if(collectionPointTelephone==""){
		alert("Enter collectionPointTelephone");
		
		return false;}
	if(collectionPin==""){
		alert("Enter collectionPin");
		
		return false;}
	if(confrmcollectionPin==""){
		alert("Enter confrmcollectionPin");
		
		return false;}
	if(confrmcollectionPin!=collectionPin){
		alert("collectionPin and confrmcollectionPin must be same" );
		
		return false;}
	
}
	if(paymenttype=='Mobile Money'||paymenttype =='Mobile Airtime top up')
	{
	if(mobileTrnsferNumber=='')
		{
		alert("please Enter mobileTrnsferNumber");
		return false;
		}
	if(transferNetWork=='')
	{
	alert("please Enter Mobile TransferNetWork");
	return false;
	}
	if(transferNetWorkCreditType=='')
	{
	alert("please Enter Mobile TransferNetWorkCreditType");
	return false;
	}
	
	}
	if(paymenttype=='Card Transfer')
	{
	if(cardNumber=='')
		{
		alert("please Enter cardNumber");
		return false;
		}
	}
	if(paymenttype=='Bill Payment')
	{
	if(utilityCompany=='')
		{
		alert("please Enter utilityCompany");
		return false;
		}
	if(customerAccountNumber=='')
	{
	alert("please Enter customerAccountNumber");
	return false;
	}
	if(invoiceNumber=='')
	{
	alert("please Enter invoiceNumber");
	return false;
	}
	if(bankToPay=='')
	{
	alert("please Enter bankToPay");
	return false;
	}
	if(iBan=='')
	{
	alert("please Enter iBan");
	return false;
	}
	if(bankBicCode=='')
	{
	alert("please Enter bankBicCode");
	return false;
	}
	if(addressLine1=='')
	{
	alert("please Enter addressLine1");
	return false;
	}
	if(addressLine2=='')
	{
	alert("please Enter addressLine2");
	return false;
	}
	if(addressLine3=='')
	{
	alert("please Enter addressLine3");
	return false;
	}
	if(city=='')
	{
	alert("please Enter city name");
	return false;
	}
	if(state=='')
	{
	alert("please Enter state Name");
	return false;
	}
	if(billDescription=='')
	{
	alert("please Enter billDescription");
	return false;
	}
	
	}
	if(paymenttype=='Home Delivery')
	{
	if(beneficiaryAddress1=='')
		{
		alert("please Enter BeneficiaryAddress1");
		return false;
		}
	if(beneficiaryAddress2=='')
	{
	alert("please Enter BeneficiaryAddress2");
	return false;
	}
	if(beneficiaryAddress3=='')
	{
	alert("please Enter BeneficiaryAddress3");
	return false;
	}
	if(beneficiaryCity=='')
	{
	alert("please Enter BeneficiaryCity");
	return false;
	}
	if(beneficiaryPostCode=='')
	{
	//alert("please Enter BeneficiaryPostCode");
	//return false;
	}
	if(deliveryNote=='')
	{
	alert("please Enter DeliveryNote");
	return false;
	}

	}
	if(paymenttype=='Bank Deposit')
		{
		if(beneficiaryAccountTransfer=='')
			{
			alert("please Enter beneficiaryAccountTransfer");
			return false;
			}
		if(bankDetails==""){
			alert("Enter bankDetails");
		
			return false;}
		if(bank==""){
			alert("Enter bankName");
		
			return false;}
		if(swiftCode==""){
			alert("Enter swiftCode");
		
			return false;}
		if(iBAN==""){
			alert("Enter IBAN");
		
			return false;}
		if(branch==""){
			alert("Enter branch");
		
			return false;}
		if(BranchCity==""){
			alert("Enter BranchCity");
		
			return false;}
		if(branchState==""){
			alert("Enter branchState");
		
			return false;}
		if(telephone==""){
			alert("Enter Branchtelephone");
		
			return false;}
		if(branchManager==""){
			alert("Enter branchManager Name");
		
			return false;}


		}
	//alert('txid====='+txid);
	if(txid==""){
	$('#insertTransaction').attr("action", "insertTransaction");
	 $('#insertTransaction').submit(); 
	}
	if(txid!=""){
		$('#insertTransaction').attr("action", "insertFirstTransaction");
		 $('#insertTransaction').submit(); 
		
	}
		
		}



</script>
<script>
function setBenificiery(beneficiery)
{
	
	var benificiery=$("input[name='beneficiery']:checked").val();
	var adminid=$('#admid').val();
	var customerid=$('#customerId').val();
	var paymenttype=$("input[name='payment']:checked").val();
	if(benificiery=='existing')
	{
		
		/* alert("customerid:"+customerid);
		alert("adminid:"+adminid);
		alert("benificiery:"+benificiery); */
		var contry=$('#toBranchId').val();
		
		if(paymenttype=='')
			{
			alert("please select payment type");
			return false;
			}
		if(customerid==''||contry==''){
			
			if(customerid=='')
				{
			alert("please search customer to get benificiery details");
				}else{
					alert("please select country");
				}
			$('.brow').hide();
			$('.cashpickup').hide();
			
			if($('#'+beneficiery).prop('checked',true))
				{
				$('#'+beneficiery).prop('checked',false);
				}
			return false;
		}
		$('.brow').hide();	
		
		/* $('.bcombo').show(); */
		/* $('.benptype').show(); */
		/* var ptype=$('#existedBenificiery').val(); */
		/* var customerid=$('#customerId').val();
		var adminid=$('#admid').val();
		alert("paymentttype:"+ptype);
		alert("customerid"+customerid);
		alert("adminid"+adminid); */
		
		
			var querystring="adminid="+adminid+"&customerid="+customerid+"&ptype="+paymenttype;
			var opt='<select id="benpaymenttype" name="benpaymenttype"><option value="">-select-</option>';
			$.ajax({
			url:'/common/getBenificeriesOfSpecificCustomer',
			type:'post',
			data:querystring,
			success:function(response){
				/* alert(response); */
				if(response!=""||response!==null){
				
				var bdetails=
					  JSON.stringify(response, undefined, '\t');
				$.each($.parseJSON(bdetails),function(idx,obj){
				
				opt=opt+'<option value="'+obj.beneficiaryId+'">'+obj.firstName+","+obj.lastName+'</option>';
				
				});
				opt=opt+'</select>';
				$('.benptype').empty();
				$('.benptype').append(opt);
				$('.benptype').show();
				}
				},
			error:function(){
				alert("error at server side");
				}	
			
				
			
			
			});
			
	}
			
	if(benificiery=='new')
		{
 $('.brow').show(); 
if(paymenttype=='cash')
	{
	$('.brow').hide();
	$('.benrow').show();
	$('.cashpickup').show();
	
	
	}
	
	/* $('.bcombo').hide(); */
	$('.benptype').hide();
}}
</script>
 <script>
 function getModeOfPaymentFee()
 {
	 clearTransactionDetails();
	 var mop=$('#modeOfPayment').val();
	var arr=[];
	 var arr=mop.split("-"); 
	 /* alert("arr"+arr[1]); */
	var adminid=$('#admid').val();
	var frombranchid=$('#bid').val();
	var amount=$('#amountToCollect').val();
	var querystring="adminid="+adminid+"&bid="+frombranchid+"&mop="+arr[1];
	if(mop==''){
		alert("please select  one mode of payment");
		return false;
	}
	 $.ajax({
		url:'/common/getModeofpaymentfee',
		data:querystring,
		type:'post',
		success:function(response){
			/* alert("response"+response); */
			/* var total=amount+Number(response); */
			$('#amountToCollect').val(response);
			$('#modeOfPaymentFee').val(response);
			},
		error:function(){
			alert("error");}
		 
		 
	 });
 
 }
 </script>
 <title>Dash board</title>
 <style>
 
 label{
 
 font-size:11px;
 }
 
 .form-controll{
 
     display: block;
    width: 100%;
    height: 26px;
    
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
 
 }
 input[type="text"],select,input[type="email"] {
 font-size:15px;
}
 </style>
</head>
<body>
<%@include file ="headerNew.jsp" %>
<div class="container-fluid">

<main id="main-container" class="container-fluid">
              
                <div class="content"><!-- <h3 class="header-title mb-3">Welcome to Branch</h3>  -->
	<section class="block ">
<div class="maketransaction mt-30">
                    	<div class="row">
                    	<form  id="insertTransaction" method="POST" enctype="multipart/form-data">
                    		                          <input type="hidden" id="myIp" name="myIp">       
                    		
                    		<div class="col-md-12 mt-50">
                    		<input type="hidden" id="admid" name="admid" value="${branchDetails.admin.adminId}">	
                     		<input type="hidden" id="tobid" name="tobid" value="${tx.toBranch.branchId}">	
                      		<input type="hidden" id="pay" name="pay" value="${tx.paymentType}">	
                      		<input type="hidden" id="txId" name="txId" value="${tx.transactionId}">	
                                   <div class="">
                                   <!-- <h5 style="font-size: 16px;">CREATE NEW TRANSACTION</h5>
 --><!--                                    <input type="button" id="searchCustomerButton" class="btn btn-primary waves-effect waves-light mt-20 mb-30" data-toggle="modal" data-target="#myModal" value="Search For Another Customer">
 -->                                   	</div>
									 
						<input type="hidden" id="bid" name="bid" value="${branchid}">
						<input type="hidden"	id="txid" name="txid"	value="${tx.transactionId}">	
							
													<div class="form-row">
              					</div>						
									
									<h3 style="margin-left:15px;">Source Country:${countryName}</h3>	
									<div class=" p-3 mb-5 bg-white rounded mt-30" style="">
										<!-- <h5 style="font-size: 16px;">SELECT COUNTRY AND
													PAYMENT TYPE</h5> -->
													<div class="row" style="margin-left:15px;">
              					<div class="col-md-2" style="color:white;padding-top:8px;font-size:13px;background:orange;">
                					<label for="inputEmail4" style="font-size:13px;">Select Country</label>
                					</div>	
                					<div class="col-md-4" style="padding:2px;background:orange;">		<c:choose>
								<c:when test="${tx.toBranch ne null}">
                						<select  id="toBranchId" name="toBranchId" class="form-controll customer" onchange="getCurrencyRateForSendingBranch();removeError('toBranchId');" >
														<option value="${tx.toBranch.branchId}">${tx.toBranch.fromCountry.countryName}(${tx.toBranch.branchName})</option>
			</select>                  						
                						</c:when><c:otherwise>
                						<select   id="toBranchId" name="toBranchId" class="form-controll customer" onchange="getCurrencyRateForSendingBranch();removeError('toBranchId');" >
														<option value="">-- Select Country --</option>
												</select></c:otherwise></c:choose>
              					</div> </div><br>
              					
              					<div class="form-row" style="">
              					             					
              					<div class="form-group col-md-4 mt-30">
                 								<c:choose>
								<c:when test="${tx.paymentType ne null}">
 						<input type="radio" name="payment" checked value="${tx.paymentType}">${tx.paymentType }
              					</c:when><c:otherwise>
                					<label for="inputEmail4">Payment Type:</label>
                						<div id="pMode" ></div> 
                						</c:otherwise></c:choose>
                						<div style="margin-top:10px;">
                						<label for="inputEmail4">Source Of Fund</label>
                					<c:choose>
                					<c:when test="${tx.sourceOfFund ne null }">
                					<select class="form-control" name="sourceOfFund" id="sourceOfFund" onchange="removeError('sourceOfFund');">
											<c:forEach var="list" items="${fundcodes}">
											<option value="${list.sourceOfFund}" ${list.sourceOfFund=='tx.sourceOfFund'?'selected':'' }>${list.sourceOfFund}</option>
											</c:forEach>                					
                					</select>
                					
                					</c:when><c:otherwise>
                					<select class="form-control" name="sourceOfFund" id="sourceOfFund" onchange="removeError('sourceOfFund');">
											<option value="">-select source of fund-</option>
											<c:forEach var="list" items="${fundcodes}">
											
											<option value="${list.sourceOfFund}" ${list.sourceOfFund=='tx.sourceOfFund'?'selected':'' }>${list.sourceOfFund}</option>
											</c:forEach>                					
                					</select></c:otherwise></c:choose>
              					</div>
              					
              					<div style="margin-top:10px;">
              					
              					<label for="inputEmail4">Purpose</label><br>
                					<c:choose>
                					<c:when test="${tx.sendingReason ne null }">
                 					<select class="form-control" name="purpose" id="purpose" onclick="removeError('purpose');" style="width:100%;float:left;">
													<c:forEach var="list" items="${pcodes}">
													 <option value="${list.reasonForTransfer}" ${tx.sendingReason==list.reasonForTransfer?'selected':''}>${list.reasonForTransfer}</option>
													</c:forEach>
													</select>
                					
                					</c:when><c:otherwise>
                					<select class="form-control" name="purpose" id="purpose" onclick="removeError('purpose');" style="width:100%;float:left;">
													<option value="">--Select Purpose *--</option>
													<c:forEach var="list" items="${pcodes}">
													 <option value="${list.reasonForTransfer}" ${tx.sendingReason==list.reasonForTransfer?'selected':''}>${list.reasonForTransfer}</option>
													</c:forEach>
													</select></c:otherwise></c:choose>
              					</div>
              					<div style="margin-top:10px;">
													<label>Reltion</label>
													<c:choose>
													<c:when test="${tx.beneficiary.relationShip ne null }">
																	
																	<select class="form-control" name="relationShip" id="relationShip" onchange="removeError('relationShip');" style="width:100%;float:left">
														<c:forEach var="list" items="${rcodes}">
														<option value="${list.relationShip}"${tx.beneficiary.relationShip==list.relationShip?'selected':''}>${list.relationShip}</option>
														</c:forEach>
													</select>
													
													</c:when><c:otherwise>
													<select class="form-control" name="relationShip" id="relationShip" onchange="removeError('relationShip');" style="width:100%;float:left">
															<option value="">--Select Relationship *--</option>
														<c:forEach var="list" items="${rcodes}">
														<option value="${list.relationShip}"${tx.beneficiary.relationShip==list.relationShip?'selected':''}>${list.relationShip}</option>
														</c:forEach>
															


													</select>
													</c:otherwise></c:choose>
              					</div>
              					
              					</div>
              	
              					<div class="form-group col-md-4 mt-30">
                					<label for="inputEmail4">Current Balance  :  -${countryIso} ${totalAmounttopay}</label>
              					<p style="color:red;">WARNING: Negative balance. Transactions may be delayed during processing.</p>
              					<label>Credit Available	:${countryIso} ${totalDeposits}</label>
              					<p>Note Credit Available is Overdraft plus Current Balance.
              					</p>
				<label>Agent Trans. Ref. No.
            <input type="hidden" value="" name="agentTrId" id="agentTrId">
				
				</label>
</div>  </div>            					
              					
              						<input type="hidden" value="" name="amountToCollect" id="amountToCollect">
              					
 	</div>
								
									</div>
									
									
									
									
<c:choose>
<c:when test="${txid ne null }">
 

<div class="row" >
<div class="col-md-6">
	<div id="senderDiv1">
<h5 style="font-size: 13px;background:#2e287b;color:white;padding:5px;">REMITTER DETAILS</h5>
<div class=" p-3 mb-5 bg-white rounded mt-30">
<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Telephone / Mobile</label>
                						<input type="text" class="form-control" name="custMobNo" value="${tx.customer.mobileNumber}" id="mobileNo" readonly="readonly"  placeholder=" Enter Telephone / Mobile  ">
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Sex</label>
                						<input type="text" class="form-control" name="custGender" id="gender"  value="${tx.customer.gender }" readonly="readonly"  placeholder=" Gender  ">
              					</div>
              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">ForeName</label>
              						<input type="text" class="form-control" id="forName" value="${tx.customer.firstName}" name="custForName" readonly="readonly"  placeholder="Enter Forename *">
              					</div>
										</div>
										<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">SurName</label>
                						<input type="text" class="form-control" value="${tx.customer.lastName }" name="custSurName" id="surName" readonly="readonly" placeholder="Enter Surname *">
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Date of Birth</label>
                					<input type="text" class="form-control " name="custDob" id="datepicker" value="${tx.customer.dob }" readonly="readonly" placeholder="Enter Date of Birth">
              					</div>
              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">Town</label>
              						<input type="text" class="form-control" name="custCityState" id="cityState" value="${tx.customer.cityOrState}" readonly="readonly" placeholder="Enter City or State Name *" >
              					</div>
										</div>
										<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Address</label>
                					<textarea class="form-control" rows="2" cols="24" placeholder="Enter Address *" name="custAddress" value="${tx.customer.address1}" readonly="readonly" id="custAddress" >${tx.customer.address1}</textarea>
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Zip Code</label>
                					<input type="text" class="form-control" name="custPostCode" id="postcode" value="${tx.customer.postalCode }" readonly="readonly" placeholder="Enter Zip Code" >
              					</div>
              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">Email Address</label>
              						<input type="text" class="form-control" name="custEmail" id="email" value="${tx.customer.emailId}" placeholder="Enter Email Address "  readonly="readonly">
              					</div>
										</div>
										<div class="form-row">
										
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Occupation</label>
                					<input type="text" class="form-control" name="occupation" id="occupation" maxlength ="50" value="${tx.customer.occupation }" readonly="readonly" placeholder="Enter occupation" >
              					</div>
										
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Identification Proof</label>
                					<input type="text" class="form-control" name="firstIdProofType" id="firstIdProofType" value="${tx.customer.firstIdProofType}" readonly="readonly">
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Document Number</label>
                					<input type="text" class="form-control" name="firstIdNumber" id="firstIdNumber" value="${tx.customer.firstIdNumber}" readonly="readonly">
              					</div>
              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">Date of Issue</label>
              						<input type="text" class="form-control "  name="firstIdIssueDate" id="datepicker1" value="${tx.customer.firstIdIssueDate }" readonly="readonly" >
              					</div>
										
										
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Expiration Date</label>
                					<input type="text" class="form-control "  name="firstIdExpireDate" id="datepicker2" value="${tx.customer.firstIdExpireDate}" readonly="readonly">
              						<span id="msg"></span>
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Issuing Country</label>
                					<input type="text" class="form-control " name="firstIdIssueCountry" id="firstIdIssueCountry" value="${tx.customer.issuingCountry.countryName}" readonly="readonly">
              					</div>
              					<div class="form-group col-md-4 mt-30 " id="customerFirstIdDiv">
              					
              						<%-- <img src="${pageContext.request.contextPath}/resources/images/customerimages/No_image_available.jpg" width="100" height="55"> --%>
              					</div>
										</div>
										</div>
										</div>
</div>

<div class="col-md-6">
 <div id="bnfDiv1">
<h5 style="font-size: 13px;background:#2e287b;color:white;padding:5px;">BENEFICIARY DETAILS</h5>
										
			<div class="form-row brow benrow" style="margin-top:45px;">
              					<div class="form-group col-md-4">
                					
                					<label for="inputEmail4">First Name:</label>
                					<input type="text" name="bFirstName" id="bfirstName" value="${tx.beneficiary.firstName }" class="form-control" placeholder="Enter Forename *" onkeyup="convertToUppercase(this);removeError('bfirstName');">
<!--                           			   <label id="dupid"></label>
 -->              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Last Name</label>
                					<input type="text" name="blastName" id="blastName" value="${tx.beneficiary.lastName}" class="form-control" placeholder="Enter Surname *" onkeyup="convertToUppercase(this);removeError('blastName');">
              					</div>
              					<div class="form-group col-md-4 ">
              					<label for="inputEmail4">Gender</label>
              						<select class="form-control" name="bgender" id="bgender" onchange="removeError('bgender');">
															<option value="">-- Select Gender *--</option>
															<option value="Male"${tx.beneficiary.gender=='Male'?'selected':''}>Male</option>
															<option value="Female"${tx.beneficiary.gender=='Female'?'selected':''}>Female</option>
													</select>
              					</div>
										</div>
										<div class="form-row brow benrow">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Telephone/Mobile</label>
                					<input type="text" name="bmobileNumber" id="receiverMobileNumber" value="${tx.beneficiary.mobileNumber }"class="form-control" placeholder="Enter Telephone/Mobile Number *" onkeyup="removeError('receiverMobileNumber');" onkeypress="return onlyNumberNoDot(event)">
              					</div> 
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">emailId</label>
                					<input type="text" name="bemailId" id="bemailId" value="${tx.beneficiary.emailId }"class="form-control" placeholder="Enter Telephone/Mobile Number *" onkeyup="removeError('receiverMobileNumber');" onkeypress="return onlyNumberNoDot(event)">
              					</div>              					
              					             					
              					<div class="form-group col-md-4 ">
              					<label for="inputEmail4">City / State</label>
              						<input type="text" name="bcityOrState" id="bcityOrState" value="${tx.beneficiary.cityOrTown}" class="form-control" placeholder="Enter City or State Name *" onkeyup="convertToUppercase(this);removeError('bcityOrState');">
              					</div>
										</div>
										<div class="form-row brow benrow">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Address/VPO</label>
                					<textarea class="form-control" name="baddress" id="baddress" value="${tx.beneficiary.address }"rows="3" cols="24" placeholder="Enter Address/VPO *" onkeyup="removeError('baddress')">${tx.beneficiary.address}</textarea>
              					</div>              					
              				<div class="form-group col-md-4">
                					<label for="inputEmail4">Id-proof</label>
                					<select class="form-control" name ="idProof" id ="idProof" >
							<option value="${tx.beneficiary.idProof}">${tx.beneficiary.idProof }</option>
							
													</select>
              					</div> 
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Id-proof No</label>
                					<input type="text"  name="idProofNo" id="idProofNo" value="${tx.beneficiary.idProofNo}" placeholder="12541OPKJ" class="form-control">
              					</div>
										</div>
               					<div class="form-group col-md-4" id="cp">
                					<label  for="inputEmail4">PostCode</label>
              					<input type="text" name="beneficiaryPostCode" value="${tx.beneficiary.postCode}" id="beneficiaryPostCode" class="form-control">			
              					</div>
										
										
										
										
										</div>

</div>


</div>

</c:when>
<c:otherwise>


<div id="bcDiv">
<div class="row" style="margin-left:10px;">
									
	<div class="col-md-6">
<div class="ui-widget">
<h5 style="font-size: 13px;background:#2e287b;color:white;padding:5px;">REMITTER DETAILS</h5>
<div class="row">
<div class="col-md-7">
	<input type="text" name="subhead" id="subhead"  class="form-control"
	 placeholder="Find here....."    />
</div>
<div class="col-md-3">
<input type="button" class="btn btn-primary waves-effect waves-light  center-block  mb-5 center-block " value="search" id="makeTransaction" onclick="doTransaction2();">
</div>
<div class="col-md-2" style="margin-left:-30px;">
<input type="button" class="btn btn-primary waves-effect waves-light  center-block  mb-5 center-block " value="new" id="makeTransaction" onclick="doTransaction5();">
</div>
</div>
<input type="hidden" name="cid" id="cid" value="0">
<input type="hidden" name="cflag" id="cflag" value="0">
<div id="cstDiv">
<textarea id="cst" name="cst" rows="4" cols="50">
</textarea>
<div class="form-row">
   <label id="emsg"></label>
   </div>
</div>

 									<div id="remDiv">
										
										<div class=" p-3 mb-5 bg-white rounded mt-30">
											<div class="form-row">
              					<label id="dupid"></label>
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Telephone / Mobile</label>
                						<input type="text" class="form-control" name="custMobNo1"   id="mobileNo1"  placeholder=" Enter Telephone / Mobile  ">
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Gender</label>
                 					<select class="form-control" name="custGender1" id="gender1">
								<option value="">---select gender...</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</select>
              	             					
              					</div>
              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">ForeName</label>
              						<input type="text" class="form-control" id="forName1"   name="custForName1"  placeholder="Enter Forename *">
              					</div>
										</div>
										<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">SurName</label>
                						<input type="text" class="form-control"   name="custSurName1" id="surName1" placeholder="Enter Surname *">
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Date of Birth</label>
                					<input type="text" class="form-control " name="custDob1" id="datepicker3"  value="${tx.customer.dob }"  placeholder="Enter Date of Birth">
              					</div>
              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">State</label>
                 					<select class="form-control" name="cState" id="cState">
								<option value="">---select State...</option>
							</select>
              	             					
              					
              					</div>
										</div>
										<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Address</label>
                					<textarea class="form-control" rows="2" cols="24" placeholder="Enter Address *" name="custAddress1"  value="${tx.customer.address1}" id="custAddress1" ></textarea>
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Zip Code</label>
                					<input type="text" class="form-control" name="custPostCode1" id="custpostcode1"  value="${tx.customer.postalCode }" placeholder="Enter Zip Code" >
              					</div>
              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">Email Address</label>
              						<input type="text" class="form-control" name="custEmail1" id="email1"  value="${tx.customer.emailId}" placeholder="Enter Email Address " >
              					<label id="emsg5"></label>
              					</div>
										</div>
										<div class="form-row">
	                					<input type="hidden" name="fromCountryISO" id="fromCountryISO" value="${countryISo}" onclick="removeError('fromCountry');">
										
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Occupation</label>
                					<input type="text" class="form-control" name="occupation1" id="occupation1" maxlength ="50"  value="${tx.customer.occupation }" placeholder="Enter occupation" >
              					</div>
										</div>
										</div>
										<div class=" p-3 mb-5 bg-white rounded mt-30">
														<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Identification Proof</label>
                   <select class="form-control" name="firstIdProofType1" id="firstIdProofType1" onchange="setIdFields();removeError('firstIdProofType')">
				<option value="">-- Select Primary Identity Proof --</option>
     <c:forEach var ="list" items="${ids}">
 <option value="${list.idValue},${list.issuingAuthority}">${list.senderType}</option>
				          </c:forEach> 
						
							</select>
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Document Number</label>
                					<input type="text" class="form-control" name="firstIdNumber1" id="firstIdNumber1" placeholder="Enter Id Number..*"  value="${tx.customer.firstIdNumber}" >
              					</div>
              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">Date of Issue</label>
                					<input type="text" class="form-control  " id="datepicker4" placeholder="Enter Issue Date" name="firstIdIssueDate1" >
              					</div>
										</div>
										<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Expiration Date</label>
                					<input type="text" class="form-control  " id="datepicker5" placeholder="Enter Expire Date" name="firstIdExpireDate1" >
              						<span id="msg"></span>
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Issuing Country</label>
              <select class="form-control pull-right" name="idProofIssueCountry1" id="idProofIssueCountry1" onchange="setTrulioResponse();removeError('idProofIssueCountry')">
                	 <option value="">--Select*--</option>
                	             <c:forEach var="list" items="${statesList}">
                <option value="${list.countryISO}">${list.stateName}</option>
              </c:forEach>
                </select>
              					</div>
              					<div class="form-group col-md-4 mt-30 " id="customerFirstIdDiv">
                					<label for="inputEmail4">First ID Proof Image:</label>
                						<input type="file" name="firstIdProofDoc1" id="firstIdProofDoc" class="form-control " placeholder="ID Proof Image" title="ID PROOF IMAGE" onclick="removeError('firstIdProofDoc');"> 
              					</div>
              					              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">Password</label>
              						<input type="text" class="form-control" name="cuspwd" id="cuspwd"  value="${tx.customer.emailId}" placeholder="Enter Password..* " >
              					</div>
										</div>
										</div></div>



 									<div id="senderDiv">
              					<div class="form-group col-md-4 ">
               <label id="emsg1"></label>

</div>              					
										
										<div class=" p-3 mb-5 bg-white rounded mt-30">
											<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Telephone / Mobile</label>
                						<input type="text" class="form-control" name="custMobNo" readonly value="${tx.customer.mobileNumber}" id="mobileNo"  placeholder=" Enter Telephone / Mobile  ">
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Sex</label>
                						<input type="text" class="form-control" name="custGender" id="gender" readonly value="${tx.customer.gender }"  placeholder=" Gender  ">
              					</div>
              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">ForeName</label>
              						<input type="text" class="form-control" id="forName" readonly value="${tx.customer.firstName}" name="custForName"  placeholder="Enter Forename *">
              					</div>
										</div>
										<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">SurName</label>
                						<input type="text" class="form-control" readonly value="${tx.customer.lastName }" name="custSurName" id="surName" placeholder="Enter Surname *">
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Date of Birth</label>
                					<input type="text" class="form-control " name="custDob" id="datepicker" readonly value="${tx.customer.dob }"  placeholder="Enter Date of Birth">
              					</div>
              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">Town</label>
              						<input type="text" class="form-control" name="custCityState" id="cityState" readonly value="${tx.customer.cityOrState}" placeholder="Enter City or State Name *" >
              					</div>
										</div>
										<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Address</label>
                					<textarea class="form-control" rows="2" cols="24" placeholder="Enter Address *" name="custAddress" readonly value="${tx.customer.address1}" id="custAddress" ></textarea>
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Zip Code</label>
                					<input type="text" class="form-control" name="custPostCode" id="postcode" readonly value="${tx.customer.postalCode}" placeholder="Enter Zip Code" >
              					</div>
              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">Email Address</label>
              						<input type="text" class="form-control" name="custEmail" id="email" readonly value="${tx.customer.emailId}" placeholder="Enter Email Address " >
              					</div>
										</div>
										<div class="form-row">
										
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Occupation</label>
                					<input type="text" class="form-control" name="occupation" id="occupation" maxlength ="50" readonly value="${tx.customer.occupation }" placeholder="Enter occupation" >
              					</div>
										</div>
										</div>
										<div class=" p-3 mb-5 bg-white rounded mt-30">
														<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Identification Proof</label>
                					<input type="text" class="form-control" name="firstIdProofType" id="firstIdProofType" readonly value="${tx.customer.firstIdProofType}" >
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Document Number</label>
                					<input type="text" class="form-control" name="firstIdNumber" id="firstIdNumber" readonly value="${tx.customer.firstIdNumber}" >
              					</div>
              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">Date of Issue</label>
              						<input type="text" class="form-control "  name="firstIdIssueDate" id="datepicker1" readonly value="${tx.customer.firstIdIssueDate }" >
              					</div>
										</div>
										<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Expiration Date</label>
                					<input type="text" class="form-control "  name="firstIdExpireDate" id="datepicker2" readonly value="${tx.customer.firstIdExpireDate}" >
              						<span id="msg"></span>
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Issuing Country</label>
                					<input type="text" class="form-control " name="firstIdIssueCountry" id="firstIdIssueCountry" readonly value="${tx.customer.issuingCountry.countryISO}">
              					</div>
              					<div class="form-group col-md-4 mt-30 " id="customerFirstIdDiv">
              					
              						<%-- <img src="${pageContext.request.contextPath}/resources/images/customerimages/No_image_available.jpg" width="100" height="55"> --%>
              					</div>
										</div>
										</div></div>

</div></div>
									<div class="col-md-6">
<div class="ui-widget">
<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">BENEFICIARY DETAILS</h5>
	
	<div class="row">
	<div class="col-md-6">
	<input type="text" class="form-control" name="bn" id="bn" placeholder="Find here....."    /></div>
<div class="col-md-6">
<input type="button" class="btn btn-primary waves-effect waves-light  center-block  mb-5 center-block " value="new" id="makeTransaction" onclick="doTransaction1();">
</div></div><input type="hidden" name="bnid" id="bnid" value="">
<input type="hidden" name="bflag" id="bflag" value="">
<div id="bDiv">
<textarea id="bnf" name="bnf" rows="4" cols="50">
</textarea>
</div>
									
									<div id="bnfDiv">
										
											<div class="form-row brow benrow">
              					<div class="form-group col-md-4">
                             			   <label id="dupid"></label>
                					<label for="inputEmail4">First Name</label>
                					<input type="text" name="bFirstName" id="bfirstName" value="${tx.beneficiary.firstName }" class="form-control" placeholder="Enter Forename *" onkeyup="convertToUppercase(this);removeError('bfirstName');">
              					
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Last Name</label>
                					<input type="text" name="blastName" id="blastName" value="${tx.beneficiary.lastName}" class="form-control" placeholder="Enter Surname *" onkeyup="convertToUppercase(this);removeError('blastName');">
              					</div>
              					<div class="form-group col-md-4 ">
              					<label for="inputEmail4">Gender</label>
              						<select class="form-control" name="bgender" id="bgender" >
															<option value="">-- Select Gender *--</option>
															<option value="Male"${tx.beneficiary.gender=='Male'?'selected':''}>Male</option>
															<option value="Female"${tx.beneficiary.gender=='Female'?'selected':''}>Female</option>
													</select>
              					</div>
										</div>
										<div class="form-row brow benrow">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Telephone/Mobile</label>
                					<input type="text" name="bmobileNumber" id="receiverMobileNumber" value="${tx.beneficiary.mobileNumber }"class="form-control" placeholder="Enter Telephone/Mobile Number *" onkeyup="removeError('receiverMobileNumber');" onkeypress="return onlyNumberNoDot(event)">
              					</div>
                     					<div class="form-group col-md-4">
                					<label for="inputEmail4">emailId</label>
                					<input type="text" name="bemailId" id="bemailId" value="${tx.beneficiary.emailId }"class="form-control" placeholder="Enter  emailId *" onkeyup="removeError('receiverMobileNumber');" onkeypress="return onlyNumberNoDot(event)">
              					</div>              					
              					              					
              					<div class="form-group col-md-4 ">
              					<label for="inputEmail4">City / State</label>
              						<input type="text" name="bcityOrState" id="bcityOrState" value="${tx.beneficiary.cityOrTown}" class="form-control" placeholder="Enter City or State Name *" onkeyup="convertToUppercase(this);removeError('bcityOrState');">
              					</div>
										</div>
										<div class="form-row brow benrow">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Address/VPO</label>
                					<textarea class="form-control" name="baddress" id="baddress" value="${tx.beneficiary.address }"rows="3" cols="24" placeholder="Enter Address/VPO *" onkeyup="removeError('baddress')"></textarea>
              					</div>              					
              				<div class="form-group col-md-4">
                					<label for="inputEmail4">Id-proof</label>
                					<select class="form-control" name ="idProof" id ="idProof" >
							<option value="${tx.beneficiary.idProof}">${tx.beneficiary.idProof }</option>
							
													</select>
              					</div> 
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Id-proof No</label>
                					<input type="text"  name="idProofNo" id="idProofNo" value="${tx.beneficiary.idProofNo}" placeholder="12541OPKJ" class="form-control">
              					</div>
										</div>
	               					<div class="form-group col-md-4" id="cp">
                					<label  for="inputEmail4">BeneficiaryPostCode</label>
              					<input type="text" name="beneficiaryPostCode" value="${tx.beneficiary.beneficiaryPostCode}" id="beneficiaryPostCode" class="form-control">			
              					</div>
							              					<div class="form-group col-md-4 ">
              					<label for="inputEmail4">States</label>
              						<select class="form-control" name="state" id="state" >
					<option value="">-- Select States *--</option>
													</select>
              					</div>
										
										</div>
										

</div></div>
									</div>
</div>
</c:otherwise>
</c:choose>
									
									<input type="hidden" id="agentFee" name="agentFee" value=""/>
									<input type="hidden" id="buyingRate" name="buyingRate" value=""/>
									<input type="hidden" id="fromCurrencyRates" name="fromCurrencyRates" value=""/>
				<input type="hidden" id="toCurrencyRates" name="toCurrencyRates" value=""/>
				<input type="hidden" id="fromBranchId" name="fromBranchId" value="${branch.branchId}"/>
				<input type="hidden" id="profitMode" name="profitMode" value="${branch.profitMode}"/>
				<input type="hidden" id="adminId" name="adminId" value="${branch.admin.adminId}"/>
				<input type="hidden" id="toCountryName" name="toCountryName" value="${toCountryName}"/>
				<input type="hidden" id="fromCountryCurrencyCode" name="fromCountryCurrencyCode" value="${branch.fromCountry.currencyCode}"/>
				<input type="hidden" id="toCountryCurrencyCode" name="toCountryCurrencyCode" value="${toCountryCurrencyCode}"/>
				<input type="hidden" id="taxFee" name="taxFee" value="${tax_fee}">
				<input type="hidden" id="fromCountryISO" name="fromCountryISO" value="${fromCountryISO}">
				<input type="hidden" id="pType" name="pType" value="">
				<input type="hidden" id="toCountryISO" name="toCountryISO" value="${toCountryISO}">	
				<input type="hidden" id="sending_currency_rate" name="sending_currency_rate" value="${sending_currency_rate}"/>
				<input type="hidden" id="receiving_currency_rate" name="receiving_currency_rate" value="${receiving_currency_rate}"/>
									
									
									<div class=" p-3 mb-5 bg-white rounded mt-30">
									<div class="row" style="margin-left:10px;">
									<div class="col-md-6">
										<h5 style="font-size: 13px;background:#2e287b;color:white;padding:5px;">TRANSACTION DETAILS</h5>
										<div class="form-row row">
										<div class="form-group col-md-4">
<label >Entered Amount is</label>	
<select  class="form-control" name="enterAmount" id="enterAmount" onchange="calculateEnterAmounts()" >	
<option value="SD" ${tx.enterAmount=='SD'?'selected':''}>SOURCE/DESTINATION</option>
<option value="RT" ${tx.enterAmount=='RT'?'selected':''}>REMITTERTOPAY</option>
</select></div>
             			<div class="form-group col-md-4">
                					<label for="inputEmail4"> Mode of Payment Received	</label>&nbsp;&nbsp;<label id="mpFee"></label><br>
            				<c:choose>
            				<c:when test="${tx.modeOfPayment ne null }">
             				<select class="form-control" name="modeOfPayment" id="modeOfPayment" onchange="calculateSendingAmounts('${branch.fromCountry.currencyCode}')">
         	<option value="${tx.modeOfPayment}-${tx.modeOfPayment}">${tx.modeOfPayment}</option>
            				
            				</select>
            				</c:when><c:otherwise>
            				<select class="form-control" name="modeOfPayment" id="modeOfPayment" onchange="calculateSendingAmounts('${branch.fromCountry.currencyCode}')">
													<option value="">--Select Mode of Payment *--</option>
                                                 </select></c:otherwise></c:choose>
            			</div>
              					
              					
              					
              					
              					
   
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">SEND :</label>
                						<input type="text" id="sendAmount" name="sendAmount" value="${tx.sendingAmount}" placeholder="00.00" onkeyup="calculateSendingAmount('${branch.fromCountry.currencyCode}');" class="form-control" onkeypress="return onlyNumber(event)"><span id="">${branch.fromCountry.currencyCode}</span> 
              					
              					<div id="minSendAlert" >
								</div>
								<div id="maxSendAlert" >
								</div>
              				</div>
              			
              			<div class="form-group col-md-4">
                					<label for="inputEmail4">CONVERTED AMOUNT :</label>
                  <input type="text" id="cAmount" name="cAmount" value="${tx.sendingAmount}" placeholder="00.00"  class="form-control" onkeypress="return onlyNumber(event)">
              				</div>	
              					            					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">RECEIVE :</label>
                						 <input type="text" id="receiveAmount" name="receiveAmount" value="${tx.receipentAmount}" placeholder="00.00" onkeyup='calculateReceivingAmount();removeError("receiveAmount");' class="form-control"><span id="toCurrencyCode" >${toCountryCurrencyCode}</span>
              						<div id="minReceiveAlert" >
 									 
								</div>
								<div id="maxReceiveAlert" >
								</div>
              					
              					</div>
              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">CurrencyRate(1 ${branch.fromCountry.currencyCode})</label>
              						<input type="text" name="exch_rate" id="exch_rate" class="form-control" value="${tx.receivingCurrencyRate }" onkeyup='calculateAmount();removeError("receiveAmount");'>
              						<input type="hidden" name="buy_rate" id="buy_rate" class="form-control" value="${tx.buyRate}" >
              					</div>
              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">AgentFee</label>
              						<input type="text" name="agent_fee" id="agent_fee" class="form-control" value="${tx.agentFee}" onkeyup="calculateFee('${branch.fromCountry.currencyCode}');">
              						<input type="hidden" name="admin_fee" id="admin_fee" class="form-control" value="${tx.adminFee}" >
              						<input type="hidden" name="rec_fee" id="rec_fee" class="form-control" value="${tx.recagentFee}" >

              					
            			</div>
            			    <div class="form-group col-md-4 ">
             <label for="inputEmail4">ProfitRate</label>
            <input type="text" name="profitRate" id="profitRate" class="form-control" value="${tx.profitRate}" readonly="readonly">
            			</div>
            			
              					<div class="form-group col-md-4">
                					<label for="inputEmail4"> Tax fee</label>
                						<input type="text" name="tax_fee" id="tax_fee" class="form-control" value="${tx.taxFee}" readonly="readonly">
              					      <input type="hidden" name="mfees" id="mfees" class="form-control" value="${tx.modeOfPaymentFee}" >
              					
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Amount to pay in
														${branch.fromCountry.currencyCode}</label>
                						<input type="text"  name="total_to_pay" id="total_to_pay" value="${tx.totalAmountCollected}" class="form-control" readonly="readonly" onkeypress="return onlyNumber(event)">
              					</div>
              					<div class="form-group col-md-4 ">
              						<label for="inputEmail4">Amount in Base Currency</label>
              						<input type="text"  name="amountInDoller" id="amountInDoller" value="${tx.receipentAmount}" class="form-control" readonly="readonly" onkeypress="return onlyNumber(event)">
              					</div>
              					
            			</div>
            			
            			
										</div>
										<div class="col-md-6" style="margin-top:-40px;">
										
											<c:choose>
											
										<c:when test="${tx.paymentType ne null }">
										<c:if test="${tx.paymentType eq 'Card Transfer' }">
										 <div  id="CardTrDiv1">
										<span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">CARD Transfer Details</h5></span>
										<div class="form-row ">
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">cardNumber </label>
                					<input type="text" name="cardNumber" id="cardNumber" value="${tx.beneficiary.cardNumber}" class="form-control">
              					</div>
              					</div>
              					</div>
              					</c:if>
 										<c:if test="${tx.paymentType eq 'Mobile Money' }">
                            <div  id="mbTrDiv1">
										<br><br><span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">Mobile Transfer Details</h5></span>
									<div class="form-row ">	
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Mobile Transfer Number</label>
                					<input type="text" name="mobileTrnsferNumber" value="${tx.beneficiary.mobileTrnsferNumber}" id="mobileTrnsferNumber" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Mobile Transfer Network</label>
                					<input type="text" name="transferNetWork" value="${tx.beneficiary.transferNetWork }" id="transferNetWork" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Mobile Transfer Network CreditType</label>
                					<input type="text" name="transferNetWorkCreditType" value="${tx.beneficiary.transferNetWorkCreditType }" id="transferNetWorkCreditType" class="form-control">
              					</div>
              					</div>
              					
              					</div>
              					
              					</c:if>
              			<c:if test="${tx.paymentType eq 'Home Delivery' }">
              					
                             <div  id="homeTrDiv1">
										<br><br><span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">Home Delivery</h5></span>
              					<div class="form-row ">
              					
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Address1</label>
              					<input type="text" class="form-control" name="beneficiaryAddress1" value="${tx.beneficiary.beneficiaryAddress1 }" id="beneficiaryAddress1">			
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Address2</label>
              					<input type="text" class="form-control" name="beneficiaryAddress2" value="${tx.beneficiary.beneficiaryAddress2 }" id="beneficiaryAddress2">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Address3</label>
              					<input type="text" class="form-control" name="beneficiaryAddress3" value="${tx.beneficiary.beneficiaryAddress3 }" id="beneficiaryAddress3">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BeneficiaryCity</label>
              					<input type="text" name="beneficiaryCity" value="${tx.beneficiary.beneficiaryCity }" id="beneficiaryCity" class="form-control">			
              					</div>
<%--                					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BeneficiaryIdType</label>
              					<input type="text" name="beneficiaryIdType" value="${tx.beneficiary.beneficiaryIdType}" id="beneficiaryIdType">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Id Details</label>
              					<input type="text" name="beneficiaryIdDetails" value="${tx.beneficiaryIdDetails }" id="beneficiaryIdDetails">			
              					</div>
 --%>               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">deliveryNote</label>
              					<input class="form-control" type="text" name="deliveryNote" value="${tx.beneficiary.deliveryNote}" id="deliveryNote">			
              					</div>
              					
              					</div>
              					
              					</div></c:if>
              					<c:if test="${tx.paymentType eq 'Account Transfer' or tx.paymentType eq 'Bank Deposit'}">
              					
              					                            <div id="AccountTrDiv1">
										<br><br><span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">Account Transfer Details1</h5></span>
									<div class="form-row">
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Account Transfer </label>
                					<input type="text" name="beneficiaryAccountTransfer" class="form-control" value="${tx.beneficiary.beneficiaryAccountTransfer}" id="beneficiaryAccountTransfer" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank Details</label>
              					<input type="text" name="bankDetails" value="${tx.beneficiary.bankDetails }" id="bankDetails" class="form-control">			
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank Name</label>
              					<input type="text" name="bank" value="${tx.beneficiary.bank}" id="bank" class="form-control">			
              					</div></div>
 									<div class="form-row">
              					
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">swiftCode</label>
              					<input type="text" name="swiftCode" value="${tx.beneficiary.swiftCode}" id="swiftCode" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">IBAN</label>
              					<input type="text" name="iBAN" value="${tx.beneficiary.iBAN}" id="iBAN" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">branch Name</label>
              					<input type="text" name="branch" value="${tx.beneficiary.branch }" id="branch" class="form-control">			
              					</div></div>
              			<div class="form-row">
              					
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch City</label>
              					<input type="text" name="BranchCity" value="${tx.beneficiary.branchCity }" id="BranchCity" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch State</label>
              					<input type="text" name="branchState" value="${tx.beneficiary.branchState}" id="branchState" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch Telephone</label>
              					<input type="text" name="telephone" value="${tx.beneficiary.telephone}" id="telephone" class="form-control">			
              					</div></div>
              				<div class="form-row">
              					
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch Manager</label>
              					<input type="text" class="form-control" name="branchManager" id="branchManager" value="${tx.beneficiary.branchManager}" class="form-control">			
              					</div>
              					
              					</div>
              					</div>
              					</c:if>
              					<c:if test="${tx.paymentType eq 'Bill Payment' }">
                             <div  id="utilityTrDiv1">
										<br><br><span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">Utility Bill Details</h5></span>
									<div class="form-row">
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Utility Company </label>
                					<input type="text" name="utilityCompany" value="${tx.beneficiary.utilityCompany}" id="utilityCompany" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Customer AccountNumber</label>
              					<input type="text" name="customerAccountNumber" value="${tx.beneficiary.customerAccountNumber}" id="customerAccountNumber" class="form-control">			
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Invoice Number</label>
              					<input type="text" name="invoiceNumber" value="${tx.beneficiary.invoiceNumber}" id="invoiceNumber" class="form-control">			
              					</div></div>
              					<div class="form-row">
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank To Pay</label>
              					<input type="text" name="bankToPay" value="${tx.beneficiary.bankToPay}" id="bankToPay" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BANK IBAN/SWIFT CODE</label>
              					<input type="text" name="iBan" id="iBan" value="${tx.beneficiary.iBan }" class="form-control">			
              					</div></div>
                 					<div class="form-row">
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank Bic Code</label>
              					<input type="text" name="bankBicCode" id="bankBicCode" value="${tx.beneficiary.bankBicCode}" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Address Line1</label>
              					<input type="text" name="addressLine1" id="addressLine1" value="${tx.beneficiary.addressLine1}" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Address Line2</label>
              					<input type="text" name="addressLine2" id="addressLine2" value="${tx.beneficiary.addressLine2}" class="form-control">			
              					</div></div>
              					    <div class="form-row">
              					
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Address Line3</label>
              					<input type="text" name="addressLine3" id="addressLine3" value="${tx.beneficiary.addressLine3}" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">City</label>
              					<input type="text" name="city" id="city" value="${tx.beneficiary.city}" class="form-control">			
              					</div>
                					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">State</label>
              					<input type="text" name="state" id="state" value="${tx.beneficiary.state }" class="form-control">			
              					</div></div>
              					     <div class="form-row">
                  					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BillDescription</label>
              					<input type="text" name="billDescription" id="billDescription" value="${tx.beneficiary.billDescription}" class="form-control">			
              					</div>
              					
              					</div>
              					</div></c:if>
              					<c:if test="${tx.paymentType eq 'Cash Collection' }">
              			<div  id="cashTrDiv1">
										<br><br><span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">CashCollection Details</h5></span>
									<div class="form-row">
              					<div class="form-group col-md-4" id="btr1">
                					<label for="inputEmail4">Collection Point</label>
                					<input type="text" name="collectionPointName" id="collectionPointName" value="${tx.beneficiary.collectionPointName}" class="form-control">
              					</div>              					
              					<div class="form-group col-md-4" id="btr2">
                					<label for="inputEmail4">collectionPointCode</label>
                					<input type="text" name="collectionPointCode" id="collectionPointCode" value="${tx.beneficiary.collectionPointCode }" class="form-control" placeholder="Enter collectionPointName*" onkeyup="removeError('bankState')">
              					</div> 
              					<div class="form-group col-md-4" id="btr3">
                					<label for="inputEmail4">collectionPointBank</label>
                					<input type="text" name="collectionPointBank" value="${tx.beneficiary.collectionPointBank}" id="collectionPointBank" class="form-control" placeholder="Enter collectionPointBank*" onkeyup="removeError('branchCode')">
              					</div> 
              					<div class="form-group col-md-4" id="btr4">
                					<label for="inputEmail4">collectionPointAddress</label>
                					<input type="text" name="collectionPointAddress" value="${tx.beneficiary.collectionPointAddress}" id="collectionPointAddress" class="form-control" placeholder="Enter collectionPointAddress  *" onkeyup="removeError('accountNo')">
              					</div> </div>
              														<div class="form-row">
              					             					
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPointCity</label>
                					<input type="text" name="collectionPointCity" value="${tx.beneficiary.collectionPointCity }" id="collectionPointCity"class="form-control" placeholder="Enter collectionPointCity   *" onkeyup="removeError('accountHolderName')">
              					</div> 
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPointState</label>
                					<input type="text" name="collectionPointState" value="${tx.beneficiary.collectionPointState}" id="collectionPointState"class="form-control" placeholder="Enter collectionPointState" onkeyup="removeError('accountHolderName')">
              					</div> 
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPointTelephone</label>
                					<input type="text" name="collectionPointTelephone" value="${tx.beneficiary.collectionPointTelephone }" id="collectionPointTelephone"class="form-control" placeholder="Enter collectionPointTelephone" onkeyup="removeError('accountHolderName')">
              					</div> </div>
              	<div class="form-row">
              					
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPin</label>
                					<input type="text" name="collectionPin" value="${tx.beneficiary.collectionPin}" id="collectionPin" class="form-control" placeholder="Enter collectionPin   *" onkeyup="removeError('accountHolderName')">
              					</div> 
               					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">ConfirmcollectionPin</label>
                					<input type="text" name="confrmcollectionPin" value="${tx.beneficiary.collectionPin}" id="confrmcollectionPin" class="form-control" placeholder="Enter ConfirmcollectionPin   *" onkeyup="removeError('accountHolderName')">
              					</div> 
              					 </div>
										</div></c:if>
										
										</c:when>
										
										
									
										<c:otherwise>
									     <div  id="CardTrDiv2">
										<br><br><span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">CARD Transfer Details</h5></span>
										<div class="form-row ">
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">cardNumber </label>
                					<input type="text" name="cardNumber1" id="cardNumber1" class="form-control">
              					</div></div></div>
              				
              					 <div  id="CardTrDiv">
              					<br><br><span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">CARD Transfer Details</h5></span>
									<div class="form-row ">	
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">cardNumber </label>
                					<input type="text" name="cardNumber" id="cardNumber" class="form-control">
              					</div></div></div>
              				
                            <div  id="mbTrDiv">
										<br><br><span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">Mobile Transfer Details</h5></span>
									<div class="form-row ">	
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Mobile Transfer Number</label>
                					<input type="text" name="mobileTrnsferNumber" id="mobileTrnsferNumber" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Mobile Transfer Network</label>
                					<input type="text" name="transferNetWork" id="transferNetWork" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Mobile Transfer Network CreditType</label>
                					<input type="text" name=transferNetWorkCreditType id="transferNetWorkCreditType" class="form-control">
              					</div>
              					
              					
              					</div></div>
              					
              					
              					
              					
                          <div id="homeTrDiv">
										<br><br><span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">Home Delivery Details</h5></span>
										<div class="form-row " >
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Address1</label>
              					<input type="text" name="beneficiaryAddress1" id="beneficiaryAddress1" class="form-control">			
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Address2</label>
              					<input type="text" name="beneficiaryAddress2" id="beneficiaryAddress2" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Address3</label>
              					<input type="text" name="beneficiaryAddress3" id="beneficiaryAddress3" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BeneficiaryCity</label>
              					<input type="text" name="beneficiaryCity" id="beneficiaryCity" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BeneficiaryIdType</label>
              					<input type="text" name="beneficiaryIdType" id="beneficiaryIdType" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Id Details</label>
              					<input type="text" name="beneficiaryIdDetails" id="beneficiaryIdDetails" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">deliveryNote</label>
              					<input type="text" name="deliveryNote" id="deliveryNote" class="form-control">			
              					</div>
              					
              					</div></div>
              					
              					                            <div id="AccountTrDiv">
										<br><br>
										<span><h5 style="font-size: 13px;background:#2e287b;color:white;padding:5px;">Account Transfer Details</h5>
										</span>
									<div class="form-row">
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Beneficiary Account Transfer Number</label>
                					<input type="text" name="beneficiaryAccountTransfer" id="beneficiaryAccountTransfer" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank Details</label>
              					<input type="text" name="bankDetails" id="bankDetails" class="form-control">			
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank Name</label>
             				<select class="form-control" name="bank" id="bank" onchange="checkBankName()">
         	<option value="">--select--</option>
            				</select>
                                <h4 style="background-color:red;color:#fff;padding:8px 8px 8px 8px;text-align:center" id="fail"></h4>
                                 <h4 style="background-color:green;color:#fff;padding:8px 8px 8px 8px;text-align:center" id="success"></h4>
              					</div></div>
 									<div class="form-row">
              					
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">swiftCode</label>
              					<input type="text" name="swiftCode" id="swiftCode" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">IBAN </label>
              					<input type="text" name="iBAN" id="iBAN" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">branch Name</label>
              					<input type="text" name="branch" id="branch" class="form-control">			
              					</div></div>
              			<div class="form-row">
              					
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch City</label>
              					<input type="text" name="BranchCity" id="BranchCity" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch State</label>
              					<input type="text" name="branchState" id="branchState" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch Telephone</label>
              					<input type="text" name="telephone" id="telephone" class="form-control">			
              					</div></div>
              				<div class="form-row">
              					
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Branch Manager</label>
              					<input type="text" name="branchManager" id="branchManager" class="form-control">			
              					</div>
              					
              					</div>
              					</div>
              					
                             <div  id="utilityTrDiv">
										<br><br><span><h5 style="font-size: 13px;background:#2e287b;color:white;padding:5px;">Utility Bill Details</h5></span>
									<div class="form-row">
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Utility Company </label>
                					<input type="text" name="utilityCompany" id="utilityCompany" class="form-control">
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Customer AccountNumber</label>
              					<input type="text" name="customerAccountNumber" id="customerAccountNumber" class="form-control">			
              					</div>
              					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Invoice Number</label>
              					<input type="text" name="invoiceNumber" id="invoiceNumber" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank To Pay</label>
                       				<select class="form-control" name="bankToPay" id="bankToPay" onchange="checkBankName6gh()">
         	<option value="">--select--</option>
            				
            				</select>
                                 <h4 style="background-color:red;color:#fff;padding:8px 8px 8px 8px;text-align:center" id="fail1"></h4>
                                <h4 style="background-color:green;color:#fff;padding:8px 8px 8px 8px;text-align:center" id="success1"></h4>
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BANK IBAN/SWIFT CODE</label>
              					<input type="text" name="iBan" id="iBan" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Bank Bic Code</label>
              					<input type="text" name="bankBicCode" id="bankBicCode" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Address Line1</label>
              					<input type="text" name="addressLine1" id="addressLine1" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Address Line2</label>
              					<input type="text" name="addressLine2" id="addressLine2" class="form-control">			
              					</div>
              					
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">Address Line3</label>
              					<input type="text" name="addressLine3" id="addressLine3" class="form-control">			
              					</div>
               					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">City</label>
              					<input type="text" name="city" id="city" class="form-control">			
              					</div>
                					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">State</label>
              					<input type="text" name="state" id="state" class="form-control">			
              					</div>
                  					<div class="form-group col-md-4" id="cp">
                					<label for="inputEmail4">BillDescription</label>
              					<input type="text" name="billDescription" id="billDescription" class="form-control">			
              					</div>
              					
              					</div>
              					</div>
              			<div  id="cashTrDiv">
										<br><br><span><h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">CashCollection Details</h5></span>
<div class="row">
<div class="col-md-7">
	<input type="text" name="collection" id="collection"  class="form-control"
	 placeholder="Find here....."    />
</div>

<div class="col-md-3">
<input type="button" class="btn btn-primary waves-effect waves-light  center-block  mb-5 center-block " value="search" id="makeTransaction" onclick="searchcollectioninfo();">
</div>
									
									<div id="collectionDiv">
									<div class="form-row">
              					<div class="form-group col-md-4" id="btr1">
                					<label for="inputEmail4">Collection Point</label>
                					<input type="text" name="collectionPointName" id="collectionPointName" class="form-control">
              					</div>              					
              					<div class="form-group col-md-4" id="btr2">
                					<label for="inputEmail4">collectionPointCode</label>
                					<input type="text" name="collectionPointCode" id="collectionPointCode" class="form-control" placeholder="Enter collectionPointName*" onkeyup="removeError('bankState')">
              					</div> 
              					<div class="form-group col-md-4" id="btr3">
                					<label for="inputEmail4">collectionPointBank</label>
            <input type="text" class="form-control" name="collectionPointBank" id="collectionPointBank" >
            				
              					
              					</div> 
              					<div class="form-group col-md-4" id="btr4">
                					<label for="inputEmail4">collectionPointAddress</label>
                					<input type="text" name="collectionPointAddress" id="collectionPointAddress" class="form-control" placeholder="Enter collectionPointAddress  *" onkeyup="removeError('accountNo')">
              					</div> </div>
              														<div class="form-row">
              					             					
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPointCity</label>
                					<input type="text" name="collectionPointCity" id="collectionPointCity"class="form-control" placeholder="Enter collectionPointCity   *" onkeyup="removeError('accountHolderName')">
              					</div> 
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPointState</label>
                					<input type="text" name="collectionPointState" id="collectionPointState"class="form-control" placeholder="Enter collectionPointState" onkeyup="removeError('accountHolderName')">
              					</div> 
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPointTelephone</label>
                					<input type="text" name="collectionPointTelephone" id="collectionPointTelephone"class="form-control" placeholder="Enter collectionPointTelephone" onkeyup="removeError('accountHolderName')">
              					</div> </div>
              	<div class="form-row">
              					
              					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">collectionPin</label>
                					<input type="text" name="collectionPin" id="collectionPin"class="form-control" placeholder="Enter collectionPin   *" onkeyup="removeError('accountHolderName')">
              					</div> 
               					<div class="form-group col-md-4" id="btr5">
                					<label for="inputEmail4">ConfirmcollectionPin</label>
                					<input type="text" name="confrmcollectionPin" id="confrmcollectionPin"class="form-control" placeholder="Enter ConfirmcollectionPin   *" onkeyup="removeError('accountHolderName')">
              					</div> 
              					 </div>
										</div>
										
									</div>	
										
										
										
										</c:otherwise>
										</c:choose>
              			
              					
              					
										
										</div>
										</div>




</div>






              												
										<div class="col-md-12">
											<input type="button" class="btn btn-primary waves-effect waves-light  center-block  mb-5 center-block " value="Make Transaction" id="makeTransaction" onclick="doTransaction();">
											
										</div>
										
										
										
	  			<div class="modal" id="collectionmyModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 700px;position: relative;left: -123px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" style="margin: -60px 0 0 -1px!important;">
          <div class="col-12 mt-50">
                                        <div class="row">
                                            <div class="col-xl-4 col-lg-4">
                                                <div>
                                                    <div class="form-group">
                                                    </div>
                                                </div>
      <label>Source country</label>
      <div>     
       <select class="form-control" data-plugin="customselect" name="source" id="source" onclick="removeError('source')">
             </select>
      </div><br>
                                                
                                                       <div  id="countriesDiv"></div>
                                                
                                        </div>
                                        </div>
											<div class="col-md-12 ">
                                             <button type="button" class="mb-15 btn btn-primary waves-effect waves-light" onclick="searchcollectionpoint();">Search</button>
                                            </div>
                                           	 <br>
                                           	 <div class="clearfix"></div>
    <table class="table table-bordered " style="width:100%;" id="detailsId">
    <thead>
    <tr>
	
	</tr>
      <tr class="bg-white">
      
        <th>cashPickupFrom</th>
        <th>collectionPointCity</th>
        <th>contactNumber</th>
        <th>collectionPointBank</th>
        <th>collectionPointAddress</th>
        <!-- <th>Last Transaction Activity<br>DATE|AMOUNT|SUBAGENT</th> -->
      </tr>
    </thead>
    <tbody id="ctbody">
 
    </tbody>
  </table>
                                    
                                    <div id="collectionData"></div>
                                    
                                </div> <!-- end card-->
                            </div>
                    	</div>
        </div>
        <div class="modal-footer">
          
        </div>
      </div>
										
 
 </div></form></div></div></section></div></main>
 
 
 			<div class="modal" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 700px;position: relative;left: -123px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
        <div class="modal-body" style="margin: -60px 0 0 -1px!important;">
        
          <div class="col-12 mt-50">
                                        <form action="searchcustomertomaketransaction"  method="POST">
                                        <div class="row">
                                           
                                            <div class="col-xl-4 col-lg-4">

                                                <div>
                                                    <div class="form-group">
                                                        <label for="showEasing">Mobile Number</label>
                                                     <input type="text" class="form-control" name="mobileNumber" id="mobileNumber" placeholder="Enter Telephone/Mobile">
                                                    </div>
  
                                                </div>

                                        </div>
    
                                        <div class="col-xl-4 col-lg-4">

                                                <div>
                                                    <div class="form-group">
                                                        <label for="showEasing">First Name</label>
                                                    <input type="text" class="form-control" name="firstName" id="firstName" placeholder="Enter First Name">
                                                    </div>
  
                                                </div>

                                        </div>
                                        <div class="col-xl-4 col-lg-4">

                                                <div>
                                                    <div class="form-group">
                                                        <label for="showEasing">Last Name</label>
                                                      <input type="text" class="form-control" name="lastName" id="lastName" placeholder="Enter Last Name">
                                                    </div>
  
                                                </div>

                                        </div>
    									<div class="col-xl-4 col-lg-4">

                                                <div>
                                                    <div class="form-group">
                                                        <label for="showEasing">Date of Birth</label>
                                                       <input type="text" class="form-control " name="dob" id="datepicker3" placeholder="Enter Date of Birth" >
                                                    </div>
  
                                                </div>

                                        </div>
                                       
                                        <div class="col-xl-4 col-lg-4">

                                                <div>
                                                    <div class="form-group">
                                                        <label for="showEasing">Email Address</label>
                                                       <input type="text" class="form-control" name="emailId" id="emailId" placeholder="Enter Email Address">
                                                    </div>
  
                                                </div>

                                        </div>
                                        <div class="col-xl-4 col-lg-4">

                                                <div>
                                                    <div class="form-group">
                                                        <label for="showEasing">Document Number</label>
                                                      <input type="text" class="form-control" name="firstIdNumber" id="firstIdNumber" placeholder="Enter Document Number">
                                                    </div>
  
                                                </div>

                                        </div>
                                        <div class="col-xl-4 col-lg-4">

                                                <div>
                                                    <div class="form-group">
                                                        <label for="showEasing">Address</label>
                                                       <textarea class="form-control" name="address" id="address" placeholder="Enter Address"></textarea>
                                                    </div>
  
                                                </div>

                                        </div>
                                        <div class="col-xl-4 col-lg-4">

                                                <div>
                                                    <div class="form-group">
                                                        <label for="showEasing">Postal Code</label>
                                                       <input type="text" class="form-control" name="postalCode" id="postalCode" placeholder="postal code">
                                                    </div>
  
                                                </div>

                                        </div>
                                        <div class="col-xl-4 col-lg-4">

                                                <div>
                                                    <div class="form-group">
                                                        <label for="showEasing">City/State</label>
                                                       <input type="text" class="form-control" name="cityOrState" id="cityOrState" placeholder="Enter City/State Name">
                                                    </div>
  
                                                </div>

                                        </div>
                                        
                                        
                                        
											<div class="col-md-12 ">
                                             <button type="button" class="mb-15 btn btn-primary waves-effect waves-light" onclick="searchCustomer();">Search</button>
                                               
                                            </div>
                                           	 <br>
                                           	 <div class="clearfix"></div>
                                           	 
                                       
                                    </div> <!-- end card-body-->
                                    </form>
                                    <table class="table table-bordered " style="width:100%;" id="detailsId">
    <thead>
    <tr>
	
	</tr>
      <tr class="bg-white">
      
        <th>Name</th>
        <th>Contact Number</th>
        <th>Address</th>
        <th>Identity Proof</th>
        <th>Identity Number</th>
        <!-- <th>Last Transaction Activity<br>DATE|AMOUNT|SUBAGENT</th> -->
      </tr>
    </thead>
    <tbody id="tbody">
 
    </tbody>
  </table>
                                    
                                    <div id="customerData"></div>
                                    
                                </div> <!-- end card-->
                            </div>
                    	</div>
        </div>
        <div class="modal-footer">
          
        </div>
      </div>
            
    
 
 
 
 
 
</body>
<script type="text/javascript">
function setIdFields(){
	var idType=$('#firstIdProofType1').val();
//alert('idType==='+idType.split(",")[1]);

	
	if(idType.split(",")[1]=='none'){
		$('#senderId').hide();
		$('#nationalId').show();
		var countryISO=$('#country').val();
		$('#nationalIdType').empty();
		$('#nationalIdTypeLabel').append('National IdType');
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

	}
	
 	
 if(idType.split(",")[1]=='country'){
		$('#id-label').append('Id Number');	
		$('#stateOfIssueLabel').append('Id Issue Country');
		$('#idProofIssueCountry').empty();
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
				 $('#idProofIssueCountry1').append(opt1);
			},
			error : function(error , xhr , status){
				//alert('getAllCountries error = '+xhr);
			}
			
			
		});
		
	}else if(idType.split(",")[1]=='state'){
		//alert('its is state===');
		//$('#stateOfIssueLabel').append('Id Issue State');

		var countryISO=$('#fromCountryISO').val();
		//alert('countryISO==='+countryISO);
		$.ajax({
			url : "/common/getStatesBasedOnCountry",
			method : "get",
			data : "countryISO="+countryISO,
			async : false,
			success : function(response){
				var list =JSON.stringify(response, undefined, '\t');
				//alert('list===='+list);
				var opt='<option value="">--Select*--</option>';
				var opt1='';
				$.each($.parseJSON(list),function(idx,obj){
					opt1=opt1+'<option value="'+obj.countryISO+'">'+obj.stateName+'</option>';
				 });
				$('#idProofIssueCountry1').empty();
				
				$('#idProofIssueCountry1').append(opt+opt1);
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
<script type="text/javascript">

function validateEmail(userName) {
	var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if(regex.test(userName)) {
	return true;
	}
	else {
	return false;
	}
}
</script>
</html>
