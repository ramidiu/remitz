<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>footer</title>
 <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"> 
<style>
section {
   /*  display: block; */
    position: relative;
  
}
 .footer {
  background-color: white !important;
    position: relative;
    top: 77px;
 /*    background-color: rgba(0, 0, 0, 0.1); */
    padding: 22px 11px 84px 0;
}
/* .footer:before {
    content: '';
    width: 100%;
    height: 187px;
    top: 1px;
    POSITION: absolute;
    background-color: #10377a;
}  */

.container:before{display: table;
    content: " ";
    }
    .mb-xlg {
    margin-bottom: 30px !important;
}

footer {
    padding: 40px 0;
    text-align: center;
    background-color: #f4f4f4;
    color: #575757;
}
 .row:before {
    display: table;
    content: " ";
}
@media (min-width: 992px){
.col-md-3 {
    width: 25% !important;
}}
.text-left {
    text-align: left;
}
 .footer.footer-title {
    /* color: #333;  */
    color: white !important;
    position:relative; 
    margin-bottom: 20px;
    
}
.mt-xlg span{color:black;}
/* .footer h3,p{
position:relative;
text-align:center;
 color: white; } */
.footer-content .footer-title {
    /*  color: #333;   */
  color: white; 
    margin-bottom: 20px;
}
h4, .h4 {
    font-size: 18px;
}
.footer ul.footer-menu {
    list-style: none;
    padding: 0;
    margin: 0;
}
.footer a {
    color: #575757; }
  .footer ul.footer-menu li {
    margin-bottom: 5px !important;
}
a {
  /*   color: #007bff; */
    color: white;
    text-decoration: none;
    background-color: transparent;
}
.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
footer {
    font-size: 14px;
}
footer {
    /* background-size: auto;
    background-position: center top;
    background-repeat: no-repeat;*/
    /* background-image: url(../images/footer-bg.jpg);  */
     background-image: url(resources/images/footer-bg.jpg) !important; 
     background-color: #112145 !important;
    position: relative;
}

/* footer {
       padding: 84px 0 !IMPORTANT;
    text-align: center;
    background-color: #f4f4f4;
    color: #575757;
}
.mb-xlg {
    margin-bottom: 30px !important;
}
.container:before{display: table;
    content: " ";}
    footer .footer-title {
    color: white;
    margin-bottom: 20px;
   font-weight: lighter;
} */
img {
    height: auto;
    max-width: 100%;
}
/* .col-md-3 {
    width: 25%;
}

h4{
    font-size: 18px;
}
footer ul.footer-menu {
    list-style: none;
    padding: 0;
    margin: 0;
}
footer ul.footer-menu li {
    margin-bottom: 5px;
}
a {
    color: #5cb85c;
    font-weight: lighter;
}
.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
 .h5 {
    font-size: 14px;
}
.h5 {
    margin-top: 10px;
    margin-bottom: 10px;
    }
 .h5{
    color: white;
    font-weight: 300;
    line-height: 1.2;
    position: relative;
}
footer a {
    color: white;
}
ul.social-buttons {
    margin-bottom: 0;
}
.list-inline {
    padding-left: 0;
    margin-left: -5px;
    list-style: none;
}
ul.social-buttons li a {
    display: block;
    width: 40px;
    height: 40px;
    border-radius: 3px;
    font-size: 20px;
    line-height: 22px;
    outline: 0;
    color: #fff;
    padding: 10px;
    background-color: #5cb85c;
    -webkit-transition: all .3s;
    -moz-transition: all .3s;
    transition: all .3s;
}
.list-inline>li {
    display: inline-block;
    padding-right: 5px;
    padding-left: 5px;
}
.hidden {
    display: none!important;
} */

    ul.social-buttons {
    margin-bottom: 0;
}
.list-inline {
    padding-left: 0;
    margin-left: -5px;
    list-style: none;
}
ul.social-buttons {
    margin-bottom: 0;
}
ul.social-buttons li a {
    display: block;
    width: 40px;
    height: 40px;
    border-radius: 3px;
    font-size: 20px;
    line-height: 22px;
    outline: 0;
    color: #fff;
    padding: 10px;
    background-color: #e2ab1d;
    -webkit-transition: all .3s;
    -moz-transition: all .3s;
    transition: all .3s;
}
.list-inline>li {
    display: inline-block;
    padding-right: 5px;
    padding-left: 5px;
}
</style>
</head>
<body>

 <!--  <footer class="footer">
      <div class="foo-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="widget foo-nav">
              <h5>Access Us</h5>
              <ul>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Payment</a></li>
                <li><a href="#">Send Money</a></li>
                <li><a href="#">Receive Money</a></li>
                <li><a href="#">Fees</a></li>
                <li><a href="#">Services</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="widget foo-nav">
              <h5>Help Center</h5>
              <ul>
              <li><a href="#">Customer Care</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="#">Live Chat</a></li>
                <li><a href="#">Payment</a></li>
                <li><a href="#">Custom API</a></li>
                <li><a href="#">Affiliate</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="widget foo-nav">
              <h5>Follow Us</h5>
              <ul>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Facebook</a></li>
                <li><a href="#">Twitter</a></li>
                <li><a href="#">Linkedin</a></li>
                <li><a href="#">Youtube</a></li>
                <li><a href="#">Forum</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="widget foo-nav">
              <h5>Partners</h5>
              <ul>
                <li><a href="#">Refer  A Frient</a></li>
                <li><a href="#">Affiliate Programs</a></li>
                <li><a href="#">Payment API</a></li>
                <li><a href="#">Partner Directory</a></li>
                <li><a href="#">Become A Partner</a></li>
                <li><a href="#">Find Locations</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="widget foo-nav">
              <h5>Services</h5>
              <ul>                
                <li><a href="#">Transfer Money</a></li>
                <li><a href="#">Saving Account</a></li>
                <li><a href="#">Online Shopping</a></li>
                <li><a href="#">Pay Bills</a></li>
                <li><a href="#">Credit Service</a></li>
                <li><a href="#">Ecommerce</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="widget foo-address">
              <h5>Stay In Touch</h5>
              <address>
                <a href="malto:ervice@email.com">ervice@email.com</a>
                <a href="tel:+12345678921">+123 4567 8921</a>
              </address>
              <address>
                Rokaz, Chok Bazar
                123 Newyork City 
                United State
              </address>
            </div>
          </div>
        </div>
      </div>
      </div>
      <div class="foo-btm">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="foo-navigation">
                <ul>
                  <li><a href="#">Terms and Conditions</a></li>
                  <li><a href="#">Privacy &amp; Policy</a></li>
                  <li><a href="#">Legal</a></li>
                  <li><a href="#">Notice</a></li>
                </ul>
              </div>
            </div>
            <div class="col-md-6">
              <div class="copyright">Copyright © <a href="http://themeies.com">themeies</a> - 2019</div>
            </div>
          </div>
        </div>
      </div>
    </footer> -->
  <!--   <footer id="colophon" class="site-footer" role="contentinfo">
            <div class="container mb-xlg">
                <h3 class="footer-title">Download our free Mobile App</h3>
                <p style="
    color: white;
">Track your transfers on the go, or make new ones in a couple of taps.</p>
                <div class="row mt-xlg">
                    <div class="col-xs-6 col-md-2 col-md-offset-4 col-sm-4 col-sm-offset-2" style="
    position: relative;
    left: 363px;
    top: 3px;
">
                <a href="#" target="_blank"><img class="img-responsive" src="resources/images/download-appstore-btn.png"></a>
                        <span class="small" style="
    color: white;
">Coming Soon...</span>
                        </div>
                    <div class="col-xs-6 col-md-2 col-sm-4" style="
    position: relative;
    left: 363px;
    top: 3px;
">
                <a href="#" target="_blank"><img class="img-responsive" src="resources/images/download-playstore-btn.png"></a>
                        <span class="small" style="
    color: white;
">Coming Soon...</span>
                        </div>
                    </div>                
                <a id="btt-btn" href="#page"><span class="">Back to top</span><i class="fa fa-arrow-up btt-icon" aria-hidden="true"></i></a>
            </div>
            <div class="container">
            <div class="row mb-xlg">
                <div class="col-sm-6 col-md-3 col-xs-6">
                    <div class="footer-content text-left">
                        <h4 class="footer-title">
                            Quick Links</h4>
                        <nav>
                            <ul class="footer-menu">
                                <li><a href="ui/about.aspx"><i class="fa fa-angle-right"></i> About Us</a></li>
                                <li><a href="ui/contact.aspx"><i class="fa fa-angle-right"></i> Contact Us</a></li>
                                <li><a href="UI/SendMoney.aspx"><i class="fa fa-angle-right"></i> Money Transfer</a></li>
                                <li><a href="UI/AirtimeTopup/airtimetopup.aspx"><i class="fa fa-angle-right"></i> Airtime/Data Top Up</a></li>
                                <li class="hidden"><a href="ui/internetandutility.aspx"><i class="fa fa-angle-right"></i> Internet &amp; Utility</a></li>                                
                                <li><a href="ui/faq.aspx"><i class="fa fa-angle-right"></i> FAQs</a></li>
                                 
                                 <li><a href="UI/Agents/login.aspx"><i class="fa fa-angle-right"></i> Agent Login</a></li>                                
                            </ul>
                          
                           
                        </nav>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-xs-6 hidden-xs">
                    <div class="footer-content text-left">
                        <h4 class="footer-title">
                            Legal</h4>
                        <nav>
                            <ul class="footer-menu">
                                <li><a href="ui/amlctf.aspx"><i class="fa fa-angle-right"></i> AML/CTF Policy</a></li>
                                <li><a href="ui/privacypolicy.aspx"><i class="fa fa-angle-right"></i> Privacy Policy</a></li>
                                <li><a href="ui/termsandconditions.aspx"><i class="fa fa-angle-right"></i> Terms and Conditions</a></li>
                                <li><a href="ui/cookiespolicy.aspx"><i class="fa fa-angle-right"></i> Cookies Policy</a></li>                                
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-xs-6 hidden-xs">
                    <div class="footer-content text-left">
                        <h4 class="footer-title">
                            Send Money to</h4>
                        <nav>
                            <ul class="footer-menu">
                                <li><a href="UI/SendMoney.aspx"><i class="fa fa-angle-right"></i> Bangladesh</a></li>
                                <li><a href="UI/SendMoney.aspx"><i class="fa fa-angle-right"></i> Pakistan</a></li>
                                <li><a href="UI/SendMoney.aspx"><i class="fa fa-angle-right"></i> China</a></li>
                                <li><a href="UI/SendMoney.aspx"><i class="fa fa-angle-right"></i> Nepal</a></li>
                                <li><a href="UI/SendMoney.aspx"><i class="fa fa-angle-right"></i> Singapore</a></li>
                                <li><a href="UI/SendMoney.aspx"><i class="fa fa-angle-right"></i> India</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-xs-6">
                    <div class="footer-content text-left">
                        <h4 class="footer-title">
                            Contact</h4>
                        <nav>
                            <ul class="footer-menu">
                                <li style="
    color: white;
"><span class="h5">Address:</span><br>
                                     5 Newenden St Maddington, WA 6109</li>
                                <li style="
    color: white;
"><span class="h5">Phone:</span><br>
                                    +61 478 606 292, +61 421 694 109</li>
                                <li ><span class="h5">Email:</span><br>
                                    <a href="mailto:support@quiqsend.com.au">support@quiqsend.com.au</a></li>                                
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <ul class="list-inline social-buttons">
                        <li><a href="https://twitter.com/" target="_blank"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="https://www.linkedin.com" target="_blank"><i class="fab fa-linkedin-in"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="row mt-xlg">
                <div class="col-md-12">
                    <ul class="list-inline quicklinks " style="
    position: relative;
    top: 22px;
color:white;">
                        <li>© 2020 QuiqSend.com.au. All Rights Reserved.</li>                       
                    </ul>
                </div>
            </div>            
            <div class="row hidden">
                <div class="col-sm-8 col-sm-offset-2">
                    <p>
                        <small>Quiqsend Australia (ABN: 77600038300 ) is providing remittance services to Bangladesh and instant International Mobile Top Up services.</small>
                    </p>
                </div>
            </div>
        </div>
        </footer> -->
      
        <footer id="colophon" class="site-footer" role="contentinfo">
        <div class="container">
            <div class="row mb-xlg">
                <div class=" col-md-3 ">
                    <div class="footer-content text-left">
                        <h4 class="footer-title">
                            Quick Links</h4>
                        <nav>
                            <ul class="footer-menu">
                                <li><a href="aboutus"><i class="fa fa-angle-right"></i> About Us</a></li>
                                <li><a href="contact"><i class="fa fa-angle-right"></i> Contact Us</a></li>
                                <li><a href="UI/SendMoney.aspx"><i class="fa fa-angle-right"></i> Money Transfer</a></li>
                                <li><a href="UI/AirtimeTopup/airtimetopup.aspx"><i class="fa fa-angle-right"></i> Airtime/Data Top Up</a></li>
                                <li class="hidden"><a href="ui/internetandutility.aspx"><i class="fa fa-angle-right"></i> Internet &amp; Utility</a></li>                                
                                <li><a href="faqs"><i class="fa fa-angle-right"></i> FAQs</a></li>
                                 
                                 <li><a href="UI/Agents/login.aspx"><i class="fa fa-angle-right"></i> Agent Login</a></li>                                
                            </ul>
                          
                           
                        </nav>
                    </div>
                </div>
                <div class="col-md-3  hidden-xs">
                    <div class="footer-content text-left">
                        <h4 class="footer-title">
                            Legal</h4>
                        <nav>
                            <ul class="footer-menu">
                                <li><a href="ui/amlctf.aspx"><i class="fa fa-angle-right"></i> AML/CTF Policy</a></li>
                                <li><a href="ui/privacypolicy.aspx"><i class="fa fa-angle-right"></i> Privacy Policy</a></li>
                                <li><a href="ui/termsandconditions.aspx"><i class="fa fa-angle-right"></i> Terms and Conditions</a></li>
                                <li><a href="ui/cookiespolicy.aspx"><i class="fa fa-angle-right"></i> Cookies Policy</a></li>                                
                            </ul>
                        </nav>
                    </div>
                </div>
                 <div class=" col-md-3  hidden-xs">
                    <div class="footer-content text-left">
                        <h4 class="footer-title">
                            Send Money to</h4>
                        <nav>
                            <ul class="footer-menu">
                                <li><a href="UI/SendMoney.aspx"><i class="fa fa-angle-right"></i> Bangladesh</a></li>
                                <li><a href="UI/SendMoney.aspx"><i class="fa fa-angle-right"></i> Pakistan</a></li>
                                <li><a href="UI/SendMoney.aspx"><i class="fa fa-angle-right"></i> China</a></li>
                                <li><a href="UI/SendMoney.aspx"><i class="fa fa-angle-right"></i> Nepal</a></li>
                                <li><a href="UI/SendMoney.aspx"><i class="fa fa-angle-right"></i> Singapore</a></li>
                                <li><a href="UI/SendMoney.aspx"><i class="fa fa-angle-right"></i> India</a></li>
                            </ul>
                        </nav>
                    </div>
                </div> 
                 <div class=" col-md-3 ">
                    <div class="footer-content text-left">
                        <h4 class="footer-title">
                            Contact</h4>
                        <nav>
                            <ul class="footer-menu">
                                <li style="color: white;"><span class="h5">Address:</span><br>
									${admin.address}
                                     </li>
                                <li style="color: white;"><span class="h5">Phone:</span><br>
                                    ${admin.mobileNumber}</li>
                                <li><span class="h5" style="color:white">Email:</span><br>
                                    <a href="#">${admin.emailId}</a></li>                                
                            </ul>
                        </nav>
                    </div>
                </div> 
            </div>
            <div class="row">
                <div class="col-md-12">
                    <ul class="list-inline social-buttons">
                        <li><a href="https://twitter.com/" target="_blank"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="https://www.linkedin.com" target="_blank"><i class="fab fa-linkedin-in"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="row mt-xlg">
                <div class="col-md-12">
                    <ul class="list-inline quicklinks" style="color: white;    position: relative; top: 35px;">
                        <li>© 2020 QuiqSend.com.au. All Rights Reserved.</li>                       
                    </ul>
                </div>
            </div>            
            <!-- <div class="row hidden">
                <div class="col-sm-8 col-sm-offset-2">
                    <p>
                        <small>Quiqsend Australia (ABN: 77600038300 ) is providing remittance services to Bangladesh and instant International Mobile Top Up services.</small>
                    </p>
                </div>
            </div> -->
        </div>
          </footer>
</body>
</html>