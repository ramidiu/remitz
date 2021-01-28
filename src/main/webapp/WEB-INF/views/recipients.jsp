<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recipients1232</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Rubik&display=swap" rel="stylesheet">
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/> -->

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Rubik&display=swap"
	rel="stylesheet">
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/> -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
.recipients .panel-heading {
	background: #e2e4e6 !important;
}

.panel.panel-default {
	border-radius: 0px;
	position: relative;
}

.myedit {
	position: relative;
}

.myedit:hover .edidel {
	opacity: 1;
}

.recipients button.btn.btn-default {
	background: #d3d6dc;
	padding: 13px 25px;
}

.recipients button.btn.btn-danger {
	padding: 13px 25px;
}

.recipients button.btn.btn-default:hover {
	background: #d3d6dc !important;
	border-color: #d3d6dc !important;
	padding: 13px 25px;
}

.recipients button.btn.btn-danger:hover {
	padding: 13px 25px;
	color: #fff !important;
	background-color: #d9534f !important;
	border-color: #d43f3a !important;
}

.edidel {
	opacity: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100%;
	height: 100%;
	bottom: 0px;
	right: 0px;
	background: rgba(255, 255, 255, 0.82);
	text-align: center;
	padding-top: 110px;
}

.panel-heading {
	border-radius: 0px;
	border-color: #e2e4e6 !important;
	padding: 15px 0px 15px 30px !important;
	font-size: 17px;
}

.panel-body {
	padding: 15px !important;
	min-height: 204px;
}

.inner-padding {
	margin-bottom: 20px;
}

p.item-label {
	font-weight: bold !important;
	color: #00B5CC !important;
	text-transform: uppercase;
	font-size: 12px;
}

.panel-body p {
	line-height: 26px !important;
	margin: 0px !important;
}
.panel-default /* .dropdown-menu {padding: 1px 3px 10px 24px;
    /* position: relative; 
    top: 30px;
    left: 126px; 
    left: auto !important ;
    margin-left: 81px !important;
    width: auto;}
    .recipients {
    background-color: #fff;
    padding: 166px 0 0 !important;
} */
</style>
</head>
<body>
	<%@include file="frontendheader.jsp"%>
	<div class="recipients">
		<div class="container">
			<div class="row">
				 <div class="col-md-12">
					  <div class="hthree">
						   <h3>My Recipients</h3>
						   <br>
					  </div>
					  <a href="addrecipient">
						 <button type="button" class="btn btn-primary btn-lg mt-20 ml-0" id="addnewrecipient">Add new Recipient</button>
					  </a>
					<div class="form-group"></div>
					<div class="row">
					<c:forEach var="list" items="${list}">
						 <div class="col-md-4">
							  <div class="panel panel-default ">
								   <div class="myedit">
									    <div class="panel-heading">${list.firstName}&nbsp;${list.lastName} <p class="item-label">${list.beneficiaryCountry.countryName }</p>
									      	 </div>
									    <div class="panel-body">
									    <div class="inner-padding">
											      <p class="item-label">Bank Name</p>
											      <p style="color:black;"class="item-value">${list.bankName}</p>
									      	 </div>
									    	<c:if test="${list.accType eq '1'  or list.accType eq '10' or list.accType eq '11'}">
										     <div class="inner-padding">
											      <p class="item-label">Account Number</p>
											      <p style="color:black;" class="item-value">${list.bankAccountNumber}</p>
									      	 </div>
									      	 </c:if>
										     
                           					
									      	           	</div>

	                                    <div class="edidel">
                                		     <button type="button" class="btn btn-default">
											        <i class="fa fa-pencil-square-o" aria-hidden="true">					 
											         <a href="editrecipient?beneficiaryId=${list.beneficiaryId}"></i> Edit
										     </button>
										     
										     <button type="button" class="btn btn-danger">
											         <i class="fa fa-trash" aria-hidden="true">
											         <a href="deleterecipient?beneficiaryId=${list.beneficiaryId}"></i> Delete
										     </button>
										     
				                       </div>
 							    </div>
							</div>
				      </div>
				      </c:forEach> 
					  
						<%-- <table class="table table-bordered mt-30">
                         <thead class="">    sS
                                <tr class="">
                                    <th>Full Name</th>
                                    <th>Contact No.</th>
                                    <th>Email</th>
                                    <th>Country</th>       
                                 </tr>
                          </thead>
                          <tbody>
                              <c:forEach var="list"  items="${list}">
                                <tr>
                              	    <td>${list.firstName}&nbsp;${list.lastName}</td>
                          	        <td>${list.mobileNumber}</td>
    	                            <td>${list.emailId}</td>
    	                            <td>${list.beneficiaryCountry.countryName}</td>
                                </tr>
                              </c:forEach>
                          </tbody>
                  </table> --%>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
	<%@include file="frontendfooter.jsp"%>
	

</html>