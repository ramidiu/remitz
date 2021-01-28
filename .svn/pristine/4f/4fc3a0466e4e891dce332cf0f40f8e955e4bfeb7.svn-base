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
</head>
<body>
<%@include file ="headerNew.jsp" %>
<div class="container">
                                    <div class="clearfix"></div>
                                    <h5 style="background: #2e287b;color:white;padding:5px;text-align:center">Agent Deposits Lists</h5>
                                    <div class="block col-md-12 p-10">
                                            <div class="row">
                                            
                                    	
                           
                            <div class="col-lg-12">
                               
                                         <div class="">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
                                                <thead class="table-primary">
                                                  <tr  style="background: #2e287b;color:white;padding:5px;text-align:center">
                                                    <th class="text-center" scope="col">DepositId</th>
                                                    <th class="text-center" scope="col">DepositDate </th>
                                                    <th class="text-center" scope="col">DepositAmount</th>
                                                    <th class="text-center" scope="col">Notes</th>
                                                    <th class="text-center" scope="col">Document</th>
                                                    <th class="text-center" scope="col">Status</th>
                                                 
                                                  </tr>
                                                </thead>
                                                <tbody>
     <c:forEach items="${list}" var="list">
      <tr>
         <td class="text-center">${list.adId}</td>
         <td class="text-center">${list.depositDate}</td>
         <td class="text-center">${list.depositAmount}</td>
         <td class="text-center">${list.notes}</td>
         <td class="text-center">
     	<img src="/images/depositDocument/${list.adId}/${list.document}" width="100" height="55">
         </td>
         <c:if test="${list.status eq 'approved'  }">
         <td>Approved</td>
         </c:if>
         <c:if test="${list.status eq ' ' || list.status eq 'pending' }">
          <td class="text-center"><a href="ApproveDeposit?Id=${list.adId}" class="btn btn-primary btn-alt-secondary">Approve</a></td>
         </c:if>
      </tr>
                  </c:forEach>
                  
                                                </tbody>
                                            </table>
                                        </div>
                                    </div> <!-- end card-body -->
                                </div>

</body>
</html>