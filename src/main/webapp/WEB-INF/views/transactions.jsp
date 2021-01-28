<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transactions123</title>
 <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Rubik&display=swap" rel="stylesheet">
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/> -->

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
  
  .dropdown-menu {padding: 1px 3px 10px 24px;
    /* position: relative; */
    top: 30px;
    /* left: 126px; */
    left: auto !important ;
    margin-left: 81px !important;
    width: auto;}
    .transactions {
    background-color: #fff;
  
}
.col-sm-12.transactions-in {
    padding-top: 30px;
}
input#search {
    border: 1px solid #ddd !important;
    box-shadow: none;
}

#loginForm button.btn.btn-default {
    padding: 8px 10px 8px 15px;
    border: 1px solid #ddd !important;
    box-shadow: none !important;
}

.tab-content.mt-3 {
    margin-top: 60px;
    padding: 10px;
}


  .nav-tabs>li>a {
font-family: 'DM Sans', sans-serif !important;
border: 1px solid transparent;
    background-color:transparent;
    border-color: rgba(72, 94, 144, 0.16);
    color: #596882;
    border-bottom-width: 0;
    position: relative;
    margin-bottom: -1px;
    padding: 0 0px;
    font-size: 14px;
    border-radius: 1px;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 38px;
    transition: background-color 0.2s;
   
}

.nav-tabs>li>a:hover {
    border-color: #eee #eee #ddd
}

.nav-tabs>li.active>a,
.nav-tabs>li.active>a:focus,
.nav-tabs>li.active>a:hover {
    background-color: #fff;
    z-index: 5;
    color: #0168fa;
}

.nav-tabs.nav-justified {
    width: 100%;
    border-bottom: 0
}

.nav-tabs.nav-justified>li {
    float: none
}

.nav-tabs.nav-justified>li>a {
    margin-bottom: 5px;
    text-align: center
}

.nav-tabs.nav-justified>.dropdown .dropdown-menu {
    top: auto;
    left: auto
}

@media (min-width:768px) {
    .nav-tabs.nav-justified>li {
        display: table-cell;
        width: 1%
    }
    .nav-tabs.nav-justified>li>a {
        margin-bottom: 0
    }
}

.nav-tabs.nav-justified>li>a {
    margin-right: 0;
    border-radius: 4px
}

.nav-tabs.nav-justified>.active>a,
.nav-tabs.nav-justified>.active>a:focus,
.nav-tabs.nav-justified>.active>a:hover {
    border: 1px solid #ddd
}

@media (min-width:768px) {
    .nav-tabs.nav-justified>li>a {
        border-bottom: 1px solid #ddd;
        border-radius: 4px 4px 0 0
    }
    .nav-tabs.nav-justified>.active>a,
    .nav-tabs.nav-justified>.active>a:focus,
    .nav-tabs.nav-justified>.active>a:hover {
        border-bottom-color: #fff
    }
}

.nav-pills>li {
    float: left
}

.nav-pills>li>a {
    border-radius: 4px
}

.nav-pills>li+li {
    margin-left: 2px
}

.nav-pills>li.active>a,
.nav-pills>li.active>a:focus,
.nav-pills>li.active>a:hover {
    color: #fff;
    background-color: #337ab7
}

.nav-stacked>li {
    float: none
}

.nav-stacked>li+li {
    margin-top: 2px;
    margin-left: 0
}

.nav-justified {
    width: 100%
}

.nav-justified>li {
    float: none
}

.nav-justified>li>a {
    margin-bottom: 5px;
    text-align: center
}

.nav-justified>.dropdown .dropdown-menu {
    top: auto;
    left: auto
}

@media (min-width:768px) {
    .nav-justified>li {
        display: table-cell;
        width: 1%
    }
    .nav-justified>li>a {
        margin-bottom: 0
    }
}

.nav-tabs-justified {
    border-bottom: 0
}

.nav-tabs-justified>li>a {
    margin-right: 0;
    border-radius: 4px
}

.nav-tabs-justified>.active>a,
.nav-tabs-justified>.active>a:focus,
.nav-tabs-justified>.active>a:hover {
    border: 1px solid #ddd
}

@media (min-width:768px) {
    .nav-tabs-justified>li>a {
        border-bottom: 1px solid #ddd;
        border-radius: 4px 4px 0 0
    }
    .nav-tabs-justified>.active>a,
    .nav-tabs-justified>.active>a:focus,
    .nav-tabs-justified>.active>a:hover {
        border-bottom-color: #fff
    }
}
 
