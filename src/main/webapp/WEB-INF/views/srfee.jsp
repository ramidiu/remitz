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
<body>
<%@include file ="headerNew.jsp" %>

<div class="container-fluid">
<div class="row">
<div class="col-md-8">
<div class="container-fluid">

<main id="main-container" class="container-fluid">
              
                <div class="content">
                 <h3 class="header-title mb-3"><b>Commission Slabs Admin</b></h3>
                 <p>Also see: Transfer Fees Administration</p>
                 
	<section class="block ">
 									<div id="remDiv">
									<input type="hidden" name="myIp" id="myIp">	
										<div class=" p-3 mb-5 bg-white rounded mt-30">
											<div class="form-row">
              					<div class="form-group col-md-4">
                					<label for="inputEmail4">Source Country:</label>
                 					<select class="form-control" name="fromBranch" id="fromBranch">
											<c:forEach var="list" items="${sList}">
								<option value="${list.branchId}">${list.fromCountry.countryName}</option>
							</c:forEach>
							</select>
              					</div>              					
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Destination Country:</label>
                 					<select class="form-control" name="toBranch" id="toBranch" onchange="getpayments();">
											<c:forEach var="rList" items="${rList}">
								<option value="${rList.branchId}">${rList.fromCountry.countryName}</option>
							</c:forEach>
							</select>
              	             					
              					</div>
              					<div class="form-group col-md-4 ">
                					<label for="inputEmail4">Transfer Type:</label>
                 					<select class="form-control" name="paymentType" id="paymentType">
								<option value="Cash Collection">Cash Collection</option>
								<option value="Account Transfer">Account Transfer</option>
								<option value="Card Transfer">Card Transfer</option>
							<option value="Home Delivery">Home Delivery</option>
							<option value="Bill Payment">Utility Bill Payment</option>
							<option value="Mobile Money">Mobile Money Transfer</option>
							</select>
              					</div>
										</div>
	<div class="col-md-4" >
	
<input type="submit"  value="GO" class="popUpYes" id="makeTransaction " onclick="doTransaction5();" style="">
</div>

&nbsp
                         <h4 style="background-color:green;color:#fff;padding:8px 8px 8px 8px;text-align:center" id="success"></h4>

<br>
<br>

<p>We recommend creating a high amount 'catch-all' slab in each corridor.
The Fixed Fee Commission is an absolute amount in the specified currency. The Percentage Commission is the percentage of the source amount that is taken as commission at that slab level.
</p>

										</div>
										</div>
</section>
</div>
</mlain>
                                            <label id="msg"></label>

                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-5">
                                                <thead class="table-primary">
                                                 <tr id="headerrow">
                                                    <th style="background: #2e287b;color:white;text-align:center;">MinValue</th>
                                                    <th style="background: #2e287b;color:white;text-align:center;">MaxValue</th>
                                                    <th style="background: #2e287b;color:white;text-align:center;">Commission fee</th>
                                                    <th style="background: #2e287b;color:white;text-align:center;">RateType:</th>
                                                    <th style="background: #2e287b;color:white;text-align:center;">Update</th>
                                                  </tr>
                                                </thead>
                                                <tbody id="sid">
     </tbody>
     
                                            </table>
	
</div>






                                   
          <div id="newDiv" >
           <div class=" p-3 mb-5 bg-white rounded mt-30" style="margin-left:8px;" >
		<tr >
		<td >
		<input type="text" name="minValue" readonly id="mv" class="mb">
		</td>
	
		
		<td>
	<input type="text" name="maxValue" id="mx" class="mb" placeholder="enter maxvalue..*">
		</td>

		
		<td>
	<input type="text" name="serviceFee" id="sf"  class="mb" placeholder="enter Fee(Fixed)..*">
		</td>

		
		<td>
                 					<select  name="rateType" id="rateType">
								<option value="flatfee">Flat Fee</option>
								<option value="percentage">Percentage</option>
		</select>
		</td>

		
		<td><input type="button" class="btn  btn-primary" value="SUBMIT" id="makeTransaction" onclick="submitRow();">

</td>
		</tr>
	</div>
	<br>
 	
      
  </div>    
              
                                      
	<div class="col-md-3">
<input type="button" class="popUpYes" style="padding:5px;" value="NEW" id="makeTransaction" onclick="addRow();">
</div>
 	<div class="col-md-3" >
<input type="button" class="btn btn-danger" style="width:100%;" value="DELETE" id="makeTransaction" onclick="deleteRow();">
</div>
                                        
