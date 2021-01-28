<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
a.newtransfer {
    padding: 8px !important;
    padding-left: 15px !important;
    padding-right: 15px !important;
}
nav ul li a, nav ul li a:hover {
    display: block;
 /*    padding: 0 20px;
    line-height: 70px; */
    background: #086af3;
    color: #fff;
    text-decoration: none !important;
}
.nav-bar {
  height: 70px;

    z-index: 999;
    position: relative;
    background-color: #086af3;
/*   background: #262626; */
}
 
.brand {
  position: absolute;
  padding-left: 20px;
  float: left;
  /* line-height: 70px; */
  line-height: 50px;
  text-transform: uppercase;
  font-size: 1.4em;
      margin: 8px 0 0 -150px;
}
.brand a img {
	max-height: 70px;
}
.brand a,
.brand a:visited {
  color: #ffffff;
  text-decoration: none;
}
 
.nav-container {
  max-width: 1000px;
  margin: 0 auto;
}
 
nav {
  float: right;
}
nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
}
nav ul li {
  float: left;
  position: relative;
}
nav ul li a,
nav ul li a:visited {
  display: block;
  padding: 0 20px;
  line-height: 70px;
  background: #fff;
  color: #262626;
  text-decoration: none !important;
}
/* nav ul li a:hover,
nav ul li a:visited:hover {
  background: #2ab1ce;
  color: #ffffff;
} */
nav ul li a:not(:only-child):after,
nav ul li a:visited:not(:only-child):after {
  padding-left: 4px;
  content: ' ';
}
nav ul li ul li {
  min-width: 190px;
}
nav ul li ul li a {
  padding: 15px;
  line-height: 20px;
}
 
.nav-dropdown {
  position: absolute;
  display: none;
  z-index: 1;
  box-shadow: 0 3px 12px rgba(0, 0, 0, 0.15);
}
.nav-mobile {
  display: none;
  position: absolute;
  top: 0;
  right: 0;
  background: #262626;
  height: 70px;
  width: 70px;
}
 
@media only screen and (max-width: 798px) {
  .nav-mobile {
    display: block;
  }
 
  nav {
    width: 100%;
    padding: 70px 0 15px;
  }
  nav ul {
    display: none;
  }
  nav ul li {
    float: none;
  }
  nav ul li a {
    padding: 15px;
    line-height: 20px;
	padding-left: 25%;
	 
  }
  nav ul li ul li a {
    padding-left: 30%;
  }
 
  .nav-dropdown {
    position: static;
  }
	.brand a img {
		max-height: 60px;
		margin-top: 5px;
	}
}
/* @media screen and (min-width: 799px) {
  .nav-list {
    display: block !important;
  }
} */
#nav-toggle {
  position: absolute;
  left: 18px;
  top: 22px;
  cursor: pointer;
  padding: 10px 35px 16px 0px;
}
#nav-toggle span,
#nav-toggle span:before,
#nav-toggle span:after {
  cursor: pointer;
  border-radius: 1px;
  height: 5px;
  width: 35px;
  background: #ffffff;
  position: absolute;
  display: block;
  content: '';
  transition: all 300ms ease-in-out;
}
#nav-toggle span:before {
  top: -10px;
}
#nav-toggle span:after {
  bottom: -10px;
}
#nav-toggle.active span {
  background-color: transparent;
}
#nav-toggle.active span:before, #nav-toggle.active span:after {
  top: 0;
}
#nav-toggle.active span:before {
  transform: rotate(45deg);
}
#nav-toggle.active span:after {
  transform: rotate(-45deg);
}
 
 nav ul li a, nav ul li a:visited {
    display: block;
    padding: 0 20px;
    line-height: 70px;
    background: #086af3;
    color: #fff;
    text-decoration: none !important;
}
/*  .dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}
 */
.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

 /* .dropdown-content a:hover {background-color: #ddd;}  */

.dropdown:hover .dropdown-content {display: block;
}

