<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script>
$("#fromdate").datepicker({
	changeMonth: true,
	changeYear: true,
	numberOfMonths: 1,
	showOn: 'both',
	buttonImage: "../images/calendar-icon.png",
	buttonText: 'Select Date',
	buttonImageOnly: true,
	dateFormat: 'yy-mm-dd',
	minDate : new Date(2018,7,1),
	onSelect: function( selectedDate ) {
		$( "#todate" ).datepicker( "option", "minDate", selectedDate );
	}
});
	$("#todate").datepicker({
	changeMonth: true,
	changeYear: true,
	numberOfMonths:1,
	showOn: 'both',
	buttonImage: "../images/calendar-icon.png",
	buttonText: 'Select Date',
	buttonImageOnly: true,
	dateFormat: 'yy-mm-dd',
	minDate : new Date(2018,7,1),
	onSelect: function( selectedDate ) {
		$( "#fromdate" ).datepicker( "option", "maxDate", selectedDate );
	}
});

</script>
<script>
function datepickerchange()
{
	var finYear=$("#finYear").val();
	var yr = finYear.split('-');
	var startDate = yr[0]+",04,01";
	var endDate = parseInt(yr[0])+1+",03,31";
	
	$('#fromdate').datepicker('option', 'minDate', new Date(startDate));
	$('#fromdate').datepicker('option', 'maxDate', new Date(endDate));
	$('#todate').datepicker('option', 'minDate', new Date(startDate));
	$('#todate').datepicker('option', 'maxDate', new Date(endDate));
}

</script>
<body>

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
                                                    <input type="text" class="form-control" id="finYear" Onchange="datepickerchange(); value="${finYear}"> 
                                                       	<%@ include file="yearDropDown1.jsp" %>
                                                    </div>
                                              
                                              
                                                    <div class="form-group">
                                                       <!--  <label for="showEasing" style="position: relative;left: -5px;top: 37px;">From Date</label>
                                                       <input type="text" class="form-control " id="datepicker" style="position: relative;left: 99px;"> -->
                                                       <label for="showEasing"  class="Fromdate" style="">From Date</label>                                            
                                                    <input type="text" class="form-control" id="fromdate" value="${fromdate}"> 
                                                       
                                              
                                                    </div>
                                                
                                        </div> 
                                        <div class="col-md-3 " >
                                              
                                                    <div class="form-group">
                                                      
                                                       <!--  <label for="showEasing" style="position: relative; left: 130px;top: 37px;">To Date</label>
                                                       <input type="text" class="form-control " id="datepicker1" style="position: relative;left: 217px;"> -->
                                                       <label for="showEasing"  class="Todate" style="">To Date</label>
                                                       <input type="text" class="form-control" id="todate" value="${todate}">
                                                    </div>
                                                
                                        </div> 
                                        <div class="col-md-3 " >
                                              
                                                    <div class="form-group">
                                                      
                                                       <!--  <label for="showEasing" style="position: relative; left: 130px;top: 37px;">To Date</label>
                                                       <input type="text" class="form-control " id="datepicker1" style="position: relative;left: 217px;"> -->
                                                       <label for="showEasing"  class="Todate" style="">subhead</label>
                                                       <input type="text" class="form-control" id="subhead" value="${subhead}">
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
                                                    <th scope="col">Transaction Id</th>
                                                    <th scope="col">Transaction Date</th>
                                                      <th scope="col">CreateDate</th>

                                               <th scope="col">BankId</th>
                                                       <th scope="col">BAnkFlag</th>
                                                      <th scope="col">Bank</th>
                                                     
                                                    
                                                     <th scope="col">CDType</th>
                                                  </tr>
                                                </thead>
                                                <tbody id="transactionRecords">
                                                <c:set var="count" value="${1}"/>
                                                <c:forEach items="${blist}" var="transaction">
      <tr>
       <td> <span ><a style="color:#0e64eb" href="txnFulldetailsBranch?txnid=${transaction.transactionId }">${transaction.transactionId }</a></span><br>
      
      <td>${transaction.createdDate }</td>
        <td>${transaction.bankId }</td>
        <td>${transaction.bankFlag}</td>
         <td>${transaction.typeOfBank }</td>
         <td>${transaction.type }</td>
          </td>
      </tr>
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