.tab-content>.tab-pane {
    display: none
}

.tab-content>.active {
    display: block
}

.nav-tabs .dropdown-menu {
    margin-top: -1px;
    border-top-left-radius: 0;
    border-top-right-radius: 0
}
.table th, .table td {
    padding-top: 20px !important;
    padding-bottom: 20px !important;
}

.table > thead > tr > th {
    vertical-align: bottom;
    border-bottom: none !important ;
    font-size: 14px;
}

a.nav-link {
    font-size: 15px !important;
}

a.nav-link.active {
    font-size: 15px !important;
}

.nav-tabs .nav-item .nav-link {
    border: 0;
    background: transparent;
    font-size: 1rem;
    position: relative;
    border-radius: 0;
    padding: 10px 20px 15px 20px !important;
    color: #7b8084;
    white-space: nowrap !important;
}
.js-validate{
    padding: 0 0 0 8px !important;
    width: 100%;
    height: 45px;
    font-size: 12px !important;
    
    font-size: 13.5px !important;
    color: #191818;
    border-radius: 2px;
    border: 1px solid #c1bbbb;
    background: #fff;
    margin: 0 0 30px -31px;
}

@media (max-width:767px) {
.nav-tabs {
    
    border-bottom: 1px solid #cdd4e0;
}

ul.nav.nav-tabs{
 margin-bottom: 20px;
}

.tab-content{
	padding: 0px !important;
}
.mobile-transcations p{
font-size: 17px;
}

}
  </style>
  <script>
$(document).ready(function(){
  $(document).ajaxStart(function(){
    $("#wait").css("display", "block");
  });
  $(document).ajaxComplete(function(){
    $("#wait").css("display", "none");
  });
  $("#search").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#tbody tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });  
});
</script>

<script type="text/javascript">
function getTransactionList(tabValue){
	var customerId=$('#customerId').val();
	var data="customerId="+customerId;
	$.ajax({
		url : "getTransactionListBasedOnCustomerId",
		type : "GET",
		data : data,
		success : function(response){
			 var txnList = JSON.stringify(response, undefined, '\t');
			 var rows='';
			 $.each($.parseJSON(txnList),function(idx,obj){
					/*  
					 if(tabValue=='successful'){
						 if(obj.status =='paid'){
							 rows=rows+'<tr bgcolor="#fff"><td>'+obj.transactionId+'</td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.beneficiary.firstName+' '+obj.beneficiary.lastName+'</td><td>'+obj.sendingAmount+' '+obj.sendingCurrency+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+obj.status+'</td></tr>';	 
						 }
					 }
					 
					 if(tabValue=='all'){
						 if(obj.status =='paid'){
							 rows=rows+'<tr bgcolor="#fff">';
						 }
					 if(obj.status =='pending'){
						 rows=rows+'<tr bgcolor="#fff">';
					 }
						 if(obj.status =='failed'){
							 rows=rows+'<tr bgcolor="#fff">';
						 }
						 if(obj.status =='cancelled'){
							 rows=rows+'<tr bgcolor="#fff">';
						 }
						 if(obj.status =='refunded'){
							 rows=rows+'<tr bgcolor="#fff">';
						 }
						 
						 rows=rows+'<td>'+obj.transactionId+'</td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.beneficiary.firstName+' '+obj.beneficiary.lastName+'</td><td>'+obj.sendingAmount+' '+obj.sendingCurrency+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+obj.status+'</td></tr>';	 
					 } */
					 rows=rows+'<tr><td> <span><a style="color:#0e64eb" href="fulldetailmt?txnid='+obj.transactionId+'">'+obj.transactionId+'</a></span><br><img src="images/countryimages/'+obj.receivingCurrency.toLowerCase()+'.jpg" width="30px" height="30px" class="rounded-circle">&nbsp;'+obj.beneficiary.firstName+' '+obj.beneficiary.lastName+'</td><td><span style="font-size: 69%;font-weight: 600;">'+obj.sendingCurrency+'</span>'+obj.sendingAmount+'</td><td><span style="font-size: 69%;font-weight: 600;">'+obj.receivingCurrency+'</span>'+obj.receipentAmount+'</td><td><span style="font-size: 69%;font-weight: 600;">'+obj.sendingCurrency+'</span>'+obj.totalFee+'</td><td><span style="font-size: 69%;font-weight: 600;">'+obj.sendingCurrency+'</span>'+obj.totalAmountCollected+'</td><td>'+obj.createdDate+'</td><td>'+obj.status+'</td></tr>';
				/* 	 if(tabValue=='failed'){
						 if(obj.status =='failed'){
							 rows=rows+'<tr  bgcolor="#fff"><td>'+obj.transactionId+'</td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.beneficiary.firstName+' '+obj.beneficiary.lastName+'</td><td>'+obj.sendingAmount+' '+obj.sendingCurrency+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+obj.status+'</td></tr>';	 
						 }
					 }
					 if(tabValue=='cancelled'){
						 if(obj.status =='cancelled' ){
							 rows=rows+'<tr  bgcolor="#fff"><td>'+obj.transactionId+'</td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.beneficiary.firstName+' '+obj.beneficiary.lastName+'</td><td>'+obj.sendingAmount+' '+obj.sendingCurrency+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+obj.status+'</td></tr>';	 
						 }
					 }
					 
					 if(tabValue=='refunded'){
						 if(obj.status =='refunded'){
							 rows=rows+'<tr bgcolor="#fff"><td>'+obj.transactionId+'</td><td>'+obj.createdDate+'</td><td>'+obj.customer.firstName+' '+obj.customer.lastName+'</td><td>'+obj.beneficiary.firstName+' '+obj.beneficiary.lastName+'</td><td>'+obj.sendingAmount+' '+obj.sendingCurrency+'</td><td>'+obj.receipentAmount+' '+obj.receivingCurrency+'</td><td>'+obj.status+'</td></tr>';	 
						 }
					 }
				  */
			 });
			 
			 
			
			 $('#tbody').empty();
			 $('#tbody').append(rows);
		},
		error : function(xhr,error,status){
			//alert("getTransactionListBasedOnFromDateToDate error::"+error);
		}
	});
}

