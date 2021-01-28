<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib 
      uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mode Of Payments Fee</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
        function isNumberKey(evt)
        {
           var charCode = (evt.which) ? evt.which : event.keyCode
           if (charCode > 31 && (charCode < 48 || charCode > 57))
              return false;

           return true;
        }
        
        </script>
<script>
function addRecord(tablecount,rowcount,count,mop,bid,adminid)
{
	/* alert("mop:"+mop+"bid:"+bid+"adminid:"+adminid); */
	  /* alert("table:"+tablecount+"count:"+count+"rowco:"+rowcount); */ 
    /* var counts=Number(count)+1; */
   var rowcounts=Number(rowcount)+1;
   if(mop=='Internet Bank Transfer')
{
	   /* alert("its equal"); */
	    mop="InternetBankTransfer";
	   }
	   
   /* alert("modeofpay:"+mop);
    */ /*  var count=Number(count)+1; */
    var removerow=$('#removerow'+tablecount+count+rowcount).val();
	var markup="";
    markup ="<tr id='modtable"+tablecount+rowcounts+"'><td><input type='text' id='min"+tablecount+count+rowcounts+"' onkeypress='return isNumberKey(event)' ></td><td><input type='text' id='max"+tablecount+count+rowcounts+"' onkeypress='return isNumberKey(event)'></td><td><input type='text' id='fee"+tablecount+count+rowcounts+"' onkeypress='return isNumberKey(event)'></td><td><select id='ratetype"+tablecount+count+rowcounts+"'>";
    markup=markup+"<option value=''>--select--</option><option value='flatfee'>Flat Fee</option><option value='percentage'>Percentage</option></select></td><td>";
    markup=markup+"<input type='text' id='displaymop"+tablecount+count+rowcounts+"' value=''>";
    markup=markup+"</td><td><input type='submit' value='submit' onclick=saveLimitation("+tablecount+","+count+","+rowcounts+",'"+mop+"','"+bid+"','"+adminid+"')></td></tr>";
    markup=markup+"<tr id='buttonrow"+tablecount+"'><td><button type='button' class='btn btn-alt-primary' id='addbutton' onclick=addRecord("+tablecount+","+rowcounts+","+count+",'"+mop+"','"+bid+"','"+adminid+"')>Add+</button><button type='button' class='btn btn-alt-primary' id='removebutton' onclick=removeLimitation('"+removerow+"')>Remove</button></td></tr>";
    
    var markup1="";
    markup1 ="<tr id='modtable"+tablecount+rowcount+"'><td><input type='text' id='min"+tablecount+count+rowcount+"' onkeypress='return isNumberKey(event)' ></td><td><input type='text' id='max"+tablecount+count+rowcount+"' onkeypress='return isNumberKey(event)'></td><td><input type='text' id='fee"+tablecount+count+rowcount+"' onkeypress='return isNumberKey(event)'></td><td><select id='ratetype"+tablecount+count+rowcount+"'>";
    markup1=markup1+"<option value=''>--select--</option><option value='flatfee'>Flat Fee</option><option value='percentage'>Percentage</option></select></td><td><select id='displaymop"+tablecount+count+rowcount+"'>";
    markup1=markup1+"<option value=''>--select--</option><option value='frontend'>Frontend</option><option value='backend'>Backend</option><option value='both'>Both</option>";
    markup1=markup1+"</select></td><td><input type='submit' value='submit' onclick=saveLimitation("+tablecount+","+count+","+rowcount+",'"+mop+"','"+bid+"','"+adminid+"')></td></tr>";
    
    /* markup1=markup1+"<tr id='buttonrow"+tablecount+"'><td><button type='button' class='btn btn-alt-primary' id='addbutton' onclick='addRecord("+tablecount+","+rowcounts+","+count+")'>Add+</button><button type='button' class='btn btn-alt-primary' id='removebutton'>Remove</button></td></tr>"; */
    
    /* if(minmaxcountrow=='first')
    	{
    	  markup = "<tr id='minmaxcount"+tablecount+count+0+"'><td><input type='text' id='min"+count+0+"' onkeypress='return isNumberKey(event)' ></td><td><input type='text' id='max"+count+0+"' onkeypress='return isNumberKey(event)'></td><td><input type='text' id='fee"+count+0+"' onkeypress='return isNumberKey(event)'></td><td><input type='submit' value='submit' onclick=addLimitation('"+count+"','"+0+"')></td></tr>";
    	}else{
    	
	  markup = "<tr id='minmaxcount"+tablecount+count+newminmaxcountrow+"'><td><input type='text' id='min"+count+newminmaxcountrow+"' onkeypress='return isNumberKey(event)' ></td><td><input type='text' id='max"+count+newminmaxcountrow+"' onkeypress='return isNumberKey(event)'></td><td><input type='text' id='fee"+count+newminmaxcountrow+"' onkeypress='return isNumberKey(event)'></td><td><input type='submit' value='submit' onclick=addLimitation('"+count+"','"+newminmaxcountrow+"')></td></tr>";
   
    	} *//*  $("table tbody ").append(markup); */
    //$('table > tbody > tr').eq(count).after(markup); 
  
 	/* var maxvalue=$('#max'+count+(Number(minmaxcountrow)-1)).val(); */
 	/* var maxvalue=$('#max'+count+minmaxcountrow).val(); */
 	
 	var maxvalue1=$('#max'+tablecount+count+rowcount).val();
 	var displaymode=$('#displaymop'+tablecount+count+rowcount).val();
  var minvalue=$('#min'+tablecount+count+rowcount).val();
 var fees=$('#fee'+tablecount+count+rowcount).val();
  
   /* alert("maxvalue:"+maxvalue1); */ 
   
  if(maxvalue1=='' && minvalue=='' && fees=='')
   {

   alert("please submit previous row");
   $('#min'+tablecount+count+rowcount).focus().css('outline','solid red 1px');
   $('#max'+tablecount+count+rowcount).focus().css('outline','solid red 1px');
   $('#fee'+tablecount+count+rowcount).focus().css('outline','solid red 1px');
   return false;
   }
  if(maxvalue1=='' && fees=='')
  {

  alert("please submit previous row");

  $('#max'+tablecount+count+rowcount).focus().css('outline','solid red 1px');
  $('#fee'+tablecount+count+rowcount).focus().css('outline','solid red 1px');
  return false;
  }
  if(maxvalue1=='')
	   {

	   alert("please provide fee value");
	   $('#max'+count+rowcount).focus().css('outline','solid red 1px');
	   return false;
	   }
  if(fees=='')
  {

  alert("please provide fee value");
  $('#fee'+count+rowcount).focus().css('outline','solid red 1px');
  return false;
  }
  
  
  
   /* if(isNaN(maxvalue1)||maxvalue1=='')
	  {
	  
	  /* alert("if execute"); */
	 /*  alert( $('#tr'+count+' > #minmaxcount'+minmaxcountrow).length); */
	  /*  $('#head'+count).after(markup); 
	 $('#temprow'+count).remove();
	   $('#min'+count+0).val(1).attr('readonly', 'true');
	  } */
   
/* '#tr'+count */
	   
	   /* else{ */

		  /*  alert("else execute"); */
		/*    alert("for already rows:"+count+","+minmaxcountrow);
		   $( '#tr'+count+ '> #minmaxcount'+minmaxcountrow).eq(minmaxcountrow-1).after(markup); 
       /*  $('#min'+count).val(maxvalue+1).attr('readonly', 'true');  */

		  
		   /* alert("for already rows:"+count+","+minmaxcountrow);
		   $('table  tbody  #tr'+count+ '#minmaxcount'+minmaxcountrow).after(markup);  */
       /*  $('#min'+count).val(maxvalue+1).attr('readonly', 'true');  */ 

		   
	//   alert('id is  = '+'#minmaxcount'+count+Number(Number(minmaxcountrow)-Number(1)));
		  //alert('markup = ='+markup);
		 //  alert("for already rows:"+count+","+Number(Number(minmaxcountrow)-Number(1)));
		    //$('table  tbody  #tr'+count+Number(Number(minmaxcountrow)-Number(1))).after(markup);  
		    //alert('#minmaxcountrow'+count+Number(Number(minmaxcountrow)-Number(1)));
		   // $('#my_table  tbody').eq(minmaxcountrow-1).after(markup);
		//     Number(Number(minmaxcountrow)-Number(1)) alert('hii');
		    
		  /* just look this statement */
		  
		 
	   if(maxvalue1!=undefined){
	  $('#buttonrow'+tablecount).remove(); 
		  $("#modtable"+tablecount+rowcount).after(markup);   
      $('#min'+tablecount+count+rowcounts).val(Number(maxvalue1)+1).attr('readonly', 'true');
      $('#displaymop'+tablecount+count+rowcounts).val(displaymode).attr('readonly', 'true');
	   
	   }
      if(maxvalue1==undefined)
{
    	  $("#headline"+tablecount).after(markup1);   
          $('#min'+tablecount+count+rowcount).val(1).attr('readonly', 'true');  
         
	   }
	  /*  } */
	    

	
	
	}
