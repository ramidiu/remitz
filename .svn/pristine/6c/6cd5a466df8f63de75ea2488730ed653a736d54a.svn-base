<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>senderIdTypes</title>
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
<%@include file="backendheader.jsp" %>

<form action="SenderIdTypes" method="post">
                                    <div class="clearfix"></div>
<!--                  <a href="relationShips1"  class="btn btn-alt-secondary">AddRealationShips</a><br><br>
 -->                                    
                                    <h5>SenderIdTypes Listing</h5>
                                    <div class="block col-md-12 p-10">
                                            <div class="row">
                                            
                                    	
                           
                            <div class="col-lg-12">
                               
                                         <div class="">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
                                                <thead class="table-primary">
                                                  <tr>
                                                    <th scope="col">AdminId</th>
                                                    <th scope="col">sIdNo</th>
                                                     <th scope="col">issuingAuthority</th>
                                                    <th scope="col">sIdType</th>
                                                    <th scope="col">Edit</th>
                                                    <th scope="col">Delete</th>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                  <c:set var="count" value="0"/>
                                                
     <c:forEach items="${list}" var="list">
      <tr>
          <td>${list.admin.adminId}</td>
         <td>SDT${list.senderId}</td>
         <td><input type="text" name="issuingAuthority" id="issuingAuthority${count}" value="${list.issuingAuthority}"></td>
       <input type="hidden" id="senderId${count}" value="${list.senderId}">
       <input type="hidden" id="adminId${count}" value="${list.admin.adminId }">
         <td><input type="text" name="senderType" id="senderType${count}" value="${list.senderType}"></td>
    <td><button type="button" class="btn btn-alt-primary" id="update" onclick="updateRecord('${count}' ,'${list.senderId}','${list.admin.adminId}','${list.senderType}','${list.issuingAuthority}');">UPDATE</button></td>   
   <td><a href="deleteSenderIds?senderId=${list.senderId}" class="btn btn-alt-danger">delete</a></td>
        
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
function updateRecord(count,senderId,senderType,adminId,issuingAuthority){
	alert('5678');
	var message="";
	var senderId=$('#senderId'+count).val();
	alert('senderId==='+senderId);
	 var senderType=$('#senderType'+count).val();
	 alert('senderType===='+senderType);
	 var adminId=$('#adminId'+count).val();
	 alert('adminId==='+adminId);
	 var issuingAuthority=$('#issuingAuthority'+count).val();
	 alert('issuingAuthority===='+issuingAuthority);
var data="senderId="+senderId+"&senderType="+senderType+"&adminId="+adminId+"&issuingAuthority="+issuingAuthority;
alert("data==="+data);
$.ajax({
	type:"POST",
	url:"updateSenderId",
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