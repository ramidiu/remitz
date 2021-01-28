<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CustomerProfile</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.card-body{
	margin: 45px -91px 0 145px;
}
.table-primary {
    background: #0168fa !important;
    color: #fff;
}
</style>
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
    
});
</script>
</head>
<body>
<%@include file="headerNew.jsp" %>
 <main id="main-container">
          
	<div class="content container">
	<section class="block">
		<div class="row">
			 <div class="col-md-12 mt-10">                    			
               <div class="">
               	<div class=" col-lg-12  col-md-12  col-sm-12 col-xs-12 coustomer-in">
				<table class="table table-bordered ">
					<tbody><tr class="admin-heading">
						<th style="padding:5px;font-size: 13px;background:#2e287b;color:white;">TRANSACTIONS AMOUNT BY <b> &nbsp;${customer.firstName}&nbsp;${customer.lastName}&nbsp;${customer.customerId}</b>
						
						</th>
					</tr>
					<tr>
						<!-- <td>
							<button type="button" class="btn btn-blue btn-submit" style="float:left">Edit Customer Details</button>
						<button type="button" class="btn btn-blue btn-submit">Disapprove Identity Proof</button> 
					</td> -->
					</tr>

					<tr>
						<td>
							<table class="table   table-bordered ml-0">
								<tbody><tr class="table-primary">
									<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">Primary ID Proof</th>
									<!-- <th class="text-black">Secondry ID Proof</th> -->
								</tr>
								<tr>
									<td>
