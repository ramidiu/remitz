<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Listing</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.list-inline>li {
    display: inline-block;
    padding-right: 5px;
    padding-left: 5px;
}
.bg-lightgray{
	background: #00acc1;
	
	color:#fff;
}  
.content{
	margin: 82px 0 0 0px;
}
.card-body {
    margin: 0 -81px 0 160px;
    padding: 15px;
}
.clear{
	clear:both;
}
.form-control{
	width: 29% !important;
    float: left;
}
.btn.btn-primary.pull-right{
	    margin: 0 87px;
}
.table {
    width: 100%;
    margin-bottom: 1rem;
    color: #001737;
    position: relative;
    top: 7px;
}
/* .abc button{
color:#0168fa;
background-color:white;
border:none;
padding: 6px 13px 6px 10px;
    border-radius: 5px;
} */
/* .abc button:hover{
border:1px solid #0168fa !important;
} */

</style>
<script type="text/javascript">
 $(document).ready(function(){
		$.getJSON("https://api.ipify.org/?format=json", function(e) {
		    console.log(e.ip);
		   // alert("ioplhgfszd"+e.ip);
		    $('#myIp').val(e.ip);
		});

	 $('#success').hide();
	 /*Search Starts  */
	  $("#search").on("keyup", function() {
		
		    var value = $(this).val().toLowerCase();
		    $("#tbody tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
	  /*Search Starts Ends */
	 
	 onchangeCustomerStatus();
 });
</script>
<script type="text/javascript">
function readData(statustype){
	 var numberOfChecked = Number($('input:checkbox:checked').length);
	 if(numberOfChecked===0){
		 alert("please check atleast one check box to  Update Customer Status.....?");
	 }
	 $.each($("input[name='customerId']:checked"), function(){
		 var checkboxval=$(this).val();
		var myIp=$('#myIp').val();
		 //alert('checkboxval====='+checkboxval);
		 //alert('statustype====='+statustype);
		 numberOfChecked=numberOfChecked-1;		
		 $.ajax({
			url : "updatecustomerstatusByAdmin",
			type : "POST",
			data :"customerId="+checkboxval+"&customerStatus="+statustype+"&myIp="+myIp,
			async: false,
			success:function(response){
				 if(response == 'updated'){ 
					// if(numberOfChecked===0){
							setTimeout(function(){
						           location.reload(); 
						      }, 1000);
							$('#success').show();
							$('#success').empty();
							$('#success').append("Status has been Changed Successfully");
						//}
				   }
			},
			error :function(xhr,status,error){
				alert("status:"+status);
				alert("error:"+error);
			}
			
			 
		 });
	 });
}

function onchangeCustomerStatus(){
	var customerStatus=$('#customerStatus').val();
	
	$.ajax({
		url : "Remmiterlist",
		type : "POST",
		data :"customerStatus="+customerStatus,
		async :false,
		success :function(response){
			var customerList = JSON.stringify(response, undefined, '\t');
			var tb='';
			if(response!=null && response!=""){
				$('#responseDiv').empty();
				tb='<table class="table  table-hover"><thead><tr  style="background: #2e287b;color:white;padding:5px;text-align:center" class="table-primary"><th style="width:5%;"></th><th style="width:9%;">CUSTOMER ID</th><th style="width:15%;">CUSTOMER NAME</th><th style="width:12%;">CONTACT NUMBER</th><th style="width:11%;">ID PROOF TYPE</th><th style="width:4%;">PRIMARY ID PROOF</th><th style="width:5%">STATUS</th><th  style="width:5%">EDIT</th></tr></thead>';
				  $.each($.parseJSON(customerList),function(idx,obj){
					  var firstIdProofType=obj.firstIdProofType;
					  var firstIdProofName='';
					  if(firstIdProofType==='1'){
						  firstIdProofName="Work Permit";
					  }
					  if(firstIdProofType==='2'){
						  firstIdProofName="International Passport";
					  }
					  if(firstIdProofType==='3'){
						  firstIdProofName="Identification ID";
					  }
					  if(firstIdProofType==='4'){
						  firstIdProofName="Residence Permit";
					  }
					  if(firstIdProofType==='5'){
						  firstIdProofName="Passport";
					  }
					  if(firstIdProofType==='01'){
						  firstIdProofName="Driver Licence";
					  }
					  if(firstIdProofType==='6'){
						  firstIdProofName="Social Security";
					  }
					  
					/*   var allMtos=obj.mtos.split(",");
					  var mtosList='';
	 	    		     for(var i=0;i<allMtos.length;i++){
	 	    		    	 var mto=allMtos[i].split("-");
	 	    		    	mtosList=mtosList+mto[1]+" ";
	 	    		     }  */
					tb=tb+'<tbody id="tbody"><tr><td><input type="checkbox" name="customerId" value="'+obj.customerId+'" ></td><td>'+obj.customerId+'</td><td><a href="Remitterprofile?custRegId='+obj.customerId+'" target="_blank" style="color:blue">'+obj.firstName+'</td><td>'+obj.mobileNumber+'</td><td>'+firstIdProofName+'</td><td><img src="/images/customerimages/'+obj.customerId+'/'+obj.firstIdProofDoc+'" width="100" height="55" alt="Please Upload Primary ID Proof"/></td><td class="badge badge-warning">'+obj.status+'</td><td><a href="editRemitterprofile?customerId='+obj.customerId+'" class="btn btn-primary btn-alt-primary" >edit</a></td></tr>';
				 }); // now we don't have resouces folder 
				
				 $('#responseDiv').append(tb+'</tbody></table>');
			}else{
				$('#responseDiv').empty();
				$('#responseDiv').append('<table class="table  table-hover "><thead><tr class="thead-light"> <th style="width:5%;"></th><th style="width:9%;">CUSTOMER ID</th><th style="width:15%;">CUSTOMER NAME</th><th style="width:12%;">CONTACT NUMBER</th><th style="width:11%;">ID PROOF TYPE</th><th style="width:4%;">PRIMARY ID PROOF</th> <th style="width:5%">STATUS</th><th style="width:5%">EDIT</th></tr></thead><tr><td colspan="11" align="center" style="color:red">No Records  Avilable.</td></tr></tbody></table>');
			}
		},
		error : function(xhr,status,error){
			
		}
	});
}
</script>
</head>
<body>
<%@include file="headerNew.jsp" %>
<div class="container">
<main id="main-container">
              
                <div class="content">
	<section class="block p-10">
       <div class="row">
           <div class="col-md-12">                    			
               <div class="">
               		<div class="pull-left">
                         <input type="text" class="form-control mt-0" placeholder="search...." id="search"  style="width: 33px; position: relative;width: 100%!important;left: 1px;"><i class="fas fa-search" style="position: relative;top: -18px;margin: 31px -31px 0;"></i><br>
</div>
<div class="abc pull-right">
                         <button type="button" class="btn btn-success"  style="color:white;" id="activebtn" onclick="readData('active');">Approve</button>&nbsp;&nbsp;
                         <button type="button" id="deactivebtn" class="btn btn-danger" style="color:white" onclick="readData('deactive');">DeActive</button>&nbsp;&nbsp;
                         <button id="suspendbtn" class="btn btn-primary" style="background:orange;color:white;"  onclick="readData('suspend');">Suspend</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Filter By Status
                       <input type="hidden" name="myIp" id="myIp"> 
                         <select  name="customerStatus" id="customerStatus" onchange="onchangeCustomerStatus();"  class="mah" style="color: #0168fa;background-color: white;border: 1px solid #0168fa !important;padding: 6px 13px 6px 10px;border-radius: 5px;position: relative;left: 4px;">
                               <option value="active" selected>Active</option>
                               <option value="pending" >Pending</option>
                               <option value="deactive">DeActive</option> 
                               <option value="suspend">Suspend</option>
                               </select>
                         <h4 style="background-color:green;color:#fff;padding:8px 8px 8px 8px;text-align:center" id="success"></h4>
                       </div>
                       <!-- Response Div Starts -->
                        <div id="responseDiv">
                        <!-- Response Div Starts Ends-->
                        </div>
                         </div>
                             </div>
                        </div>
                        </section>
                    </div>
                   
                 
                 </main>
                
            
</body>
</html>