<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Key</title>
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
<form action="adminKey" method="post">
                                    <div class="clearfix"></div>
<!--                  <a href="adminKey"  class="btn btn-alt-secondary">AddAdminKey</a><br><br>
 -->                                    
                                    <h5 style="background: #2e287b;color:white;padding:5px;text-align:center">AdminKey</h5>
                                    <div class="block col-md-12 p-10">
                                            <div class="row">
                                            
                                    	
                           
                            <div class="col-lg-12">
                               
                                         <div class="">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
                                                <thead class="table-primary">
                                                  <tr style="background: #2e287b;color:white;padding:5px;text-align:center">
                                                    <th scope="col">AdminId</th>
                                                    <th scope="col">keyId</th>
                                                    <th scope="col">FromEmail</th>
                                                    <th scope="col">key</th>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                
     <c:forEach items="${list}" var="list">
      <tr>
          <td>${list.admin.adminId}</td>
         <td>${list.mailId}</td>
         <td>${list.fromEmail}</td>
         <td>${list.mailKey}</td>
  </tr>
      
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
function updateRecord(count,relationId,sourceOfFund,adminId){
	var message="";
	var relationId=$('#relationId'+count).val();
	//alert('sourceOffundId==='+sourceOffundId);
	 var relationShip=$('#relationShip'+count).val();
	 //alert('sourceOfFund==='+sourceOfFund);
	 var adminId=$('#adminId'+count).val();
	 //alert('adminId==='+adminId);
	//$('#updateFundForm').submit();
var data="relationShip="+relationShip+"&relationId="+relationId+"&adminId="+adminId;
//alert('data==='+data);
$.ajax({
	type:"POST",
	url:"updateRelationShip",
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