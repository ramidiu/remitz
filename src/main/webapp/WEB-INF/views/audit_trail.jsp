<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agent List</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/adm/js/nicEdit-latest.js" ></script>
  <script src="${pageContext.request.contextPath}/resources/adm/js/modal-windowRTF.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
 <style type="text/css">
  th{
font-weight:normal;
font-size:14px;
  }
 .popUpYes:hover
    {
      background-color: #005075;;
      color: white; /* SET COLOR IN BLACK */
    }  
    .popUpYes
    {width:100%;
    cursor: pointer;
    text-decoration: none;
    font-weight: bold;
    color: #464646;
    }
  </style>
</head>
<body>
<br>
<%@include file="headerNew.jsp" %>
<div class="container-fluid">
<div class="row">

<div class="col-md-1"></div>
<div class="col-md-11">
<h6>Audit Trail</h6>
</div>
<div class="col-md-1"></div>
<div class="col-md-9">
<div class="row">
<div class="col-md-3 ">
<labe>Start date</labe>
<input type="date" name="fdate" id="fdate" class="form-control">
</div>
<div class="col-md-3 ">
<labe>End date</labe>
<input type="date" name="tdate" id="tdate"  class="form-control">
</div>
<br>
<div class="row">
<div class="col-md-3 ">
<label>Username</label>
<input type="text" name="username" id="username"  class="form-control"></div>

<div class="col-md-3 ">
<label>Agent Code</label>
<input type="text" name="agent" id="agent" class="form-control"></div>


</div><br>
<div class="row">
<div class="col-md-3">
<input type="submit" class="form-control popUpYes" onclick="getList();"  style="margin-top:25px;">
</div>
</div><br>
</div></div>

<div class="row">
<div class="col-md-1"></div>
<div class="col-md-11">
<table class="table table-bordered">
<thead>
<tr style="background: #0c036c;padding:5px;color:white;">
<th>Date</th>
<th>CATEGORYs</th>
<th>Username</th>
<th>UserType</th>
<th>IP Address</th>
<th>Source Country</th>
<th>Agent</th>
<th>Transaction</th>
<th>Message</th>
<th>Original Data</th>
<th>Changed Data</th>
</tr>
</thead>
    <tbody class="list">
     <c:forEach items="${list}" var="list">
      <tr>
               <td class="text-center">${list.date}</td>
          <td class="text-center">${list.category}</td>
         <td class="text-center">${list.userName}</td>
         <td class="text-center">${list.userType}</td>
         <td class="text-center">${list.ipAddress}</td>
           <td class="text-center">${list.sourceCountry}</td>
           <td class="text-center">${list.agent}</td>
          <td class="text-center">${list.transaction}</td>
         <td class="text-center">${list.message}</td>
         <td class="text-center">${list.originalData}</td>
         <td class="text-center">${list.changedData}</td>

</tr>
 </c:forEach>
    </tbody>


</table>

</div>
</div>
</div>

</div>
</div>

</body>
<script type="text/javascript">
function getList(){
	var date1=$('#fdate').val();
	var date2=$("#tdate").val();
	var agent=$('#agent').val();
	var username=$('#username').val();
	alert('logondate===='+date1);
	alert('logoffdate==='+date2);
	alert('userType===='+agent);
	alert('username==='+username);
	var data='';
	var url='';
	if(date1!='' && username=='' && agent==''){
		if(date2==''){
			alert('please select end  date ');
			return false;
		}
		data="date1="+date1+"&date2="+date2;
		url="getAdtListbwdates";
	}
	if(agent!='' && date1!='' && date2!='' && username==''){
		data="date1="+date1+"&date2="+date2+"&agent="+agent;
		url="getListbwdatesAndagent";
		
	}
	if(username=='' && date1!='' && date2!='' && username!=''){
		data="date1="+date1+"&date2="+date2+"&username="+username;
		url="getListbwdatesAndUsername";
		
	}

	if(agent!='' && date1!='' && date2!='' && username!=''){
		data="date1="+date1+"&date2="+date2+"&username="+username+"&agent="+agent;
		url="getListbwdatesAndUsernameAndAgent";
	
	}
	if(agent!='' && date1=='' && date2=='' && username=='' ){
	data="agent="+agent;
	url="getListByAgent";
	}
	if(agent=='' && date1=='' && date2=='' && username!='' ){
		data="username="+username;
		url="getListByusername";
		}
alert('data===='+data);
alert('url====='+url);
$.ajax({
	  url:url,
	  type:'POST',
	  data:data,
	  success:function(response)
	  {
		  alert('response==='+response);
	  },
		error:function()
		{
			alert("get AccessLogs error");
		}

			
	  }); 
			

}


</script>
</html>