
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/adm/js/nicEdit-latest.js" ></script>
  <script src="${pageContext.request.contextPath}/resources/adm/js/modal-windowRTF.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 


  
<meta charset="ISO-8859-1">
<title>Customer Manual Verification</title>
<style>
    /* CSS used here will be applied after bootstrap.css */ @media (min-width: 768px) {
 .modal-dialog {
    width: 50%!important;
    max-width:700px;
    max-height:80%;
    margin: 30px auto;
}
.modal-dialog img {
  max-height: 80%;
}
}
/*second css*/

</style>
</head>
 <script type="text/javascript">
 $(document).ready(function(){
		$.getJSON("https://api.ipify.org/?format=json", function(e) {
		    console.log(e.ip);
		   // alert("ioplhgfszd"+e.ip);
		    $('#myIp').val(e.ip);
		});

 };
 </script>
<body>
<%@include file ="headerNew.jsp" %>
<div class="container">

<main id="main-container">
              
                <div class="content"><h3 class="header-title mb-3" style="text-align:center;">Manual ID Verification</h3> 
	
<!-- 	<img class="img" src="http://localhost:2023/images/logo.svg">
 -->	
	<section class="block p-10">
	<div class="row">
	
	<div class="col-lg-12">
                               
                                         <div class="block p-10">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
                                                <thead class="table-primary">
                                                 <tr>
      <th style="background: #2e287b;color:white;text-align:center;" >Customer ID</th>
      <th style="background: #2e287b;color:white;text-align:center;" >Full Name</th>
      <th style="background: #2e287b;color:white;text-align:center;">ID Proof</th>
      <th style="background: #2e287b;color:white;text-align:center;">ID Proof Number</th>
      <th style="background: #2e287b;color:white;text-align:center;">Expire Date</th>
      <th  style="background: #2e287b;color:white;text-align:center;">Primary ID Image</th>
      <th  style="background: #2e287b;color:white;text-align:center;">Secondary ID Image</th>
      <th  style="background: #2e287b;color:white;text-align:center;">Status</th>
      <c:out value="${pageContext.request.contextPath}"></c:out>
    </tr>
                                                </thead>
                                                <tbody>
     <c:forEach var="list" items="${list}">
    <tr>
      <td>${list.customerId }</td>
      <td>${list.firstName} ${list.lastName}</td>
     <c:choose>
     <c:when test="${list.firstIdProofType eq '01'}">
     <td>Driver Licence</td>
     </c:when>
     <c:when test="${list.firstIdProofType eq '2'}">
     <td>Passport</td>
     </c:when>
     <c:when test="${list.firstIdProofType eq '03'}">
     <td>Medicare</td>
     </c:when>
        <c:when test="${list.firstIdProofType eq '4'}">
     <td>International Passport</td>
     </c:when>
     <c:otherwise>
     <td>-</td>
     </c:otherwise>
      </c:choose>
      <td>${list.firstIdNumber}</td>
      <td>${list.firstIdExpireDate}</td>
   		 <c:if test="${list.firstIdProofStatus eq 'no' }">
   		<td><img src="/images/no_img.jpg" height="50px" width="50px"></td>
   		
   		</c:if>
   		<c:if test="${list.firstIdProofStatus eq 'yes' }"> 
   		<td><a href="#" class=" meat" data-img="/images/customerimages/${list.customerId }/${list.firstIdProofDoc}" onclick="showFirstId('${list.firstIdProofDoc}');">
   		<img  class=" img-fluid" src="/images/customerimages/${list.customerId }/${list.firstIdProofDoc}"  height="50px" width="50px"></a>
   		
  <div id="meatModal" class="modal fade" tabindex="-1" role="dialog">

  <div class="modal-dialog">
     <button type="button" class="close" data-dismiss="modal">&times;</button>
  	<div class="modal-content">

  	  <div class="modal-body">
          <img src="" id="meatModalImg" width="100%">
  	  </div>
  	</div>
  </div>
  </div>
   		</td>
   		 </c:if>
   		 <c:if test="${list.secondIdProofStatus eq 'no' }"> 
   		 <td><img src="/images/no_img.jpg" height="50px" width="50px">
<!--    		 <img src="http://localhost:2023/images/logo.svg">
 -->	</td>
   		 <%-- <td><a href="#" onclick="showFirstId('${list.secondIdProofDoc}');"><img src="${pageContext.request.contextPath}/resources/images/customerimages/${list.customerId }/${list.secondIdProofDoc}" height="50px" width="50px"></a></td> --%> 
   		 </c:if> 
   		<c:if test="${list.secondIdProofStatus eq 'yes' }"> 
   		<td><a href="#" class=" meat" data-img="/images/customerimages/${list.customerId }/${list.secondIdProofDoc}" onclick="showFirstId('${list.secondIdProofDoc}');">
   		
   		<img class=" img-fluid" src="/images/customerimages/${list.customerId }/${list.secondIdProofDoc}" height="50px" width="50px"></a>
 
  <div id="meatModal" class="modal fade" tabindex="-1" role="dialog">

  <div class="modal-dialog">
     <button type="button" class="close" data-dismiss="modal">&times;</button>
  	<div class="modal-content">

  	  <div class="modal-body">
          <img src="" id="meatModalImg" width="100%">
  	  </div>
  	</div>
  </div>
  </div>	
   		</td> 
   		</c:if> 
      <td><!--  <img src="resources/images/rapid.png" >  -->
     <c:choose>
      <c:when test="${list.customerKYCStatus ne 'completed' }">
       
      <c:if test="${list.customerKYCMode eq 'RapidId'}">
     <img src="/images/rejected2.png" height="23px" > <img src="/images/rapid.png" height="23px" >
      </c:if> 
      
      <c:if test="${list.customerKYCMode eq 'manual'}">
      <img src="/images/rejected2.png" height="23px" > <img src="/images/manual.png" height="23px" >
      </c:if>
      <br><a href="manual_id_update?id=${list.customerId}&status=yes" style="cursor:pointer;text-decoration:underline;color:green">Change to approved</a>
      
      <br><a href="manual_id_update?id=${list.customerId}&status=no" style="cursor:pointer;text-decoration:underline;color:red">Change to rejected</a>
    
    </c:when>
      <%-- <c:when test="${list.firstIdProofStatus eq 'yes' or list.secondIdProofStatus eq 'yes'}">
     
      <c:if test="${list.customerKYCMode eq 'RapidId'}">
     <img src="${pageContext.request.contextPath}/resources/static/images/rejected2.png" height="23px" > <img src="${pageContext.request.contextPath}/resources/static/images/rapid.png" height="23px" >
      </c:if> 
      
      <c:if test="${list.customerKYCMode eq 'manual'}">
      <img src="${pageContext.request.contextPath}/resources/static/images/rejected2.png" height="23px" > <img src="${pageContext.request.contextPath}/resources/static/images/manual.png" height="23px" >
      </c:if>
      <br><a href="manual_id_update?id=${list.customerId }&status=yes" style="cursor:pointer;text-decoration:underline;color:green">Change to approved</a>
      <c:if test="${list.customerKYCMode eq 'manual'}">
      <br><a href="manual_id_update?id=${list.customerId}&status=no" style="cursor:pointer;text-decoration:underline;color:red">Change to rejected</a>
    </c:if>
    </c:when>  --%>
      </c:choose> 
     <c:if test="${list.customerKYCStatus eq 'completed' }">
     <br><a href="manual_id_update?id=${list.customerId}&status=no" style="cursor:pointer;text-decoration:underline;color:red">Change to rejected</a>
    </c:if> 
   
    </td> 
    </tr>
    </c:forEach>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
<!--     <td>
      <a href="#/" class=" meat" data-img="https://www.remitz.co.uk/images/remitz-logo-min.png">
      <img src="https://www.remitz.co.uk/images/remitz-logo-min.png" width="10%" class=" img-fluid">
    </a>

  <div id="meatModal" class="modal fade" tabindex="-1" role="dialog">

  <div class="modal-dialog">
     <button type="button" class="close" data-dismiss="modal">&times;</button>
  	<div class="modal-content">

  	  <div class="modal-body">
          <img src="https://www.remitz.co.uk/images/remitz-logo-min.png" id="meatModalImg" width="100%">
  	  </div>
  	</div>
  </div>
  </div>
    
    
    </td>
 --><!--     <td>
<img id="myImg" src="https://static.toiimg.com/thumb/72975551.cms?width=680&height=512&imgsize=881753" alt="Snow" style="width:100%;max-width:100px">

The Modal
<div id="myModal" class="modal">
  <span class="close">&times;</span>
  <img class="modal-content" id="img01">
  <div id="caption"></div>
</div></td>
 -->    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                       
                                    </div> <!-- end card-body -->
                                
                                
                                </div>
	
             </div>
                                </section>
                                
                            </div>
                                    <!-- end card-body-->
                                    
                                   
                            
                                
                        
                        
                       </main>                
                    
<script src="${pageContext.request.contextPath}/resources/js/summernote-bs4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/form-editor.init.js"></script>  
</body>


    <script type="text/javascript">
      $(window).resize(function (e) {
  window.resizeEvt;
  $(window).resize(function () {
    clearTimeout(window.resizeEvt);
    window.resizeEvt = setTimeout(function () {
      doneresizing();
    }, 250);
  });
});

$(function doneresizing() {
  $('.meat').click(function (){
    if( ($(window).width() <= 768) | /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
      event.preventDefault();
      alert('mobile! No links workinf');
    } else {
      $('#meatModalImg').attr('src', $(this).data('img'));
      $('#meatModal').modal({show:true})
    }
  });
});

    </script>


</html>