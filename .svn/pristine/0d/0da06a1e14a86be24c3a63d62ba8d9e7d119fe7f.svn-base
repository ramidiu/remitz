<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Transaction List</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">-->
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> Branch Transactions List</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
  
 
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   
<script type="text/javascript">
function setPaymentStatus(count,txnid,ckycstatus)
{ 
	
	//alert("hi from paymentstatus===="+ckycstatus);
	var pstatus=$('#paymentstatus'+count).val();
	//alert('pstatus===='+pstatus);
	if(pstatus=="")
		{
		alert("please select status to change");
		return false;
		}
/* alert("pstatus:"+pstatus); */
	var querystring="pstatus="+pstatus+"&txnid="+txnid+"&ckycstatus="+ckycstatus;
	$.ajax({
	url:"common/changeBranchPaymentStatusInTransaction",
	type:'POST',
	data:querystring,
	success:function(response){
		if(response=="success")
			{
			getTransactionList();
			}
		
	},
	error:function(){
		
		alert("error");
	}	
		
	
	
	
	})
	
	
	
	}
</script>
 <script type="text/javascript">
function updateStatus(count,txnid)
{
	alert("txnid====="+txnid);
	
	/* alert("hi from paymentstatus"); */
	var transactionstatus=$('#transactionStatus'+count).val();
	alert('transactionstatus====='+transactionstatus);
	if(transactionstatus=="")
		{
		alert("please select status to change");
		return false;
		}
/* alert("pstatus:"+pstatus); */
	var querystring="transactionstatus="+transactionstatus+"&txnid="+txnid;
	$.ajax({
	url:"common/changeBranchTransactionStatus",
	type:'POST',
	data:querystring,
	success:function(response){
		alert('response====='+response);
		if(response=="success")
			{
			getTransactionList();
			}
		
	},
	error:function(){
		
		alert("error");
	}	
		
	
	
	
	})
	
	
	
	}
</script>

 

 
  
<!-- <script type="text/javascript">
$(document).ready(
	

function (){
	
	var count=$('#count').val();
for(var i=1; i<=count;i++){
	var txnId=$('#txnid'+i).val();
	var pstatus=$('#txnpstatus'+i).val();
	var kycstatus=$('#ckycstatus'+i).val();
	var adminstatus=$('#adminstatus'+i).val();
	
	alert(adminstatus);
	/* alert('txnId = '+txnId+" pType = "+pType+" status = "+status+" paymentStatus = "+createdDate+" sendingReason = "+sendingReason); */
/* 	var txntype=$('#transactionStatus').val(); */
	var opt='<select id="select-'+txnId+'" onchange=showUpdateButton("'+txnId+'");removeError("select-'+txnId+'");><option value="">select</option>';
	if(adminstatus=="Wrong A/c No" || adminstatus=="pending"){
		opt=opt+'<option value="cancelled">Cancelled</option>';
		opt=opt+'<option value="on hold">On Hold</option>';	
		
	}else{
		if(pstatus=='Completed' && kycstatus=='Y'){
			if(txntype=='processing'){
				opt=opt+'<option value="paid">Completed</option>';
				opt=opt+'<option value="cancelled">Cancelled</option>';
				opt=opt+'<option value="on hold">On Hold</option>';	
			}else{
				opt=opt+'<option value="processing">Processing</option>';
				opt=opt+'<option value="paid">Completed</option>';
				opt=opt+'<option value="cancelled">Cancelled</option>';
				opt=opt+'<option value="on hold">On Hold</option>';
			}
			
		}
		else if (pstatus=='Completed' && kycstatus=='pending'||pstatus!='Completed'){
			opt=opt+'<option value="cancelled">Cancelled</option>';
		}
	}
	alert(opt);
	opt=opt+'</select>';
/* 	$(".transactionstatus"+i).innerHTML=opt; */
$('transactionstatus'+i).innerHTML+=opt;
}
});

