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
  <title>All Transactions List</title>
  
 
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   
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
/* alert("pstatus:"+pstatus); */
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
function updateStatus(count,txnid,ckycstatus)
{
	/* alert("executing"); */
	
	/* alert("hi from paymentstatus"); */
	var transactionstatus=$('#transactionStatus'+count).val();
	if(transactionstatus=="")
		{
		alert("please select status to change");
		return false;
		}
 /* alert("pstatus:"+pstatus); */ 
 /* alert("transactionstatus="+transactionstatus);
 alert("txnid="+txnid); */
	var querystring="transactionstatus="+transactionstatus+"&txnid="+txnid+"&ckycstatus="+ckycstatus;
	$.ajax({
	url:'/common/changeReceivingTransactionStatus',
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
		  url:'/common/getRecBranchTxnListBasedOnFromToDate',
			  type:'POST',
				  
			data:'fromdate='+fromdate+'&todate='+todate,
				success:function(response){
					

					
					 var txnList = JSON.stringify(response, undefined, '\t');
					 var rows='';
					 var selectbox='';
					 var selectbox2='';
					 var counts=1;
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
											  
												  selectbox2='<select id="paymentstatus'+counts+'" onchange=setPaymentStatus("'+counts+'","'+obj.transactionId+'","'+current_kyc_status+'")><option value="">select</option><option value="funds received">fund received</option><option value="cancelled">cancelled</option></select>'; 
												  /* '<select id="select-'+txnId+'" onchange=showUpdateButton("'+txnId+'");removeError("select-'+txnId+'");><option value="">select</option>'; */							  
										  }
								  if(obj.status=='pending'){
									  
									 /*  alert("pending ifstatus:"+obj.status); */
										  
											  selectbox=setStatus(counts,obj.transactionId,obj.status.replace(/\s/g,"&nbsp;"),obj.paymentStatus,current_kyc_status);
											  rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+obj.status+selectbox+'</td></tr>';  
										    selectbox2="";
										  
										 
											
										
										 
							
										  
									  } if(obj.status=='processing'){
										  /* alert("cancelled if:"+obj.status); */
									  selectbox=setStatus(counts,obj.transactionId,obj.status.replace(/\s/g,"&nbsp;"),obj.paymentStatus,current_kyc_status);
										  rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td>'+obj.beneficiary.firstName+' '+obj.beneficiary.lastName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+obj.status+selectbox+'</td></tr>';
									  }
								 
									  if(obj.status=='cancelled'){
										  /* alert("cancelled if:"+obj.status); */
									  
										  rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td>'+obj.beneficiary.firstName+' '+obj.beneficiary.lastName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+obj.status+selectbox+'</td></tr>';
									  }
								 
								  if(obj.status =='funds received'){
									 /*  alert("paid if:"+obj.status); */
										  //rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.beneficiary.firstName+' '+obj.beneficiary.lastName+'</td><td><img src="${pageContext.request.contextPath}/resources/images/cancel.png" height="20px"weight="20px"></td><td>'+obj.transactionRate+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.createdDate+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td><strong>'+obj.modeOfPayment.toUpperCase()+'</strong> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td><td><font color="red"><strong>[KYC Pending]</strong></font><br><font color="green">'+obj.status+'</strong></font> <img src="${pageContext.request.contextPath}/resources/images/ok.png" height="20px"weight="20px"></td></tr>';  
										  rows=rows+'<tr><td><a href="transactionPreview?txnId='+obj.transactionId+'">'+obj.transactionId+'</a></td><td>'+obj.createdDate+'</td><td>'+obj.beneficiary.firstName+' '+obj.beneficiary.lastName+'</td><td>'+obj.paymentType+''+td+'</td><td>'+obj.sendingAmount+' ' +obj.sendingCurrency+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+obj.status+'</td></tr>';
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
						
						alert("error");
					}
	  
	  
	  });
	  
	  
	  
	  
	  
	  
  }
  
  
  </script>
  <script>
  function setStatus(counts,txnId,status,paymentStatus,current_kyc_status){
		/* alert('txnId = '+txnId+" pType = "+pType+" status = "+status+" paymentStatus = "+createdDate+" sendingReason = "+sendingReason); */
		var txntype=$('#txntype').val();
		var opt='<select id="transactionStatus'+counts+'" onchange=updateStatus("'+counts+'","'+txnId+'","'+current_kyc_status+'");><option value="">select</option>';
		
			if(paymentStatus=='funds received' && current_kyc_status=='completed'){
				
					if(status="processing"){
				
				opt=opt+'<option value="funds received">Fund Delivered</option>';
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
                                          <div class="col-md-3" >
                                               
                                                    <div class="form-group">
                                                       <!--  <label for="showEasing" style="position: relative;left: -5px;top: 37px;">From Date</label>
                                                       <input type="text" class="form-control " id="datepicker" style="position: relative;left: 99px;"> -->
                                                       <label for="showEasing"  class="Fromdate" style="">From Date</label>                                            
                                                    <input type="text" class="form-control" id="fromDate" value="${fromdate}"> 
                                                       
                                                    </div>
                                                
                                        </div> 
                                        <div class="col-md-3 " >
                                              
                                                    <div class="form-group">
                                                      
                                                       <!--  <label for="showEasing" style="position: relative; left: 130px;top: 37px;">To Date</label>
                                                       <input type="text" class="form-control " id="datepicker1" style="position: relative;left: 217px;"> -->
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
                                                  <tr  style="background: #2e287b;color:white;padding:5px;text-align:center">
                                                    <th scope="col">Transaction Id</th>
                                                    <th scope="col">Transaction Date</th>
                                                   
                                                    <!-- <th scope="col">Receiving Currency</th>
                                                    <th scope="col">sending Currency</th> -->
                                                   <!--  <th scope="col">Tax Fee</th> -->
                                                    
                                                     <!-- <th scope="col">receivingCurrencyRate</th> -->
                                                     <!-- <th scope="col">amountToBeConverted</th> -->
                                                     
                                                    <!--  <th scope="col">sendingCurrencyRate</th> -->
                                                     <th scope="col">receiving customer name</th>
                                                     <!-- <th scope="col">kyc status</th> -->
                                                     <!-- <th scope="col">beneficiary</th> -->
                                                     
                                                     <!-- <th scope="col">createdDate</th>
                                                     <th scope="col">updatedDate</th> -->
                                                     <!-- <th scope="col">sendingReason</th> -->
                                                     <!-- <th scope="col">admin</th> -->
                                                     <!-- <th scope="col">sendingCountry</th> -->
                                                     <!-- <th scope="col">sendingCountry</th> -->
                                                    <!--  <th scope="col">receivingCountry</th> -->
                                                    
                                                     
                                                     <th scope="col">paymentType</th>
                                                     <!--  <th scope="col">transactionMode</th>
                                                      <th scope="col">agent</th>
                                                      <th scope="col">paymentStatus</th> -->
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
                                                       <!-- <th scope="col">totalFee</th> -->
                                                      <th scope="col">ReceipentAmount</th>
                                                     
                                                    
                                                     <th scope="col">status</th>
                                                  </tr>
                                                </thead>
                                                <tbody id="transactionRecords">
                                                <c:set var="count" value="${1}"/><c:forEach items="${list}" var="transaction">
      <tr>
         <td>${transaction.transactionId}</td>
        <td>${transaction.createdDate }</td>
        <td>${transaction.beneficiary.firstName}${transaction.beneficiary.lastName}</td>
        <td>${transaction.paymentType }</td>
        <%-- <td>${transaction.customer.firstName }${transaction.customer.lastName }</td> --%>
       <%--  <td>${transaction.customer.customerKYCStatus } --%>
        <%-- <input type="hidden" value="${transaction.customer.customerKYCStatus }" name="custkycstatus${count}" id="custkycstatus${count}"> --%>
       <!--  </td> -->
<%--          <td>${transaction.sendingCountry.countryName }</td>
         <td>${transaction.paymentType }</td>
           <td>${transaction.transactionMode}</td> --%>
       <%--   <td>${transaction.receivingCurrency}</td>
         <td>${transaction.sendingCurrency}</td>
         <td>${transaction.taxFee}</td>
      
         <td>${transaction.receivingCurrencyRate }</td>
         <td>${transaction.amountToBeConverted }</td> --%>
        <%--  <td>${transaction.agent }</td> --%>
         <%-- <td>${transaction.sendingCurrencyRate }</td> --%>
         
         
        
         <%-- <td>${transaction.beneficiary.beneficiaryCountry.countryName }</td>
         
         
         <td>${transaction.updatedDate }</td>
         <td>${transaction.sendingReason }</td>
         <td>${transaction.admin.adminId }</td>
         <td>${transaction.sendingCountry.countryName }</td> --%>
        
       
         
       
         <%-- <td>${transaction.paymentStatus} --%>
         <%-- <c:if test="${transaction.paymentStatus eq 'pending'}">
         <select id="paymentstatus${count}" name="paymentstatus${count}" onchange="setPaymentStatus('${count}','${transaction.transactionId}','${transaction.customer.customerKYCStatus }')">
         <option value="">select</option>
         <option value="paid">fund received</option>
         <option value="cancelled">cancelled</option>
         </select>
         
         </c:if> --%>
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
             <%--  <td>${transaction.totalFee }</td> --%>
             <td>${transaction.receipentAmount }${transaction.receivingCurrency}</td>
             <td >
             <%-- <c:choose>
             <c:when test="${transaction.customer.customerKYCStatus eq 'completed'}">
              <font color="green"><strong>[KYC Completed]</strong></font>
             </c:when>
              <c:when test="${transaction.customer.customerKYCStatus eq 'pending'}">
              <font color="red"><strong>[KYC Pending]</strong></font>
             </c:when>
             
             
             </c:choose>
            --%>
            ${transaction.status }
          <%-- <c:choose>
         
           <c:when test="${transaction.paymentStatus eq 'paid' and transaction.customer.customerKYCStatus eq 'completed'}">
           
           <c:if test="${transaction.status eq 'pending'}">
           
           
           <select id="transactionStatus${count}" name="transactionStatus${count}" onchange="updateStatus('${count}','${transaction.transactionId}');"> 
          <option value="">select</option>
          <!-- <option value="processing">processing</option> -->
          <option value="paid">Amount Delivered</option>
          <option value="cancelled">cancelled</option>
          <option value="onhold">Onhold</option>
          </select>
          </c:if>--%>
          <c:if test="${transaction.status eq 'processing'}">
           
           
           <select id="transactionStatus${count}" name="transactionStatus${count}" onchange="updateStatus('${count}','${transaction.transactionId}','${transaction.customer.customerKYCStatus}')"> 
          <option value="">select</option>
          
          <option value="funds received">AmountDelivered</option>
          <option value="cancelled">cancelled</option>
          <option value="onhold">Onhold</option>
          </select>
          </c:if>
          <%-- </c:when>
          <c:otherwise>
           <select id="transactionStatus${count}" name="transactionStatus${count}" onchange="updateStatus('${count}','${transaction.transactionId}')"> 
          <option value="">select</option>
          <option value="cancelled">Cancelled</option>
         
          </select>
          
          
          </c:otherwise>
          
          </c:choose>
           <input type="hidden" name="txnid${count}" id="txnid${count}" value="${transaction.transactionId}">
         <input type="hidden" name="txnpstatus${count}" id="txnpstatus${count}" value="${transaction.paymentStatus}">
         <input type="hidden" name="ckycstatus${count}" id="ckycstatus${count}" value="${transaction.customer.customerKYCStatus}">
           <input type="hidden" name="adminstatus${count}" id="adminstatus${count}" value="${transaction.status}"> --%>
          <%-- <div id="transactionStatus${count}">
          
          
          </div> --%>
          </td>
         
         
         
      </tr>
         <c:set var="count" value="${count+1}"/>
                  </c:forEach>
                       
                                                
     </tbody>
     
                                            </table>
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