</body>
   <script>
   function deleteRow()
   {
		//$('#success').hide();
		var myIp=$('#myIp').val();
	   var fromBranch=$('#fromBranch').val();
		var toBranch=$('#toBranch').val();
		var ptype=$('#paymentType').val();
		var querystring="fromBranch="+fromBranch+"&toBranch="+toBranch+"&ptype="+ptype+"&myIp="+myIp;  
		$.ajax({
				  url:'deleteServicevalue',
				  type:'POST',
				  data:querystring,
				  success:function(response)
				  {
					  //alert('response===='+response);
					   $('#newDiv').hide();
						//$('#success').show();
						//$('#success').empty();
						//$('#success').append("fee slabs has been Changed Successfully");
						$('#paymentType').val(ptype);
						$('#fromBranch').val(fromBranch);
						$('#toBranch').val(toBranch);
						doTransaction5();

				  },
					error:function()
					{
						
						alert("error");
					}

						
				  });
		$('#paymentType').val(ptype);
		$('#fromBranch').val(fromBranch);
		$('#toBranch').val(toBranch);
		doTransaction5();

   }
   </script>
   <script>
   function submitRow()
   {
		//alert('hghg');
	   var fromBranch=$('#fromBranch').val();
		var toBranch=$('#toBranch').val();
		var ptype=$('#paymentType').val();
		var mv=$('#mv').val();
		var mx=$('#mx').val();
		var sf=$('#sf').val();
		var rateType=$('#rateType').val();
		var myIp=$('#myIp').val();
//alert('muip===='+myIp);
		if(mx==''){
			alert('please enter maxvalue');
			return false;
		}
		if(sf==''){
			alert('please enter Fee(Fixed)');
			return false;
		}
		if(rateType==''){
			alert('please enter rateType');
			return false;
		}
	if(Number(mx)<=Number(mv)){
		alert('max value should be Greater than minvaalue...');
		$('#mv').focus().css('outline','solid red 2px');
		$('#mx').focus().css('outline','solid red 2px');
		return false;
		
	}
		
	var querystring="fromBranch="+fromBranch+"&toBranch="+toBranch+"&ptype="+ptype+"&mv="+mv+"&mx="+mx+"&sf="+sf+"&rateType="+rateType+"&myIp="+myIp;
	   //alert('querystring===='+querystring);
	   $.ajax({
			  url:'addServicevalue',
			  type:'POST',
			  data:querystring,
			  success:function(response)
			  {
				  $('#newDiv').hide();
					$('#paymentType').val(ptype);
					$('#fromBranch').val(fromBranch);
					$('#toBranch').val(toBranch);
					doTransaction5();


			  },
				error:function()
				{
					
					alert("error");
				}

					
			  }); 


   }
   </script>
   <script>
   function addRow()
   {
		$('#success').hide();
	   var fromBranch=$('#fromBranch').val();
		var toBranch=$('#toBranch').val();
		var ptype=$('#paymentType').val();
		   var querystring="fromBranch="+fromBranch+"&toBranch="+toBranch+"&ptype="+ptype;
		   $.ajax({
				  url:'getServicemaxvalue',
				  type:'POST',
				  data:querystring,
				  success:function(response)
				  {
					  $('#mv').val(response);
					  $('#mx').val('');
					  $('#sf').val('');
					  $('#pf').val('');
					   $('#newDiv').show();
				  },
					error:function()
					{
						
						alert("error");
					}

						
				  }); 

   }
   </script>
   <script>
   function doTransaction5()
   {
	  // alert('hvhghg');
	 //$('#success').hide();
	  $('#newDiv').hide();
	var fromBranch=$('#fromBranch').val();
	var toBranch=$('#toBranch').val();
	var ptype=$('#paymentType').val();
	//var opt='';
	   var querystring="fromBranch="+fromBranch+"&toBranch="+toBranch+"&ptype="+ptype;
	   //alert('querystring====='+querystring);
	   $.ajax({
			  url:'getSrfeelist',
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
							var glo='';
							glo='<input type="checkbox" name="serviceFeeId" value="'+obj.serviceFeeId+'" >';		 

							 rows=rows+"<tr style='background:#fff'><td class='text-center'><input type='text' id='minValue"+idx+"' value='"+obj.minValue+"' class='form-control' </td><td class='text-center'><input type='text' id='maxValue"+idx+"' value='"+obj.maxValue+"' class='form-control' </td><td class='text-center'> <input type='text'  class='form-control' id='serviceFee"+idx+"' value='"+obj.serviceFee+"'></td><td class='text-center' ><input type='text' class='form-control' style='border: none;' id='rateType"+idx+"'  value='"+obj.rateType.toUpperCase()+"'</td><td class='text-center'><button class='btn btn-primary btn-alt-primary' type='button' onclick=updateRate('"+idx+"','"+obj.serviceFeeId+"');>Update</button></td></tr>";

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
  <script type="text/javascript">
function updateRate(count,serviceFeeId)
{
	$('#success').hide();

	var fromBranch=$('#fromBranch').val();
var toBranch=$('#toBranch').val();
var paymentType=$('#paymentType').val();
var minValue=$('#minValue'+count).val();
var maxValue=$('#maxValue'+count).val();
var sFee=$('#serviceFee'+count).val();
var rateType=$('#rateType'+count).val();
var sfid=$('#serviceFeeId').val();
var myIp=$('#myIp').val();
//alert('rateType===='+rateType);
if(maxValue==''){
	$('#maxValue'+count).focus().css('outline','solid red 2px');
	return false;
}
if(sFee==''){
	$('#sFee'+count).focus().css('outline','solid red 2px');
	return false;
}
if(rateType==''){
	$('#rateType'+count).focus().css('outline','solid red 2px');
	return false;
}


var querystring="sfid="+serviceFeeId+"&minValue="+minValue+"&maxValue="+maxValue+"&sFee="+sFee+"&rateType="+rateType+"&myIp="+myIp;
//alert('querystring==='+querystring);
$.ajax({
	
	type:'POST',
	url:'updatesrFee',
	data:querystring,
	success:function(response){
		if(response=='success')
			$('#success').show();
		$('#success').empty();
		$('#success').append("fee slabs has been Changed Successfully");
		$('#paymentType').val(ptype);
		$('#fromBranch').val(fromBranch);
		$('#toBranch').val(toBranch);
		doTransaction5();

	},
	error:function(xhr,error,status)
	{
	   alert("fee limit error"+error+xhr+status);
	}
	}); 


	

}
</script>
 <script type="text/javascript">
 $(document).ready(function(){
		$.getJSON("https://api.ipify.org/?format=json", function(e) {
		    console.log(e.ip);
		   // alert("ioplhgfszd"+e.ip);
		    $('#myIp').val(e.ip);
		});


	 $('#success').hide();
	 $('#newDiv').hide();
		var fromBranch=$('#fromBranch').val();
		var toBranch=$('#toBranch').val();
		var opt='';
		
 $.ajax({
	url : "/common/getbranchpaymenttypedetailsbasedonbranchidandstatus",
	type : "get",
	data  : "branchId="+toBranch+"&status=active",
	async  : false,
	success : function(response){
		//alert('response==='+response);
		var paymentType = JSON.stringify(response, undefined, '\t');
		var i =0;
		$.each($.parseJSON(paymentType),function(idx,obj){
			opt=opt+'<option value="'+obj.paymentTypes.paymentType+'">'+obj.paymentTypes.paymentType+'</option>';
		
		});
		$('#paymentType').empty();
		$('#paymentType').append(opt);
		},					
		error:function()
		{
			
			alert("getRecTrnBasedonStatuserror");
		}

			
	  }); 
			

		
	var ptype=$('#paymentType').val();
	
		
		var selectbox='';
		   var querystring="fromBranch="+fromBranch+"&toBranch="+toBranch+"&ptype="+ptype;
		   //alert('querystring====='+querystring);
		   $.ajax({
				  url:'getSrfeelist',
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
								var glo='';
								  selectbox2='<select name="rateType" id="rateType'+counts+'" <option value="">select</option><option value="flatfee">Flat Fee</option><option value="percentage">percentage</option></select>'; 

								glo='<input type="checkbox" name="serviceFeeId" value="'+obj.serviceFeeId+'" >';		 

								 rows=rows+"<tr style='background:#fff'><td class='text-center'><input type='text' id='minValue"+idx+"' value='"+obj.minValue+"' class='form-control' </td><td class='text-center'><input type='text' id='maxValue"+idx+"' value='"+obj.maxValue+"' class='form-control' </td><td class='text-center'> <input type='text'  class='form-control' id='serviceFee"+idx+"' value='"+obj.serviceFee+"'></td><td class='text-center' ><input type='text' class='form-control' style='border: none;' id='rateType"+idx+"'  value='"+obj.rateType.toUpperCase()+"'</td><td class='text-center'><button class='btn btn-primary btn-alt-primary' type='button' onclick=updateRate('"+idx+"','"+obj.serviceFeeId+"');>Update</button></td></tr>";

								  counts++; 
							 });
						  $('table').find("tr:gt(0)").remove(); 
						  $('table tbody').append(rows);
						  $('#msg').append(opt);
				  },
					 
					error:function()
					{
						
						alert("getRecTrnBasedonStatuserror");
					}

						
				  }); 
						



 });
 </script>
 <script type="text/javascript">
 
 function getpayments(){
	 var toBranch=$('#toBranch').val();
	var opt='';
	 $.ajax({
			url : "/common/getbranchpaymenttypedetailsbasedonbranchidandstatus",
			type : "get",
			data  : "branchId="+toBranch+"&status=active",
			async  : false,
			success : function(response){
				//alert('response==='+response);
				var paymentType = JSON.stringify(response, undefined, '\t');
				var i =0;
				$.each($.parseJSON(paymentType),function(idx,obj){
					opt=opt+'<option value="'+obj.paymentTypes.paymentType+'">'+obj.paymentTypes.paymentType+'</option>';
				
				});
				$('#paymentType').empty();
				$('#paymentType').append(opt);
				},					
				error:function()
				{
					
					alert("getRecTrnBasedonStatuserror");
				}

					
			  }); 
					

 }
 
 
 
 </script>
</html>