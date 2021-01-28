<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin List123</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>

.tab-list a {
    color: #fff !important;
    background: #337ab7 !important;
    text-decoration: none !important;
}
</style>
<!-- <script type="text/javascript">
$(document).ready(function(){
	$("#statusIdUpdate").click(function(){
			var count=$('#adminCountNumber').val();
			var radioStatus="";
			var totalRadioStatus="";
			var adminId="";
			var totalAdminId="";
			
			for(var i=0;i<count;i++){
				radioStatus= $('input[name=adminStatus'+i+']:checked', '#AdminListTable').val();
				adminId=$('#adminID'+i).val();
				//
				if(i!=Number(count-1)){
					totalRadioStatus=totalRadioStatus+radioStatus+",";
					totalAdminId=totalAdminId+adminId+",";
				}
				else{
					totalRadioStatus=totalRadioStatus+radioStatus;	
					totalAdminId=totalAdminId+adminId;
				}
				if(radioStatus=='pending'){ 
					$('#Update1'+i).show();
					$('#Update'+i).hide();
					} 
					else{
						$('#Update'+i).show();
						$('#Update1'+i).hide();
					}
			}
			var data = 'totalRadioStatus='+totalRadioStatus+'&totalAdminId='+totalAdminId;
			$.ajax({
				url: "adminUpdate.do",
				data: data,
				type : "POST",
				success : function(response) {
					
					alert(response);
				},
				error : function(xhr, status, error) {
					alert(xhr.responseText);
					
				}
				
			});
	});
	
	$('#packageTypeUpdate').click(function(){
		var count=$('#adminCountNumber').val();
		var radioPackageType="";
		var totalRadioPackageType="";
		var adminId="";
		var totalAdminId="";
		
		for(var i=0;i<count;i++){
			radioPackageType= $('input[name=adminPackage'+i+']:checked', '#AdminListTable').val();
			adminId=$('#adminID'+i).val();
			//
			if(i!=Number(count-1)){
				totalRadioPackageType=totalRadioPackageType+radioPackageType+",";
				totalAdminId=totalAdminId+adminId+",";
			}
			else{
				totalRadioPackageType=totalRadioPackageType+radioPackageType;	
				totalAdminId=totalAdminId+adminId;
			}
			
		}
		
		var data='totalRadioPackageType='+totalRadioPackageType+'&totalAdminId='+totalAdminId;
		$.ajax({
			url : "packageTypeUpdate.do",
			data : data,
			type : "POST",
			success : function(response) {
				
				alert(response);
			},
			error : function(xhr, status, error) {
				alert(xhr.responseText);
				
			}
			
		});
	});
	
// 	var countStatus=$('#adminCountNumber').val();
// 	var radioStatusValue="";
// 	var toCountryId="";
// 	for(var i=0;i<countStatus;i++){
// 		radioStatusValue= $('input[name=adminStatus'+i+']:checked', '#AdminListTable').val();
// 		if(radioStatusValue=='pending'){ 
// 		$('#Update1'+i).show();
// 		$('#Update'+i).hide();
// 		} 
// 		else{
// 			$('#Update'+i).show();
// 			$('#Update1'+i).hide();
// 		}
// 		toCountryId=$('#toCountryId'+i).val();
// 		toCountryId = toCountryId.slice(0, -1);
// 		$('#toCountryValue'+i).html(toCountryId);
// 	}
	
	
	$("#addNewAdminId").click(function(){
// 		window.location.replace("../superadmin/registration.do");
		
		$('#adminRegistration').attr('action', 'registration.do');
		$('#adminRegistration').submit();
	});
	
});
</script> -->


<script>



</script>
</head>
<body>
<%-- <%@include file="header.jsp"%> --%>
<%@include file="headerNew.jsp"%>
<div class="container">
<form id="adminRegistration" id="adminRegistration">

</form>


<main id="main-container">
              
                <div class="content">
                
	<section class="block p-10">
	 <div class="row">
			<div class="col-md-12">
<!-- 				<span class="col-lg-12 col-md-12 breadcrumbs"> -->
<!-- 				<p>RemitSuite <i class="fa fa-angle-right"></i>  Super Admin  <i class="fa fa-angle-right"></i>  Admin List :</p> -->
<!-- 				</span> -->
				<table class="table table-bordered" id="AdminListTable" style="margin-bottom: 100px;">
					<thead>
<!-- 					<tr>
						<td colspan="11" class="no-border"><button type="button" class="btn btn-blue btn-primary" id="addNewAdminId"><i class="fa fa-plus"></i>&nbsp;&nbsp;Add New Admin</button></td>
					</tr>
 -->					<tr class="bg-blue">
						<th class="text-center text-white" style="background: #2e287b;color:white;padding:5px;text-align:center"
						 colspan="11">ADMIN LIST</th>
					</tr>
					<tr class="table-primary" >
						<th style="background: #2e287b;color:white;padding:5px;text-align:center"
						>Admin Id</th>
						<th style="background: #2e287b;color:white;padding:5px;text-align:center"
						>Admin Name</th>
						<th style="background: #2e287b;color:white;padding:5px;text-align:center"
						>Created Date</th>
						<th style="background: #2e287b;color:white;padding:5px;text-align:center"
						>Mobile Number</th>
						<th style="background: #2e287b;color:white;padding:5px;text-align:center"
						>Address</th>
						<th style="background: #2e287b;color:white;padding:5px;text-align:center"
						>From Country</th>
						<!-- <th style="background: #2e287b;color:white;padding:5px;text-align:center"
						>Update</th> -->
						
<!-- 						<th>Package Type</th>
						<th class="w-per-9">Status</th>
						<th>Details</th>
						<th>Edit</th>
						<th>New Keygeneration</th>
 -->					</tr>
					</thead>
					
