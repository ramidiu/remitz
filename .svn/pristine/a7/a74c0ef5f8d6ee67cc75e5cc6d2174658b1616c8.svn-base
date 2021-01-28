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
	    		 $('#branchesList').val(allbranches);	 
	    	},
	    	error : function(xhr, status, error) {
			alert("status code:"+status);
			alert("error::"+error);
		}
	     });
	
	$.ajax({
    	url : "getallsellratesbasedonadmin",
    	type : "GET",
    	async  : false,
    	success : function(response){
    		 var allsellrates = JSON.stringify(response, undefined, '\t');
    		$('#sellRatesList').val(allsellrates);
    		 
    	},
    	error : function(xhr, status, error) {
		alert("status code:"+status);
		alert("error::"+error);
	}
     });
	
    var sellRatesList=$('#sellRatesList').val();
	var branchesList=$('#branchesList').val();
  
	 var bodyres='';
	 var sending_br='';
	 $.each($.parseJSON(branchesList),function(idx,obj){
		 
		if(obj.functionality ==='sending' || obj.functionality ==='both'){
			bodyres=bodyres+'<tr class="table-warning"><td style="text-align:center;background:orange;color:white;padding:2px; colspan="15" >'+obj.fromCountry.countryName+'-'+obj.branchName.toUpperCase()+'</td></tr>';
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
			      var masterRate=Number(obj.masterRate).toFixed(6);
			      var markUp=Number(obj.markup).toFixed(2);
			      var per=Number(masterRate)*Number(markUp)/100;
			  	var sell_rate=Number(Number(masterRate)-Number(per)).toFixed(6);
				 bodyres=bodyres+"<tr style='background:#fff'><th><label>"+sending_br_cur+"-"+receiving_br_cur+"</label><label>("+obj.fromBranch.branchName.toUpperCase()+"-"+obj.toBranch.branchName.toUpperCase()+")</label><td class='text-center'>"+obj.paymentType.toUpperCase()+"</td></th><td class='text-center'><input type='text' id='masterRate"+idx+"' value='"+masterRate+"' class='form-control' </td><td class='text-center'> <input type='text'  class='form-control' id='markup"+idx+"' value='"+markUp+"'onkeyup=calculateSellRate('masterRate"+idx+"','markup"+idx+"','sellRate"+idx+"');></td><td class='text-center' ><input type='text' class='form-control' style='border: none;' id='sellRate"+idx+"' readonly value='"+sell_rate+"'</td><td class='text-center' colspan='8'> <button class='btn btn-primary btn-alt-primary' type='button' onclick=updateRate('"+idx+"','"+sending_br+"','"+receving_br+"','"+obj.crId+"');>Update rates</button></td></tr>";
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
function updateRate(count,f_br,t_br,crId)
{
 $('#masterRate').val($('#masterRate'+count).val());
	$('#markup').val($('#markup'+count).val());
	$('#sellRate').val($('#sellRate'+count).val());
	
	if($('#masterRate'+count).val()==''){
		$('#masterRate'+count).focus().css('outline','solid red 2px');
		return false;
	}
	if($('#markup'+count).val()==''){
		$('#markup'+count).focus().css('outline','solid red 2px');
		return false;
	}
	if($('#sellRate'+count).val()==''){
		$('#sellRate'+count).focus().css('outline','solid red 2px');
		return false;
	}
	
	
	
	$('#f_br').val(f_br);
	$('#t_br').val(t_br);
	$('#crId').val(crId);
	$('#frm').submit();
	

}
</script>

</head>
<body>
 <%@include file ="headerNew.jsp" %>  
 
 <form action="update_rates_by_admin" method="post" id="frm">
 <input type="hidden" name="myIp" id="myIp">	
 <input type="hidden" name="masterRate" id="masterRate"/>
 <input type="hidden" name="markup" id="markup"/>
 <input type="hidden" name="sellRate" id="sellRate"/>
 <input type="hidden" name="f_br" id="f_br"/>
 <input type="hidden" name="t_br" id="t_br"/>
 <input type="hidden" name="rateType" value="selling"/>
 <input type="hidden" name="crId" id="crId" value=""/>
 <input type="hidden" id="sellRatesList">
 <input type="hidden" id="branchesList">
 <input type="hidden" id="rateUpdateddate">

 </form>
 <div class="container">
  <main id="main-container">
              
                <div class="content">
                    
                    
                    
<!--                     <h1>Last Rates  Updated Date:<span id="updateddate"></span></h1>
 --><section class="block">
         <div class="">
              <div class="row">
                   <div class="col-md-12">
                   <h5 style="padding:5px;text-align:center;font-size: 16px;background:#2e287b;color:white;">Selling Rate</h5>
                        <div class="table-responsive">
                             <table class="table table-bordered table-striped table-vcenter js-dataTable-full-pagination dataTable no-footer" style="">
                                    <thead class="">
                                            <tr class="table-primary">
                                                 <th style="text-align:center;padding:5px;font-size: 13px;background:#2e287b;color:white;">Countries</th>
       	                                         <th style="text-align:center;padding:5px;font-size: 13px;background:#2e287b;color:white;">PaymentType</th>
       	                                         <th style="text-align:center;padding:5px;font-size: 13px;background:#2e287b;color:white;">Master Rate</th>
                                                 <th style="text-align:center;padding:5px;font-size: 13px;background:#2e287b;color:white;">Mark Up(%)</th>
                                                 <th style="text-align:center;padding:5px;font-size: 13px;background:#2e287b;color:white;">Sell Rate</th>
                                                 <th style="text-align:center;padding:5px;font-size: 13px;background:#2e287b;color:white;">Update</th>
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