/*  .dropdown:hover .dropbtn {background-color: #3e8e41;}   */

</style>
<link href="/adm/all.min.css" rel="stylesheet">
<link href="/adm/ionicons.min.css" rel="stylesheet">
<link href="/adm/dashforge.css"  rel="stylesheet">
 <link rel="stylesheet" href="/adm/dashforge.demo.css"> 
<link rel="stylesheet" href="/adm/shortcuts.css">
<link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<%-- <link href="${pageContext.request.contextPath}/resources/adm/all.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/adm/ionicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/adm/dashforge.css"  rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/adm/dashforge.demo.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/adm/shortcuts.css">
<link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
 --%>
</head>
<body>
<section class="nav-bar">
         <div class="nav-container">
              <div class="brand">
                   <a href="sender_dashboard">
                     <img src="/images/adminlogo/${adminId}/${adminLogo}" width="80px">
                   </a>
    </div>
    <nav>
      <div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>
      <ul class="nav-list">
        <li class="dropdown">
                        <a href="#" class="dropbtn"><i class="fas fa-chevron-circle-down" style="margin: 0 6px 0 2px;"></i>Rates & Service Fee</a>
                        <ul  class="dropdown-content">
                           
                            <li>
                               <a href="add_rates">Add Currency Rates</a>
                            </li>
                             <li>
                        <a href="mop" >Mode Of Payment Fee</a>
                            </li>
                             <li>
                        <a href="srfee" >Service Fee</a>
                            </li>
                             <li>
                               <a href="manageBranchPayments">Payments Type</a>
                            </li>
                           
                        </ul>
                    </li>
   
    
        <li class="dropdown">
                        <a href="#" class="dropbtn"><i class="fas fa-chevron-circle-down" style="margin: 0 6px 0 2px;"></i>Customer</a>
                        <ul  class="dropdown-content">
                            <li>
                         <a href="customer_listing" >Customer List</a>
                            </li>
                           <li>
                             <a href="manual_id_verification">Manual ID Verification</a>
                            </li>
                        </ul>
                    </li>
         <li class="dropdown">
                        <a href="#" class="dropbtn"><i class="fas fa-chevron-circle-down" style="margin: 0 6px 0 2px;"></i>Reports</a>
                        <ul  class="dropdown-content">
                            <li>
                              <a href="profitnloss">Profit & Loss</a>
                            </li>
                           <li>
                              <a href="outbound_austrac">Austrac Outbound</a>             
                            </li>
                            <li>
                              <a href="inbound_austrac">Austrac Inbound</a>
                            </li>
                        </ul>
                    </li>
                                 </li>
         <li class="dropdown">
                        <a href="#" class="dropbtn"><i class="fas fa-chevron-circle-down" style="margin: 0 6px 0 2px;"></i>Settings</a>
                        <ul  class="dropdown-content">
                            <li>
                              <a href="add_email_templates">Email Templates</a>
                            </li>
                           <li>
                              <a href="add_sms_templates" >SMS Templates</a>
                            </li>
                            <li>
                              <a href="promocode" >Promo Code</a>
                            </li>
                              <li>
                              <a href="wishrate">Wish Rate</a>
                            </li>
                             <li>
                              <a href="manageUsers" >Manage Users</a>
                            </li>
                        </ul>
                    </li>
                                
         <li class="dropdown">
                        <a href="#" class="dropbtn"><i class="fas fa-chevron-circle-down" style="margin: 0 6px 0 2px;"></i>Branch</a>
                        <ul  class="dropdown-content">
                            <li>
                               <a href="branch_registration">Branch Registration</a>
                            </li>
                          
                        </ul>
                    </li>
                     <li class="dropdown">
                        <a href="#" class="dropbtn">${adminName}</a>
                        <ul  class="dropdown-content">
                            <li>
                                <a href="logout">Logout</a>
                            </li>
                          
                        </ul>
                    </li>
        
        
      </ul>
    </nav>
  </div>
</section>
      
</body>
</html>