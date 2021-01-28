<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UnderRemitBanktransactions</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var  status=$('#status').val();
	$.ajax({
		url : "gettransactionsbystatus",
		type : "get",
		data : "status="+status,
		async : false,
		success : function(response){
			var tbody='';
			 var transactionList = JSON.stringify(response, undefined, '\t');
				 $.each($.parseJSON(transactionList),function(idx,obj){
					 tbody=tbody+'<tr><td>'+obj.transactionId+'</td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+'</td><td>'+obj.transactionMode+'</td><td>'+obj.paymentStatus+'</td><td>'+obj.sendingAmount+'&nbsp'+obj.sendingCurrency+'</td><td>'+obj.totalFee+'</td><td>'+obj.receipentAmount+'&nbsp'+obj.receivingCurrency+'</td><td>'+obj.status+'</td>';
					 if(obj.status==='pending'){
						  	tbody=tbody+'<td><button type="button" class="btn btn-primary"  onclick="transferDetails('+"'"+obj.transactionId+"'"+')">Transfer</button></td>'; 
					 }
					 if(obj.status==='NEW'){
						 tbody=tbody+'<td><button type="button" class="btn btn-primary" id="submitBtn"'+idx+'onclick="flutterStatus('+"'"+obj.flutterReferenceId+"'"+')">Get Status</button></td>';
					 }
					 
				 });
				 
				 $('#transactionRecords').empty();
				 $('#transactionRecords').append(tbody);		
		},
		error  : function(error,xhr,status){
			alert(' errordfdfdf');
		}
		});
});
</script>
<script type="text/javascript">
function onChangeStatus(){
	var  status=$('#status').val();
	$.ajax({
		url : "gettransactionsbystatus",
		type : "GET",
		data : "status="+status,
		async : false,
		success : function(response){
			var tbody='';
			 var transactionList = JSON.stringify(response, undefined, '\t');
				 $.each($.parseJSON(transactionList),function(idx,obj){
					 tbody=tbody+'<tr><td>'+obj.transactionId+'</td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.customer.customerKYCStatus+'</td><td>'+obj.receivingCountry.countryName+'</td><td>'+obj.paymentType+'</td><td>'+obj.transactionMode+'</td><td>'+obj.paymentStatus+'</td><td>'+obj.sendingAmount+'&nbsp'+obj.sendingCurrency+'</td><td>'+obj.totalFee+'</td><td>'+obj.receipentAmount+'&nbsp'+obj.receivingCurrency+'</td><td>'+obj.status+'</td>';
					 if(obj.status==='pending'){
						  	tbody=tbody+'<td><button type="button" class="btn btn-primary"  onclick="transferDetails('+"'"+obj.transactionId+"'"+')">Transfer</button></td>'; 
					 }
					 if(obj.status==='NEW'){
						 tbody=tbody+'<td><button type="button" class="btn btn-primary" onclick="flutterStatus('+"'"+obj.flutterReferenceId+"'"+')">Get Status</button></td>';
					 }
					 
				 });
				 
				 $('#transactionRecords').empty();
				 $('#transactionRecords').append(tbody);
				 
		},
		error  : function(error,xhr,status){
			alert(' errorrrrrr');
		}
		});
}
</script>
<script type="text/javascript">
	function transferDetails(transactionId) {
		 $('#transactionId').val(transactionId);
		$('#submitForm').attr("action", "createtransfer");
		$('#submitForm').submit(); 
	}
</script>
<script type="text/javascript">
	function flutterStatus(transferId){
		 $('#transferId').val(transferId);
		$('#submitForm').attr("action", "gettransferstatus");
		$('#submitForm').submit(); 
	}