<!-- 										<div class="col-md-6">
											<button type="button" class="btn btn-blue btn-submit mt-25">Upload</button>
									</div>
										<div class="col-md-6">
											
 -->												
												
																					<div class="col-md-6">
												
												<img src="/images/customerimages/${customer.customerId}/${customer.firstIdProofDoc}" width="100" height="55">
												
												
									</div>
									</td>
									<!-- <td> -->
										<!-- <div class="col-md-6">
											<button type="button" class="btn btn-blue btn-submit mt-25">Upload</button>

										</div> -->
										<!-- <div class="col-md-6">
											
												
														<img src="/MarhabaNov262018/resources/images/No_image_available.jpg" width="100" height="55">
												
												
												
								</div> -->
									<!-- </td> -->
								</tr>
							</tbody></table>
						</td>
					</tr>
				</tbody></table>
				<table class="table table-striped  table-bordered">
					<tbody><tr class="table-primary">
						<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">Sender Transaction</th>
						<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">Total Transactions</th>
						<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">Total Amount (${thirtyDaystransactionInformation.sendingCurrency})</th>
					</tr>
					
     <c:forEach items="${thirtyDaystransactionInformation}" var="thirtyDaystransactionInformation">
					<tr>
					
						<%-- <td>
							<h4>30 Days (${todayFormatedDate})</h4>
							<table class="table table-striped  table-bordered">
								<tbody><tr class="table-primary">
									<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">MODE </th>
									<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">COUNT</th>
									<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">AMOUNT (${thirtyDaystransactionInformation.sendingCurrency})</th>
								</tr>
								
								
							</tbody></table>
						</td> --%>
						<td>${thirtyDaystransactionInformation.transactionCount}</td>
						<td>${thirtyDaystransactionInformation.transactionTotalAmount}</td>
					</tr>
					
													</c:forEach>
					<tr>
						<td>
							<h4>${days1} Days (${todayFormatedDate})</h4>
							<table class="table table-striped  table-bordered">
								<tbody><tr class="table-primary">
									<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">MODE </th>
									<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">COUNT</th>
									<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">AMOUNT (${nintyDaystransactionInformation.sendingCurrency})</th>
								</tr>
								<tr>
					<td>Internet Bank Transfer</td>
					<td>${thirtyibtcount}</td>
					<td>${thirtyibtAmount}</td>
					</tr>
					<tr>
					<td>Cash</td>
					<td>${thirtycashCount}</td>
					<td>${thirtycashAmount}</td>
					</tr>
					<tr>
					<td>Online</td>
					<td>${thirtyonlineCount}</td>
					<td>${thirtyonlineAmount}</td>
					</tr>
								
								
								
							</tbody></table>
						</td>
						<td>${count1}</td>
						<td>${ta1}</td>
					</tr>
										<tr>
						<td>
							<h4>${days2} Days (${todayFormatedDate})</h4>
							<table class="table table-striped  table-bordered">
								<tbody><tr class="table-primary">
									<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">MODE </th>
									<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">COUNT</th>
									<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">AMOUNT (${nintyDaystransactionInformation.sendingCurrency})</th>
								</tr>
								<tr>
					<td>Internet Bank Transfer</td>
					<td>${nic}</td>
					<td>${nia}</td>
					</tr>
					<tr>
					<td>Cash</td>
					<td>${ncc}</td>
					<td>${nca}</td>
					</tr>
					<tr>
					<td>Online</td>
					<td>${noc}</td>
					<td>${noa}</td>
					</tr>
								
								
								
							</tbody></table>
						</td>
						<td>${count2}</td>
						<td>${ta2}</td>
					</tr>
					
					
						<tr>
						<td>
							<h4>${days3} Days (${todayFormatedDate})</h4>
							<table class="table table-striped  table-bordered">
								<tbody><tr class="table-primary">
									<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">MODE </th>
									<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">COUNT</th>
									<th class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">AMOUNT (${yeartransactionInformation.sendingCurrency})</th>
								</tr>
																<tr>
					<td>Internet Bank Transfer</td>
					<td>${yic}</td>
					<td>${yia}</td>
					</tr>
					<tr>
					<td>Cash</td>
					<td>${ycc}</td>
					<td>${yca}</td>
					</tr>
					<tr>
					<td>Online</td>
					<td>${yoc}</td>
					<td>${yoa}</td>
					</tr>
								
								
								
							</tbody></table>
						</td>
						<td>${count3}</td>
						<td>${ta3}</td>
					</tr>
				</tbody></table>
				<table class="table table-striped  table-bordered ">
					<tbody><tr class="bg-blue">
						<th class="text-black" colspan="3">Make Transaction</th>
					</tr>
			<tr>
						<!-- <td colspan="3">
						<button type="button" class="btn btn-blue btn-submit" id="makeTransaction"> Make Transaction </button>
					</td> -->
					</tr>
				</tbody></table>
				<table class="table  table-bordered ">
								<tbody><tr class="table-primary">
									<td colspan="2" class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">CUSTOMER DETAILS</td>
								</tr>
								
								<tr> 
									<td width="70%">
										<table class="table  table-bordered">
											<tbody><tr>
												<td>Telephone / Mobile</td>
												<td>
													<input type="text" class="form-control" id="mobileNO" value="${customer.mobileNumber}" readonly="readonly" placeholder="Enter Telephone / Mobile">
												</td>
												<td>Gender</td>
												<td>
													<select class="form-control" id="gender">
													
															<c:if test="${customer.gender eq 'Male'}">
															<option value="${customer.gender}" selected="selected">${customer.gender}</option>
															</c:if>
															<c:if test="${customer.gender eq 'Female'}">
															<option value="${customer.gender}" selected="selected">${customer.gender}</option>
															</c:if>															
													</select>
												</td>
											</tr>
											<tr>
												<td>Forename</td>
												<td>
													<input type="text" class="form-control" id="forName" value="${customer.firstName}" readonly="readonly" placeholder="Enter Forename">
												</td>
												<td>Surname</td>
												<td>
													<input type="text" class="form-control" id="surname" value="${customer.lastName}" readonly="readonly" placeholder="Enter Surname">
												</td>
											</tr>
											
											<tr>
											<td>Address</td>
												<td>
													<textarea class="form-control" rows="2" cols="10" placeholder="Enter Address" id="address" value="${customer.address1}" readonly="readonly">${customer.address1}</textarea>
												</td>
												<td>City/State</td>
												<td>
													<input type="text" class="form-control" value="${customer.cityOrState}" id="cityState" readonly="readonly" placeholder="Enter City/State Name">
												</td>
											</tr>
											<tr>
											<td>Living Country</td>
												<td>
													<input type="text" class="form-control" name="fromCountry" id="fromCountry" value="${customer.country.countryName}" placeholder="Living Country" readonly="readonly">
												</td>
												<td>Postcode</td>
												<td>
													<input type="text" class="form-control" id="postcode" value="${customer.postalCode}" readonly="readonly" placeholder="Post Code">
												</td>
											</tr>
											<tr>
											<!-- <td>Source of Income</td>
												<td>
													<input type="text" class="form-control" value="ssss" readonly="readonly" placeholder="Source of Income">
												</td> -->
												<td>Email Address</td>
												<td>
													<input type="text" class="form-control" id="email" value="${customer.emailId}" readonly="readonly" placeholder="Email Address">
												</td>
											</tr>
											<tr class="table-primary">
												<th colspan="4" class="text-black" style="padding:5px;font-size: 13px;background:#2e287b;color:white;">PRIMARY IDENTITY PROOF</th>
											</tr>
											<tr>
											<td>Primary Identification Proof</td>
												<td>
                						<select class="form-control pull-right" name="firstIdProofType" id="firstIdProofType" onclick="removeError('firstIdProofType'); readonly="readonly" ">
										
							        <c:if test="${customer.firstIdProofType eq 1}">
									<option value="1" >Work Permit</option>
									</c:if>
                                  <c:if test="${customer.firstIdProofType eq 2}">
                                  <option value="2" >International Passport</option>
                                 </c:if>
                                 <c:if test="${customer.firstIdProofType eq 3}">
                                 <option value="3" >Identification ID</option>
                                 </c:if>
                                 <c:if test="${customer.firstIdProofType eq 4}">
                                 <option value="4" >Residence Permit</option>
                                 </c:if>
                                 <c:if test="${customer.firstIdProofType eq 5}">
                                 <option value="5" >Passport</option>
                                 </c:if>
                                 <c:if test="${customer.firstIdProofType eq 01}">
                                 <option value="01" >Driver Licence</option>
                                 </c:if>
						
							</select>
												</td>
												<td>Document Number</td>
												<td>
													<input type="text" value="${customer.firstIdNumber}" id="firstIdNumber" class="form-control" readonly="readonly" placeholder="Enter Document Number">
												</td>
											</tr>
											<tr>
											<td>Date of Issue</td>
											<td><input type="text" class="form-control " value="${customer.firstIdIssueDate}" id="datepicker" placeholder="Enter Issue Date" readonly="readonly"></td>
											<td>Expiry Date</td>
												<td><input type="text" class="form-control " value="${customer.firstIdExpireDate}" id="datepicker1" placeholder="Enter Expiry Date" readonly="readonly"></td>
											</tr>
											<tr>
											<td>Issuing Country</td>
											<td>
													<select class="form-control" id="firstIdIssuingCountry">																									
													<option value="${customer.issuingCountry.countryISO }">${customer.issuingCountry.countryName}</option>
													</select>
												</td>
												<td colspan="2"></td>
											</tr>
											</tbody></table>
											
									</td>
									
								</tr>
						</tbody></table>
						
			</div>
               </div>
              </div>
		</div>
		</section>
	</div>
</main>
 <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/feather.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dashforge.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/prism.js"></script>
</body>
</html>