function showUpdateButton(id){
	var selectedItem=$('#select-'+id).val();
	if(selectedItem==''){
		$('#span-'+id).empty();
	}else{
		$('#span-'+id).empty();
		$('#span-'+id).append('<button type="button" class="updatebtn" onclick=openModal("'+id+'");>update</button>');	
	}
	
	
}
</script> -->
  <script>
  $( function() {
    $( "#fromDate" ).datepicker({
    	 changeMonth: true,
    	    changeYear: true,
    	    format: 'yyyy-mm-dd' ,
    	    	onSelect: function( selectedDate ) {
    				$( "#toDate" ).datepicker( "option", "minDate", selectedDate );
    			} 
    });
   
  } );
  </script> 
  <script type="text/javascript">
 $(document).ready(function(){
	 $('#success').hide();
	 $('#fail').hide();
 });
 </script>
  <script>
  $( function() {
    $( "#toDate" ).datepicker({
   	 changeMonth: true,
     changeYear: true,
     format:'yyyy-mm-dd' ,
     onSelect: function( selectedDate ) {
			$( "#fromDate" ).datepicker( "option", "maxDate", selectedDate );
		} 
    });
  } );
  </script>
  <script type="text/javascript">
  function doDeposit()
  {
		 var numberOfChecked = Number($('input:checkbox:checked').length);
		 if(numberOfChecked===0){
			 alert("please check atleast one check box to  Update .....?");
		 }
		 $.each($("input[name='transactionId']:checked"), function(){
			 var checkboxval=$(this).val();
			 //alert('checkboxval====='+checkboxval);
			 numberOfChecked=numberOfChecked-1;		
			 $.ajax({
				url : "doDeposit",
				type : "POST",
				data :"txId="+checkboxval,
				async: false,
				success:function(response){
					//alert('response==='+response);
					if(response == 'Deposit request processed successfully'){ 
						// if(numberOfChecked===0){
								$('#success').show();
								$('#success').empty();
								$('#success').append("Deposit request processed successfully .....");
								setTimeout(function(){
							           location.reload(); 
							      }, 5000);
					   }else{
							$('#fail').show();
							$('#fail').empty();
							$('#fail').append("Deposit  Failed.....");
							setTimeout(function(){
						           location.reload(); 
						      }, 5000);
						   
					   }
				},
				error :function(xhr,status,error){
					$('#fail').show();
					$('#fail').empty();
					$('#fail').append("Deposit  Failed due to invalid recipent detais.....");
					//alert("status:"+status);
					setTimeout(function(){
				           location.reload(); 
				      }, 5000);
				}
				
				 
			 });
		 });
  
  } 
  
  </script>
  <script>
  function getTransactionList()
  {
	  var fromdate=$('#fromDate').val();
	// alert('fromdate===='+fromdate);
	var todate=  $('#toDate').val();
	//alert('todate===='+todate);
	  $.ajax({
		  url:"common/TxnlistOfSendingBranch",
		   type:'GET',
			data:'fromdate='+fromdate+'&todate='+todate,
			async : false,	
			success:function(response){
				
			//alert('response====='+response);
					 var txnList = JSON.stringify(response, undefined, '\t');
					 var rows='';
					 var selectbox='';
					 var selectbox2='';
					 var counts=1;
					// alert('txnList==='+txnList);
					 $.each($.parseJSON(txnList),function(idx,obj){
						 /* if(obj.fromBranch.branchId == branchId && obj.status==txntype){ */
							  var count='0';
						 var ramp='';
								var txnId=obj.transactionId;
								var paymenttype=obj.paymentType;
							
								/* alert(paymenttype); */
								var td=''; 
								/*  $.each($.parseJSON(bankList),function(idx,obj){
									 if(txnId==obj.transactionInformation.transactionId){
										 td=obj.beneficiary.bankName+"<br>"+obj.beneficiary.bankAccountNumber+"<br>"+obj.beneficiary.bankBranchCode;
										 count='1';
									 }
								 });   */
								  /*if(count=='0'){
									 var pt=''; */
									 //alert('sendingAmount===='+obj.sendingAmount);
										ramp=(Number(obj.sendingAmount)+Number(obj.totalFee))-Number(obj.agentFee);
									 //alert('ramp===='+ramp);
									 var ck='';
									 var glo='';
									 var nsano=obj.admin.nsano;
									 var nsano1=obj.toBranch.nsano;
									 var ptypes=obj.paymentType;
									 
									 //alert('nsano1===='+nsano1);
									 //alert('nsano===='+nsano);
									 
									 if(nsano=="yes" && nsano1=="yes"){
										 var st=obj.nasanoResponse.gloStatus;
											//alert('st====='+st);
										 if(st=="notdone"){
												if(ptypes=='Mobile Money'||ptypes=='Bank Deposit'||ptypes=='Account Transfer'){
													glo='<input type="checkbox" name="transactionId" value="'+obj.transactionId+'" >';		 
													 }
														 }
													 if(st=='FAILED'|| st=='SUCCESSFUL'||st=='pending'){
													 glo='';
													 }
													 }
									 var kyc='';
									 var kycstatus='';
									 var deliveryinfo='';
									 var ptype=obj.paymentType;
									 //alert('ptype==='+ptype);
									 if(ptype=='Cash Collection'){
										 deliveryinfo=obj.beneficiary.collectionPointName+","+obj.beneficiary.collectionPointBank+","+obj.beneficiary.collectionPointAddress+","+obj.beneficiary.collectionPointCity+","+obj.beneficiary.collectionPointState;
									 }
									 if(ptype=='Bill Payment'){
										 deliveryinfo= obj.beneficiary.utilityCompany+","+obj.beneficiary.customerAccountNumber+","+obj.beneficiary.invoiceNumber+","+obj.beneficiary.bankBicCode+","+obj.beneficiary.addressLine1;
									 }
									 if(ptype=='Card Transfer'){
										 deliveryinfo=obj.beneficiary.cardNumber;
									 }
									 if(ptype=='Home Delivery'){
										 deliveryinfo=obj.beneficiary.beneficiaryAddress1+","+obj.beneficiary.beneficiaryAddress2+","+obj.beneficiary.beneficiaryAddress3;
									 }
									 if(ptype=='Mobile Money'){
										 deliveryinfo=obj.beneficiary.mobileTrnsferNumber+","+obj.beneficiary.transferNetWork+","+obj.beneficiary.transferNetWorkCreditType;
									 }
									 if(ptype=='Bank Deposit'|| ptype=='Account Transfer'){
										 deliveryinfo=obj.beneficiary.beneficiaryAccountTransfer+","+obj.beneficiary.bank;
									 }
									//alert('deliveryinfo final===='+deliveryinfo); 
									 var current_kyc_status=obj.customer.customerKYCStatus;
									 var kyc_mode=obj.customer.customerKYCMode;
									 if(current_kyc_status=='completed' && kyc_mode=='RapidId'){
										 kyc='<img src="${pageContext.request.contextPath}/resources/static/images/verified4.jpg" height="45px" style="position: relative;left: 30px;"> <img src="${pageContext.request.contextPath}/resources/images/rapid.png" height="23px">'; 
										 kycstatus='<font color="green"><strong>[KYC Completed]</strong></font>';	
									 }
									 if(current_kyc_status=='completed' && kyc_mode=='manual'){
										 kyc='<img src="${pageContext.request.contextPath}/resources/static/images/verified4.jpg" height="45px" style="position: relative;left: 7px;"><br><img src="${pageContext.request.contextPath}/resources/images/manual.png" height="23px">';
										 kycstatus='<font color="green"><strong>[KYC Completed]</strong></font>';
									 }
									 if(current_kyc_status=='pending' && kyc_mode=='manual'){
										 kyc='<br><img src="${pageContext.request.contextPath}/resources/static/images/rejected2.png" height="30px" style="position: relative;left: 4px;top: -8px;"><br><img src="${pageContext.request.contextPath}/resources/images/manual.png" height="23px">';
										 kycstatus='<font color="red"><strong>[KYC Pending]</strong></font>';
									 }
									 if(current_kyc_status=='pending' && kyc_mode=='RapidId'){
										 kyc='<br><img src="${pageContext.request.contextPath}/resources/static/images/rejected2.png" height="30px" style="position: relative;left: 4px;top: -8px;"><br><img src="${pageContext.request.contextPath}/resources/images/rapid.png" height="23px">';
										 kycstatus='<font color="red"><strong>[KYC Pending]</strong></font>';
									 }
									 
									 

									  if(obj.paymentStatus=='pending'){
										  
										  /* alert("pending ifstatus:"+obj.paymentStatus); */
											  
												  selectbox2='<select id="paymentstatus'+counts+'" onchange=setPaymentStatus("'+counts+'","'+obj.transactionId+'","'+current_kyc_status+'")><option value="">select</option><option value="funds received">Funds Received</option><option value="cancelled">cancelled</option></select>'; 
												  /* '<select id="select-'+txnId+'" onchange=showUpdateButton("'+txnId+'");removeError("select-'+txnId+'");><option value="">select</option>'; */							  
										  }
								  if(obj.status=='pending'){
									  
									 /*  alert("pending ifstatus:"+obj.status); */
										  
											  selectbox=setStatus(counts,obj.transactionId,obj.status.replace(/\s/g,"&nbsp;"),obj.paymentStatus,current_kyc_status);
											  rows=rows+'<tr><td>'+glo+'</td><td><a href="txnFulldetailsBranch?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td></td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.transactionMode+'</td><td>'+obj.agent+'</td><td>'+obj.paymentStatus+selectbox2+'</td><td>'+ramp+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.taxFee+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+kycstatus+'<br><font color="green">'+obj.status+selectbox+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td><td>'+obj.beneficiary.firstName+'</td><td>'+deliveryinfo+'</td></tr>';  
										    selectbox2="";
										  
										 
											
										
										 
							
										  
									  } if(obj.status=='processing'){
										  /* alert("cancelled if:"+obj.status); */
									  selectbox=setStatus(counts,obj.transactionId,obj.status.replace(/\s/g,"&nbsp;"),obj.paymentStatus,current_kyc_status);
										  rows=rows+'<tr><td>'+glo+'</td><td><a href="txnFulldetailsBranch?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td></td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.transactionMode+'</td><td>'+obj.agent+'</td><td>'+obj.paymentStatus+'</td><td>'+ramp+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.taxFee+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+kycstatus+'<br><font color="green">'+obj.status+selectbox+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td><td>'+obj.beneficiary.firstName+'</td><td>'+deliveryinfo+'</td></tr>';
									  }
								 
									  if(obj.status=='cancelled'){
										  /* alert("cancelled if:"+obj.status); */
									  
										  rows=rows+'<tr><td>'+glo+'</td><td><a href="txnFulldetailsBranch?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td></td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.transactionMode+'</td><td>'+obj.agent+'</td><td>'+obj.paymentStatus+'</td><td>'+ramp+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.taxFee+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+kycstatus+'<br><font color="green">'+obj.status+selectbox+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td><td>'+obj.beneficiary.firstName+'</td><td>'+deliveryinfo+'</td></tr>';
									  }
								 
								  if(obj.status =='funds received'){
									 /*  alert("paid if:"+obj.status); */
										  //rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.beneficiary.firstName+' '+obj.beneficiary.lastName+'</td><td><img src="${pageContext.request.contextPath}/resources/images/cancel.png" height="20px"weight="20px"></td><td>'+obj.transactionRate+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.createdDate+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td><strong>'+obj.modeOfPayment.toUpperCase()+'</strong> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td><td><font color="red"><strong>[KYC Pending]</strong></font><br><font color="green">'+obj.status+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td></tr>';  
										  rows=rows+'<tr><td>'+glo+'</td><td><a href="txnFulldetailsBranch?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td></td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.transactionMode+'</td><td>'+obj.agent+'</td><td>'+obj.paymentStatus+'</td><td>'+ramp+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.taxFee+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+kycstatus+'<br><font color="green">'+obj.status+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td><td>'+obj.beneficiary.firstName+'</td><td>'+deliveryinfo+'</td></tr>';
								  } 
								   
								  counts++; 
								  					 
//rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.agent+'</td><<td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+td+'</td><td>'+obj.transactionMode+'</td><td>'+obj.paymentStatus+'</td><td><strong>'+obj.modeOfPayment+'</strong> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"><br></td><td>'+obj.adminApprovalDateTime+'</td><td>'+obj.sellRate+'</td><td>' +obj.sendingAmount+obj.sendingCurrency+'</td><td>'+obj.totalFee+'</td><td>'+obj.receipentAmount+obj.receivingCurrency+'</td><td>'+kycstatus+'<br><font color="blueviolet">'+obj.status+selectbox+'<br><span id="span-'+obj.transactionId+'"></span></strong></font></td></tr>';				 
						 });
					 
					  $("table").find("tr:gt(0)").remove(); 
					 /* $('table').remove(); */
					 $("table tbody").append(rows);
					/*  alert("apeend"); */
					
				},
					error:function()
					{
						
						alert("error=======");
					}
	  
	  
	  });
	  
	  
	  
	  
	  
	  
  }
  
  
  </script>
  <script>
  function setStatus(counts,txnId,status,paymentStatus,current_kyc_status){
		/* alert('txnId = '+txnId+" pType = "+pType+" status = "+status+" paymentStatus = "+createdDate+" sendingReason = "+sendingReason); */
		var txntype=$('#txntype').val();
		var opt='<select id="transactionStatus'+counts+'" onchange=updateStatus("'+counts+'","'+txnId+'");><option value="">select</option>';
		
			if(paymentStatus=='funds received' && current_kyc_status=='completed'){
				
					if(status="processing"){
				
				opt=opt+'<option value="funds received">Completed</option>';
				opt=opt+'<option value="cancelled">Cancelled</option>';
				opt=opt+'<option value="onhold">On Hold</option>';
					}else if(status="pending")
				
				{
						opt=opt+'<option value="processing">Processing</option>';
						opt=opt+'<option value="funds received">Completed</option>';
						opt=opt+'<option value="cancelled">Cancelled</option>';
						opt=opt+'<option value="onhold">On Hold</option>';
				}
					
			}else{
				opt=opt+'<option value="cancelled">Cancelled</option>';
			
			}
			
			
		
		return opt+'</select>';
	}

  
  </script>
   