</script>
</head>
<body>
	<%@include file="backendheader.jsp"%>
	<main id="main-container">
		<div class="content">
			<div class="row">
				<div class="col-lg-12">
					<div class="col-md-3"></div>
				</div>
				<div class="table-responsive">
					<label for="cars">Filter By Status:</label> <select name="status"
						id="status" onchange="onChangeStatus();">
						<option value="pending">Pending</option>
						<option value="all">All</option>
						<option value="NEW">NEW</option>
						<option value="paid">Paid</option>
						
					</select>
					<form id="submitForm">
					<input type="hidden" name="transactionId" id="transactionId">
					<input type="hidden" name="transferId" id="transferId">
						<table class="table table-bordered mb-0">
							<thead class="table-primary">

								<tr id="dates">

								</tr>
								<tr id="headerrow">
									<th scope="col">Transaction Id</th>
									<th scope="col">Transaction Date</th>
									<th scope="col">customer</th>
									<th scope="col">kyc status</th>
									<th scope="col">receivingCountry</th>
									<th scope="col">paymentType</th>
									<th scope="col">transactionMode</th>
									<th scope="col">paymentStatus</th>
									<th scope="col">Sending Amount</th>
									<th scope="col">totalFee</th>
									<th scope="col">ReceipentAmount</th>
									<th scope="col">status</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody id="transactionRecords">
								<%-- <c:forEach items="${transactionlist}" var="transaction"
									varStatus="loop">
									<input type="hidden" name="transactionId" value=""
										id="transactionId">
									<tr>
										<td>${transaction.transactionId}</td>
										<td>${transaction.createdDate }</td>
										<td>${transaction.customer.firstName }${transaction.customer.lastName }</td>
										<td>${transaction.customer.customerKYCStatus }
										</td>
										<td>${transaction.receivingCountry.countryName }</td>
										<td>${transaction.paymentType }</td>
										<td>${transaction.transactionMode}</td>


										<td>${transaction.paymentStatus}<c:if
												test="${transaction.paymentStatus eq 'pending'}">
												<select id="paymentstatus${loop.index}"
													name="paymentstatus${loop.index}"
													onchange="setPaymentStatus('${loop.index}','${transaction.transactionId}','${transaction.customer.customerKYCStatus}')">
													<option value="">select</option>
													<option value="paid">fund received</option>
													<option value="cancelled">cancelled</option>
												</select>

											</c:if>
										</td>
										<td>${transaction.sendingAmount}${transaction.sendingCurrency}</td>
										<td>${transaction.totalFee }</td>
										<td>${transaction.receipentAmount }${transaction.receivingCurrency}</td>
										<td><c:choose>
												<c:when
													test="${transaction.customer.customerKYCStatus eq 'completed'}">
													<font color="green"><strong>[KYC Completed]</strong></font>
												</c:when>
												<c:when
													test="${transaction.customer.customerKYCStatus eq 'pending'}">
													<font color="red"><strong>[KYC Pending]</strong></font>
												</c:when>


											</c:choose> ${transaction.status } <c:if
												test="${transaction.status eq 'processing'}">


												<select id="transactionStatus${loop.index}"
													name="transactionStatus${loop.index}"
													onchange="updateStatus('${loop.index}','${transaction.transactionId}','${transaction.customer.customerKYCStatus}')">
													<option value="">select</option>

													<option value="paid">Amount Delivered</option>
													<option value="cancelled">cancelled</option>
													<option value="onhold">Onhold</option>
												</select>
											</c:if> <c:if test="${transaction.status eq 'pending'}">
												<select id="transactionStatus${loop.index}"
													name="transactionStatus${loop.index}"
													onchange="updateStatus('${loop.index}','${transaction.transactionId}')">
													<option value="">select</option>
													<option value="cancelled">Cancelled</option>

												</select>



											</c:if></td>
										<td>
											<button type="button" class="btn btn-primary"
												id="submitBtn${loop.index}"
												onclick="transferDetails('${transaction.transactionId}')">Transfer</button>
										</td>

									</tr>
								</c:forEach>
							</tbody>
 --%>						</table>
					</form>
				</div>
			</div>
		</div>
		</div>
	</main>
</body>
<script
	src="assets/js/plugins/pwstrength-bootstrap/pwstrength-bootstrap.min.js"></script>
<script
	src="assets/js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script
	src="assets/js/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<script
	src="assets/js/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
<script src="assets/js/plugins/select2/js/select2.full.min.js"></script>
<script
	src="assets/js/plugins/jquery-tags-input/jquery.tagsinput.min.js"></script>
<script
	src="assets/js/plugins/jquery-auto-complete/jquery.auto-complete.min.js"></script>
<script src="assets/js/plugins/masked-inputs/jquery.maskedinput.min.js"></script>
<script
	src="assets/js/plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
<script src="assets/js/plugins/dropzonejs/dropzone.min.js"></script>
<script src="assets/js/plugins/flatpickr/flatpickr.min.js"></script>
</html>