<%-- 					<c:if test="${list ne null }">
					<input type="hidden" id="adminCountNumber" value="${list}"/>
 --%><%-- 					<c:forEach items="${list}" var="adminlist">
 --%>					<tr>
					<td>${adminlist.adminId}</td>
					<td><a href="${adminlist.url}" style="color:blue">${adminlist.firstName} ${adminlist.lastName}</a></td>
					<td>${adminlist.createdDate}</td>
					<td>${adminlist.mobileNumber}</td>
					<td>${adminlist.address}</td>
					<td>${adminlist.country.countryName}</td>
					<%-- <td>
					<input type="radio" name="packages" value="trail" ${adminlist.packages=='trail'?'checked':''}>Trail		
					<input type="radio" name="packages" value="main" ${adminlist.packages=='main'?'checked':''}>Main
					
					</td>
					<td><input type="radio" name="adminStatus" value= "active" ${adminlist.adminStatus=='active'?'checked':''}>active	
					<input type="radio" name="adminStatus" value="inactive" ${adminlist.adminStatus=='inactive'?'checked':''}>inactive</td>
					<td>details</td> --%>
<%-- 					<td><a href="Adminupdate?adminid=${adminlist.adminId}" disabled="true" class="btn btn-primary btn-alt-primary">Update</a>
					</td> --%>
<%-- 					<td><a href="generatenewadminkey?adminId=${adminlist.adminId}" class="btn btn-alt-primary">GenerateNewKey</a></td>
 --%>					</tr>
					
<%-- 					</c:forEach>	
					</c:if>
 --%>					<%-- <c:forEach var="adminListsize" begin="0" end="${adminList.size() - 1}" items="${adminList }" varStatus="adminCount">
					<input type="hidden" id="adminID${adminCount.index}" value="${adminListsize.adminId}"/>
					<input type="hidden" id="toCountryId${adminCount.index}" value="${adminListsize.toCountryNames}"/>
					<c:set var="adminNum" value="${adminCount.count}"/>
					<tr>
						<td>${adminNum}</td>
						<td>
							<c:choose>
								<c:when test="${adminListsize.status ne 'pending'}">
									<a href="../admin/adminLogin.do?adminId=${adminListsize.adminId}" target="_blank">${adminListsize.firstName} ${adminListsize.lastName}</a>
								</c:when>
								<c:otherwise>
									${adminListsize.firstName} ${adminListsize.lastName}
								</c:otherwise>
							</c:choose>
						</td>
						<fmt:parseDate value = "${adminListsize.createdDate }" var = "parsedAdminDate" pattern = "yyyy-MM-dd" />
						<fmt:formatDate pattern = "dd-MMM-yyyy"  value = "${parsedAdminDate}" var="createdDate"/>
						<td>${createdDate}</td>
						<td>${adminListsize.mobileNo}</td>
						<td>${adminListsize.address}</td>
						<td>${adminListsize.fromCountryName}</td>
						
						<td id="toCountryValue${adminCount.index}"></td>
						<td>
						<input type="radio" name="adminPackage${adminCount.index}" value="trailPack" <c:if test="${adminListsize.packageType eq 'trailPack'}"> checked="checked" </c:if>  />&nbsp;&nbsp;Trail Package<br/>
						<input type="radio" name="adminPackage${adminCount.index}" value="agreement" <c:if test="${adminListsize.packageType eq 'agreement'}"> checked="checked" </c:if> />&nbsp;&nbsp;Agreement<br/>
						
						<td>
						
						<input type="radio" name="adminStatus${adminCount.index}" id="adminStatus1${adminCount.index}" <c:if test="${adminListsize.status eq 'active'}"> checked="checked" </c:if> value="active">&nbsp;&nbsp;Active<br>
						<input type="radio" name="adminStatus${adminCount.index}" id="adminStatus2${adminCount.index}" <c:if test="${adminListsize.status eq 'inActive'}"> checked="checked" </c:if> value="inActive">&nbsp;&nbsp;InActive<br> 
						<input type="radio" name="adminStatus${adminCount.index}" id="adminStatus3${adminCount.index}" <c:if test="${adminListsize.status eq 'pending'}"> checked="checked" </c:if> value="pending">&nbsp;&nbsp;Pending
						
						</td>
						
						<td><a href="../superadmin/adminDetails.do?adminId=${adminListsize.adminId}" target="_blank">Details</a></td>
							<c:choose>
								<c:when test="${adminListsize.status ne 'pending'}">
								<td id="Update${adminCount.index}"><a href="../superadmin/updateAdminDetails.do?adminId=${adminListsize.adminId}" target="_blank">Update</a></td>
								</c:when>
								<c:otherwise>
									<td id="Update1${adminCount.index}">Update</td>
								</c:otherwise>
							</c:choose>
						
						
					</tr>
					</c:forEach>
					 --%>
					<!-- <tr>
						<td>2</td>
						<td><a href="#">Sita ram</a></td>
						<td>1234567890</td>
						<td>Hyderabad</td>
						<td>India</td>
						<td>America</td>
						<td>Agreement</td>
						<td><input type="radio" name="r1">&nbsp;&nbsp;Active&nbsp;&nbsp; <input type="radio" name="r1">&nbsp;&nbsp;Inactive</td>
						<td><a href="#">Update</a></td>
					</tr> -->
					<!-- <tr>
						<td colspan="7"></td>
						<td><button type="button" class="btn btn-blue  pull-right " id="packageTypeUpdate">UPDATE PACKAGE TYPE</button></td>
						<td><button type="button" class="btn btn-blue  pull-right " id="statusIdUpdate">UPDATE STATUS</button></td>
						<td colspan="2"></td>
					</tr> -->
				</table>
			
			</div>
			</section>
		</div>

</main>

</body>
</html>