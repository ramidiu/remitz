<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <link rel="stylesheet" href="/superadmin/style.css">
<title>Transaction Limits</title>
<style>



</style>
</head>
<body>
<%@include file ="headerNew.jsp" %>
<div class="container">
<main id="main-container">
              
                <div class="content"><h3 class="header-title mb-3" style="background: #2e287b;color:white;padding:5px;text-align:center">IdTypesLimits</h3> 
	<section class="block p-20">
				     <div class="row">
 				<form  method="POST" action="addTxLimits" > 
 				<input type="hidden" id="adminId" value="${adminId}"/>
					<div class="form-group col-md-12">
					<table class="table">
					    <tr>
					    <td>
					    <label>Select country</label>
					  <select class="form-control custom-select" id="branchId" name="branchId" onchange="removeError('branchId');">
					<option value="">---select------</option>
					
					<c:forEach items="${branches}" var="branches">
					<option value="${branches.branchId}">${branches.fromCountry.countryName}</option>
					</c:forEach></select></td>
	               <br>
	               <td>
	               <div>
	               <label>select Limit</label>
	              <select class="form-control custom-select" id="limitDays" name="limitDays" onchange="removeError('branchId');">
					<option value="">---select------</option>
					<option value="30">30 Days</option>
					<option value="90">90 Days</option>
					<option value="365">365 Days</option>
	            
	               </div></td>
	               								<td>
											<div class="form-group col-md-12 text-center">
						<button type="submit" id="submitBtn" class="btn btn-primary btn-alt-primary" >REGISTER</button>
					</div>
								</td>
	               
	               
	               </tr></table></div></form></div></section></div>
 		                                    <h5 style="background: #2e287b;color:white;padding:5px;text-align:center">TransactionLimits Listing</h5>
                                    <div class="block col-md-12 p-10">
                                            <div class="row">
                                            
                                    	
                           
                            <div class="col-lg-12">
                               
                                         <div class="">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
                                                <thead class="table-primary">
                                                  <tr style="background: #2e287b;color:white;padding:5px;text-align:center">
                                                    <th scope="col">TxId</th>
                                                    <th scope="col">AdminId</th>
                                                    <th scope="col">BranchId</th>
                                                     <th scope="col">LimitDays</th>
                                                     <th scope="col">Update</th>
                                                  </tr>
                                                </thead>
                                                <tbody><br>
                                                  <c:set var="count" value="0"/>
                                                
     <c:forEach items="${tx}" var="list">
      <tr>
           <td>${list.txId}</td>
       <input type="hidden" id="txId${count}" value="${list.txId}">
          <td>${list.admin.adminId}</td>
         <td>${list.branch.fromCountry.countryName}</td>
         <td><input type="text" name="limitDays" id="limitDays${count}" value="${list.limitDays}"></td>
    <td><button type="button" class="btn btn-primary btn-alt-primary" id="update" onclick="updateRecord('${count}' ,'${list.txId}','${list.admin.adminId}','${list.limitDays}');">UPDATE</button></td>   

 </tr>
                                                   <c:set var="count" value="${count + 1}"/>  
                                             <input type="hidden" id="totalCount" value="${count}">
 
      
                  </c:forEach>
                                                </tbody>
                                            </table>
                                        </div></div></div></div></div></main>
      


</body>
<script type="text/javascript">
function updateRecord(count,txId,limitDays,adminId){
	var message="";
	var txId=$('#txId'+count).val();
	//alert('maxAmountId==='+maxAmountId);
	 var limitDays=$('#limitDays'+count).val();
	 //alert('amount==='+amount);
	 var adminId=$('#adminId').val();
	 //alert('adminId==='+adminId);
var data="txId="+txId+"&limitDays="+limitDays;
alert('data==='+data);
$.ajax({
	type:"POST",
	url:"updateDays",
	async  : false,
	data:data,
	success:function(response){
		if(response=='updated')
			
		 location.reload(true); 
		
			message="updated successfully";
			
	},
	error:function()
	{
	message="error at server side";
	
	}
	}) 
	
}
</script>
