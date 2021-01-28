<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script async src="js/user_timeline.json"></script>
<title>Major Head</title>



<script type="text/javascript">
	function validateLevel(majorHeadNature) {
		 alert('majorHeadNature');
		 //var adminId=$('#adminId').val();
				  var majorHeadNature = $('#majorHeadNature').val();
				 alert('majorHeadNature'+majorHeadNature);
				 
				 $.ajax({
					
					url : '/getMajorHeadCount',
					data : "majorHeadNature="+majorHeadNature,
					type :'get',
			
				
					success : function(response){
						alert("successssssss::::");
						var result='';
						if(majorHeadNature=='Equity'){
							
							result="10"+response;
						
						}
						else if (majorHeadNature=='Revenue') {
							//majorHeadId=b+response;
							result="20"+response;
						
						}
						else if (majorHeadNature=='Expenses') {
							//majorHeadId=c+response;
							result="30"+response;	
						
						}else if (majorHeadNature=='Assets') {
							//majorHeadId=d+response;
							result="40"+response;	
							
						}else{
							//majorHeadId=e+response;
							result="50"+response;	
							
						}
						alert("ressssss"+result);
						$('#majorHeadId').val(result);
					alert('success1');	
					},
				
					error : function(xhr, status, error) {
						alert("error::::"+error);
					}
				 });
 		 }
		
		
</script>
 




<script type="text/javascript">
$(document).ready(function(){
	 
	  $('#submit').click(function(){
		  alert("df");
		  var headOfAccount=$('#headOfAccount').val();
		  var majorHeadNature=$('#majorHeadNature').val();
		  var majorHeadName=$('#majorHeadName').val();
		  var majorHeadId=$('#majorHeadId').val();
		  var description=$('#description').val();
		  
		  if(headOfAccount==""){
			  $('#headOfAccount').focus().css('outline','solid red 2px');
			  return false;
		  }
		  if(majorHeadNature==""){
			  $('#majorHeadNature').focus().css('outline','solid red 2px');
			  return false;
		  }
		  if(majorHeadName==""){
			  $('#majorHeadName').focus().css('outline','solid red 2px');
			  return false;
		  }
		   var testVal = '';
		  if(majorHeadId==""){
			  $('#majorHeadId').focus().css('outline','solid red 2px');
			 
			  return false;
		  }else{
			     $.ajax({
			    	url : "checkmajorheadid",
					 data : "majorHeadId="+majorHeadId+ "&majorHeadNature="+majorHeadNature,
					 type : "POST",
					 async : false,
					success : function(response){
						if($.trim(response)=='exist'){
							$('#majorHeadId').focus().css('outline', '2px solid red');
							
							alert('MajorHeadId is already Exist');
							testVal = '1';
							return false;
						}
					},
					error : function(xhr,status,error){
						alert("error:::"+error);
					}
				}); }
		   if(testVal!=''){
				return false;
			}  
		 	if(description==""){
			  $('#description').focus().css('outline','solid red 2px');
			  return false;
		  }
		  });
	  
			 	
		  
	  });
	  
	  

	  </script>






<script type="text/javascript">
function removeError(id){
	$('#'+id).css('outline','#B0C4DE');
}
</script>

</head>
<style>
.bg-primary {
    position: relative;
    color: #fff;
    background-color: #337ab7;
    left: -15px;
    padding: 10px;
  width: 1170px;
}
.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th {
    border: 1px solid #ccc !important;
}
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 8px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 1px solid #ccc !important;
}
</style>

<body>

<%@include file="headerNew.jsp" %>
<%-- <%@include file="sidenav.jsp" %> --%>
<div class="majorhead pt-70">
	<div class="container">
		<div class="row">
			<div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12  pb-50 " style=" width: 100%;display: block;margin: 0 0px;">
			<form action="insertmajorhead" id="majorheadform" method="POST">
			<h3 class="admin-heading">Major Head</h3>
			<!-- <div class="col-md-3">
				<label>Head Account*</label>
				<select class="form-control" name="headOfAccount" id="headOfAccount" onclick="removeError('headOfAccount')">
					<option value="Maharba">Maharba</option>
					
				</select>
			</div> -->
			<div class="col-md-3">
				<label>Category*</label>
				<select class="form-control" name="majorHeadNature"  id="majorHeadNature" 	onchange="validateLevel(majorHeadNature)" 
							onclick="removeError('majorHeadNature')">
							<option value="">---select---</option>
						<option value="Equity">Equity</option>
					<option value="Revenue">Revenue</option>
					<option value="Expenses">Expenses</option>
					<option value="Assets">Assets</option>
					<option value="Liabilities">Liabilities</option>
				
				</select>
			</div>
			<div class="col-md-3">
				<label>Major Head Name*</label>
				<input type="text" class="form-control" name="majorHeadName"  id="majorHeadName"  onkeyup="removeError('majorHeadName');">
			</div>
			<div class="col-md-3"> 
				<label>Major Head No*</label>
				<input type="text" class="form-control" name="accNo" id="majorHeadId"  onkeyup="removeError('majorHeadId');">
			</div>
			<div class="col-md-3 mt-20">
				<label>Desicription</label>
				<textarea class="form-control" name="description" id="description" onkeyup="removeError('description')"></textarea>
			</div>
			<div class="col-md-12">
				 <button type="submit" id="submit" class="btn btn-blue btn-submit center-block mt-20 mb-20">Create</button>
			</div>
			</form>
			<table class="table table-bordered">
    <thead>
      <tr class="bg-blue">
        <th>Major Head No</th>
        <th>Major Head Name</th>
        <th>Description</th>
        <th>Head of account</th>
        <th>Nature</th>
        
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${majorHeadList}" var="majorhead">
      <tr >
         <td>${majorhead.accNo}</td>
        <td>${majorhead.majorHeadName}</td>
        <td>${majorhead.description}</td>
        <td>${majorhead.headOfAccount}</td>
        <td>${majorhead.majorHeadNature}</td>
        
      </tr>
      </c:forEach>
    </tbody>
  </table>
			</div>
		</div>
	</div>
</div>
</body>
</html>