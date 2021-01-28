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
    margin-top:30px;
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
<body>
<%@include file ="headerNew.jsp" %>

<div class="container-fluid">
<div class="row">
<div class="col-md-8">
<div class="container-fluid">

<main id="main-container" class="container-fluid">
              
                <div class="content">
                 
	<section class="block ">
 									<div id="remDiv">
										
										<div class=" p-3 mb-5 bg-white rounded mt-30">
											<div class="  form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4"> Country:</label>
                 					<select class="form-control" name="country" id="country">
											<c:forEach var="list" items="${list}">
								<option value="${list.branchId}">${list.fromCountry.countryName}</option>
							</c:forEach>
							</select>
              					</div>              					
	<div class="col-md-4" >
	
<input type="submit"  value="GO" class="popUpYes" id="makeTransaction " onclick="getList();" style="">
</div>
              					
										</div>
										</div>
</section>
</div>
</mlain><div class="row"></div>
              					                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-5">
                                                <thead class="table-primary">
                                                 <tr id="headerrow">
                                                    <th style="background: #2e287b;color:white;text-align:center;">Name</th>
                                                    <th style="background: #2e287b;color:white;text-align:center;">User Name</th>
                                                    <th style="background: #2e287b;color:white;text-align:center;">Bank Name</th>
                                                    <th style="background: #2e287b;color:white;text-align:center;">Bank Code</th>
                                                    <th style="background: #2e287b;color:white;text-align:center;">Country</th>
                                                     <th style="background: #2e287b;color:white;text-align:center;">Enabled</th>
                                                  </tr>
                                                </thead>
                                                <tbody id="sid">
     </tbody>
     
                                            </table>
	
</div>



              					</div></div></div></div>
              					</body>
              					
   <script>
   function getList()
   {
	var country=$('#country').val();
	//alert('country===='+country);
	   $.ajax({
			  url:'getprocessbanklist',
			  type:'POST',
			  data:"country="+country,
			  success:function(response)
			  {
				  
				  var List = JSON.stringify(response, undefined, '\t');
				 //alert('List===='+List);
				  var rows='';
					 var counts=1;
					  $.each($.parseJSON(List),function(idx,obj){
						  var count='0';
							var td='';

							  rows=rows+'<tr><td>'+obj.firstName+'</td><td>'+obj.userName+'</td><td>'+obj.fullBankName+'</td><td>'+obj.bankCode+'</td><td>'+obj.country.countryName+'</td><td>'+obj.status+'</td></tr>';

							  counts++; 
						 });
					  $('table').find("tr:gt(0)").remove(); 
					  $('table tbody').append(rows);
					 // $('#msg').append(opt);
			  },
				 
				error:function()
				{
					
					alert("getRecTrnBasedonStatuserror");
				}

					
			  }); 
					


   }
  </script>
              					
              					</html>