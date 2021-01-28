<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>jQuery UI Autocomplete - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>bankbalance</title>

<script type="text/javascript">
$(document).ready(function(){
	// alert('dfs')
	  $('#submit').click(function(){
	//	  alert("df");
		 var fin=$('#fin').val();
		  var majorHeadNature=$('#majorHeadNature').val();
		  var cdtype=$('#cdtype').val();
		  var bankname=$('#bankname').val();
		  var amount=$('#amount').val();
		  if(fin==""){
			  $('#fin').focus().css('outline','solid red 2px');
			  return false;
		  }
		   if(majorHeadNature==""){
			  $('#majorHeadNature').focus().css('outline','solid red 2px');
			  return false;
		  }
		  if(cdtype==""){
			  $('#cdtype').focus().css('outline','solid red 2px');
			  return false;
		  }
		  
		  if(bankname==""){
			  $('#bankname').focus().css('outline','solid red 2px');
			 
			  return false;
		  }
		    	if(amount==""){
			  $('#amount').focus().css('outline','solid red 2px');
			  return false;
		  
		    		}
		    	
	    			$.ajax({
	    				url : "checkcurrentYear",
	    				method : "post",
	    				data : "bankname="+bankname+"&fin="+fin,
	    				 async : false,
	    				success : function(response){
	    					alert(response)
	    					 if(response==success){
	    					alert("result=="+response);
	    					}
	    					else{
	    						alert("success");
	    					}
	    				},
	    				
	    			});
	    		    	 });
	  });
	  
	  

	  </script>


<script type="text/javascript">
	function validateLevel(majorHeadNature) {
		 //alert('majorHeadNature');
		 				  var majorHeadNature = $('#majorHeadNature').val();
		 				 	// alert('majorHeadNature'+majorHeadNature);
							 var assets1=["State Bank Of India Savings Account","State Bank Of India Current Account","State Bank Of India FD Account","State Bank Of India RD Account"];
			 				  var liaiblity1=["Corporation Bank OD Account","Corporation Bank CC Account"];
var t3=[];
		 				 	 //alert("successssssss::::");
						var result='';
						if(majorHeadNature=='Equity'){
							result="credit";
						}
						else if (majorHeadNature=='Revenue') {
							result="credit";
						}
						else if (majorHeadNature=='Expenses') {
							result="debit";	
						
						}else if (majorHeadNature=='Assets') {
							
							result="debit";
							t3=assets1;
							
						}else{
							result="credit";	
							t3=liaiblity1;
						}
						alert("ressssss"+result);
						$('#cdtype').val(result);
					alert('success1');
	 				  $( "#bankname" ).autocomplete({
	 				      source: t3
	 				    });
	 				  
		
	 				  
	}
	
</script>


</head>
<body>
<form action="bblform" id="bblform" method="POST">
			<h3 class="admin-heading">Balance Entry Form</h3>
			<div class="col-md-3">
				<label>Select FinYr*</label>
			<select name="fin" id="fin" class="select ui-widget-content ui-corner-all">
  			<option value="">----SELECT----</option>
  			<option value="2020-21">2020-21</option>
  			<option value="2019-20">2019-20</option>
  			<option value="2018-19">2018-19</option>
  		</select>
			</div>
			<div class="col-md-3">
				<label>Category*</label>
				<select class="form-control" name="majorHeadNature"  id="majorHeadNature" 	onchange="validateLevel(majorHeadNature)" 
							onclick="removeError('majorHeadNature')">
							<option value="">---select---</option>
						<option value="Equity">Equity</option>
					<option value="Revenue">Revenue</option>
					<option value="Expenses">Expenses</option>
					<option value="Assets">Assets</option>
					<option value="Liabilities">Liabilities</option>
				
				</select>
			</div>
			<div class="col-md-3">
				<label>Bank Name*</label>
				<input type="text" class="form-control" name="bankname"  id="bankname"  onkeyup="removeError('bankname);">
			</div>
			<div class="col-md-3"> 
				<label>Type</label>
				<input type="text" class="form-control" name="cdtype" id="cdtype"  onkeyup="removeError('cdtype');">
			</div>
			<div class="col-md-3"> 
				<label>Amount</label>
				<input type="text" class="form-control" name="amount" id="amount"  onkeyup="removeError('amount');">
			</div>
			
			<div class="col-md-12">
				 <button type="submit" id="submit"  "btn btn-blue btn-submit center-block mt-20 mb-20">Create</button>
			</div>
			</form>

</body>
<script>
$( function() {
	var majorHeadNature1 = $('#majorHeadNature').val();
 	 alert('majorHeadNature'+majorHeadNature1);
 	var availableTags = ["abc","bcd"];
    var t2=["cdf","fd"];
    var t3=[];
 	 if(majorHeadNature1=="Assets"){
	t3=availableTags;
	alert(t3)
} elseif(majorHeadNature1="Liabilities"){
	t3=t2;
	alert(t3);
}
    
    var d3=availableTags;
    $( "#bankname" ).autocomplete({
      source: t3
    });
  } );
alert("sdf");
</script>
</html>