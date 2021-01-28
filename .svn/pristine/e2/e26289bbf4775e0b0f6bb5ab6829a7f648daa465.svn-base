<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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

<script>

$(document).ready(function(){
	
var count=$('#count').val();
	
	
	for(var i=1; i<=count;i++)
		{
		var amasterrate=$('#agentmasterrate'+i).val();
		var amarkup=$('#agentmarkup'+i).val();
		var asellrate=$('#agentsellrate'+i).val();
		
		
		if(amasterrate!=0.0 && asellrate==0.0){
			$('#agentsellrate'+i).val(amasterrate);
		}
		}
})









</script>
<!-- <script type="text/javascript">
$(document).ready(function (){
	
	
 
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
			bodyres=bodyres+'<tr><td colspan="5" style="background-color: #ecb89a;">'+obj.fromCountry.countryName+'</td></tr>';
		}
		sending_br=obj.branchId;
      var sending_br_cur=obj.fromCountry.currencyCode;
      $.each($.parseJSON(branchesList),function(idx,obj){
	   if(obj.functionality === 'receiving' || obj.functionality === 'both'){
	    var receiving_br_cur=obj.fromCountry.currencyCode;
		var receving_br=obj.branchId;
	    if(sending_br_cur===receiving_br_cur){
		   
	   }else{
 		 $.each($.parseJSON(sellRatesList),function(idx,obj){
		  if(obj.fromBranch.branchId===sending_br && obj.toBranch.branchId===receving_br){
			  if(idx===0){
			  $('#rateUpdateddate').val(obj.rateUpdatedDate);
			  }
			      var masterRate=Number(obj.masterRate).toFixed(6);
			      var markUp=Number(obj.markup).toFixed(2);
			      var per=Number(masterRate)*Number(markUp)/100;
			  	var sell_rate=Number(Number(masterRate)-Number(per)).toFixed(6);
				 bodyres=bodyres+"<tr style='border-bottom-style: hidden;background-color: #b2c3f5;'><th><label>"+sending_br_cur+"-"+receiving_br_cur+"</label></th><td><input type='text' id='masterRate"+idx+"' value='"+masterRate+"' class='form-control' style='border: none;'</td><td> <input type='text'  class='form-control' style='border: none'; id='markup"+idx+"' value='"+markUp+"'onkeyup=calculateSellRate('masterRate"+idx+"','markup"+idx+"','sellRate"+idx+"');></td><td><input type='text' class='form-control' style='border: none;' id='sellRate"+idx+"' readonly value='"+sell_rate+"'</td><td colspan='8'> <button type='button' onclick=updateRate('"+idx+"','"+sending_br+"','"+receving_br+"','"+obj.crId+"');>Update rates</button></td></tr>";
			}
		 });
	   }
		}  	
	});
	});
	 $('#tablebody').empty();
	 $('#tablebody').append(bodyres);
	
	 var rateUpdateddate=$('#rateUpdateddate').val();
		$('#updateddate').empty();
		$('#updateddate').append(rateUpdateddate);
		 
});
</script> -->
<script type="text/javascript">
function removeError(id){
	/* $('#msg').hide(); */
	$('#'+id).css('outline','#B0C4DE');
}

</script>
<script type="text/javascript">
function updateRate(count,crId)
{
var amasterrate= $('#agentmasterrate'+count).val();
	var amarkup=$('#agentmarkup'+count).val();
	var asellrate=$('#agentsellrate'+count).val();
	var crid=$('#crid'+count).val();
	var agentid=$('#agentid').val();
	alert("agentid"+agentid);
	if($('#agentmasterrate'+count).val()==''){
		$('#agentmasterrate'+count).focus().css('outline','solid red 2px');
		return false;
	}
	if($('#agentmarkup'+count).val()==''||$('#agentmarkup'+count).val()==0.0){
		$('#agentmarkup'+count).focus().css('outline','solid red 2px');
		return false;
	}
	if($('#agentsellrate'+count).val()==''){
		$('#agentsellrate'+count).focus().css('outline','solid red 2px');
		return false;
	}
	
	var querystring="amasterrate="+amasterrate+"&amarkup="+amarkup+"&asellrate="+asellrate+"&crid="+crid+"&agentid="+agentid;
	$.ajax({
		
	type:'POST',
	url:'updateAgentSellRate',
	data:querystring,
		success:function(response)
		{ 
			if(response=='success')
				alert("updated successfully");
			location.reload(true);
		},
	
			error:function()
			{
				alert("error");
			}
	
	
	
	
	
	})
	
	
	
	
	

}
</script>