</script>
<script>
function saveLimitation(tablecount,count,rowcount,mop,bid,adminid)
{
	/* alert('soemthing====');
	alert(mop);
	 */if(mop=='InternetBankTransfer')
		{
		mop="Internet Bank Transfer";
		}
	var minvalue=$('#min'+tablecount+count+rowcount).val();
	var maxvalue=$('#max'+tablecount+count+rowcount).val();
	var feevalue=$('#fee'+tablecount+count+rowcount).val();
	var ratetype=$('#ratetype'+tablecount+count+rowcount).val();
	var displaymode=$('#displaymop'+tablecount+count+rowcount).val();
	//alert('minvalue===='+minvalue);
	//alert('maxvalue===='+maxvalue);
	if(maxvalue==''|| feevalue=='')
		{
		alert("please provide maxvalue and fee value");
		return false;
		}
	 if(Number(minvalue) >= Number(maxvalue))
		{
		
		alert("maxvalue should be greater than min value");
		return false;
		} 
	if(ratetype=='')
		{
		alert("please select Rate Type");
		return false;
		}
	
	if(displaymode=='')
	{
	alert("please select display mode");
	return false;
	}

	
	var querystring="min="+minvalue+"&max="+maxvalue+"&fee="+feevalue+"&adminid="+adminid+"&branchid="+bid+"&mopid="+mop+"&ratetype="+ratetype+"&dismode="+displaymode;
	/* alert("querystring:"+querystring); */
		$.ajax({
		url:'common/saveModeOfPaymentLimitation',
			data:querystring,
				type:'GET',
					success:function(response){
						//alert(response);
					location.reload(true); 
					},
						error:function(){alert("error");}
	
	
	
	});
	}

