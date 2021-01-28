<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Email Template</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/adm/js/nicEdit-latest.js" ></script>
  <script src="${pageContext.request.contextPath}/resources/adm/js/modal-windowRTF.js"></script>
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
        	<script type="text/javascript">
        	bkLib.onDomLoaded(function() {
        	    nicEditors.editors.push(new nicEditor().panelInstance(document.getElementById('rtext')));
        	    $("div.nicEdit-main").keydown(function(event) {
        	    });
        	 });
        	</script> 
        	<script type="text/javascript">
        	
        	</script>
  <script type="text/javascript">
  $(document).ready(function(){
	  $('#newtitlediv').hide();
	  /* getDetails(); */
	  
	 $('#save').click(function(){
		 var nicE1 = new nicEditors.findEditor('rtext');
     	var data = nicE1.getContent();
     	if(data.length < 5){
     		alert("Template can't be empty.....!");
     		return false;
	     	}
     	$('#template').val(data);
	 }); 
	 
	 $('#pluse').click(function(){
		 $('#newtitlediv').show(); 
	 });
	 $('#title').change(function(){
		 $('#newtitlediv').hide();
		 var titleId=$('#title').val();
		 titleId=titleId.split('-');
		// alert('titleId==='+titleId);
		 window.location='gettemplatebasedonid?id='+Number(titleId[0]);
		/*  getDetails(); */
		 
	 });
	 $('#addnew').click(function(){
		 var newtitle=$('#newtitle').val();
		 if(newtitle==''){
			 $('#newtitle').focus().css('outline','solid red 2px');
			 return false;
		 }
		 $('#newttl').val(newtitle);
		 $('#addnewtitleform').submit();
	 })
	 
  });
  
  </script>
 
  <script type="text/javascript">
function removeError(id){
	$('#'+id).css('outline','#B0C4DE');
}
</script>
</head>
<body>
<%-- <%@include file="sidenav1.jsp" %> --%>
<%@include file="backendheader.jsp" %>
<form action="addEmailTemplates" id="addnewtitleform" method="post">
<input type="hidden" id="newttl" name="newtitle" value="">
<input type="hidden" name="flag" value="addnewtitle">

</form>
<div class="email">
<span style="margin: 0 0 0 393px;font-size: xx-large;font-family: fantasy;display: table-footer-group;">Email Template</span><br>
<form action="addEmailTemplates" method="post" id="submitform">
<input type="hidden" id="template" name="template" value=""/>

<div>
<label>Template For :</label>
<select class="selectpicker" id="title" name="title" data-live-search="true" data-style="custom-select bg-transparent border-0" data-container="body">
<c:forEach var="list" items="${list}">
<c:choose>
<c:when test="${emailTemplate.emailCode eq list.emailCode}">
<option value="${list.emailCode}-${list.title}" selected>${list.title}</option>
</c:when>
<c:otherwise>
<option value="${list.emailCode}-${list.title}">${list.title}</option>
</c:otherwise>
</c:choose>

</c:forEach>
</select> <!-- <div style="margin: -30px 0 0 462px;">
<button type="button" id="pluse"><i class="fas fa-plus-square"></i></button></div> -->
<!-- <div style="margin: -27px 0 0 541px;" id="newtitlediv"><input type="text" id="newtitle"  placeholder="add new title" size="35"onkeyup="removeError('newtitle');"><button type="button" id="addnew" style="margin-left: 10px;background-color: #e4ac3b;border: double;">Add New</button></div> -->
</div>
<div>
<label>Email Subject :</label>
<input type="text" id="subject" name="subject" required value="${emailTemplate.subject}">
</div>
<div>
<label>REPLY Email : </label>
<input type="email" id="replyEmail" name="replyEmail" placeholder="kji@gmail.com" required value="${emailTemplate.replyEmail}"> 
</div>
<div>
<label>CC Email : </label>
<input type="text" id="ccEmail" name="ccEmail" required value="${emailTemplate.ccEmail}">
</div>
<span style="font-size: 10px;margin: 0 0 0 78px;margin-left: 77px;color: brown;" >(Comma separator)</span>
<div>
<label>BCC Email : </label>
<input type="text" id="bccEmail" name="bccEmail" placeholder="abc@yahoo.com" required value="${emailTemplate.bccEmail}">
</div>
<span style="font-size: 10px;margin: 0 0 0 78px;margin-left: 77px;color: brown;">(Comma separator)</span>

<br><label>Email Template :</label>
</div>
<div style="margin-left: 352px;">
<div class="page-wrapper box-content">
            <textarea id="rtext"name="example" rows="7" style="width:700px; height:200px">${emailTemplate.template}</textarea>
        </div>
     <input type="submit" id="save" style="background-color: green;margin: 10px 0 0 653px;" value="Edit">
</div>
</form>

</body>
</html>