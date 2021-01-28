<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction Confirmation</title>
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
<script type="text/javascript">
$(document).ready(function(){
	$('#subbtn').click(function(){
		$('#form').submit();
	});
$('#updateBtn').click(function(){
	//alert('update');
	$('#form1').submit();
	});
$('#deleteBtn').click(function(){
	//alert('delete');
	$('#form2').submit();
	});
	
});
</script>
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

<script type="text/javascript">
$(function () {
    $("#datepicker").datepicker({
        changeMonth: true,
        changeYear: true,
        format:'yyyy-mm-dd' 
    });
    $("#datepicker1").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
            onSelect: function( selectedDate ) {
    			$( "#datepicker1" ).datepicker( "option", "maxDate", selectedDate );
    		}

    });
    $("#datepicker2").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
    $("#datepicker3").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
    $("#datepicker4").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
});
  </script> 
  <script>
$(document).ready(function(){
	 //alert("executing"); 
		
	$('#dateDiv').show();
	$("#dynamicDiv").hide();
});
</script>
  <script type="text/javascript">
  
  function getTrnBasedonStatus(){
		 var bid = $('#bid').val();
		 var fromDate = $('#fromDate').val();
		 var toDate = $('#toDate').val();
		 //alert('bid====='+bid);
		 alert('fromDate==='+fromDate);
		 alert('todate===='+toDate);
		 var afee='';
		  var data="bid="+bid+"&fromDate="+fromDate+"&toDate="+toDate;
			$.ajax({
				url : "/getAgentDepositsByDates",
				method : "get",
				data : data,
				async : false,
				success : function(response){
				//alert(response); 
				afee=response;
				$('#dateDiv').hide();
				$('#dynamicDiv').show();
				},
				error : function(xhr,error,status){
					alert('get fee error : '+error+status);
				}
				
				
			});

		//alert("afee=="+afee.split(",")[0]);
		//alert("afee1=="+afee.split(",")[1]);
		$('#tToPay').val(Number(afee.split(",")[0]));
		$('#tdep').val(Number(afee.split(",")[1]));
		$('#sf').val(Number(afee.split(",")[2]));
		$('#ta').val(Number(afee.split(",")[3]));
		$('#tx').val(Number(afee.split(",")[4]));

		 
	 }
  </script>
<script type="text/javascript">
		 $('#submitbtn').click(function(){
			 var depositDate = $('#depositDate').val();
			 var depositAmount = $('#depositAmount').val();
			 var notes = $('#notes').val();
		
			if(depositAmount==""){
				$('#depositAmount').focus().css('outline', '2px solid red');
				return false;
			}
			if(depositDate==""){
				$('#depositDate').focus().css('outline', '2px solid red');
				return false;
			}
			if(notes==""){
				$('#notes').focus().css('outline', '2px solid red');
				return false;
			}
			
		}); 
	
	});
	
