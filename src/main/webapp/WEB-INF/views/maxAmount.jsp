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
<title>idTypesLimits</title>
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
 				<form  method="POST" action="addmaxAmount" > 
 				<input type="hidden" id="adminId" value="${adminId}"/>
					<div class="form-group col-md-12">
					<table class="table table-bordered">
					    <tr>
					    <td>
					  <select class="form-control custom-select" id="branchId" name="branchId" onchange="removeError('branchId');">
					<option value="">---select------</option>
					
					<c:forEach items="${branches}" var="branches">
					<c:set var="count" value="0"/>
 					<c:forEach items="${ma}" var="ma">
					<c:if test="${branches.branchId eq ma.branch.branchId and branches.admin.adminId eq ma.admin.adminId}">
					 <c:set var="count" value="${count + 1}"/>
					  </c:if> </c:forEach>
					<c:if test="${count eq 0}">
					<option value="${branches.branchId}">${branches.fromCountry.countryName}</option>
					</c:if>
					</c:forEach></select></td>
	               <br>
	               <td>
	               <div>
	               <input type="text" name="amount" id="amount" >
	               </div></td>
	               								<td>
											<div class="form-group col-md-12 text-center">
						<button type="submit" id="submitBtn" class="btn btn-primary btn-alt-primary" >REGISTER</button>
					</div>
								</td>
	               
	               
	               </tr></table></div></form></div></section></div>
 		                                    <h5 style="background: #2e287b;color:white;padding:5px;text-align:center">AML Listing</h5>
                                    <div class="block col-md-12 p-10">
                                            <div class="row">
                                            
                                    	
                           
                            <div class="col-lg-12">
                               
                                         <div class="">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
                                                <thead class="table-primary">
                                                  <tr style="background: #2e287b;color:white;padding:5px;text-align:center">
                                                    <th style="text-align: center" scope="col">MAXAmountId</th>
                                                    <th style="text-align: center" scope="col">AdminId</th>
                                                    <th style="text-align: center" scope="col">BranchId</th>
                                                     <th style="text-align: center" scope="col">Amount</th>
                                                     <th style="text-align: center" scope="col">Update</th>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                  <c:set var="count" value="0"/>
                                                
     <c:forEach items="${ma}" var="list">
      <tr>
           <td style="text-align:center">${list.maxAmountId}</td>
       <input type="hidden" id="maxAmountId${count}" value="${list.maxAmountId}">
          <td style="text-align:center">${list.admin.adminId}</td>
         <td style="text-align:center">${list.branch.fromCountry.countryName}</td>
         <td style="text-align:center"><input type="text" name="amount" id="amount${count}" value="${list.amount}"></td>
    <td style="text-align:center"><button type="button" class="btn btn-primary btn-alt-primary" id="update" onclick="updateRecord('${count}' ,'${list.maxAmountId}','${list.admin.adminId}','${list.amount}');">UPDATE</button></td>   

 </tr>
                                                   <c:set var="count" value="${count + 1}"/>  
                                             <input type="hidden" id="totalCount" value="${count}">
 
      
                  </c:forEach>
                                                </tbody>
                                            </table>
                                        </div></div></div></div></div></main>
      


</body>
<script type="text/javascript">
function updateRecord(count,maxAmountId,amount,adminId){
	var message="";
	var maxAmountId=$('#maxAmountId'+count).val();
	//alert('maxAmountId==='+maxAmountId);
	 var amount=$('#amount'+count).val();
	 //alert('amount==='+amount);
	 var adminId=$('#adminId').val();
	 //alert('adminId==='+adminId);
var data="maxAmountId="+maxAmountId+"&amount="+amount;
//alert('data==='+data);
$.ajax({
	type:"POST",
	url:"updateAmount",
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
