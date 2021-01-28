<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MajorHeads</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!-- <script src="jquery-3.4.1.min.js"></script> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Rubik:300,300i,400,400i,500,500i,700,700i,900,900i' type='text/css'>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/shortcut.css" />

<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/vendor/font-awesome/css/all.min.css" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/vendor/bootstrap-select/css/bootstrap-select.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/vendor/currency-flags/css/currency-flags.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/vendor/owl.carousel/assets/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/stylesheet1.css" />
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style1.css" />  --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/style3.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/bootstrap.css" />

<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style3.css" /> --%>


<style>
.th{
padding-right:30px;
padding-left:10px;
padding-bottom:10px;
padding-top:10px;
border:1px solid grey;

}
#th{width:30%;}
#tr{
width:20%
}
th{
background:#e4f2ed;}

  input[type=text],textarea{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: none;
  background-color:#e4f2ed;
  color: black;
  border-radius:5px;
  outline:none;
}
#majorHeadNature{
width: 100%;

box-sizing: border-box;
border: none;
background-color:#e4f2ed;
color: black;
border-radius:5px;
outline:none;
}
#button{
background:#a35040;
color:white;
margin-top:15px;
border:none;
margin-right:10px;
border-radius:5px;
outline:none;
padding:8px;
padding-left:20px;

padding-right:20px;
}
</style>
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
						if(majorHeadNature=='Assets'){
							
							result="10"+response;
						
						}
						else if (majorHeadNature=='Liabilities') {
							//majorHeadId=b+response;
							result="20"+response;
						
						}
						else if (majorHeadNature=='Expenses') {
							//majorHeadId=c+response;
							result="30"+response;	
						
						}else if (majorHeadNature=='Revenue') {
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
	 
	  $('#button').click(function(){
		  
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
<body>

<%@include file="backendheader.jsp" %> 
<br><br><br><br><br>
<div class="container">
<div class="row">
  <div class="col-md-3">
  <form action="insertmajorhead" id="majorheadform" method="POST">
     <h6>Category</h6>
  <select class="form-control" name="majorHeadNature"  id="majorHeadNature" 	onchange="validateLevel(majorHeadNature)" 
							onclick="removeError('majorHeadNature')">
   	<option>--select--</option>
						<option value="Equity">Equity</option>
					<option value="Revenue">Revenue</option>
					<option value="Expenses">Expenses</option>
					<option value="Assets">Assets</option>
					<option value="Liabilities">Liabilities</option>
  </select>
  </div>
        <div class="col-md-3">
      <h6>Major Head Name</h6>
      <input type="text"  class="form-control" name="majorHeadName"  id="majorHeadName"  onkeyup="removeError('majorHeadName');">
      </div>
        <div class="col-md-3">
      <h6>Major Head No</h6>
      <input type="text" class="form-control" name="accNo" id="majorHeadId"  onkeyup="removeError('majorHeadId');">
      </div>
      <div class="col-md-3">
      <h6>Description</h6>
      <textarea  rows="1" cols="20" name="description" id="description" onkeyup="removeError('description')"></textarea>
      </div>
</div>
<br>
<div class="t" style="text-align:center;">
<input type="submit" id="button" value="Create"> 
</div>
</form>
<br>
  <table border="1px">
    <tr>
    <th class="th"  id="tr">Major Head ID</th>
    <th class="th"  id="tr">Major Head No</th>
    <th class="th"  id="th">Major Head Name</th>
    <th class="th"  id="th">Description</th>
    <th class="th"  id="tr">Head of account</th>
    <th class="th" >Nature</th>
    <th class="th" >Edit</th>
</tr>

  <c:forEach items="${majorHeadList}" var="majorhead">
      <tr >
      <td>${majorhead.majorHeadId}</td>
         <td>${majorhead.accNo}</td>
        <td>${majorhead.majorHeadName}</td>
        <td>${majorhead.description}</td>
        <td>${majorhead.headOfAccount}</td>
        <td>${majorhead.majorHeadNature}</td>
        
      </tr>
      </c:forEach>
  


  </table>
  </div>

</body>
</html>