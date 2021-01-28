<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Under Remit Transactions List</title>
  
 
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script type="text/javascript">
  
  $(document).ready(function(){
	  $('#submitBtn').click(function(){
		  var checkedTransactions="";
		  var anyBoxesChecked = false;
		    $("input[name='transactionId']:checked").each(function() {
		        if ($(this).is(":checked")) {
		            anyBoxesChecked = true;
		            checkedTransactions=checkedTransactions+$(this).val()+"-";
		        }
		    });
		 
		    if (anyBoxesChecked == false) {
		      alert("Please check atleast on Transaction....?");
		      return false;
		    } 
		    
		 
		   $('#transactionData').val(checkedTransactions);
		   $('#submitForm').attr("action","bulktransfer");
		   $('#submitForm').attr("method","POST");
		  $('#submitForm').submit();
	  }	);
		  
  });
  </script>   
   
<script type="text/javascript">
function setPaymentStatus(count,txnid,ckycstatus)
{ 
	
	/* alert("hi from paymentstatus"); */
	var pstatus=$('#paymentstatus'+count).val();
	/* var ckycstatus=('#custkycstatus'+count).val(); */
	if(pstatus=="")
		{
		alert("please select status to change");
		return false;
		}
 /* alert("ckycstatus:"+ckycstatus);  */
	var querystring="pstatus="+pstatus+"&txnid="+txnid+"&ckycstatus="+ckycstatus;
	$.ajax({
	url:'changePaymentStatusInTransaction',
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
	alert("executing");
	
	/* alert("hi from paymentstatus"); */
	var transactionstatus=$('#transactionStatus'+count).val();
	if(transactionstatus=="")
		{
		alert("please select status to change");
		return false;
		}
/* alert("pstatus:"+pstatus); */
	var querystring="transactionstatus="+transactionstatus+"&txnid="+txnid;
	$.ajax({
	url:'changeTransactionStatus',
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
  <script>
  function getTransactionList()
  {
	 /*  alert("hi"); */
	  var fromdate=$('#fromDate').val();
	var todate=  $('#toDate').val();
	  $.ajax({
		  url:'getunderremitfromdateandtodate',
			  type:'POST',
				  
			data:'fromdate='+fromdate+'&todate='+todate,
				success:function(response){
					

					
					 var txnList = JSON.stringify(response, undefined, '\t');
					 var rows='';
					 var selectbox='';
					 var selectbox2='';
					 var counts=1;
					 alert("calling::::");
					 $.each($.parseJSON(txnList),function(idx,obj){
					
						 /* if(obj.fromBranch.branchId == branchId && obj.status==txntype){ */
							  var count='0';
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
									 var kyc='';
									 var kycstatus='';
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
									 
									 
									 if(paymenttype=='bank'){
										 td=obj.beneficiary.bankName+"<br>"+obj.beneficiary.bankAccountNumber+"<br>"+obj.beneficiary.bankBranchCode;
									 }
									 if(paymenttype=='cash'){
									 td=obj.beneficiary.bankName;
									 /* alert("from if condition:"+td); */
									 }
									 if(paymenttype=='eWallet'){
										 td=obj.beneficiary.bankName;
										 }
									 if(paymenttype=='Ezy Local Deposit'){
										/*  td="Ezy Local Deposit"; */
										
										 }
									 if(paymenttype=='Urgent Local Deposit'){
										 /* td="Urgent Local Deposit"; */
										 }
								 /* } */

									  if(obj.paymentStatus=='pending'){
										  
										  /* alert("pending ifstatus:"+obj.paymentStatus); */
											  
												  selectbox2='<select id="paymentstatus'+counts+'" onchange=setPaymentStatus("'+counts+'","'+obj.transactionId+'","'+current_kyc_status+'")><option value="">select</option><option value="paid">fund received</option><option value="cancelled">cancelled</option></select>'; 
												  /* '<select id="select-'+txnId+'" onchange=showUpdateButton("'+txnId+'");removeError("select-'+txnId+'");><option value="">select</option>'; */							  
										  }
								  if(obj.status=='pending'){
									  
									 /*  alert("pending ifstatus:"+obj.status); */
										  
											  selectbox=setStatus(counts,obj.transactionId,obj.status.replace(/\s/g,"&nbsp;"),obj.paymentStatus,current_kyc_status);
											  rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.transactionMode+'</td><td>'+obj.agent+'</td><td>'+obj.paymentStatus+selectbox2+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.totalFee+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+kycstatus+'<br><font color="green">'+obj.status+selectbox+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td></tr>';  
										    selectbox2="";
										  
										 
											
										
										 
							
										  
									  } if(obj.status=='processing'){
										  /* alert("cancelled if:"+obj.status); */
									  selectbox=setStatus(counts,obj.transactionId,obj.status.replace(/\s/g,"&nbsp;"),obj.paymentStatus,current_kyc_status);
										  rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.transactionMode+'</td><td>'+obj.agent+'</td><td>'+obj.paymentStatus+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.totalFee+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+kycstatus+'<br><font color="green">'+obj.status+selectbox+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td></tr>';
									  }
								 
									  if(obj.status=='cancelled'){
										  /* alert("cancelled if:"+obj.status); */
									  
										  rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.transactionMode+'</td><td>'+obj.agent+'</td><td>'+obj.paymentStatus+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.totalFee+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+kycstatus+'<br><font color="green">'+obj.status+selectbox+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td></tr>';
									  }
								 
								  if(obj.status =='paid'){
									 /*  alert("paid if:"+obj.status); */
										  //rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.beneficiary.firstName+' '+obj.beneficiary.lastName+'</td><td><img src="${pageContext.request.contextPath}/resources/images/cancel.png" height="20px"weight="20px"></td><td>'+obj.transactionRate+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.createdDate+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td><strong>'+obj.modeOfPayment.toUpperCase()+'</strong> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td><td><font color="red"><strong>[KYC Pending]</strong></font><br><font color="green">'+obj.status+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td></tr>';  
										  rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.transactionMode+'</td><td>'+obj.agent+'</td><td>'+obj.paymentStatus+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.totalFee+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+kycstatus+'<br><font color="green">'+obj.status+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td></tr>';
								  } 
								   
								  counts++; 
								  					 
//rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.agent+'</td><<td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+td+'</td><td>'+obj.transactionMode+'</td><td>'+obj.paymentStatus+'</td><td><strong>'+obj.modeOfPayment+'</strong> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"><br></td><td>'+obj.adminApprovalDateTime+'</td><td>'+obj.sellRate+'</td><td>' +obj.sendingAmount+obj.sendingCurrency+'</td><td>'+obj.totalFee+'</td><td>'+obj.receipentAmount+obj.receivingCurrency+'</td><td>'+kycstatus+'<br><font color="blueviolet">'+obj.status+selectbox+'<br><span id="span-'+obj.transactionId+'"></span></strong></font></td></tr>';				 
						 });
					 var txnList = JSON.stringify(response, undefined, '\t');
					  $("table").find("tr:gt(0)").remove();
					  
					 /* $('table').remove(); */
					 $("table tbody").append(rows);
					/*  alert("apeend"); */
					
				},
					error:function()
					{
						
						alert("error");
					}
	  
	  
	  });
	  
	  
	  
	  
	  
	  
  }
  
  
  </script>
  <script>
  function setStatus(counts,txnId,status,paymentStatus,current_kyc_status){
		/* alert('txnId = '+txnId+" pType = "+pType+" status = "+status+" paymentStatus = "+createdDate+" sendingReason = "+sendingReason); */
		var txntype=$('#txntype').val();
		var opt='<select id="transactionStatus'+counts+'" onchange=updateStatus("'+counts+'","'+txnId+'");><option value="">select</option>';
		
			if(paymentStatus=='paid' && current_kyc_status=='completed'){
				
					if(status="processing"){
				
				opt=opt+'<option value="paid">Completed</option>';
				opt=opt+'<option value="cancelled">Cancelled</option>';
				opt=opt+'<option value="onhold">On Hold</option>';
					}else if(status="pending")
				
				{
						opt=opt+'<option value="processing">Processing</option>';
						opt=opt+'<option value="paid">Completed</option>';
						opt=opt+'<option value="cancelled">Cancelled</option>';
						opt=opt+'<option value="onhold">On Hold</option>';
				}
					
			}else{
				opt=opt+'<option value="cancelled">Cancelled</option>';
			
			}
			
			
		
		return opt+'</select>';
	}

  
  </script>
   <script>
   function getTrnBasedonStatus()
   {
	var status=$('#filterstatus').val();
	var fromdate=$('#fromDate').val();
	var todate=$('#toDate').val();
   if(status==''){
	   alert("please select one status value");
	   return false;}
	   if(fromdate==''){
		   alert("please enter from date");
		   return false;}
		   if(todate==''){
			   alert("please enter to date");
			   return false;}
			   var querystring="status="+status+"&fromdate="+fromdate+"&todate="+todate;
			   /* var rows=""; */
			   /* alert(querystring); */
			   $.ajax({
				  url:'getRecTrnBasedonStatus',
				  type:'POST',
				  data:querystring,
				  success:function(response)
				  {
					  
					  var txnList = JSON.stringify(response, undefined, '\t');
						 var rows='';
						 var selectbox='';
						 var selectbox2='';
						 var counts=1;
						
					  /*  alert("txnList:"+txnList);  */
					  
					  	  
					  $.each($.parseJSON(txnList),function(idx,obj){
						  var count='0';
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
								 var kyc='';
								 var kycstatus='';
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
								 
								 
								 if(paymenttype=='bank'){
									 td=obj.beneficiary.bankName+"<br>"+obj.beneficiary.bankAccountNumber+"<br>"+obj.beneficiary.bankBranchCode;
								 }
								 if(paymenttype=='cash'){
								 td=obj.beneficiary.bankName;
								 /* alert("from if condition:"+td); */
								 }
								 if(paymenttype=='eWallet'){
									 td=obj.beneficiary.bankName;
									 }
								 if(paymenttype=='Ezy Local Deposit'){
									/*  td="Ezy Local Deposit"; */
									
									 }
								 if(paymenttype=='Urgent Local Deposit'){
									 /* td="Urgent Local Deposit"; */
									 }
							 /* } */

								  if(obj.paymentStatus=='pending'){
									  
									  /* alert("pending ifstatus:"+obj.paymentStatus); */
										  
											  selectbox2='<select id="paymentstatus'+counts+'" onchange=setPaymentStatus("'+counts+'","'+obj.transactionId+'","'+current_kyc_status+'")><option value="">select</option><option value="paid">fund received</option><option value="cancelled">cancelled</option></select>'; 
											  /* '<select id="select-'+txnId+'" onchange=showUpdateButton("'+txnId+'");removeError("select-'+txnId+'");><option value="">select</option>'; */							  
									  }
							  if(obj.status=='pending'){
								  
								 /*  alert("pending ifstatus:"+obj.status); */
									  
										  selectbox=setStatus(counts,obj.transactionId,obj.status.replace(/\s/g,"&nbsp;"),obj.paymentStatus,current_kyc_status);
										  rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.transactionMode+'</td><td>'+obj.agent+'</td><td>'+obj.paymentStatus+selectbox2+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.totalFee+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+kycstatus+'<br><font color="green">'+obj.status+selectbox+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td></tr>';  
									    selectbox2="";
									  
									 
										
									
									 
						
									  
								  } if(obj.status=='processing'){
									  /* alert("cancelled if:"+obj.status); */
								  selectbox=setStatus(counts,obj.transactionId,obj.status.replace(/\s/g,"&nbsp;"),obj.paymentStatus,current_kyc_status);
									  rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.transactionMode+'</td><td>'+obj.agent+'</td><td>'+obj.paymentStatus+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.totalFee+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+kycstatus+'<br><font color="green">'+obj.status+selectbox+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td></tr>';
								  }
							 
								  if(obj.status=='cancelled'){
									  /* alert("cancelled if:"+obj.status); */
								  
									  rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.transactionMode+'</td><td>'+obj.agent+'</td><td>'+obj.paymentStatus+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.totalFee+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+kycstatus+'<br><font color="green">'+obj.status+selectbox+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td></tr>';
								  }
							 
							  if(obj.status =='paid'){
								 /*  alert("paid if:"+obj.status); */
									  //rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.beneficiary.firstName+' '+obj.beneficiary.lastName+'</td><td><img src="${pageContext.request.contextPath}/resources/images/cancel.png" height="20px"weight="20px"></td><td>'+obj.transactionRate+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.createdDate+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td><strong>'+obj.modeOfPayment.toUpperCase()+'</strong> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td><td><font color="red"><strong>[KYC Pending]</strong></font><br><font color="green">'+obj.status+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td></tr>';  
									  rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.transactionMode+'</td><td>'+obj.agent+'</td><td>'+obj.paymentStatus+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.totalFee+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+kycstatus+'<br><font color="green">'+obj.status+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td></tr>';
							  } 
							   
							  counts++; 
							  					 
//rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.agent+'</td><<td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+td+'</td><td>'+obj.transactionMode+'</td><td>'+obj.paymentStatus+'</td><td><strong>'+obj.modeOfPayment+'</strong> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"><br></td><td>'+obj.adminApprovalDateTime+'</td><td>'+obj.sellRate+'</td><td>' +obj.sendingAmount+obj.sendingCurrency+'</td><td>'+obj.totalFee+'</td><td>'+obj.receipentAmount+obj.receivingCurrency+'</td><td>'+kycstatus+'<br><font color="blueviolet">'+obj.status+selectbox+'<br><span id="span-'+obj.transactionId+'"></span></strong></font></td></tr>';				 
					 });
					  /* alert("rows:"+rows);	   */
					  
					var sta=$('#filterstatus').val();  
					 /*  alert(sta); */
					  if(sta=="all"){
						  
					  /* alert("executing"); */
						  $('#fromDate').val('');
						  $('#toDate').val('');
						  $('#dates').remove();
						  $('table').find("tr:gt(0)").remove(); 
						  $('table tbody').append(rows);
					
					  }else{
						  
					  /* alert("else executinh"); */
					  var fromdate=$('#fromDate').val();
					  var todate=$('#toDate').val();
					  var datesrow='<tr id="dates"><th colspan="3">'+fromdate+'</th><th colspan="3">'+todate+'</th><tr>';
						   $("#dates").remove(); 
						  /* $("#headerrow").before(datesrow);*/
						  $("table").find("tr:gt(0)").remove(); 
						   
						   $("table tbody").append(datesrow);
					  $("table tbody").append(rows);
					  /* $('table').remove(); */}
					
				  },
				 
				 
			
				error:function()
				{
					
					alert("error");
				}

					
			  }); 
					
   }
   
   
   </script>
</head>

<body>
<%@include file="backendheader.jsp" %>
 <main id="main-container">
              
                <div class="content">   

<div class="row">
                                            
                                	
                           
                     
                            <div class="col-lg-12">
                               
                                         <%-- <div class="">
                                          <div class="col-md-3" >
                                               
                                                    
                                                       <label for="showEasing"  class="Fromdate" style="">From Date</label>                                            
                                                    <input type="text" class="form-control" id="fromDate" value="${fromdate}"> 
                                                       
                                                    </div>
                                                
                                        </div>  --%>
                                        <%-- <div class="col-md-3 " >
                                              
                                                    <div class="form-group">
                                                      
                                                      
                                                       <label for="showEasing"  class="Todate" style="">To Date</label>
                                                       <input type="text" class="form-control" id="toDate" value="${todate}">
                                                    </div>
                                                
                                        </div> --%> 
                                        <!-- <div class="col-md-3" style="">
                                        	<button type="button" class="btn btn-primary waves-effect waves-light center-block" id="submit" onclick="getTransactionList();" style="margin: 29px 0 0;">Submit</button>
                                        </div>  -->
                                        <div class="col-md-3" >
                                               
                                                    <!-- <div class="form-group">
                                                       
                                                       <label for="showEasing"  class="Fromdate" style="">Filter By Status:</label>                                            
                                                    <select  class="form-control" id="filterstatus" name="filterstatus" onchange="getTrnBasedonStatus()"> 
                                                       <option value="">--select--</option>
                                                       <option value="all">All Transactions</option>
                                                       <option value="newtrns">New Transactions</option>
                                                       <option value="processing">processing Transactions</option>
                                                       <option value="cancelled">cancelled Transactions</option>
                                                       <option value="pending">pending Transactions</option>
                                                       <option value="onhold">on Hold Transactions</option>
                                                       <option value="paid">complete</option>
                                                       
                                                       
                                                       </select>
                                                    </div>
                                           -->      
                                        </div>
                                      </div>
                                        <div class="table-responsive">
                                        <form  id="submitForm" >
                                            <table class="table table-bordered mb-0">
                                                <thead class="table-primary">
                                                
                                    <tr id="dates">
                                    
                                    <%-- <th colspan="5">${fromdate}</th>
                                    <th colspan="5">${todate}</th> --%>
                                    </tr>
                                                  <tr id="headerrow">
                                                  <th scope="col"></th>
                                                    <th scope="col">Transaction Id</th>
                                                    <th scope="col">Transaction Date</th>
                                                   
                                                    <!-- <th scope="col">Receiving Currency</th>
                                                    <th scope="col">sending Currency</th> -->
                                                   <!--  <th scope="col">Tax Fee</th> -->
                                                    
                                                     <!-- <th scope="col">receivingCurrencyRate</th> -->
                                                     <!-- <th scope="col">amountToBeConverted</th> -->
                                                     
                                                    <!--  <th scope="col">sendingCurrencyRate</th> -->
                                                     <th scope="col">customer</th>
                                                     <th scope="col">kyc status</th>
                                                     <!-- <th scope="col">beneficiary</th> -->
                                                     
                                                     <!-- <th scope="col">createdDate</th>
                                                     <th scope="col">updatedDate</th> -->
                                                     <!-- <th scope="col">sendingReason</th> -->
                                                     <!-- <th scope="col">admin</th> -->
                                                     <!-- <th scope="col">sendingCountry</th> -->
                                                     <th scope="col">receivingCountry</th>
                                                    
                                                     
                                                     <th scope="col">paymentType</th>
                                                      <th scope="col">transactionMode</th>
                                                     <!--  <th scope="col">agent</th> -->
                                                      <th scope="col">paymentStatus</th>
                                                     <!--  <th scope="col">modeOfPayment</th>  -->
                                                     
                                                    <!--   <th scope="col">approvedBySendingBranch</th>
                                                       <th scope="col">approvedByReceivingBranch</th> -->
                                                       <!--  <th scope="col">approvedByAdmin</th> -->
                                                        <!-- <th scope="col">adminApprovalDateTime</th> -->
                                                       <!--  <th scope="col">sendingBranchApprovalDateTime</th>
                                                        
                                                        <th scope="col">receivingBranchApprovalDateTime</th> -->
                                                     <!-- <th scope="col">cancelReason</th> -->
                                                     <!-- <th scope="col">sellRate</th> -->
                                                      <th scope="col">Sending Amount</th>
                                                       <th scope="col">totalFee</th>
                                                      <th scope="col">ReceipentAmount</th>
                                                     
                                                    
                                                     <th scope="col">status</th>
                                                  </tr>
                                                </thead>
                                                <tbody id="transactionRecords">
                                                <%-- <c:set var="count" value="${1}"/> --%>
                                                <c:forEach items="${transactionlist}" var="transaction" varStatus="loop">
                                                <input type="hidden" name="transactionData" id="transactionData"> 
      <tr>
      <td><input type="checkbox" id="transactionId" name="transactionId" value="${transaction.transactionId},${transaction.beneficiary.bankId},${transaction.beneficiary.bankAccountNumber},${transaction.receipentAmount}">
      </td>
         <td>${transaction.transactionId}</td>
        <td>${transaction.createdDate }</td>
        <td>${transaction.customer.firstName }${transaction.customer.lastName }</td>
        <td>${transaction.customer.customerKYCStatus }
        <input type="hidden" value="${transaction.customer.customerKYCStatus }" name="custkycstatus${count}" id="custkycstatus${count}">
        </td>
         <td>${transaction.receivingCountry.countryName }</td>
         <td>${transaction.paymentType }</td>
           <td>${transaction.transactionMode}</td>
       <%--   <td>${transaction.receivingCurrency}</td>
         <td>${transaction.sendingCurrency}</td>
         <td>${transaction.taxFee}</td>
      
         <td>${transaction.receivingCurrencyRate }</td>
         <td>${transaction.amountToBeConverted }</td> --%>
         <%-- <td>${transaction.agent }</td> --%>
         <%-- <td>${transaction.sendingCurrencyRate }</td> --%>
         
         
        
         <%-- <td>${transaction.beneficiary.beneficiaryCountry.countryName }</td>
         
         
         <td>${transaction.updatedDate }</td>
         <td>${transaction.sendingReason }</td>
         <td>${transaction.admin.adminId }</td>
         <td>${transaction.sendingCountry.countryName }</td> --%>
        
       
         
       
         <td>${transaction.paymentStatus}
         <c:if test="${transaction.paymentStatus eq 'pending'}">
         <select id="paymentstatus${loop.index}" name="paymentstatus${loop.index}" onchange="setPaymentStatus('${loop.index}','${transaction.transactionId}','${transaction.customer.customerKYCStatus}')">
         <option value="">select</option>
         <option value="paid">fund received</option>
         <option value="cancelled">cancelled</option>
         </select>
         
         </c:if>
         </td>
        <%--  <td>${transaction.modeOfPayment }</td>
        <td>${transaction.adminApprovalDateTime }</td> --%>
        <%--  <td>${transaction.approvedBySendingBranch }</td>
         <td>${transaction.approvedByReceivingBranch }</td> --%>
         
         
         <%-- <td>${transaction.approvedByAdmin }</td>
         
         <td>${transaction.sendingBranchApprovalDateTime }</td>
         <td>${transaction.receivingBranchApprovalDateTime }</td>
         <td>${transaction.cancelReason }</td> --%>
        <%--  <td>${transaction.sellRate }</td> --%>
          <td>${transaction.sendingAmount}${transaction.sendingCurrency}</td>
              <td>${transaction.totalFee }</td>
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
          <%-- <c:choose>
         
           <c:when test="${transaction.paymentStatus eq 'paid' and transaction.customer.customerKYCStatus eq 'completed'}">
          --%>  
           <%-- <c:if test="${transaction.status eq 'pending'}">
           
           
           <select id="transactionStatus${count}" name="transactionStatus${count}" onchange="updateStatus('${count}','${transaction.transactionId}');"> 
          <option value="">select</option>
          <option value="processing">processing</option>
          <option value="paid">Amount Delivered</option>
          <option value="cancelled">cancelled</option>
          <option value="onhold">Onhold</option>
          </select>
          </c:if>
          < --%><c:if test="${transaction.status eq 'processing'}">
           
           
           <select id="transactionStatus${loop.index}" name="transactionStatus${loop.index}" onchange="updateStatus('${loop.index}','${transaction.transactionId}','${transaction.customer.customerKYCStatus}')"> 
          <option value="">select</option>
          
          <option value="paid">Amount Delivered</option>
          <option value="cancelled">cancelled</option>
          <option value="onhold">Onhold</option>
          </select>
          </c:if>
          <c:if test="${transaction.status eq 'pending'}">
           <select id="transactionStatus${loop.index}" name="transactionStatus${loop.index}" onchange="updateStatus('${loop.index}','${transaction.transactionId}')"> 
          <option value="">select</option>
          <option value="cancelled">Cancelled</option>
         
          </select>
         
           
           
          </c:if>
          
          
           
          <%-- </c:choose> --%>
         <%--   <input type="hidden" name="txnid${count}" id="txnid${count}" value="${transaction.transactionId}">
         <input type="hidden" name="txnpstatus${count}" id="txnpstatus${count}" value="${transaction.paymentStatus}">
         <input type="hidden" name="ckycstatus${count}" id="ckycstatus${count}" value="${transaction.customer.customerKYCStatus}">
           <input type="hidden" name="adminstatus${count}" id="adminstatus${count}" value="${transaction.status}"> --%>
          <%-- <div id="transactionStatus${count}">
          
          
          </div> --%>
          </td>
         
         
         
      </tr>
         <%-- <c:set var="count" value="${count+1}"/> --%>
                  </c:forEach>
                       
                                                
     </tbody>
     
                                            </table>
                                            <button type="button" class="btn btn-primary" id="submitBtn" >Bulk Transfer</button>
                                            </form>
                                           <%--  <input type="hidden" id="count" name="count" value="${count-1}"> --%>
                                        </div>
                                    </div> <!-- end card-body -->
                                </div>
                            </div> <!-- end col -->
                           

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