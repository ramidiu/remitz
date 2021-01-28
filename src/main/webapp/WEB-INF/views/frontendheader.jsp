<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<!-- <script src="jquery-3.4.1.min.js"></script> -->
<script src="/js/jquery.min.js"></script>
  <script src="/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Rubik:300,300i,400,400i,500,500i,700,700i,900,900i' type='text/css'>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/shortcut.css" />

<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
 <link rel="stylesheet" type="text/css" href="/css/fontawesomecss/font-awesome/css/all.min.css" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/vendor/bootstrap-select/css/bootstrap-select.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/vendor/currency-flags/css/currency-flags.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/vendor/owl.carousel/assets/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/stylesheet1.css" />
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style1.css" />  --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/style3.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/bootstrap.css" />

<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style3.css" /> --%>


<script type="text/javascript">
$(document).ready(function(){
	$('#login').click(function(){
		$('#loginsignup').attr('action' , 'login');
		$('#loginsignup').submit();
	});
$('#signup').click(function(){
	$('#loginsignup').attr('action' , 'signup');
	$('#loginsignup').submit();
	});
});

</script>
<style>

a.newtransfer {
    padding: 8px !important;
    padding-left: 15px !important;
    padding-right: 15px !important;
}

 .affix {
    top: 0;
    width: 100%;
    z-index: 9999 !important;
  }
  
  nav.navbar.navbar-default.affix {
    background: #112145 !important;
    border: none !important;
    border-radius: 0px;
}
.navbar-default{

}

</style>
</head>
<body>


<nav class="navbar navbar-default" data-spy="affix" >
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <c:if test="${customerId eq null }">
      <a class="navbar-brand" href="index?adminKey=${adminKey}"><img src="/images/adminlogo/${adminId}/${adminLogo}"></a>
      </c:if>
      <c:if test="${customerId ne null }">
      <a class="navbar-brand" href="my_account_calculator"><img src="/images/adminlogo/${adminId}/${adminLogo}"></a>
      </c:if>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <c:if test="${customerId eq null}">
        <li >
          <a  href="#">Money Transfer <span class="caret"></span></a>
          <%-- <ul class="dropdown-menu">
            <li><a href="index">Send Money</a></li>
                              <li><a  href="${pageContext.request.contextPath}/receive-money/bd/receivemoney">Receive Money</a></li>
                              <li><a  href="#">Wish Rate Alert</a></li>
          </ul> --%>
        </li>
        <!-- <li><a href="topupindex">Airtime/Data Topup</a></li> -->
        <li><a href="#">Utility Connection</a></li>
        
        </c:if>
            <c:if test="${customerId ne null}">
        <li><a  href="transactions" onclick="showNewTransactionButton();">Transfers</a>
        <!-- <li><a  href="mytopuptransactions">TopUp Transactions</a></li> -->
        <!-- <li><a href="topupindex">Airtime/Data Topup</a></li>
        <li><a href="#">Utility Connection</a></li> -->
        <!-- <li><a href="topup" class="Topup">To Pup</a></li> -->
        <!--      
     <div class="col-md-4 text-left" id="icon-bar">
<a href="confirmation" class="btn12 btn-prim"></i>Send Money</a>
</div>
         -->
        <li><a href="my_account_calculator?ds=empty" class="newtransfer">Send Money</a></li>
   <!--      
     <div class="col-md-4 text-right" id="icon-bar">
<a href="confirmation" class="btn11 btn-prime"></i>Send Money</a>
</div>
         -->
        </c:if>
        
		<li><a href="#">
				 <c:if test="${customerId eq null and customerName eq null}">
                             <button type="button" id="login" class="login btn btn-default">
                                    <span class="bh"></span> 
                                   <span>login</span>
                             </button> 
                       </c:if>
		
		</a></li>
		
		      <c:if test="${customerId ne null}">
                        <li class="dropdown">
             	          
                               <button class="dropdown-toggle account" id="#account0" type="button"  data-toggle="dropdown">
                                      My Account <i class="fa fa-caret-down visible-xs visible-sm" aria-hidden="true"></i>
                                  
                                </button>
                              
                            
                               <ul class="dropdown-menu"  id="ddm">
                             
                               <li class="name">
                                  <span>MS</span>
                                   <h5>${customerName}</h5> 
                                   <p>Customer No. ${mobileNumber}</p>
                                   <hr>
                                   </li>
                                      <li><a href="viewprofile">View Profile</a></li>
                                      <li><a href="recipients">Recipients</a></li>
                                      <li><a href="doc">Documents</a></li>
                                      <li><a  href="changepassword">Change Password</a></li>
                                   <!--    <li><a  href="transactions">Transactions</a></li>
                                      <li><a  href= "mytopuptransactions">TopUp Transactions</a></li>
                                      <li><a  href="recipients">Recipients</a></li>
                                      <li><a  href="doc">Documents</a></li> -->
                                      <!--   <li><a href="#">Transaction</a></li> -->
                               <li class="logout">
                                  <a  href="logout">Log Out
                                  </a>
                                  </li>
                                </ul>
                            
             </li>
             </c:if>
             
      </ul>
     
    </div>
  </div>
</nav>


  <%-- <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script> --%> 
<script src="${pageContext.request.contextPath}/frontend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
<script src="${pageContext.request.contextPath}/frontend/vendor/bootstrap-select/js/bootstrap-select.min.js"></script> 
<script src="${pageContext.request.contextPath}/frontend/vendor/owl.carousel/owl.carousel.min.js"></script> 
<script src="${pageContext.request.contextPath}/frontend/js/theme.js"></script>
<script>
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}


</script>

 
</body>
</html>	