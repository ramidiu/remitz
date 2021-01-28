<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agent List</title>
</head>
<body>
<%@include file ="backendheader.jsp" %>
<div class="branchtransaction mt-100">
	<div class="container">
        <div class="row">
             <div class="col-12">        
              <h5 class="header-title mb-3" style="font-size: 16px;    margin: -24px 154px 0;"> Branch Agents List</h5>           
                  <div class="card-body shadow p-3 mb-5 bg-white rounded">
                     <table>
                     <tr>
                     <th>Agent Id</th>
                     <th>Agent Name</th>
                     <th>Agent Email</th>
                     <th>Profit Mode</th>
                     <th>Agent Address</th>
                     <th>Agent Mobile Number</th>
                     <th>Agent Status</th>
                     
                     </tr>
                     
                     <c:forEach var="balist" items="${branchagentslist}">
                     <tr>
                     <td>${balist.agentId}</td>
                     <td>${balist.agentName}</td>
                     <td>${balist.agentEmail}</td>
                     <td>${balist.agentProfitMode}</td>
                     <td>${balist.agentAddress}</td>
                     <td>${balist.agentMobileNumber}</td>
                     <td>${balist.agentStatus}</td>
                     </tr>
                     </c:forEach>
                     
                     </table>
			             
                                       
                                       </div>
                                      
                                </div> <!-- end card-->
                            </div>
                                    </div> <!-- end card-body-->
                                    
                                    <div class="col-md-12 mt-30">
                                            <div class="row">
                           
                           
                            </div> <!-- end col -->
                        </div>
                        </div>                    
                    
<script src="${pageContext.request.contextPath}/resources/js/summernote-bs4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/form-editor.init.js"></script>  
</body>
</html>