</script>

<script>
function updateLimitation(tablecount,count,rowcount,mopfeeid)
{
	/* alert("tablcount:"+tablecount+"count:"+count+"rowcount:"+rowcount+"mopfid:"+mopfeeid); */
	var fee=$('#fee'+tablecount+count+rowcount).val();
	var rateType=$('#ratetype'+tablecount+count+rowcount).val();
/* alert(fee); */
//alert('rateType====='+rateType);
var querystring="mopfeeid="+mopfeeid+"&fee="+fee+"&rateType="+rateType;
$.ajax({
url:'common/updateModeOfPaymentLimitation',
	data:querystring,
		type:'GET',
			success:function(response){alert(response);
			location.reload(true);
			},
				error:function(){alert("error");}


});

	}

</script>

<script>
function removeLimitation(mopfeeid)
{var querystring="mopfeeid="+mopfeeid;
/* alert('mopfeeid==='+mopfeeid); */
	$.ajax({
	url:'common/deleteModeOfPaymentLimitation',
		data:querystring,
			type:'GET',
				success:function(response){alert(response);
				
				location.reload(true);
				},
					error:function(){alert("error");}
				
	});
	}

</script>
</head>
<body>

 <%@include file="headerNew.jsp" %>  

 <div class="container">
 <main id="main-container">
      <div class="content">
         <section class="block">
         <div class="">
              <div class="row">
                   <div class="col-md-12">
                              <div class="table-responsive">
                   
                         <table class="table table-bordered mb-0" style="">
                                    <thead class="">
                                    
                                            <tr class="table-primary">
                                                 <th>Currency</th>