</head>
<body>
<%@include file="headerNew.jsp" %>


<div class="container">
 <main id="main-container">
              
                <div class="content">   

<div class="row">
                                            
                               	
                           
                            <div class="col-lg-12">
                               
                                         <div class="row">
                                                                      
                                                     <c:if test="${nsn eq 'yes' }">
                                                                       <div class="col-md-3" style="">
                                        	<button type="button" class="btn btn-primary waves-effect waves-light center-block" id="submit" onclick="doDeposit();" style="margin: 29px 0 0;">PerformDeposit</button>
                               <h4 style="background-color:green;color:#fff;padding:8px 8px 8px 8px;text-align:center" id="success"></h4>
                               <h4 style="background-color:red;color:#fff;padding:8px 8px 8px 8px;text-align:center" id="fail"></h4>
                                       
                                        </div> 
                                         </c:if>
                                          <div class="col-md-3" >
                                               
                                                    <div class="form-group">
                                                       <label for="showEasing"  class="Fromdate" style="">From Date</label>                                            
                                                    <input type="text" class="form-control" id="fromDate" value="${fromdate}"> 
                                                       
                                                    </div>
                                                
                                        </div> 
                                        <div class="col-md-3 " >
                                              
                                                    <div class="form-group">
                                                      
                                                       <label for="showEasing"  class="Todate" style="">To Date</label>
                                                       <input type="text" class="form-control" id="toDate" value="${todate}">
                                                    </div>
                                                
                                        </div> 
                                        <div class="col-md-3" style="">
                                        	<button type="button" class="btn btn-primary waves-effect waves-light center-block" id="submit" onclick="getTransactionList();" style="margin: 29px 0 0;">Submit</button>
                                        </div> 
                                      </div>
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
                                                <thead class="table-primary">
                                                  <tr>
                                                    <th style="background: #2e287b;color:white;text-align:center;"> </th>
                                                    <th style="background: #2e287b;color:white;text-align:center;">Trans refId</th>
                                                    <th style="background: #2e287b;color:white;text-align:center;">Create_Date</th>
                                                    <th style="background: #2e287b;color:white;text-align:center;">Delivery_Date</th>
                                                     <th style="background: #2e287b;color:white;text-align:center;">Remitter</th>
                                                     <th style="background: #2e287b;color:white;text-align:center;">kyc status</th>
                                                     <th style="background: #2e287b;color:white;text-align:center;">Destination</th>
                                                     <th style="background: #2e287b;color:white;text-align:center;">TransType</th>
                                                      <th style="background: #2e287b;color:white;text-align:center;">transactionMode</th>
                                                      <th style="background: #2e287b;color:white;text-align:center;">agent</th>
                                                      <th style="background: #2e287b;color:white;text-align:center;">paymentStatus</th>
                                                      <th style="background: #2e287b;color:white;text-align:center;">SourceAgent To Pay</th>
                                                      <th style="background: #2e287b;color:white;text-align:center;">Source Amount</th>
                                                       <th style="background: #2e287b;color:white;text-align:center;">totalFee</th>
                                                      <th style="background: #2e287b;color:white;text-align:center;">DestAmount</th>
                                                     <th style="background: #2e287b;color:white;text-align:center;">status</th>
                                                     <th style="background: #2e287b;color:white;text-align:center;">Benificiary Name</th>
                                                     <th style="background: #2e287b;color:white;text-align:center;">Delivery Info</th>
                                                  </tr>
                                                </thead>
                                                <tbody id="transactionRecords">
                                                <c:set var="count" value="${1}"/>
                                                <c:forEach items="${transactionlist}" var="transaction">
      <tr>
      <c:choose>
      <c:when test="${transaction.admin.nsano eq 'yes' and transaction.toBranch.nsano eq 'yes' and (transaction.nasanoResponse.gloStatus eq 'notdone') and(transaction.paymentType eq 'Mobile Money' or transaction.paymentType eq 'Bank Deposit' or transaction.paymentType eq 'Account Transfer') }">
        <td>
       <input type="checkbox" name="transactionId" id="transactionId" value="${transaction.transactionId}">
       </td>     
      </c:when>
      <c:otherwise>
      <td></td>
      </c:otherwise>
      </c:choose>
       
       <td> <span ><a style="color:#0e64eb" href="txnFulldetailsBranch?txnId=${transaction.transactionId }">${transaction.transactionId }</a></span><br>
  <td>${transaction.createdDate }</td>
  <td></td>
        <td>${transaction.customer.firstName }${transaction.customer.lastName }</td>
        <td>${transaction.customer.customerKYCStatus}</td>
         <td>${transaction.receivingCountry.countryName }</td>
         <td>${transaction.paymentType }</td>
           <td>${transaction.transactionMode}</td>
         <td>${transaction.agent }</td>
         <td>${transaction.paymentStatus}
         <c:if test="${transaction.paymentStatus eq 'pending'}">
         <select id="paymentstatus${count}" name="paymentstatus${count}" onchange="setPaymentStatus('${count}','${transaction.transactionId}')">
         <option value="">select</option>
         <option value="funds received">funds received</option>
         <option value="cancelled">cancelled</option>
         </select>
         
         </c:if>
         </td>
         <td>${transaction.sendingAmount+transaction.taxFee-transaction.agentFee}</td>
          <td>${transaction.sendingAmount}${transaction.sendingCurrency}</td>
              <td>${transaction.taxFee }</td>
             <td>${transaction.receipentAmount }${transaction.receivingCurrency}</td>
             <td >
             <c:choose>
             <c:when test="${transaction.customer.customerKYCStatus eq 'completed'}">
              <font color="green"><strong>[KYC Completed]</strong></font>
             </c:when>
              <c:when test="${transaction.customer.customerKYCStatus eq 'pending'}">
              <font color="red"><strong>[KYC Pending]</strong></font>
             </c:when>
             
             
             </c:choose>
           
            ${transaction.status }
          <c:choose>
         
           <c:when test="${transaction.paymentStatus eq 'funds received' and transaction.customer.customerKYCStatus eq 'completed'}">
           
           <c:if test="${transaction.status eq 'pending'}">
           
           
           <select id="transactionStatus${count}" name="transactionStatus${count}" onchange="updateStatus('${count}','${transaction.transactionId}');"> 
          <option value="">select</option>
          <option value="processing">processing</option>
          <option value="funds received">completed</option>
          <option value="cancelled">cancelled</option>
          <option value="onhold">Onhold</option>
          </select>
          </c:if>
          <c:if test="${transaction.status eq 'processing'}">
           
           
           <select id="transactionStatus${count}" name="transactionStatus${count}" onchange="updateStatus('${count}','${transaction.transactionId}')"> 
          <option value="">select</option>
          
          <option value="funds received">completed</option>
          <option value="cancelled">cancelled</option>
          <option value="onhold">Onhold</option>
          </select>
          </c:if>
          </c:when>
          <c:otherwise>
           <select id="transactionStatus${count}" name="transactionStatus${count}" onchange="updateStatus('${count}','${transaction.transactionId}')"> 
          <option value="">select</option>
          <option value="cancelled">Cancelled</option>
         
          </select>
          
          
          </c:otherwise>
          
          </c:choose>
          </td>
         <td>${transaction.beneficiary.firstName}</td>
         
         
         
         <c:if test="${transaction.paymentType eq 'Cash Collection' }">
        <td>${transaction.beneficiary.collectionPointName},
        ${transaction.beneficiary.collectionPointCode},
        ${transaction.beneficiary.collectionPointBank},
        ${transaction.beneficiary.collectionPointAddress}
        </td>
         </c:if>
         
         
         
         <c:if test="${transaction.paymentType eq 'Mobile Money' }">
         <td>${transaction.beneficiary.mobileTrnsferNumber },
         ${transaction.beneficiary.transferNetWork },
         ${transaction.beneficiary.transferNetWorkCreditType }
         </td>
         </c:if>
         
         
         <c:if test="${transaction.paymentType eq 'Bank Deposit' }">
         <td></td>
         </c:if>
         
         
         
         <c:if test="${transaction.paymentType eq 'Card Transfer' }">
        <td>${transaction.beneficiary.cardNumber}</td>
         </c:if>
         
         
         <c:if test="${transaction.paymentType eq 'Mobile Airtime top up' }">
         <td></td>
         </c:if>
         
         <c:if test="${transaction.paymentType eq 'Bill Payment' }">
           <td>${transaction.beneficiary.utilityCompany },
          ${transaction.beneficiary.customerAccountNumber },
          ${transaction.beneficiary.invoiceNumber },
          ${transaction.beneficiary.bankToPay}
          </td>
         </c:if>
         
         
          <c:if test="${transaction.paymentType eq 'Home Delivery' }">
          <td>${transaction.beneficiary.beneficiaryAddress1 },
          ${transaction.beneficiary.beneficiaryAddress2 },
          ${transaction.beneficiary.beneficiaryAddress3 },
          ${transaction.beneficiary.beneficiaryPostCode}
          </td>
         </c:if>
          <c:if test="${transaction.paymentType eq 'Bureau de Change' }">
        <td></td>
         </c:if>
         
         
         
         
         
         
      </tr>
         <c:set var="count" value="${count+1}"/>
                  </c:forEach>
                       
                                                
     </tbody>
     
                                            </table>
                                           <%--  <input type="hidden" id="count" name="count" value="${count-1}"> --%>
                                        </div>
                                    </div> <!-- end card-body -->
                                </div>
                            </div> <!-- end col --><br>
<div class="content">   
<div class="form-row">
<label>Total Number of Transactions:${total} </label>
</div>
				          <div class="form-row">
<label>SourceAgent to Pay:${lifetimeAgenttopayhq}</label></div>
				          <div class="form-row">
<label>Commission:${commision}</label></div>
				          <div class="form-row">
<label>Total Deduction:${lifetimeAgentcommision}</label></div>
				          <div class="form-row">
<label>Total Dest Amount:${destAmount}</label></div>




 </div></div>                          
</main>

                          

</body>
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
</html>