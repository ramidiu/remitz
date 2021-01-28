<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>POLi</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>

.poli1 h3, p{
text-align:center;
}
.poli1 a{
color: #00b9ff;
    text-decoration: underline;
}
.poli1 a:hover{
color: #00b9ff;
    text-decoration: underline;
}
.clear{
clear:both;}
.poli1 .btn4{ border: none;
    font-family: "Rubik", sans-serif;
    background-color: #2dbe60 !important;
    margin-top: 30px;
    font-weight: 500;
    text-align: center;
    font-size: 16px;
    line-height: 1.5;
    border-radius: 4px;
    color: #fff !important;
        padding: 7px 15px 7px 15px;

 
    }
.btn5 {
    border: none;
    font-family: "Rubik", sans-serif;
    background-color: #ff0000;
   
    font-weight: 500;
    text-align: center;
    font-size: 16px;
    line-height: 1.5;
    border-radius: 4px;
    color: #fff;
   
    padding: 7px 15px 7px 15px;
}
.poli1 img{
    margin: 10px 0 0 0;
    padding: 5px 20px;
	}
    .poli1{
    background-color:white;   
padding:0px;
    margin-top: 80px;
}
.poli4{

text-align: center;
    position: relative;
    left: 0;
    right: 0;
  }
  

  
  
  
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	
	$('#continue').click(function(){
		$('#form').attr('action' ,'dopolipayment')
		$('#form').submit(); 
		/* var amt=$("#sendAmount").val();
 		var txnId=$("#txnId").val();
		window.location="initiatepayment?amt="+amt+"&merchantReference="+txnId; */
	});
	$('#cancel').click(function(){
		$('#form').attr('action' ,'canceltxnbyuser');
		$('#form').submit();
	});
	
});

</script>
</head>
<body>
<%@include file="myacc_header.jsp" %> 
<form id="form" method="post">
<input type="hidden" name="sendAmount" id="sendAmount" value="${sendAmount}">
<input type="hidden" name="txnId" id="txnId" value="${txnId}">
</form>
<section class="poli1">
         <div class="container">
               <div class="row">
                    <div class="col-md-12 ">
                         <h3>Pay with POLi</h3>
                         <p><a href="#">Pay another way</a></p>
                     </div>
                     <div class="clear"></div>
                     <div class="col-md-6 col-md-offset-3">
                     <div class="poli2" >
                          <div class="row">
                               <div class="col-md-8">
                                    <h5>Pay in with POLi</h5>
                                    <p style="text-align: left;">POLi let's you securely make a payment from internet bank to TransferWise. Most Australian banks are supported
                                          (but you can doubl-check yours <a href="#">here</a>)
                                     </p>
                                    
                                </div>
                                <div class="col-md-4">
                                 <img src="resources/images/poli.png">
                                   <p class="poli4"><a href="#">What is POLi?</a></p>
                                </div>
                                
                        </div>
                        
                        <div class="clearfix"></div>
                         <div class="poli2" >
                         <div class="row">
                          <div class="col-md-12">
                           <button type="button" class="btn4 btn-block" id="continue">Continue to POLi</button>
                              <button type="button" class="btn5 btn-block" id="cancel">Cancel my transfer</button>
                           </div>
                               </div>    
                               </div>
                       
                       
                   </div>     
                       
                       
                       </div>                
               </div>
        </div>
</section>


<%@include file="frontendfooter.jsp" %>
</body>
</html>