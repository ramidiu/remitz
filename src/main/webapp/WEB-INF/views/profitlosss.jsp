<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Profit&Loss</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
  
 
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
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
  $(document).ready(function(){
	  var tableBody='';
	  var fromDate=$('#fromDate').val();
	  var toDate=$('#toDate').val();
	  $.ajax({
			url:'getprofitlosstrans',
			type:'GET',
			data:"fromDate="+fromDate+"&toDate="+toDate,
			success:function(response){
			   var txnList = JSON.stringify(response, undefined, '\t');
			   var usdAmount='';
			   $.each($.parseJSON(txnList),function(idx,obj){
				   var usdAmount='';
				   usdAmount=Number(Number(obj.sendingAmount)*(obj.fixerRate));
				   tableBody=tableBody+'<td>'+obj.sendingAmount+'</td><td>'+obj.totalFee+'</td><td>'+obj.totalAmountCollected+'</td><td>'+obj.markup+'</td><td>'+obj.fixerRate+'</td><td>'+usdAmount+'</td><td>'+obj.flutterRate+'</td><td>'+obj.flutterFee+'</td><td>'+obj.receipentAmount+'</td><td></td>'; 
			   });
			   $('#tableBody').empty();
			   $('#tableBody').append(tableBody);
			},
			error:function(){
				
				alert("gettranserror");
			}
		})
			
				  
  });
  </script>
  <script type="text/javascript">
  function getTransactionList(){
	  var tableBody='';
	  var fromDate=$('#fromDate').val();
	  var toDate=$('#toDate').val();
	  $.ajax({
			url:'getprofitlosstrans',
			type:'GET',
			data:"fromDate="+fromDate+"&toDate="+toDate,
			success:function(response){
			   var txnList = JSON.stringify(response, undefined, '\t');
			   var usdAmount='';
			   $.each($.parseJSON(txnList),function(idx,obj){
				   var usdAmount='';
				   usdAmount=Number(Number(obj.sendingAmount)*(obj.fixerRate));
				   tableBody=tableBody+'<tr><td>'+obj.sendingAmount+'</td><td>'+obj.totalFee+'</td><td>'+obj.totalAmountCollected+'</td><td>'+obj.markup+'</td><td>'+obj.fixerRate+'</td><td>'+usdAmount+'</td><td>'+obj.flutterRate+'</td><td>'+obj.flutterFee+'</td><td>'+obj.receipentAmount+'</td><td></td></tr>'; 
			   });
			   $('#tableBody').empty();
			   $('#tableBody').append(tableBody);
			},
			error:function(){
				
				alert("gettranserror");
			}
		})
	  
  }
  </script>
 </head>
<body>
<%@include file="backendheader.jsp" %>

 <main id="main-container">
              
                <div class="content">   

<div class="row">
                                            
                                	
                           
                            <div class="col-lg-12">
                               
                                         <div class="">
                                          <div class="col-md-3" >
                                               
                                                    <div class="form-group">
                                                       <!--  <label for="showEasing" style="position: relative;left: -5px;top: 37px;">From Date</label>
                                                       <input type="text" class="form-control " id="datepicker" style="position: relative;left: 99px;"> -->
                                                       <label for="showEasing"  class="Fromdate" style="">From Date</label>                                            
                                                    <input type="text" class="form-control" id="fromDate" value="${fromDate}"> 
                                                       
                                                    </div>
                                                
                                        </div> 
                                        <div class="col-md-3 " >
                                              
                                                    <div class="form-group">
                                                      
                                                       <!--  <label for="showEasing" style="position: relative; left: 130px;top: 37px;">To Date</label>
                                                       <input type="text" class="form-control " id="datepicker1" style="position: relative;left: 217px;"> -->
                                                       <label for="showEasing"  class="Todate" style="">To Date</label>
                                                       <input type="text" class="form-control" id="toDate" value="${fromDate}">
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
				<th colspan="3">SENDING</th>
				<th colspan="3">FIXER</th>
				<th colspan="3">FLUTTERWAVE</th>
				<th>PROFIT</th>
			</tr>
			<tr>
				<td>Sending amount</td>
				<td>fee</td>
				<!-- <td>Mode of payment fee</td> -->
				<td>Total</td>
				<td>Markup %</td>
				<td>Sell Rate</td>
				<td>Usd value</td>
				<td>Rate</td>

				<td>Fee</td>
				<td>NGN</td>
				<td></td>

			</tr>
			<%-- <c:forEach items="${transactionsList}" var="transaction"> --%>
				<!-- <tr id="tableBody"> -->
					<%-- <td>${transaction.sendingAmount}</td>
					<td>${transaction.totalFee}</td>
					<td>${transaction.totalAmountCollected}</td>
					<td>${transaction.markup}</td>
					<td>${transaction.fixerRate}</td>

					<td></td>
					<td>${transaction.flutterRate}</td>
					<td>${transaction.flutterFee}</td>
					<td>${transaction.receipentAmount}</td>
					<td></td> --%>

				<!-- </tr> -->
				<tbody id="tableBody">
				</tbody>
			<%-- </c:forEach> --%>
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