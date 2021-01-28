<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<title>Add Rates</title>
<style>
.addrates{
padding:50px 50px;
}

@media (max-width:767px){
.addrates{
widh:100% !Important;
background-color:#000 !important;
}

}
</style>
<script type="text/javascript">
$(document).ready(function (){
			$.getJSON("https://api.ipify.org/?format=json", function(e) {
			    console.log(e.ip);
			   // alert("ioplhgfszd"+e.ip);
			    $('#myIp').val(e.ip);
			});
	
 
	$.ajax({
	    	url : "getallbranchesbasedonadmin",
	    	type : "GET",
	    	async  : false,
	    	success : function(response){
	    		 var allbranches = JSON.stringify(response, undefined, '\t');
	    		//alert('allbranches===='+allbranches);
	    		 $('#branchesList').val(allbranches);	 
	    	},
	    	error : function(xhr, status, error) {
			alert("branchesList error::"+error);
		}
	     });
	
	$.ajax({
    	url : "getallRevenueRatesbasedonadmin",
    	type : "GET",
    	async  : false,
    	success : function(response){
    		 var allsellrates = JSON.stringify(response, undefined, '\t');
    		//alert('allsellrates==='+allsellrates);
    		 $('#sellRatesList').val(allsellrates);
    		 
    	},
    	error : function(xhr, status, error) {
		alert("sellRatesList error::"+error);
	}
     });
	
    var sellRatesList=$('#sellRatesList').val();
	var branchesList=$('#branchesList').val();
  
	 var bodyres='';
	 var sending_br='';
	 $.each($.parseJSON(branchesList),function(idx,obj){
		 
		if(obj.functionality ==='sending' || obj.functionality ==='both'){
			bodyres=bodyres+'<tr class="table-warning"><td colspan="5" style="">'+obj.fromCountry.countryName+'-'+obj.branchName.toUpperCase()+'</td></tr>';
		}
		sending_br=obj.branchId;
      var sending_br_cur=obj.fromCountry.currencyCode;
      $.each($.parseJSON(branchesList),function(idx,obj){
	   if(obj.functionality === 'receiving' || obj.functionality === 'both'){
	    var receiving_br_cur=obj.fromCountry.currencyCode;
		var receving_br=obj.branchId;
	   /*  if(sending_br_cur===receiving_br_cur){
		   
	   }else{ */
 		 $.each($.parseJSON(sellRatesList),function(idx,obj){
		  if(obj.fromBranch.branchId===sending_br && obj.toBranch.branchId===receving_br){
			  if(idx===0){
			  $('#rateUpdateddate').val(obj.rateUpdatedDate);
			  }
			      var adminPercentage=Number(obj.adminPercentage);
			      var sourcePercentage=Number(obj.sourcePercentage);
			      var terminatePercentage=Number(obj.terminatePercentage);
				 bodyres=bodyres+"<tr style='background:#fff'><th><label>"+sending_br_cur+"-"+receiving_br_cur+"</label><label>("+obj.fromBranch.branchName.toUpperCase()+"-"+obj.toBranch.branchName.toUpperCase()+")</label></th><td><input type='text' id='adminPercentage"+idx+"' value='"+adminPercentage+"' class='form-control' </td><td> <input type='text'  class='form-control' id='sourcePercentage"+idx+"' value='"+sourcePercentage+"' class='form-control'</td><td><input type='text' id='terminatePercentage"+idx+"' value='"+terminatePercentage+"' class='form-control' </td><td colspan='8'> <button class='btn btn-primary btn-alt-primary' type='button' onclick=updateRate('"+idx+"','"+sending_br+"','"+receving_br+"','"+obj.rpId+"');>Update rates</button></td></tr>";
			}
		 });
	  /*  } */
		}  	
	});
	});
	 $('#tablebody').empty();
	 $('#tablebody').append(bodyres);
	
	 var rateUpdateddate=$('#rateUpdateddate').val();
		$('#updateddate').empty();
		$('#updateddate').append(rateUpdateddate);
		 
});
</script>
<script type="text/javascript">
function removeError(id){
	$('#msg').hide();
	$('#'+id).css('outline','#B0C4DE');
}