</script>
</head>
<body>
<%@include file="frontendheader.jsp" %>
<section class="transactions">
<input type="hidden" id="customerId" value="${customerId}"/>
<input type="hidden" id="admin" value="${admin}"/>

	<div class="container">
		<div class="row">
		<div class="col-sm-12 transactions-in">
			 <form id="loginForm" method="post">
			 <div class="col-md-9">
               <ul class="nav nav-tabs" role="tablist">
                <li class="active">
                  <a data-toggle="tab" href="#e" role="tab" onclick="getTransactionList('all')" aria-controls="home" aria-selected="true">Money Transfers</a>
                </li>
                <!-- <li>
                  <a data-toggle="tab" href="#airtime" role="tab"   aria-selected="true">Airtime/Data Topupsssssssss</a>
                </li> -->
                
              </ul>
              </div>
              <div class="col-md-3">
               <div class="input-group">
      
      <div class="input-group-btn">
        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
      </div>
     <input type="text" class="form-control" id="search" placeholder="Search..." required>
    </div>
              	 
              </div>
              <div class="tab-content mt-3">
                <div class="tab-pane fade in  active" id="e" role="tabpanel" aria-labelledby="email-tab">
                  <div class="form-group hidden-xs">
                
                  <table class="table table-hover mt-30 mb-80" style="">
                        <thead>
                            <tr >
							   <th rowspan="2">Recipient</th>
			                   <th rowspan="2">Send</th>
						       <th rowspan="2">Payout</th>
					           <th rowspan="2" class="hidden-xs">Fee</th>
							   <th rowspan="2" class="hidden-xs">Total</th>
				               <th rowspan="2">Created</th>				        	
							   <th colspan="2">Status</th>
						  </tr> 
                     </thead>
                     <tbody id="tbody">
                     
        <c:forEach var="list" items="${txnList}">
        <tr>
              <%--        <c:if test="${list.status eq 'paid' }"><tr ></c:if>
                     <c:if test="${list.status eq 'failed' }"><tr ></c:if>
                     <c:if test="${list.status eq 'cancelled' }"><tr></c:if>
                     <c:if test="${list.status eq 'refunded' }"><tr ></c:if>
                     <c:if test="${list.status eq 'pending' }"><tr></c:if> --%>
             		<td> <span ><a style="color:#0e64eb" href="fulldetailmt?txnid=${list.transactionId }">${list.transactionId }</a></span><br>
             		<img src="${pageContext.request.contextPath}/images/countryimages/${list.receivingCurrency.toLowerCase()}.jpg" width="30px" height="30px" class="rounded-circle">&nbsp; ${list.beneficiary.firstName} ${list.beneficiary.lastName}
             		</td>
             		<td><span style="font-size: 69%;font-weight: 600;">${list.sendingCurrency}</span> ${list.sendingAmount} </td>
             		<td><span style="font-size: 69%;font-weight: 600;">${list.receivingCurrency}</span> ${list.receipentAmount} </td>
             		<td class="hidden-xs"><span style="font-size: 69%;font-weight: 600;">${list.sendingCurrency}</span> ${list.totalFee}</td>
             		<td class="hidden-xs"><span style="font-size: 69%;font-weight: 600;">${list.sendingCurrency}</span> ${list.totalAmountCollected}</td>
             		<td>${list.createdDate }</td>
             		<td>${list.status}</td>
             		</tr>
             		</c:forEach>
                     </tbody>
               </table>
               <div id="wait" style="display:none;width:69px;height:89px;position:absolute;top:116%;left:36%;padding:2px;"><img src='${pageContext.request.contextPath}/images/demo_wait.gif' width="107" height="113" /><br>Loading..</div>
                </div>
                
                <div class="visible-xs">
                    <div class="mobile-transcations">
                     <c:forEach var="list" items="${txnlistmap}">
                    <div class="row">
                   
                    <div class="col-xs-12"><p><b>${list.key }</b></p></div>
                      <c:forEach var="innerList" items="${list.value}">
                      <div class="col-xs-6"><p><a href="fulldetailmt?txnid=${innerList.transactionId }">${innerList.transactionId }</a></p></div>
                      <div class="col-xs-6 text-right"><p>${innerList.sendingCurrency} ${innerList.sendingAmount }</p></div>
                      <div class="col-xs-6"><img src="images/countryimages/${innerList.receivingCurrency.toLowerCase()}.jpg" width="30px" height="30px" class="rounded-circle"></div>
                      <div class="col-xs-6 text-right"><p>${innerList.receivingCurrency} ${innerList.receipentAmount }</p></div>
                      
                      <div class="col-xs-6"><p>${innerList.beneficiary.firstName }</p></div>
                      <div class="col-xs-6 text-right"><p>${innerList.status}</p></div>
                      </c:forEach>
                    </div>
                    </c:forEach>
                </div>
                 </div>
                </div>
                
                <div class="tab-pane fade" id="airtime">
                
                
                
                <%-- <table class="table table-hover mt-30 mb-80 hidden-xs" style="">
                        <thead>
                            <tr >
							   <th rowspan="2">TransactionId</th>
			                   <th rowspan="2">Mobile Number</th>
						       <th rowspan="2">Amount</th>
					           <th rowspan="2">Sender Name</th>
							   <th rowspan="2">Date</th>
				               <th rowspan="2">Transaction Status</th>				        	
							   <th colspan="2">Payment Status</th>
						  </tr> 
                     </thead>
                     <tbody id="tbody">
                     
        <c:forEach var="topuptransaction" items="${topUpTransactionList}">
        <tr>
             
             		<td>${topuptransaction.topUpTransactionId}</td>
             		<td>${topuptransaction.destination_msisdn}</td>
             		<td>${topuptransaction.product_requested} ${topuptransaction.destination_currency}/${topuptransaction.retail_price} ${topuptransaction.originating_currency}</td>
             		<td>${topuptransaction.customer.firstName} ${topuptransaction.customer.lastName}</td>
                    <td>${topuptransaction.createdDate}</td>
                    <td>${topuptransaction.transactionStatus}</td>
                    <td>${topuptransaction.paymentStatus}</td>
                                           
             		</tr>
             		</c:forEach>
                     </tbody>
               </table>
 --%>               
               
                 
                <div class="visible-xs">
                    <div class="mobile-transcations">
                    <c:forEach var="listt" items="${txnlistmap}">
                    <div class="row">
                    <div class="col-xs-6"><p><b>${list.key }</b></p></div>
                      <div class="col-xs-6 text-right"><p>Success</p></div>
                      
                      <div class="col-xs-6"><p>9700000303</p></div>
                      <div class="col-xs-6 text-right">21INR</div>
                      <div class="clearfix"></div>
                      <div class="col-xs-6"><p>Umesh Ramidi</p></div>
                      <div class="col-xs-6 text-right"><p>2AUD</p></div>
                     
                      
                    </div>
                    </c:forEach>
                </div>
                 </div>
            
                </div>
             
          
              </div>
                
              
              </form>
              </div>
		</div>
	</div>
</section>
<%@include file="frontendfooter.jsp" %>

</body>
</html>