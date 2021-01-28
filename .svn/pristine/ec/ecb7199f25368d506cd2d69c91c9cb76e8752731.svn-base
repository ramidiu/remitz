<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reason For Transfer</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/adm/js/nicEdit-latest.js" ></script>
  <script src="${pageContext.request.contextPath}/resources/adm/js/modal-windowRTF.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
<style type="text/css">
.email{
margin: 89px 0 0 268px;
font-family: Coronetscript, cursive;
color: #086af3;
font-weight: bold;
}
 .label{
font-size: 17px;
} 
</style>
<body>
<%@include file="headerNew.jsp" %>
<div class="container">
<form action="reasonForTransfer" method="post">
                                    <div class="clearfix"></div>
<!--                   <a href="reasonForTransfer"  class="btn btn-alt-secondary">AddReasonForTransfer</a><br><br>
 -->                                    
                                    <h5 style="background: #2e287b;color:white;padding:5px;text-align:center"
                                    >RelationShips Listing</h5>
                                    <div class="block col-md-12 p-10">
                                            <div class="row">
                                            
                                    	
                           
                            <div class="col-lg-12">
                               
                                         <div class="">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
                                                <thead class="table-primary">
                                                  <tr style="background: #2e287b;color:white;padding:5px;text-align:center"
                                                  >
                                                    <th class="text-center" scope="col">AdminId</th>
                                                    <th class="text-center" scope="col">ReasonForTransferId</th>
                                                    <th class="text-center" scope="col">ReasonForTransfer</th>
                                                    <th class="text-center" scope="col">Edit</th>
                                                    <th class="text-center" scope="col">Delete</th>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                  <c:set var="count" value="0"/>
                                                
     <c:forEach items="${list}" var="list">
      <tr>
          <td class="text-center">${list.admin.adminId}</td>
         <td class="text-center">${list.reasonFortransferId}</td>
       <input type="hidden" id="reasonFortransferId${count}" value="${list.reasonFortransferId}">
       <input type="hidden" id="adminId${count}" value="${list.admin.adminId }">
         <td class="text-center"><input type="text" name="reasonForTransfer" id="reasonForTransfer${count}" value="${list.reasonForTransfer}"></td>
    <td class="text-center"><button type="button" class="btn btn-primary btn-alt-primary" id="update" onclick="updateRecord('${count}' ,'${list.reasonFortransferId}','${list.admin.adminId}','${list.reasonForTransfer}');">UPDATE</button></td>   
   <td class="text-center"><a href="deleteReasonForTransfer?reasonFortransferId=${list.reasonFortransferId}" class="btn btn-danger btn-alt-danger">delete</a></td>
        
  </tr>
                                                  <c:set var="count" value="${count + 1}"/>  
                                             <input type="hidden" id="totalCount" value="${count}">
      
                  </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        
</div>

</form>

</body>

<script type="text/javascript">
function updateRecord(count,reasonFortransferId,reasonForTransfer,adminId){
	var message="";
	var reasonFortransferId=$('#reasonFortransferId'+count).val();
	//alert('sourceOffundId==='+sourceOffundId);
	 var reasonForTransfer=$('#reasonForTransfer'+count).val();
	 //alert('sourceOfFund==='+sourceOfFund);
	 var adminId=$('#adminId'+count).val();
	 //alert('adminId==='+adminId);
	//$('#updateFundForm').submit();
var data="reasonForTransfer="+reasonForTransfer+"&reasonFortransferId="+reasonFortransferId+"&adminId="+adminId;
//alert('data==='+data);
$.ajax({
	type:"POST",
	url:"updateReasonForTranser",
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
</html>