</script>
<script type="text/javascript">
function updateRate(count,f_br,t_br,rpId)
{
 $('#adminPercentage').val($('#adminPercentage'+count).val());
 //alert('adminPercentage===='+adminPercentage);
	$('#sourcePercentage').val($('#sourcePercentage'+count).val());
	// alert('sourcePercentage===='+sourcePercentage);
	$('#terminatePercentage').val($('#terminatePercentage'+count).val());
	 //alert('terminatePercentage===='+terminatePercentage);
	if($('#adminPercentage'+count).val()==''){
		$('#adminPercentage'+count).focus().css('outline','solid red 2px');
		return false;
	}
	if($('#sourcePercentage'+count).val()==''){
		$('#sourcePercentage'+count).focus().css('outline','solid red 2px');
		return false;
	}
	if($('#terminatePercentage'+count).val()==''){
		$('#terminatePercentage'+count).focus().css('outline','solid red 2px');
		return false;
	}
	
	
	
	$('#f_br').val(f_br);
	$('#t_br').val(t_br);
	$('#rpId').val(rpId);
	$('#frm').submit();
	

}
</script>

</head>
<body>
 <%@include file ="headerNew.jsp" %>  
 
 <form action="update_revenue_by_admin" method="post" id="frm">
 <input type="hidden" name="sourcePercentage" id="sourcePercentage"/>
 <input type="hidden" name="terminatePercentage" id="terminatePercentage"/>
 <input type="hidden" name="adminPercentage" id="adminPercentage"/>
 <input type="hidden" name="f_br" id="f_br"/>
 <input type="hidden" name="t_br" id="t_br"/>
 <input type="hidden" name="rateType" value="selling"/>
 <input type="hidden" name="rpId" id="rpId" value=""/>
 <input type="hidden" id="sellRatesList">
 <input type="hidden" id="branchesList">
 <input type="hidden" id="rateUpdateddate">
<input type="hidden" name="myIp" id="myIp">
 </form>
 <div class="container">
  <main id="main-container">
              
                <div class="content">
                    
                    
                    
<!--                     <h1>Last Rates  Updated Date:<span id="updateddate"></span></h1>
 --><section class="block">
         <div class="">
              <div class="row">
                   <div class="col-md-12">
                   <h5 style="text-align:center;padding:5px;font-size: 16px;background:#2e287b;color:white;">Revenue Percentage</h5>
                        <div class="table-responsive">
                             <table class="table table-bordered table-striped table-vcenter js-dataTable-full-pagination dataTable no-footer" style="">
                                    <thead class="">
                                            <tr class="table-primary">
                                                 <th style="text-align:center;padding:5px;font-size: 13px;background:#2e287b;color:white;">Countries</th>
       	                                         <th style="text-align:center;padding:5px;font-size: 13px;background:#2e287b;color:white;">AdminPercentage</th>
       	                                         <th style="text-align:center;padding:5px;font-size: 13px;background:#2e287b;color:white;">SourcePercentage</th>
                                                 <th style="text-align:center;padding:5px;font-size: 13px;background:#2e287b;color:white;">Terminate Percentage</th>
                                             <th style="text-align:center;padding:5px;font-size: 13px;background:#2e287b;color:white;">UPDATE</th>
                                             </tr>
                                     </thead>
                                     <tbody id="tablebody">
                                     </tbody>
                                                        </table>
                             </div>
                   </div>
              </div>
         </div>
</section>  
                    
                </div>
              
            </main>
 

</body>
<script type="text/javascript">
function calculateSellRate(mr_id,id,s_rate){
	//alert('id = '+id);
	
	var m_rate=$('#'+mr_id).val();
	var value=$('#'+id).val();
	//alert('value = '+value);
	var per=Number(m_rate)*Number(value)/100;
	var sell_rate=Number(Number(m_rate)-Number(per)).toFixed(6);
	$('#'+s_rate).val(sell_rate);
	//alert('sell_rate'+sell_rate);
	
}
</script>

</html>