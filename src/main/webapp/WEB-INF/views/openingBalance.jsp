<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>jQuery UI Autocomplete - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>bankbalance</title>

<script type="text/javascript">
$(document).ready(function(){
	 //alert('dfs')
		date();
	  $('#submit').click(function(){
	 //alert("submit");
     		 var majorHeadNature=$('#majorHeadNature').val();
		  var subName=$('#subName').val(); 
		  var fin=$('#fin').val();
		  var cdType=$('#cdType').val();
		  var openingAmount=$('#openingAmount').val();

		  if(majorHeadNature==""){
			  //alert(subName+"========subName");
			  $('#majorHeadNature').focus().css('outline','solid red 2px');
			 
			  return false;
		  }
		  if(subName==""){
			  //alert(subName+"========subName");
			  $('#subName').focus().css('outline','solid red 2px');
			 
			  return false;
		  }else{
			  
			  var sh=subName;
			  var n=sh.length;
			  //alert(n);
			  }
		  
		  if(subName.length==3 || subName.length==6){
				$('#emsg').empty();
				$('#emsg').append("<font color='red'>Select Minor Heads Only!</font>");
				//alert('this email/phone is already exist...!');
				$('#subName').focus().css('outline','solid red 2px');
				return false;

		  }
 
		  if(fin==""){
			  //alert(subName+"========subName");
			  $('#fin').focus().css('outline','solid red 2px');
			 
			  return false;
		  }
		   if(cdType==""){
			  //alert(subName+"========subName");
			  $('#cdType').focus().css('outline','solid red 2px');
			 
			  return false;
		  }
		  
				    	if(openingAmount==""){
		    		//alert(openingAmount+"===========openingAmount");
			  $('#openingAmount').focus().css('outline','solid red 2px');
			  return false;
		  
		    		}
						$.ajax({
		    				url : "checkcurrentYr",
		    				method : "post",
		    				data : "subName="+subName+"&fin="+fin,
		    				 async : false,
		    				success : function(response){
		    					alert(response)
		    					 if(response==success){
		    					alert("result=="+response);
		    					}
		    					else{
		    						alert("success");
		    					}
		    				},
		    				
		    			});
		 
		    	
	    		    	 });
	  });
	  
	  

	  </script>
<script>
</script>

<script type="text/javascript">
	function validateHeads() {
	
		$('#natureId').val($('#majorHeadNature').val());
		$('#getAllHeadsForm').attr('action', 'openingB');
		$('#getAllHeadsForm').attr('method', 'get');
		$('#getAllHeadsForm').submit();

	}
</script>
<script>
function date(){
	var fin=$("#fin").val();	
}
$(document).ready(function(){
	date();
}); 

</script>
<script>
var fin=('#fin').val();
$( "#fin" ).selectable({
	  appendTo: "#fin"
	});
</script>
</head>

<body>
	<form id="getAllHeadsForm">
		<input type="hidden" id="natureId" name="natureId" value="">
	</form>

<form action="openBal" id="openBal" method="POST">
<%
if(session.getAttribute("adminId")!=null) {
	String fin = "";
	
		fin = request.getParameter("fin");
	}
%>
<table>

			<h3 class="admin-heading">Balance Entry Form</h3>
			<tr>
			<td>
			Category
			</td>
			<td>Bank Name*</td>
			<td>
				Select FinYr*</td>
			<td>Type</td>
			
			<td>Amount</td>		
			</tr>
			
			<tr>
			
			
			<td>
				<select class="form-control" name="majorHeadNature"  id="majorHeadNature" 	onchange="validateHeads()">
				 <option>    ---select----</option>      
							<option value="Liabilities" ${nature=='Liabilities'?'selected':''}>Liability</option>
							<option value="Assets" ${nature=='Assets'?'selected':''}>Assets</option>
							<option value="Revenue" ${nature=='Revenue'?'selected':''}>Revenue</option>
							<option value="Equity" ${nature=='Equity'?'selected':''}>Equity</option>
							<option value="Expenses" ${nature=='Expenses'?'selected':''}>Expenses</option>
						
				
				</select>
	</td>
			
			<td><select class="form-control" id="subName"
							name="subName"
>
							<option value="">--select--</option>
			<c:if test="${fn:length(majorHeadList) > 0}">
			<c:forEach var='mList' items="${majorHeadList}">
			<option value="${mList.accNo}">${mList.accNo}-${mList.majorHeadName}</option>
							
							
			<c:if test="${fn:length(minorHeadList) > 0}">
          	<c:forEach var = 'minList' items="${minorHeadList}">
          	<c:if test="${(minList.majorHead.majorHeadId eq mList.majorHeadId) && (minList.createdBy eq adminId)}">
          	<option  value="${minList.accNo}">${minList.accNo}-${minList.minorHeadName}</option>
			
			<c:if test="${fn:length(subHeadList) > 0}">
          	<c:forEach var = 'sList' items="${subHeadList}">
          	<c:if test="${(sList.minorHead.minorHeadId eq minList.minorHeadId) && (sList.createdBy eq adminId)}">
          	<option  value="${sList.accNo}">${sList.accNo}-${sList.subHeadName}</option>
			
			
			
			
				          	 	</c:if>
								</c:forEach>
								</c:if>
			
			
			
			
				          	 	</c:if>
								</c:forEach>
								</c:if>
								</c:forEach>
							</c:if>
							</select>
			<label id="emsg"></label></td>
			
						
			<td><select class="form-control" name="fin" id="fin" Onchange="date();" >
  			
  		<option value="">----SELECT----</option>
  		<option value="2020-21" name="year" <%if(request.getParameter("fin") != null && request.getParameter("fin").equals("2020-21")) {%> selected="selected"<%} %>>2020-2021</option>
 					<option value="2019-20" name="year" <%if(request.getParameter("fin") != null && request.getParameter("fin").equals("2019-20")) {%> selected="selected"<%} %>>2019-2020</option>
					<option value="2018-19" name="year" <%if(request.getParameter("fin") != null && request.getParameter("fin").equals("2018-19")) {%> selected="selected"<%} %>>2018-2019</option>
	</select>
			</td>
			
			
				
				<td><input type="radio" class="form-control" name="cdType" id="cdType" value="debit" ><b>debit</b>
                <input type="radio" class="form-control" name="cdType" id="cdType" value="credit" ><b>credit</b>
				
			</td>
			
		
			<td>	<input type="text" class="form-control" name="openingAmount" id="openingAmount"  onkeyup="removeError('amount');">
			</td>
			
			<td>
				 <button type="submit" id="submit"  "btn btn-blue btn-submit center-block mt-20 mb-20">Create</button>
			</td>
			</form>

</body>
</html>