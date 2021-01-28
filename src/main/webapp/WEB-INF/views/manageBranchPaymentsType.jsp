<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Payment Type</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/adm/js/nicEdit-latest.js" ></script>
  <script src="${pageContext.request.contextPath}/resources/adm/js/modal-windowRTF.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
		
				<style>
				.map-placeses{
				    box-shadow: 0 20px 40px 0 rgba(21, 12, 181, 0.5);
				    
				}
				label {
    margin: 0 0 0 14px;
    display: inline-block;
    margin-bottom: 0.5rem;
}
	.address.nicEdit-panelContain{
			display:none;
		}
		.address text-area{
			display:block !important;
		}
		.card-body {
    width: 1030px !important;
    margin: 22px -45px -1px 148px !important;
    overflow: hidden;
}
.branchtransaction{    width: 1000px;}
		</style>
		
<!-- <script>
function getBranchPaymentTypes()
{
	var branchid=$('#branch').val();
	alert("branchid"+branchid);
	var branchname=$('#branch').text();
	if(branchid!='')
	{
	$.ajax({
		
		url :"/common/getBranchPaymentDetails",
		type :"GET",
		data :"branchid="+branchid,
		success :function(response){
			alert("response:"+response);
			var row="<tr>";
			for (var i=0 ; i < response.length ; i++)	{
				var branchptd = response[i];
				var row +="<td>"+branchptd.status+"</td>";
			var row +="</tr>";
			$('table').append(row);
		},
		error:function(){alert("error");}
		
	})
	}
	}
</script> -->
<script>
function getUpdate(branchcount,count,branchid,paymentid){
	/* var c=Number(branchcount)-1; */

/* 	alert("branchcount:"+branchcount);
	/* alert("c"+c); */
/* 	alert("count:"+count);
	alert("branchid"+branchid);  */
	
	var branchstatus=$('input[name=rad'+branchcount+']:checked').val(); 
	var paymentstatus=$('input[name=radio'+count+']:checked').val(); 

		
		/* alert("branchstatus:"+branchstatus);

	alert("payment status:"+paymentstatus); */
	var deliverytime=$('#deliveryTime'+count).val();
	/* var branchid=$('#branchid').val(); */
	if(paymentstatus=='active' && deliverytime=='')
		{
		$('#deliveryTime'+count).focus().css('outline','solid red 1px');
		return false;
		
		}
	 //alert(branchstatus+","+paymentstatus+","+deliverytime); 
	var querystring="branchid="+branchid+"&branchstatus="+branchstatus+"&paymentid="+paymentid+"&paymentstatus="+paymentstatus+"&deliverytime="+deliverytime;
	 //alert(querystring); 
	$.ajax({
		url : "updatebranchpaymenttype",
		type : "POST",
		data : querystring,
		success : function (response){
			if(response=='success'){
				alert("updated successfully");
			location.reload();
			}
		},
		error: function ()
		{
			
		alert("error");
		}
	
	})
	
	
	
	
}


</script>
<script type="text/javascript">
function removeError(id){
	/* $('#msg').hide(); */
	$('#'+id).css('outline','#B0C4DE');
}

</script>
</head>
<body>
<%@include file ="headerNew.jsp" %>
<div class="container "><br>
  <main id="main-container">
              
                <div class="content">
                    
                 	<h5 style="background: #2e287b;color:white;text-align:center;padding:5px;">Update Payment Type</h5>   
<section class="block">
<div class="">
	<div class="">
        <div class="row">
      
 <div class="col-md-12" id="paymentTable">
                               
                                         <div class="">
                                        <div class="table-responsive" id="branchPaymentDetails">
                                            <table class="table table-bordered mb-0">
                                                <thead class="table-primary">
                                                  <tr style="background:#2e287b;color:white;padding:5px;">
                                                    <th class="text-center" scope="col">COUNTRY</th>
                                                   <th class="text-center" scope="col">BRANCH STATUS</th>
                           <th class="text-center" scope="col">Payment TYPE STATUS</th>
                                                     
                                                    <th class="text-center" scope="col">DELIVERY TIME</th>
                                                   <!--  <th scope="col">MAX TRANSACTION</th> -->
                                                    <th class="text-center" scope="col">UPDATE</th>
                                                    
                                                  </tr>
                                           </thead>
                                                   <c:set var="c" value="1"></c:set> 
                                                   <c:forTokens items="${adminpt.paymentTypes }" delims="," var="counts">
                                                   
                                                   
                                                    <c:set var="c" value="${c+1}"></c:set>
                                                    </c:forTokens>
                                                  
                                                    
                                                    <c:set var="count" value="1"></c:set>
                                                    <c:set var="branchcount" value="1"></c:set>
                                                     <c:set var="branchrowcount" value="1"></c:set>
                                                     <c:set var="incidvalue" value="1"></c:set>
                                                    <c:forEach items="${paymenttype}" var="paytype"> 
                                                   
                                                    <%-- <c:if test="${branch.branchId eq paytype.branchId.branchId }"> --%>
                                                   <c:if test="${branchrowcount eq 1}">
                                                    <tr><th class="text-center">${paytype.branchId.fromCountry.countryName}(${paytype.branchId.branchName})</th>
                                                     
                                                     
                                                     <th class="text-center">
                                                  <div class="custom-control custom-radio custom-control-inline mb-5">
                                                    <input type="radio" class="custom-control-input" name="rad${branchcount}" id="rad${branchcount}${incidvalue}" value="active" ${paytype.branchId.status=='active'?'checked':''}>
                                                    <label class="custom-control-label" for="rad${branchcount}${incidvalue}">Active</label>
                                                </div>
                                                    

  <div class="custom-control custom-radio custom-control-inline mb-5">
                                                    <input class="custom-control-input" type="radio" name="rad${branchcount}" id="rad${branchcount}" value="inActive" ${paytype.branchId.status=='inActive'?'checked':''}>
                                                    <label class="custom-control-label" for="rad${branchcount}">inactive</label>
                                                </div>
                                                    
                                                    <%-- <input type="radio" name="rad${branchcount}" id="rad${branchcount}" value="active" ${paytype.branchId.status=='active'?'checked':''}>active
                                                    <input type="radio" name="rad${branchcount}" id="rad${branchcount}" value="inActive" ${paytype.branchId.status=='inActive'?'checked':''}>inactive
                                                    --%></th>
                                                  
                                                    </tr>
                                                     
                                                   </c:if>
                                                   
                                                    <tr><th class="text-center">${paytype.paymentTypes.paymentType}</th>
                                                    
                                                   
                                                    <td class="text-center"></td>
                                                  
                                                    <td class="text-center">
                                                    
                                                    
                                                           <div class="custom-control custom-radio custom-control-inline mb-5">
                                                     <input type="radio" class="custom-control-input" name="radio${count}" id="radio${count}${incidvalue}" value="active" ${paytype.status=='active'?'checked':''}>
                                                    <label class="custom-control-label" for="radio${count}${incidvalue}">Active</label>
                                                    </div>
                                                    

   <div class="custom-control custom-radio custom-control-inline mb-5">
                                                    <input type="radio" class="custom-control-input" name="radio${count}" id="radio${count}" value="inactive" ${paytype.status=='inactive'?'checked':''}>
                                                    <label class="custom-control-label" for="radio${count}">inactive</label>
                                                </div> 
                                                
                                                
                                                    <%-- <input type="radio" name="radio${count}" id="radio${count}"value="active" ${paytype.status=='active'?'checked':''}>active
                                                    <input type="radio" name="radio${count}" id="radio${count}" value="inactive" ${paytype.status=='inactive'?'checked':''}>inactive
                                                    --%>
                                                   
                                                    
                                                    </td>
                                                    <td class="text-center"><input type="text" name="deliveryTime${count}" id="deliveryTime${count}" onkeyup="removeError('deliveryTime${count}');" value="${paytype.deliveryTime}"></td>
                                                    <%-- <td><input type="text" name="maxtransaction${count}" value="${paytype.deliveryTime}"></td> --%>
                                                    <td class="text-center"><input type="submit" class="btn btn-primary btn-alt-primary" value="update" onclick="getUpdate('${branchcount}','${count}','${paytype.branchId.branchId}','${paytype.branchPaymentTypeDetailId}');"></td>
                                                   </tr>
                                                    <c:set var="count" value="${count+1}"></c:set>
                                                    
                                                    <c:choose>
                                                    <c:when test="${branchrowcount eq c-1}">
                                                    <c:set var="branchrowcount" value="1"></c:set>
                                                    <c:set var="branchcount" value="${branchcount+1}"></c:set>
                                                    
                                                    </c:when>
                                                    <c:otherwise>
                                                    <c:set var="branchrowcount" value="${branchrowcount+1 }"></c:set>
                                                    </c:otherwise>
                                                    </c:choose>
                                                    <%-- </c:if> --%>
                                                    
                                                      </c:forEach>
                                             <!-- 
                                                   </tr> -->
                                                   
                                             
                                               <%--     </c:forEach> --%>
                                                   
                                                </thead>
                                              <tbody>
     <%-- <c:forEach items="${branchesList}" var="branch">
      <tr>
         <td>${branch.branchName}</td>
         <td>${branch.functionality}</td>
         <td>${branch.address}</td>
         <td>${branch.fromCountry.countryName}</td>
         <td>${branch.status}</td>
         <td><a href="branchRegistration?branchId=${branch.branchId}&buttonName=update" >update</a></td>
      </tr>
                  </c:forEach> --%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div> <!-- end card-body -->
                                </div> 
</div>
</div>
</div>
</section>
</div>
</main>
<script src="${pageContext.request.contextPath}/resources/js/summernote-bs4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/form-editor.init.js"></script> 
</body>
</html>