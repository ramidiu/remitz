<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<meta charset="ISO-8859-1">
<style>
ul {
 list-style-type: none;
 margin: 0;
 padding: 0;
 overflow: hidden;
 background-color: #333;
}

li {
 float: left;
}

li a {
 display: block;
 color: white;
 text-align: center;
 padding: 14px 16px;
 text-decoration: none;
}

li a:hover {
 background-color: #111;
}
</style>
</head>

<body>

<ul>
 <li><a href="postjob">postjob</a></li>
 <li><a href="usersList">userslist</a></li>
  <li><a href="appliedUsersList">AppliedjobsList</a></li>
  <li><a href="jobsCount">jobCount</a>
 <li><a href="logOutAdmin">Logout</a></li>
</ul>
<h1>JOB PORTAL</h1>
<h2>Admin index</h2>
<!-- <h4 style="background-color:green;color:#fff;padding:8px 8px 8px 8px;text-align:center" id="success"></h4> -->
<br>
<input type="hidden" id="selectedJobs" name="selectedJobs" value=""/>
<input type="hidden" name="status" value="" id="status"/>

<form action="adminDashboard" method="Get" id="frm">
 <select name="status" id="status" onchange="resetStatus()">
 <option value="active" ${status eq 'active'?'selected':''}>active</option>
 <option value="inactive" ${status eq 'inactive'?'selected':''}>inactive</option>
 </select>
 <input type="submit" value="search">
 </form>
 
<div class="text-left"><br />
<button type="button" id="updateBtn" >update</button>
</div>

<input type="checkbox"  id="checkAll" >Select All
<table border="1">
<thead>
<tr>
<th>Select</th>
<th>jobId</th>
<th>jobTitle</th>
<th>JobType</th>
<th>number of openings</th>
<th>status</th>
<th>skills</th>
<th>Admin </th>

</tr>
</thead>

<tbody id="tbody">
<c:forEach var="list" items="${list}">
<tr>
<td><input type="checkbox"  name="checkbox" value="${list.jobid}"></td>
<td>${list.jobid}</td>
<td>${list.jobtitle }</td>
<td>${list.jobtype }</td>
<td>${list.number_of_openings }</td>
<td>${list.job_status }</td>
<td>${list.skills }</td>
<td>${list.admin.adminId}</td>
</tr>
</c:forEach>
</tbody>
</table>
</body>
<script src="${pageContext.request.contextPath}/resources/js/Chart.min.js"></script>

<script type="text/javascript">

$(function(){
	
	$('#checkAll').click(function(){
		if($(this).prop("checked") === true){
			$("input[type='checkbox'][name='checkbox']").each(function(){
				$(this).prop("checked",true);
			});
		}
		else if($(this).prop("checked") === false){
			$("input[type='checkbox'][name='checkbox']").each(function(){
				$(this).prop("checked",false);
			});
		}
	});
});
	</script>
	<script type="text/javascript">
    $( document ).ready(function() {

	$('#updateBtn').click(function(){
		var selectjobs = [];
		$.each($("input[name='checkbox']:checked"), function(){
			selectjobs.push($(this). val());
		});
		
		alert('selectjobs===='+selectjobs);
		$.ajax({
			url : "updatejobids",
			type : "POST",
			data : "selectjobs="+selectjobs,
			
			success : function(response){
				alert('response==='+response);
				if (response == "true")	{
					alert(" success");
					location.reload();
				}
				else	{
					//alert("Applied successfully");
				}
			}
			
		});

	
	});
	});
</script>
</html>





