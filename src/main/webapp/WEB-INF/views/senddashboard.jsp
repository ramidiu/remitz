<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<!DOCTYPE html>
<html >
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> Agent Dashboard </title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="ui/jquery.ui.core.js"></script>
<script src="ui/jquery.ui.datepicker.js"></script>
     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
   <script src="js/jquery-1.4.2.js"></script>
<link rel="stylesheet" href="./admin/themes/ui-lightness/jquery.ui.all.css" />
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
  <script src="${pageContext.request.contextPath}/resources/js/cleave.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.70/jquery.blockUI.min.js"></script>
<style>
td{
border-color:grey;
}
#jkl:hover{
  background-color: yellow;
}
 .popUpYes:hover
    {
      background-color: #005075;;
      color: white; /* SET COLOR IN BLACK */
    }  
    .popUpYes
    {width:100%;
    cursor: pointer;
    text-decoration: none;
    font-weight: bold;
    color: #464646;
    }
    .mb{
 
   width:21%;
   margin-right:5px;
  out-line:none;
    
    height: 34px;
  
  box-sizing: border-box;
  border: 1px solid #ccc;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
}
   td{
    border: 1px solid #ddd;
   }
   .mb:focus {
   border: 1px solid #34ebe1;
}
   
   
</style>

   </head>
   <body><br>
   
<%@include file="headerNew.jsp" %>
   <div class="container-fluid">
   <div class="row">
   <div class="col-md-1"></div>
   <div class="col-md-11">
   <p>Welcome ${b.branchName} - Please choose a function from the Menu above.</p>
   
   </div>
   </div>
   <div class="row">
   <div class="col-md-1"></div>
   <div class="col-md-9">
   <p>Message of the Day</p>
   <p style="background:#e18500;padding:5px;font-size:13px;">Welcome to  ${b.admin.companyName}. We are proud of all our Agents, We really appreciate your contributions which have made ${b.admin.companyName} a successful company today.</p>
   </div>
   </div><br>
   <div class="row">
   <div class="col-md-1"></div>
   <div class="col-md-2 form-inline">
   <p>Entered transactions  &nbsp&nbsp<div class="vl"></div>&nbsp&nbsp<b><p>${enter}</p></em></b>
   </div>
   <div class="col-md-2 form-inline">
   <p>Pending <br> Transactions: &nbsp &nbsp&nbsp&nbsp&nbsp<div class="vl"></div> &nbsp&nbsp&nbsp&nbsp<b><p>${pending}</p></em></b>
   </div>
   <div class="col-md-2 form-inline">
   <p>paid Transactions:&nbsp<div class="vl"></div>&nbsp<b><p>${success}</p></b>
   </div>
      <div class="col-md-2 form-inline">
   <p>Cancelled Transactions:&nbsp<div class="vl"></div>&nbsp<b><p>${cancel}</p></b>
   </div>
   
   <div class="row" >
   <div class="col-md-1"></div>
   <div class="col-md-2 form-inline">
   <p>Credit: ${b.fromCountry.countryISO}${credit} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
   </div>
   </div>
   </div>
   <div class="row">
   <div class="col-md-1"></div>
   <div class="col-md-11">
   <p>Current rate to <label id="rcountry"></label></p></div></div>
   <div class="row">
   
   <div class="col-md-1"></div>
   <div class="col-md-5">
   <div class="row" style="background: #e18500;">
   <div class="col-md-4" ><p style="padding-top:4px;">Other countries:</p></div>
   <div class="col-md-6" style="padding:6px;">
   <select style="height:30px;width:100%;" id="toBranch" name="toBranch" >
											<c:forEach var="rList" items="${rlist}">
								<option value="${rList.branchId},${rList.fromCountry.countryName}">${rList.fromCountry.countryName}</option>
			</c:forEach>
   </select></div>
   <input type="hidden" name="fromBranch" id="fromBranch" value="${branchId}">
    <div class="col-md-1" style="padding:6px;">
   <input type="submit" value="GO" onclick="doTransaction5();">
   </div>
   </div>
   </div>
   </div>
  
  
   <br> 
   <div class="row">
   
   <div class="col-md-1"></div>
   <div class="col-md-7">
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-5">
                                                <thead class="table-primary">
                                                 <tr id="headerrow">
                                                    <th style="background: #2e287b;color:white;text-align:center;">PaymentType</th>
                                                    <th style="background: #2e287b;color:white;text-align:center;">Markup</th>
                                                    <th style="background: #2e287b;color:white;text-align:center;">SellRate </th>
                                                  </tr>
                                                </thead>
                                                <tbody id="sid">
     </tbody>
     
                                            </table>
	
   <div class="row">
   <div class="col-md-5"></div>
   <div class="col-md-4">
<input type="hidden"  value="Start a transaction to Ghana" class="popUpYes"  ></div>
   <div class="col-md-3">
<input type="hidden"  value="Print Rate PDF " class="popUpYes"  ></div>
   </div>
   
   </div>
   </div><br>
   <div class="container">
   <div class="row">
   <div class="col-md-1"></div>