<!--                                                  <th>Mode Of Payments</th>
 -->                                             </tr>
                                             
                                             
                                     </thead>
                                    <tbody>
                                  
                                  
                                    
                                    <c:set var="count" value="1"/>
                                    <c:set var="tablecount" value="1"/>
                                    <c:set var="lastrowid" value=""/>    
                                       <c:forEach   var="entry" items="${countries}"> 
                                    <tr style="">
                                    <th style="text-align:center;background:orange;color:white;padding:2px;">
                                    <label >${entry.fromCountry.currencyCode}
                                   (${entry.branchName.toUpperCase()})</label>
                                   </th>
                                   <c:set var="rowcount" value="1"/>
                                   <c:set var="eachtablerow" value="1"/> 
                                   <c:forTokens var="mop1" items="${entry.modeOfPayment}" delims=",">
                                    <c:set var="str5" value="${fn:split(mop1, '-')}" />  
                                       			  <td>
                                  <tr id="EachTableInRow${eachtablerow}">
                                  <td style=""> 
                                      <p style="background: #2e287b;color:white;padding:3px;text-align:center;font-size:15px;">  ${str5[1]}</p>
                                    <table class="table table-bordered" id="tablecount${tablecount}" >
                                   
                                    <tr id="headline${tablecount}"  style="background: #2e287b;color:white;padding:5px;text-align:center">
                                    <td>MINVALUE</td>
                                    <td>MAXVALUE</td>
                                    <td>FEE</td>
                                    <td>RATE TYPE</td>
                                    <td>DISPLAY</td>
                                    <td>ACTION</td>
                                    </tr>
                                <c:forEach var="modeofpaymenttype" items="${mop}">
                                    
                                    <c:forEach var="rows" items="${modeofpaymenttype.value}">
                                    
                                    <c:if test="${rows.branchId.branchId eq entry.branchId && rows.modeOfPaymentId.modeOfPaymentId eq str5[0]}">
                                <%-- <c:set var="rowcount" value="2"/> --%>
                                   
                                    <tr id="modtable${tablecount}${rowcount}">
                                    
                                    <td><input type="text" id="min${tablecount}${count}${rowcount}" name="minValue${tablecount}${count}${rowcount}" value="${ rows.minValue}" readonly></td>
                                    <td><input type="text" id="max${tablecount}${count}${rowcount}" name="maxValue${tablecount}${count}${rowcount}" value="${rows.maxValue }" readonly></td>
                                   <td><input type ="text" id="fee${tablecount}${count}${rowcount}" onkeypress="return isNumberKey(event)" value="${rows.fee}"> </td>
                                   <td>
