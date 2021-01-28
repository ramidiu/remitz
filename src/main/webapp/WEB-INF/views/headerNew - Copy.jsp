<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
    
<!DOCTYPE html>
<html>
<head>
<style>
.navbar{

background:#2e287b;
}


.navbar a{
color:white;
}


</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar " id="main-navbar">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#" style="background:#2e287b;color:white">Home</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
       <c:if test="${role eq 'ROLE_SUPERADMIN' }">
        <li class="dropdown">
          <a style="background:#2e287b;color:white" href="#"
           class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">Admin<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="adminRegistration">Admin Registration</a></li>
            <li><a href="adminList">Admin List</a>
            </li>
          </ul></li>
                      <li><a href="logout">Logout</a>
            </li>
          
        </li></c:if>
       <c:if test="${role eq 'ROLE_ADMIN' }">
        <li class="dropdown">
          <a style="background:#2e287b;color:white" href="#"
           class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">Admin Details<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="adminUpdate">Admin Details</a></li>
          </ul></li>
          <li class="dropdown">
          <a style="background:#2e287b;color:white" href="#"
           class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">Transaction <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="transactionList">Transaction List</a></li>
          </ul></li>
          <li class="dropdown">
          <a style="background:#2e287b;color:white" href="#"
           class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">Exchange Rates <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="add_rates">Add Sell Rates</a></li>
            <li><a href="addbuy_rates">Add BuyRates</a>
            </li>
            <li><a href="revenuePercentage">
            Add RevenuePercentage</a></li>
          </ul></li>
          <li class="dropdown">
          <a style="background:#2e287b;color:white" href="#"
           class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">Fee <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="mop">Mode Of Payment Fee</a></li>
            <li><a href="srfee">Service Fee</a>
            </li>
             <li><a href="manageBranchPayments">Payments Type</a>
            </li>
          </ul></li>
           <li class="dropdown">
          <a style="background:#2e287b;color:white" href="#"
           class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">Remmiter <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="admincustomerList">Remmiter List</a></li>
            <li><a href="CustomerManualIdVerification">KYC Approval</a></li>
                       <c:if test="${adm ne null }">
                             <li>
                         <a href="getsanctioncustomers" >sanctionsearchcustomer List</a>
                            </li>
                       
                       </c:if>
         
          </ul>
        </li>
         <li class="dropdown">
          <a style="background:#2e287b;color:white" href="#"
           class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">Settings<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="maxAmount">AML Limits</a></li>
            <li><a href="txDaysLimit">TransactionList Limits</a></li>
            <li><a href="add_email_templates">Email Templates</a></li>
            <li><a href="relationShips1">RealationShips</a></li>
                                                </li>
                                                                       <li>
                                        <a href="sourceOfFund">SourceOfFund </a>
                                    </li>
            
            <li><a href="reasonForTransfer">ReasonForTransfer</a></li>
            <li><a href="adminKey">AdminKey</a></li>
                                    <c:if test="${paymentType ne null }">
                                    
                                               <li>
                                        <a href="ewalletPaymentTyp">Add EwalletDetails</a>
                                    </li>
                                    
                                    </c:if>
                                    <c:if test="${modeOfPayment ne null }">
                                    
                                               <li>
                                        <a href="onlineMop">Add OnlineTransferDetails</a>
                                    </li>
                                    
                                    </c:if>
                                    <c:if test="${ibt ne null }">
                                               <li>
                                        <a href="internetbanktransferMop">InternetBankTransfer</a>
                                    </li>
                                    </c:if>
                                                <li>
                                        <a href="majorhead">MajorHeads</a>
                                    </li>

                                               <li>
                                        <a href="chartofaccounts">MinorHeads</a>
                                    </li>
                                    
                                       
          
          </ul>
        </li>
<!--                   <li class="dropdown">
          <a style="background:#2e287b;color:white" href="#"
           class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">Process.Banks <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="process">Add ProcessBank</a></li>
          <li><a href="processbankList">ProcessBank List</a></li>
         
          </ul></li>
 -->        
         <li class="dropdown">
          <a style="background:#2e287b;color:white" href="#"
           class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">Agents<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="branch_registration">Agent Registration</a></li>
            <li><a href="AgentsList">Agents List</a></li>
            <li><a href="banks">Agent Banks Registration</a></li>
             <li><a href="cashpickup">Agent Cash Registration</a></li>
          </ul>
        </li>
         <li class="dropdown">
          <a style="background:#2e287b;color:white" href="#"
           class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">UserRoles<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="addNewUsers">AddNewUser</a></li>
          </ul>
        </li>
             <li><a href="logout">Logout</a></li>
        
        </li></c:if>
        <c:if test="${role eq 'ROLE_BRANCH' }">
           <c:if test="${branchFunctionality ne 'sending'}">
        <li class="dropdown">
          <a style="background:#2e287b;color:white" href="#"
           class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">Transactions<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="getReceivingBranchTransactions">Transaction List</a></li>
          </ul></li>
        <li class="dropdown">
          <a style="background:#2e287b;color:white" href="#"
           class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">ExchangeRates<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="addBranch_rates">BuyRates</a></li>
          </ul></li>
            <li><a href="logout">Logout</a></li>
          </c:if>
         <c:if test="${branchFunctionality ne 'receiving' }">
          <li class="dropdown">
          <a style="background:#2e287b;color:white" href="#"
           class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">Transactions <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="doTransaction">Make Transaction</a></li>
            <li><a href="branchTransactionlist">Transaction List</a>
            </li>
          </ul></li>
          <li class="dropdown">
          <a style="background:#2e287b;color:white" href="#"
           class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">Agent <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="AgentDeposit">Agent Deposits</a></li>
          </ul></li>
          <li class="dropdown">
          <a style="background:#2e287b;color:white" href="#"
           class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">Remmiter <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="customerReg">Remitter Registration</a></li>
            <li><a href="RemmitersList">Remmiter List</a>
            </li>
            <li><a href="BranchCustomerManualIdVerification">KYC Approval</a>
            </li>
            
          </ul></li>
          <c:if test="${switchAgent eq 'sa' }">
            <li><a href="switchToAdmin">SwitchToAdmin </a></li>
          </c:if>
          
            <li><a href="logout">Logout</a></li>
        </c:if>
        </c:if>
        
        
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <!-- <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li> -->
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</div>
</body>