</script>
</head>
<body>
<%@include file="headerNew.jsp" %>
<div class="container">

  <main id="main-container ">
                       <form id="form" action="confirmtxn" method="post" enctype="multipart/form-data"/>
               <input type="hidden" name="txid" name="txid" value="${tx.transactionId}">
                </form>
                        <form id="form1" action="doTransaction" method="get" enctype="multipart/form-data"/>
               <input type="hidden" name="txid" name="txid" value="${tx.transactionId}">
                </form>
                         <form id="form2" action="deletetxn" method="post" enctype="multipart/form-data"/>
               <input type="hidden" name="txid" name="txid" value="${tx.transactionId}">
                </form>
  
                <div class="content">
                                    	<div class="row">
                    		<div class="col-md-12 ">
                
        <div class="row">
             <div id="one" class="form-group col-md-6">
				
				<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">AGENT DETAILS</h5>
            			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4" style="font-weight:400;">
                					<b>Agent 
                					</b>
                					</label>
              					</div>
              					<div class="col-md-6">
              					:${tx.fromBranch.branchId}
              					</div>
              					</div>
                					
              					
              					
              					</div>
              					</div>
              					
              			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              		<label for="inputEmail4" 
                					style="font-weight:400;"><b>
                					CurrentBalance </b>
                					
                					</label>			
              					</div>
              					<div class="col-md-6">
              					:${countryIso} ${totalAmounttopay} 
              					</div>
              					</div>
                					
              					<p style="color:red;">WARNING: Negative balance. Transactions may be delayed during processing.</p>
              					</div>
              					</div>
                          <div class="form-row" >
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"
                					 style="font-weight:400;">
                					 <b>Credit Available</b>
                					 </label>
              					</div>
              					<div class="col-md-6">
              					:${countryIso} ${totalDeposits}
              					</div>
              					</div>
                					
              					<p>Note Credit Available is 
              					Overdraft plus Current Balance.
              					</p>
              					</div></div>
              					</div>
              					
             <div id="one" class="form-group col-md-6">
            			
				
				<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">TRANSACTION DETAILS</h5>
				
            			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4" 
                					style="font-weight:400;"><b>
                					Source/Destination Country	 
                					</b></label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.fromBranch.fromCountry.countryISO}
                					/${tx.toBranch.fromCountry.countryISO }
              					</div>
              					</div>
                					
              					</div>
              					</div>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label style="font-weight:400;">
              					<b>Transfer Type	
              					</b></label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.paymentType}
              					</div>
              					</div>
              					
              					</div></div>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label style="font-weight:400;">
              					<b>Transfer Purpose		</b
              					></label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.sendingReason}
              					</div>
              					</div>
              					
              					</div></div>
              					
              			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label style="font-weight:400;">
              					<b>Source of Income	</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.sourceOfFund}
              					</div>
              					</div>
              					
              					</div></div>
               			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label style="font-weight:400;">
              					<b>Sale Type	</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					: Counter
              					</div>
              					</div>
              					
              					</div></div>
               			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label style="font-weight:400;">
              					<b>Service Level	</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					: Instant
              					</div>
              					</div>
              					
              					</div></div>
              					</div>
              					</div>
				<div class="row">
				
             <div id="one" class="form-group col-md-6">
				<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">REMITTER DETAILS</h5>
				
            			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					<div class="col-md-6">
                					<label style="font-weight:400;" for="inputEmail4">Member
                					</label></div>
                					<div class="col-md-6">:
         <a href="Remitterprofile?custRegId=${tx.customer.customerId }" >${tx.customer.customerId  }</a>
                					
                					
              					</div></div></div>
              					</div><br>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					<div class="col-md-6">
              					<label ><b> Name	</b></label></div>
              					<div class="col-md-6">
              					:${tx.customer.firstName}</div>
              					</div></div></div>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					<div class="col-md-6">
              					<label style="font-weight:400;">
              					<b>Remitter Address			</b>
              					</label></div>
              					<div class="col-md-6">
              					:${tx.customer.address1}
              					</div></div></div></div>
              					
              			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					<div class="col-md-6">
              					<label style="font-weight:400;">
              					<b>Remitter Telephone	</b></label></div>
              					<div class="col-md-6">
              					${tx.customer.mobileNumber}</div>
              					</div>
              					</div></div>
              					</div>
				
             <div id="one" class="form-group col-md-6">
				<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">BENEFICIARY DETAILS</h5>
				
            			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					<div class="col-md-6">
                					<label for="inputEmail4" 
                					style="font-weight:400;">
                					<b>Beneficiary No</b></div>
                					<div class="col-md-6">
           :<a href="benpro?beneficiaryId=${tx.beneficiary.beneficiaryId }&txId=${tx.transactionId}" >
                					
                					${tx.beneficiary.beneficiaryId }</a></label>
              					
              					</div></div>
              					</div></div>
              					
              					<br>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					<div class="col-md-6">
              					<label ><b>Benef. Name		</b></label>
              					</div>
              					<div class="col-md-6">
              					:${tx.beneficiary.firstName}
              					</div>
              					</div>
              					
              					</div></div>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>Benef. Telephone	</b></label>
              					</div>
              					<div class="col-md-6">
              					:${tx.beneficiary.mobileNumber}
              					</div>
              					</div>
              					
              					</div>
              					</div>
              					
              			<div class="form-row">
              					<div class="form-group col-md-12">
              					
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>Beneficiary Address	</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					:${tx.beneficiary.addressLine1}
              					</div>
              					</div>
              						
              					</div></div></div>
              					</div>
              					<div class="row">
              					
              					
              					
              					
              						<div id="two" class="col-md-6 ">
                                    
				<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">AMOUNT DETAILS</h5>
				<p>Please ensure funds details are entered correctly. If any mistake is made you will need to delete the Transaction and re-enter it.
				</p>
            			<div class="form-row">
            			
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<b>Payment Method	 </b>
              					</div>
              					<div class="col-md-6">
              					:${tx.modeOfPayment}
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<b>Service Level	:</b>
              					</div>
              					<div class="col-md-6">
              					Instant 
              					</div>
              					</div>
                					</label>
              					</div>
              					</div><br>
               			<div class="form-row">
              					<div class="form-group col-md-12">
              					
              					<div class="row">
              					
              					<div class="col-md-6">
              					<b>
                					Source Amount	:</b>
              					</div>
              					<div class="col-md-6">
              					${tx.sendingAmount} 
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
                			<div class="form-row">
              					<div class="form-group col-md-12">
              					
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4">
                					<b>Rate	:</b></label>
              					</div>
              					<div class="col-md-6">
              					${tx.transactionRate} 
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
                			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4">
                					<b>Destination Amount		
                					:
                					</label>
              					</div>
              					<div class="col-md-6">
              					</b>${tx.receipentAmount} 
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
                   			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"><b>
                					Commission		:</b></label>
              					</div>
              					<div class="col-md-6">
              					${tx.taxFee} 
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
                   			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4">
                					<b> SourceAgent Fee			:</b>
                					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.agentFee} 
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
                    			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"> 
                					<b>Head Office Fee	:
                					</b></label>
              					</div>
              					<div class="col-md-6">
              					${tx.adminFee} 
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
                    			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"> 
                					<b>Terminate Agent Fee			
                					:</b></label>
              					</div>
              					<div class="col-md-6">
              					${tx.recagentFee} 
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              					
                    			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"> 
              		<b>SourceAgent to Pay	:</b></label>
               					</div>
              					<div class="col-md-6">
              		
              		${tx.totalAmountCollected-tx.agentFee}
               					</div>
              					</div>
                					
              					</div>
              					</div><br>
              					
              			
              			
              			
              			</div>
              					
              					
              					<div id="one" class="form-group col-md-6">
				<c:if test="${tx.paymentType eq 'Cash Collection' }">
				<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">CASH COLLECTION DETAILS</h5>
				
            			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"><b>
                					Collection Point</b>
                					</label>
              					</div>
              					<div class="col-md-6">
              					:${tx.beneficiary.collectionPointName},${tx.beneficiary.collectionPointCode},
                					${tx.beneficiary.collectionPointBank},
                					${tx.beneficiary.collectionPointAddress},
                					${tx.beneficiary.collectionPointCity},
                					${tx.beneficiary.collectionPointCity},
                					${tx.beneficiary.collectionPointTelephone}
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>Beneficiary's ID Type	:</b></label>
              					</div>
              					<div class="col-md-6">
              					<c:if test="${tx.beneficiary.idProof eq '1'}">
                                                                Work Permit
                                                         </c:if>
                                                         <c:if test="${tx.beneficiary.idProof eq '2'}">
                                                               International Passport
                                                         </c:if>
                                                         <c:if test="${tx.beneficiary.idProof eq '3'}">
                                                                Identification ID
                                                         </c:if>
                                                         <c:if test="${tx.beneficiary.idProof eq '4' }">
                                                               Residence Permit
                                                         </c:if>
                                                          <c:if test="${tx.beneficiary.idProof eq '5' }">
                                                            Passport
                                                         </c:if>
                                                          <c:if test="${tx.beneficiary.idProof eq '6' }">
                                                              Social Security
                                                         </c:if>
                                                          <c:if test="${tx.beneficiary.idProof eq '8' }">
                                                               Driver Licence
                                                         </c:if>
              					</div>
              					</div>
              					
                                                          
                                  
              					</div></div>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>Beneficiary's ID Number	
              					</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					:${tx.beneficiary.idProofNo}
              					</div>
              					</div>
              					
              					</div>
              					</div><br><br><br><br><br><br><br>
               					<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;margin-left:5px;" >AGENT ACCOUNTING</h5>
              			           <div class="form-row">
              					<div class="form-group col-md-12">
              					
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4">
                					 <b>Agent Deduction		:</b>
                					 </label>
              					</div>
              					<div class="col-md-6">
              					${tx.agentFee} :
              					</div>
              					</div>
              					
                					
              					</div>
              					</div><br>
              			                    			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"> 
                					<b>Agent to Pay ${tx.admin.companyName}	:</b> 
                					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.totalAmountCollected-tx.agentFee}
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              					
              					</c:if>
              					
              					
              					
 				<c:if test="${tx.paymentType eq 'Mobile Money' }">
				<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">MOBILE MONEY TRANSFER DETAILS</h5>
				
            			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4">
                					<b>MobileTrnsferNumber:</b>
                					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.beneficiary.mobileTrnsferNumber}
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>TransferNetWork</b>
              					
              					</label>
              					</div>
              					<div class="col-md-6">
              					:${tx.beneficiary.transferNetWork}
              					</div>
              					</div>
              					
              					</div></div>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>TransferNetWorkCreditType
              					</b>
              					
              					</label>
              					</div>
              					<div class="col-md-6">
              					:${tx.beneficiary.transferNetWorkCreditType}
              					</div>
              					</div>
              					
              					</div></div>
              					<br><br><br><br>
                  					<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;margin-left:5px;">AGENT ACCOUNTING</h5>
              			           <div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"> 
                					<b>Agent Deduction		:</b>
                					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.agentFee} :
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              			                    			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"> 
                					<b>Agent to Pay 
                					${tx.admin.companyName}	:
                					</b>
                					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.totalAmountCollected-tx.agentFee} :
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              					
              					</c:if>
              					
              					
 				<c:if test="${tx.paymentType eq 'Bill Payment' }">
				<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">UTIL BILLPAYMENT TRANSFER DETAILS</h5>
				
            			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<b>utilityCompany</b>
                					
              					</div>
              					<div class="col-md-6">
              					:${tx.beneficiary.utilityCompany}
              					</div>
              					</div>
                					<label for="inputEmail4">
                					
                					</label>
              					</div>
              					</div><br>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>CustomerAccountNumber
              					</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.beneficiary.customerAccountNumber}
              					</div>
              					</div>
              					
              					</div></div>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					
              					<label><b>InvoiceNumber:
              					</b></label>
              					</div>
              					<div class="col-md-6">
              					${tx.beneficiary.invoiceNumber}
              					</div>
              					</div>
              					</div></div>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					
              					<label><b>BankToPay</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.beneficiary.bankToPay}
              					</div>
              					</div>
              					</div></div>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>BankBicCode:</b>
              					
              					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.beneficiary.bankBicCode}
              					</div>
              					</div>
              					
              					</div></div>
              			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>Adress:</b>
              					
              					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.beneficiary.addressLine1}
              					</div>
              					</div>
              					
              					</div></div><br><br><br><br><br><br><br><br><br><br>
                  					<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;margin-left:5px;">AGENT ACCOUNTING</h5>
              			           <div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4">
                					 <b>Agent Deduction		:</b>
                					 </label>
              					</div>
              					<div class="col-md-6">
              					${tx.agentFee} 
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              			                    			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"> 
                					<b>Agent to Pay ${tx.admin.companyName}	:</b>
                					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.totalAmountCollected-tx.agentFee} 
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              					
              					
              					</c:if>
              					
         				<c:if test="${tx.paymentType eq 'Home Delivery' }">
				<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">HOME DELIVERY TRANSFER DETAILS</h5>
				
            			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4">
                					<b>BeneficiaryAddress:</b>
                					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.beneficiary.beneficiaryAddress1},${tx.beneficiary.beneficiaryAddress2},
                					${tx.beneficiary.beneficiaryAddress3}
              					
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					
              					<label><b>BeneficiaryCity:</b></label>
              					</div>
              					<div class="col-md-6">
              					
              					${tx.beneficiary.beneficiaryCity}
              					</div>
              					</div>
              					</div></div>
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>BeneficiaryPostCode:</b></label>
              					</div>
              					<div class="col-md-6">
              					${tx.beneficiary.beneficiaryPostCode}
              					</div>
              					</div>
              					
              					</b>
              					</label>
              					</div></div><br><br><br><br>
              					
              					<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">AGENT ACCOUNTING</h5>
              			           <div class="form-row">
              					<div class="form-group col-md-12">
                					<label for="inputEmail4"> <b>Agent Deduction		:</b>${tx.agentFee} :</label>
              					</div>
              					</div><br>
              			                    			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"> 
                					<b>Agent to Pay ${tx.admin.companyName}	
                					</b> 
                					</label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.totalAmountCollected-tx.agentFee}
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              					</c:if>
              					
           				<c:if test="${tx.paymentType eq 'Card Transfer' }">
				<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">CARD TRANSFER DETAILS</h5>
				
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>CardNumber</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.beneficiary.cardNumber}
              					</div>
              					</div>
              					
              					</div></div><br><br><br><br>
                   					<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;margin-left:5px;">AGENT ACCOUNTING</h5>
              			           <div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4">
                					 <b>Agent Deduction		:</b>
                					 </label>
              					</div>
              					<div class="col-md-6">
              					${tx.agentFee} 
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              			                    			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4">
					 <b>Agent to Pay ${tx.admin.companyName}:
					 </b>
					 </label>
              					</div>
              					<div class="col-md-6">
              					${tx.totalAmountCollected-tx.agentFee} 
              					</div>
              					</div>
					
              					</div>
              					</div><br>
              					
              					</c:if>
              					
            				<c:if test="${tx.paymentType eq 'Mobile Airtime top up' }">
				<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">MOBILE AIRTIME TOPUP TRANSFER DETAILS</h5>
				
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					</div></div><br><br><br><br>
                   					<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">AGENT ACCOUNTING</h5>
              			           <div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"> 
                					<b>Agent Deduction		:</b>
                					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.agentFee} 
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              			        <div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4">
                					 <b>Agent to Pay ${tx.admin.companyName} 	
                					 </b>
                					  </label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.totalAmountCollected-tx.agentFee}
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              					
              					</c:if>
              					
             				<c:if test="${tx.paymentType eq 'Bank Deposit' }">
				<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">BANK DEPOSIT TRANSFER DETAILS</h5>
								
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					
              					<label><b>beneficiaryAccountTransfer:</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.beneficiary.beneficiaryAccountTransfer}
              					</div>
              					</div>
              					</div></div>
              			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					
              					<label><b>BankDetails:</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.beneficiary.bankDetails}
              					</div>
              					</div>
              					</div></div>
              			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>Bank:</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.beneficiary.bank}
              					</div>
              					</div>
              					
              					</div></div>
              			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>BranchCity/State</b>
              					
              					</label>
              					</div>
              					<div class="col-md-6">
              					:${tx.beneficiary.branchCity},
              					${tx.beneficiary.branchState}
              					</div>
              					</div>
              					
              					</div></div>
              			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					
              					<label><b>SwiftCode</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.beneficiary.swiftCode}
              					</div>
              					</div>
              					</div></div>
               			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					
              					<label><b>Telephone</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					:${tx.beneficiary.telephone}
              					</div>
              					</div>
              					</div></div>
				<br><br><br><br><br><br><br><br><br><br><br><br>
                					<h5 style="padding:5px;font-size: 13px;background:#2e287b;color:white;">AGENT ACCOUNTING</h5>
              			           <div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"> 
                					<b>Agent Deduction:</b>
                					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.agentFee} 
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              			                    			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4">
                					 <b>Agent to Pay ${tx.admin.companyName}	
                					 </b>
                					 </label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.totalAmountCollected-tx.agentFee} 
                					
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              					
              					</c:if>
             				<c:if test="${tx.paymentType eq 'e-Wallet' }">
				<h5 style="font-size: 16px;">E-WALLET TRANSFER DETAILS</h5>
				
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					</div></div><br><br><br><br>
               					<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">AGENT ACCOUNTING</h5>
              			           <div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4">
                					 <b>Agent Deduction		:</b>
                					 </label>
              					</div>
              					<div class="col-md-6">
              					:  ${tx.agentFee}
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              			                    			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"> 
                					<b>Agent to Pay 
                					 ${tx.admin.companyName}	
                					 </b>
                					 </label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.totalAmountCollected-tx.agentFee} 
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              					
              					</c:if>
              				<c:if test="${tx.paymentType eq 'Bureau de Change' }">
				<h5 style="font-size: 16px;">Bureau de Change TRANSFER DETAILS</h5>
				
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					</div></div><br><br><br>,br>
                    					<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">AGENT ACCOUNTING</h5>
              			           <div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"> 
                					<b>Agent Deduction		
                					</b></label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.agentFee} :
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              			                    			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					
                					<label for="inputEmail4"> 
                					<b>Agent to Pay ${tx.admin.companyName}	</b>
                					</label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.totalAmountCollected-tx.agentFee} 
              					</div>
              					</div>
              					</div>
              					</div><br>
              					
              					</c:if>
              					
              				<c:if test="${tx.paymentType eq 'Account Transfer' }">
				<h5 style="font-size: 16px;">ACCOUNT TRANSFER DETAILS</h5>
				
             			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					
              					<label><b>beneficiaryAccountTransfer:</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.beneficiaryAccountTransfer}
              					</div>
              					</div>
              					</div></div>
              			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>BankDetails:</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.bankDetails}
              					</div>
              					</div>
              					
              					</div></div>
              			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>Bank</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					:${tx.bank}
              					</div>
              					</div>
              					
              					</div></div>
              			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>BranchCity/State:</b>
              					
              					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.BranchCity},${tx.branchState}
              					</div>
              					</div>
              					
              					</div></div>
              			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>SwiftCode</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.swiftCode}
              					</div>
              					</div>
              					
              					</div></div>
               			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label><b>Telephone:</b>
              					</label>
              					</div>
              					<div class="col-md-6">
              					${tx.telephone}
              					</div>
              					</div>
              					
              					</div></div>
                    					<h5 style="font-size: 13px;background:#2e287b;padding:5px;color:white;">AGENT ACCOUNTING</h5>
              			           <div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4">
                					 <b>Agent Deduction		
                					 </b></label>
              					</div>
              					<div class="col-md-6">
              					: ${tx.agentFee} 
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              			                    			<div class="form-row">
              					<div class="form-group col-md-12">
              					<div class="row">
              					
              					<div class="col-md-6">
              					<label for="inputEmail4"> 
                					<b>Agent to Pay
                					 ${tx.admin.companyName}	
                					 :</b>
                					
                					 </label>
              					</div>
              					<div class="col-md-6">
              					 ${tx.totalAmountCollected-tx.agentFee} 
              					</div>
              					</div>
                					
              					</div>
              					</div><br>
              					
              					</c:if>
					
              					</div>
              					
              					
              					
                    	
              		</div>
				<div class="row">
				
				
	              	             <div class="form-group col-md-4">
            			<button type="Submit" id="updateBtn" class="btn btn-primary waves-effect waves-light" style="margin: 19px 0 26px 159px;">AMEND Transaction</button>
            			</div>
	              	             <div class="form-group col-md-4">
            			<button type="Submit" id="deleteBtn" class="btn btn-danger waves-effect waves-light" style="margin: 19px 0 26px 159px;">DELETE Transaction</button>
            			</div>
				
				
              	             <div class="form-group col-md-4">
            			<button type="Submit" id="subbtn" class="btn btn-primary waves-effect waves-light" style="margin: 19px 0 26px 159px;">Confirm And Submit Transaction</button>
            			</div>
            			</div>
            			
            			</div></div></div></main>





         			
            			
                    
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