<select   name="ratetype${tablecount}${count}${rowcount}" id="ratetype${tablecount}${count}${rowcount}"  >	
<option value="flatfee" ${rows.rateType=='flatfee'?'selected':''}>flatfee</option>
<option value="percentage" ${rows.rateType=='percentage'?'selected':''}>percentage</option>
</select>                                   
                                   </td>
                                   <td>
                                   <input type="text" id="displaymop${tablecount}${count}${rowcount}" name="displaymop${tablecount}${count}${rowcount}" value="${rows.display}" readonly> 
                                    <td>
                                    <button type="button" class="btn btn-primary btn-alt-primary" id="update" onclick="updateLimitation('${tablecount}','${count}','${rowcount}' ,'${rows.modeOfPaymentFeeId}');">UPDATE</button></td>
                                    <input type="hidden" id="removerow${tablecount}${count}${rowcount}" value="${rows.modeOfPaymentFeeId}">
                                    </tr>
                      <c:set var="rowcount" value="${rowcount+1}"/>
                           <c:set var="lastrowfeeid"  value="${rows.modeOfPaymentFeeId}"/>
                           </c:if>
                       
                        
                         
                                   
                                    </c:forEach>
                                  <%-- <c:set var="lastrowid" value="${lastrowfeeid}"/> --%>   
                                    </c:forEach>
                                    
                         <tr id="buttonrow${tablecount}">           
                         <td><button type="button" class="btn btn-success" id="addbutton" onclick="addRecord('${tablecount}','${rowcount-1}','${count}','${str5[1]}','${entry.branchId}','${entry.admin.adminId}')">Add+</button>
                         <button type="button"class="btn btn-danger" id="removebutton" onclick="removeLimitation('${lastrowfeeid}')">Remove</button></td>        
                                  </tr>
                                    </table>
                                    
                                   
                                   <input type="hidden" id="feeId${count}" value="${rows.modeOfPaymentFeeId}">
                                   <input type="hidden" id="adminId${count}" value="${rows.admin.adminId }">
                                    <input type="hidden" id="modeOfPaymentId${count}" value="${rows.modeOfPaymentId}">
                                         		 </td>
                                         		 </tr>
                                         		 <c:set var="tablecount" value="${tablecount+1}"/> 
                                         		  </c:forTokens>
                                     
                                      
                                                             
                                        
                                             </tr>
                                            <c:set var="count" value="${count + 1}"/>  
                                             <input type="hidden" id="totalCount" value="${count}">
                                             
                                        </c:forEach>  
                                          
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



<!--
 <script type="text/javascript">
$(document).ready(function (){

	$.ajax({
    	url : "getallFeebasedonadmin",
    	type : "GET",
    	async  : false,
    	success : function(response){
    		 var mlists = JSON.stringify(response, undefined, '\t');
    		$('#mlist').val(mlists);
    		 
    	},
    	error : function(xhr, status, error) {
		alert("status code:"+status);
		alert("error::"+error);
	}
     });
	
    var mlist=$('#mlist').val();
   
}



 -->


<script type="text/javascript">
function updateRecord(count,modeOfPaymentId,fee,adminId,modeOfPaymentFeeId){
	
	
	 var message="";
	 var modeOfPaymentId=$('#modeOfPaymentId'+count).val();
	 var fee=$('#fee'+count).val();
	 var adminId=$('#adminId'+count).val();
	 var modeOfPaymentFeeId=$('#feeId'+count).val();
	
/* 	alert("fee======"+fee);
	alert("adminId======="+adminId);
	alert("feeId======"+modeOfPaymentFeeId);
alert("modeOfPaymentId========="+modeOfPaymentId);
 */
var data="fee="+fee+"&modeOfPaymentFeeId="+modeOfPaymentFeeId+"&adminId="+adminId;



$.ajax({
	
	type:'POST',
	url:'updateFee',
	data:data,
	success:function(response){
		if(response=='updated')
			
		 location.reload(true); 
		
			message="updated successfully";
			
	},
	error:function()
	{
	message="error at server side";
	
	}
	}) 
	
}




 function updateRecord1(branchId,modeOfPayment,fee){
	
	
	$('#fee').val($('#fee'+rowCount+colCount).val());
	
	if($('#fee'+rowCount+colCount).val()==''){
		$('#fee'+rowCount+colCount).focus().css('outline','solid red 2px');
		return false;
	}
	
	var totalData='';
	
	for(var j=0;j<colCount;j++){
		
			var fee=$('#fee'+rowCount+j).val();
			
			var br=$('#br'+rowCount+j).val();
			
			totalData=totalData+mopId+"-"+br+"-"+fee+",";
	}
	$('#data').val(totalData);
	//alert('totalData = ='+totalData);
	$('#frm').submit();
}
</script>
</html>