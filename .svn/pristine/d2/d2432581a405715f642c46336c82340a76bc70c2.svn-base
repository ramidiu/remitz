<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agent Registration</title>
</head>
<body>
<%@include file ="backendheader.jsp" %>
<main id="main-container">
              
                <div class="content"><h3 class="header-title mb-3">Agent Registration</h3> 
	<section class="block p-10">
	<div class="row">
             <div class="col-md-12">        
                        
                  <div class="">
                     <%-- <input type="hidden" id="bcountries" value="${admin.businessCountries}"/>
			         <input type="hidden" id="adminId" name="adminId" value="${admin.adminId}">  --%>   
			              <form action="submitAgent" method="post">	
								<%-- <input type="hidden" value="${branch.fromCountry.countryName}" id="selectedCountry" />
								<input type="hidden" value="${branch.fromCountry.countryISO}" id="selectedCountryISO" />
								<input type="hidden" value="${buttonName}" id="buttonName"/>
								<input type="hidden" name="branchId" value="${branch.branchId}">
								
								<input type="hidden" name="pmtMode" id="pmtMode" value=""> --%>
			                        <!-- <div class="row"> -->        
			                        <div class="col-xl-4 col-lg-4">
                                         <div>
                                            <div class="form-group">
                                                <label for="showEasing">Branch</label>
                                                
                                                	<c:if test="${branch.fromCountry.countryName ne null}">
                                                	<!-- <select class="form-control" disabled="true" data-plugin="customselect" name="fromCountry.countryISO" id="fcountry" onclick="removeError('fcountry')"></select> -->
                                                	<input  type="text" name="agentBranch" id="agentBranch" value="${branch.fromCountry.countryName}"  class="form-control" disabled/>
                                                	</c:if>
                         
                                                    <input type="hidden" name="branchid" id="branchid" value="${branch.branchId}">
                                                    <input type="hidden" name="branchFunctionality" id="branchFunctionality" value="${branch.functionality}">
                                             </div>
                                        </div>
                                     </div> 
                                     <%-- <div class="col-xl-4 col-lg-4">
                                        <div>
                                            <div class="form-group">
                                                <label for="showEasing">Current Time Zone</label>
                                                <c:choose>
                                                	<c:when test="${branch.zone.zoneId ne null}">
                                                	<!-- <select class="form-control" disabled="true" data-plugin="customselect" name="zone.zoneId" id="zone" onclick="removeError('zone')"> -->
                                                       <option value="${branch.zone.zoneId}">${branch.zone.zoneName}</option>
                                                    </select>
			                                        </c:when>
			                                        <c:otherwise>
			                                        <select class="form-control" data-plugin="customselect" name="zone" id="zone" onclick="removeError('zone')">
                                                       <option value="${branch.zone.zoneId}">${branch.zone.zoneName}</option>
                                                    </select>
			                                        
			                                        </c:otherwise>
                                                
                                                </c:choose>
                                                   
                                                    </div> 
                                            </div>
                                        </div>   --%> 
                                        <div class="col-xl-4 col-lg-4" >
									<label class="pull-left ml-0 ">Sending/Receiving</label>
							
								<c:if test="${branch.functionality ne null}">
								<input  type="text" name="functionality" id="functionality" value="${branch.functionality}"  class="form-control" disabled/>
							<%-- <select  class="form-control" name="functionality" id="functionality" onchange="validateProfitMode();removeError('functionality')">	
							 <option value="">-- Select Functionality --</option>
							 <option value="${branch.funtionality}">${branch.funtionality}</option>
											<option value="sending" ${branch.functionality=='sending'?'selected':''}>Sending Branch</option>
										<option value="receiving" ${branch.functionality=='receiving'?'selected':''}>Receiving Branch</option>
										<option value="both" ${branch.functionality=='both'?'selected':''}>Both Sending and Receiving Branch</option>
							</select>  --%>
								</c:if>
								
							
									 	
									</div>                               
                                        <div class="col-xl-4 col-lg-4">
                                            <div>
                                                <div class="form-group">
                                                    <label for="showEasing">Agent Name</label>
                                                        <input  type="text" name="agentName" id="agentName"  placeholder="Enter Agent Name" onkeyup="removeError('branchName')"class="form-control" />
                                                 </div>
                                             </div>
                                        </div>  
                                        <div class="col-xl-4 col-lg-4">
                                            <div>
                                               <div class="form-group">
                                                  <label for="showEasing">Agent Email Id</label>
                                                  
                                                  
                                                  	
                                                  		<input type="email" name="agentEmail"  id="agentEmail"  onkeyup="removeError('emailId');" placeholder="Enter Email Address/Username *" class="form-control"  />
                                                  	
                                                  	
             
                                                     
                                               </div>
                                            </div>
                                        </div>
                                        
    									
                                       <div class="col-xl-4 col-lg-4">
                                          <div>
                                             <div class="form-group">
                                                 <label for="showEasing">Password</label>
                                                    <input  type="Password" name="agentPassword" id="agentPassword"  onkeyup="removeError('password');" placeholder="Enter Password *" class="form-control"  />
                                              </div> 
                                         </div>
                                      </div>
                                      <div class="col-xl-4 col-lg-4">
                                            <div>
                                               <div class="form-group">
                                                   <label for="showEasing">Address</label>
                                                       <textarea  class="form-control" maxlength="225" rows="3" name="agentAddress" id="agentAddress" onkeyup="removeError('address');" placeholder="Enter Your Address *"></textarea>
                                                </div>
                                           </div>
                                        </div>
                                      <div class="col-xl-4 col-lg-4">
                                            <div>
                                               <div class="form-group">
                                                   <label for="showEasing">Mobile Number</label>
                                                        <input type="text" placeholder="Enter your phone no"name="agentMobileNumber" id="agentMobileNumber"  maxlength="13" onkeyup="removeError('mobileNumber');" placeholder="Enter Mobile  Number" onkeypress="return onlyNumber(event)" class="form-control"  />
                                                </div>
                                            </div>
                                       </div>
                                     <div class="col-xl-4 col-lg-4  ">
                                          <div>
                                             <div class="form-group">
                                                <label>Status</label><br>
                                                  <input type="radio" name="agentStatus" id="radio1" />
                                                     <label for="radio5">Active</label>
                                                         <input type="radio" name="agentStatus" id="radio2" />
                                                            <label for="radio5">InActive</label>
                                               </div>
                                           </div>
                                      </div>
                                         
                                     
                                      <div class="col-xl-4 col-lg-4 mt-10"  id="profitModeDiv">
									<label class="pull-left ml-0 ">Profit Mode</label>
								
										<c:if test="${branch.profitMode ne null }">
										<input type="text" name="agentProfitMode" id="agentProfitMode"   class="form-control" value="${branch.profitMode}" disabled/>
										</c:if>
									
									</div>	
                                      
									
									
									 <%-- <input type="hidden" id="modeOfPayments" value="${admin.getModeOfPayments()}"/>
									 <input type="hidden" id="branchModeOfPayments" value="${branch.modeOfPayment}"/>
                                     
									
									
									
							<input type="hidden" name="modeOfPayments" value="${admin.getProfitMode()}" id="pMode"/> --%>
							
		
										<!-- <div class="col-md-12 mt-30 mb-30">
                                             <button type="button" id="submitBtn" class="btn btn-primary waves-effect waves-light">Register</button>
                                               
                                            </div> -->
                                            <div class="col-md-12 " style="top:4px;left:0px;">
                                             <input type="submit" id="register" value="Register" class="btn btn-primary waves-effect waves-light">
                                               
                                            </div>
                                            
                                          
                                       </form>
                                       
                                       </div>
                                      
                                </div> <!-- end card-->
                                </section>
                                
                            </div>
                                    <!-- end card-body-->
                                    
                                    <div class="mt-30  p-5">
                                            <div class="row ">
                           
                           
                            </div> <!-- end col -->
            
                            <div class="col-lg-12">
                               
                                         <div class="block p-10">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
                                                <thead class="table-primary">
                                                 <tr>
                     <th>Agent Id</th>
                     <th>Agent Name</th>
                     <th>Agent Email</th>
                     <th>Profit Mode</th>
                     <th>Agent Address</th>
                     <th>Agent Mobile Number</th>
                     <th>Agent Status</th>
                     
                     </tr>
                                                </thead>
                                                <tbody>
      <c:choose>
                     <c:when test="${!empty(branchagentslist)}">
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
                     </c:when>
                     <c:otherwise>
                     <tr><td colspan="7">no results</td></tr>
                     </c:otherwise>
                     </c:choose>
                                                </tbody>
                                            </table>
                                        </div>
                                       
                                    </div> <!-- end card-body -->
                                
                                
                                </div>
                                
                        </div>
                        
                       </main>                
                    
<script src="${pageContext.request.contextPath}/resources/js/summernote-bs4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/form-editor.init.js"></script>  
</body>
</html>