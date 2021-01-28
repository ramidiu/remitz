<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agent Deposit Entries</title>
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
		$.getJSON("https://api.ipify.org/?format=json", function(e) {
		    console.log(e.ip);
		   // alert("ioplhgfszd"+e.ip);
		    $('#myIp').val(e.ip);
		});
		
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
  <main id="main-container">
              
                <div class="content">
                    	<div class="row">
                    		<div class="col-md-12 ">
                                    
                                    <form action="insertDeposits" method="POST"  enctype="multipart/form-data">
        <input type="hidden" name="bid" id="bid" value="${bid}">                            	
				<input type="hidden" name="myIp" id="myIp">
				<section class="block p-20">
				<h5 style="padding:5px;font-size: 13px;background:#2e287b;color:white;text-align:center">Agent Deposit Entries</h5>
				</section>
								<div class="form-row">
				
              					<div class="form-group col-md-6">
				
				<h5 style="padding:5px;font-size: 13px;background:#2e287b;color:white;">Make A New Entry</h5>
				
            			<div class="form-row">
              					<div class="form-group form-inline col-md-12">
                					<label for="inputEmail4">Deposit Date:</label>
               <input type="text" class="form-control" name="depositDate" id="datepicker" value="${currentDate}" placeholder="Enter Deposit Date *" >
              					</div>
              					</div><br>
              			<div class="form-row">
              					<div class="form-group form-inline col-md-12">
                					<label for="inputEmail4">Amount(${countryIso}) :</label>
               <input type="text" class="form-control" name="depositAmount" id="depositAmount" placeholder="Enter Deposit Amount *" >
              					</div>
              					</div><br>
                          <div class="form-row" >
              					<div class="form-group form-inline col-md-12">

                					<label for="inputEmail4">Document Scan:</label>
                						<input type="file" name="document1" id="document" class="form-control " placeholder="ID Proof Image" title="ID PROOF IMAGE" onclick="removeError('firstIdProofDoc');"> 
              					</div></div>
              					
               			<div class="form-row">
              					
              	             <div class="form-group form-inline col-md-6">
                					<label for="inputEmail4">Notes:</label>
                						<textarea class="form-control pull-right" name="notes" id="notes" placeholder="Enter notes *" onkeyup="removeError('address');"></textarea>
              					</div>
              					</div>
              					
				<div class="form-row">
              	             <div class="form-group col-md-12">
            			<button type="Submit" id="submitbtn" class="btn btn-primary waves-effect waves-light" style=" ">SUBMIT</button>
            			</div>
            			</div>
            			
            			</div>
              					<div class="form-group col-md-6">
            			
            	<section class="block " style="margin-top:-10px;">
				<h3 style="padding:5px;font-size: 13px;background:#2e287b;color:white;">Display By Date Range</h3>
				</section>
				            			<div class="form-row">
              					<div class="form-group  col-md-4">
                      <label for="showEasing"  class="Fromdate" style="">From Date</label>                                            
            <input type="text" class="form-control" id="fromDate" value="${currentDate}"> 
              					</div>
               					<div class="form-group  col-md-4">
                         <label for="showEasing"  class="Todate" style="">To Date</label>
              <input type="text" class="form-control" id="toDate" value="${currentDate}">
              					</div>
               	             <div class="form-group col-md-4">
  <button type="button" class="btn btn-primary waves-effect waves-light center-block" id="submit" onclick="getTrnBasedonStatus();" style="margin: 29px 0 0;">Submit</button>
            			</div>
              					
              					</div>
              					<div id="dynamicDiv">
 			<div class="form-row">
				
                <table class="table table-bordered mb-0">
            		<tr>
            		<th>Total To Pay HQ</th>
            		<th>Total Deposits</th>
            		</tr>
            		<tr>
            		<td>
  <input type="text" name="tToPay" id="tToPay" class="form-control" value="0" readonly="readonly">
            		</td>
            		<td>
  <input type="text" name="tdep" id="tdep" class="form-control" value="0" readonly="readonly">
            		</td>
            		</tr>
            		</table>	
            		</div>
         <div class="form-row">
            		<label>Shortfall:
  <input type="text" name="sf" id="sf" class="form-control" value="0" readonly="readonly">
            		 </label></div>	
          <div class="form-row">
         <label>
         Total Agent Commission :
  <input type="text" name="ta" id="ta" class="form-control" value="0" readonly="readonly">

          </label></div>	
				          <div class="form-row">
          <label>Total Transaction Value :
  <input type="text" name="tx" id="tx" class="form-control" value="0" readonly="readonly">
           </label></div>	
              					
              					
              					
              					
              					</div>
              					
              					<div id="dateDiv">
			<div class="form-row">
				
                <table class="table table-bordered mb-0">
            		<tr>
            		<th>Total To Pay HQ</th>
            		<th>Total Deposits</th>
            		</tr>
            		<tr>
            		<td>${totaltopayHq}</td>
            		<td>${todaytotaldeposit}</td>
            		</tr>
            		</table>	
            		</div>
         <div class="form-row">
            		<label>Shortfall: ${shortfail}</label></div>	
          <div class="form-row">
         <label>Total Agent Commission : ${todayAgentcommision}	</label></div>	
				          <div class="form-row">
          <label>Total Transaction Value : ${todaytxnvalu} </label></div>	
				</div> <br><br>
				       
				       
				       
				          <div class="form-row">
            		<label>Lifetime Agent To Pay HQ: ${lifetimeAgenttopayhq }</label></div>	
				          <div class="form-row">
            			
            		<label>Lifetime Agent Deposits: ${lifetimedeposit}	</label></div>	
				          <div class="form-row">
            			
            		<label>Balance to Pay: ${balancetopay}	</label></div>	
				          <div class="form-row">
<label> Lifetime Agent Income:${lifetimeAgentcommision}	</label>	</div>
            			</div>
            			</div>
			
				</form>
				
                                 
                               </div>
                  
                           </div>
                        
                         
                       </div>

                           
                            <div class="col-lg-12">
                               	<h5 style="text-align:center;padding:5px;font-size: 16px;background:#2e287b;color:white;">
                               	Deposit Entries</h5>
                                         <div class=" shadow p-3 mb-5 bg-white rounded">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
                                                <thead class="thead-light">
                                                  <tr>
                                                    <th scope="col" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">EntryDate/Time</th>
                                                    <th scope="col" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">Amount</th>
                                                    <th scope="col" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">Notes</th>
                                                    <th scope="col" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">DocumentScan</th>
                                                 
                                                  </tr>
                                                </thead>
                                                <tbody>
 
      <c:forEach items="${list}" var="list">
                                                
      <tr>
         <td>${list.depositDate}</td>
         <td>${countryIso} ${list.depositAmount}</td>
         <td>${list.notes}</td>
         <td>
      	<img src="/images/depositDocuments/${list.adId}/${list.document}" width="100" height="55">
         
         </td>
      
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