<div class="col-md-11">
   <p>Commision  slabs to <label id="rcountry1"></label></p></div></div>

                        <div id="responseDiv">
                        <!-- Response Div Starts Ends-->
                        </div>
   </div>
   </div>
   </div>
   </div>
   </div>
   </div>
   </body>
   <script>
      $(document).ready(function(){
    
  		var fromBranch=$('#fromBranch').val();
		var toBranch=$('#toBranch').val();
		$('#rcountry').append(toBranch.split(",")[1]);
		
		//var opt='';
		   var querystring="fromBranch="+fromBranch+"&toBranch="+toBranch.split(",")[0];
		   //alert('querystring====='+querystring);
		   $.ajax({
				  url:'ratesBasedOnFromCountryAndToCountry',
				  type:'POST',
				  data:querystring,
				  success:function(response)
				  {
					  
					  var txnList = JSON.stringify(response, undefined, '\t');
						//alert('txnList===='+txnList);
					  var rows='';
						 var counts=1;
						 var opt='';
						  $.each($.parseJSON(txnList),function(idx,obj){
								 //opt=opt+"Commission Slabs for "+obj.fromBranch.fromCountry.countryName +" "+"to "+" "+obj.toBranch.fromCountry.countryName;
								//alert('opt====='+opt);
							  var count='0';
								var td='';

								 rows=rows+"<tr style='background:#fff'><td class='text-center'>"+obj.paymentType+"</td><td class='text-center'>"+obj.markup+"</td><td class='text-center'> "+obj.sellRate+"</td></tr>";

								  counts++; 
							 });
						  $('table').find("tr:gt(0)").remove(); 
						  $('table tbody').append(rows);
						  $('#msg').append(opt);
						   docommisionslabs();
					  
				  },
					 
					error:function()
					{
						
						alert("getRecTrnBasedonStatuserror");
					}

						
				  }); 
						


   	  
    	  
    });
      
      docommisionslabs();   
      
  </script> 
   <script type="text/javascript">
   function doTransaction5()
   {
 		var fromBranch=$('#fromBranch').val();
		var toBranch=$('#toBranch').val();
		$('#rcountry').append(toBranch.split(",")[1]);

		var querystring="fromBranch="+fromBranch+"&toBranch="+toBranch.split(",")[0];
		   $.ajax({
				  url:'ratesBasedOnFromCountryAndToCountry',
				  type:'POST',
				  data:querystring,
				  success:function(response)
				  {
					  
					  var txnList = JSON.stringify(response, undefined, '\t');
						//alert('txnList===='+txnList);
					  var rows='';
						 var counts=1;
						 var opt='';
						  $.each($.parseJSON(txnList),function(idx,obj){
								 //opt=opt+"Commission Slabs for "+obj.fromBranch.fromCountry.countryName +" "+"to "+" "+obj.toBranch.fromCountry.countryName;
								//alert('opt====='+opt);
							  var count='0';
								var td='';

								 rows=rows+"<tr style='background:#fff'><td class='text-center'>"+obj.paymentType+"</td><td class='text-center'>"+obj.markup+"</td><td class='text-center'> "+obj.sellRate+"</td></tr>";

								  counts++; 
							 });
						  $('table').find("tr:gt(0)").remove(); 
						  $('table tbody').append(rows);
						  $('#msg').append(opt);
						   docommisionslabs();

				  },
					 
					error:function()
					{
						
						alert("getRecTrnBasedonStatuserror");
					}

						
				  }); 
						

   
   }
   docommisionslabs();
   </script>
   <script type="text/javascript">
   function docommisionslabs()
   {
		var fromBranch=$('#fromBranch').val();
		var toBranch=$('#toBranch').val();
		var querystring="fromBranch="+fromBranch+"&toBranch="+toBranch.split(",")[0];
		$('#rcountry1').append(toBranch.split(",")[1]);
  
		//alert('querystring5577777====='+querystring);
	  	$.ajax({
			url : "commisionslabs",
			type : "POST",
			data :querystring,
			async :false,
			success :function(response){
				//alert('response====='+response);
				var List = JSON.stringify(response, undefined, '\t');
				var tb='';
				if(response!=null && response!=""){
					$('#responseDiv').empty();
					tb='<table class="table table-hover"><thead><tr  style="background: #2e287b;color:white;padding:5px;text-align:center" class="table-primary"><th style="background: #2e287b;color:white;text-align:center;">PaymentType</th><th style="background: #2e287b;color:white;text-align:center;">MinValue</th><th style="background: #2e287b;color:white;text-align:center;">MaxValue</th><th style="background: #2e287b;color:white;text-align:center;">serviceFee</th><th style="background: #2e287b;color:white;text-align:center;">PercentageFee</th></tr></thead>';
					  $.each($.parseJSON(List),function(idx,obj){
							tb=tb+'<tbody id="tbody"><tr><td>'+obj.paymentType+'</td><td>'+obj.minValue+'</td><td>'+obj.maxValue+'</td><td>'+obj.serviceFee+'</td><td>'+obj.percentageFee+'</td></tr>';
						 }); // now we don't have resouces folder 
						
						 $('#responseDiv').append(tb+'</tbody></table>');
					}else{
						$('#responseDiv').empty();
						$('#responseDiv').append('<table class="table  table-hover "><thead><tr class="thead-light"> <th style="width:5%;"></th><th style="width:9%;">MinValue</th><th style="width:15%;">MaxValue</th><th style="width:12%;">ServiceFee</th><th style="width:11%;">PercentageFee</th></tr></thead><tr><td colspan="11" align="center" style="color:red">No Records  Avilable.</td></tr></tbody></table>');
					}

			},
				error : function(xhr,status,error){
					
				}
			});
	     

	   
   }
   </script>
</html>
   