</head>
<body>
 <%@include file ="backendheader.jsp" %>  
 
<!--  <form action="update_rates_by_admin" method="post" id="frm">
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

 </form> -->

<main id="main-container">
             
                <div class="content">
                	  <h1>Last Rates  Updated Date:<span id="updateddate"></span></h1>
	<section class="block p-10">

              <div class="row">
                   <div class="col-md-12">
                        <div class="table-responsive">
                             <table class="table table-bordered mb-0" style="">
                                    <thead class="table-primary">
                                            <tr class="table-primary">
                                                 <th>Countries</th>
       	                                         <th>Branch Sell Rate</th>
                                                 <th>Mark Up(%)</th>
                                                 <th>Sell Rate</th>
                                                 <th>Update</th>
                                             </tr>
                                     </thead>
                                     <c:set var="count" value="1"></c:set>
                                     <tbody id="tablebody">
                                     <tr><th>${agentCountryName}</th></tr>
                                     <c:forEach var="bsellrate" items="${selllist}">
                                     <input type="hidden" name="functionality" id="functionality" value="${bsellrate.fromBranch.functionality }">
                                     <input type="hidden" name="agentid" id="agentid" value="${bsellrate.agentId}">
                                     <tr><th>${bsellrate.fromBranch.fromCountry.currencyCode}-${bsellrate.toBranch.fromCountry.currencyCode}</th>
                                     
                                     <td><input type="text" class="form-control" name="agentmasterrate${count}" id="agentmasterrate${count}"value="${bsellrate.branchAgentMasterRate}" readonly></td>
                                    <td><input type="text" class="form-control" name="agentmarkup${count}" id="agentmarkup${count}" value="${bsellrate.agentMarkupRate }"  onkeyup="calculateSellRate('agentmasterrate${count}','agentmarkup${count}','agentsellrate${count}')" onkeypress="removeError('agentmarkup${count}')"></td>
                                    <td><input type="text" class="form-control" name="agentsellrate${count}" id="agentsellrate${count}" value="${bsellrate.agentCurrencySellRate }" readonly></td>
                                     <td><input class="btn btn-alt-primary" type="submit" value="update" onclick="updateRate('${count}','${bsellrate.crid}')"></td>
                                     </tr>
                                     <input type="hidden" name="crid${count}" id="crid${count}" value="${bsellrate.crid}">
                                     <c:set var="count" value="${count+1}"></c:set>
                                     
                                     </c:forEach>
                                     
                                     </tbody>
                                                        </table>
                             <input type="hidden" id="count" value="${count-1}">
                             </div>
                   </div>
              </div>
         
</section>
</div>
</main>  

</body>
<script type="text/javascript">
function calculateSellRate(mr_id,id,s_rate){
	
	var functionality=$('#functionality').val();
	
	var m_rate=$('#'+mr_id).val();
	var value=$('#'+id).val();
	
	if(functionality=='sending'){
		
		if(m_rate==0.0){
			alert("cant calculate");
			return false;
		}
	var per=Number(m_rate)*Number(value)/100;
	var sell_rate=Number(Number(m_rate)-Number(per));
	$('#'+s_rate).val(sell_rate);
	//alert('sell_rate'+sell_rate);
	}
	
	if(functionality=='receiving'){
		var per=Number(m_rate)*Number(value)/100;
		var sell_rate=Number(Number(m_rate)+Number(per));
		$('#'+s_rate).val(sell_rate);
		//alert('sell_rate'+sell_rate);
		}
}
</script>

</html>