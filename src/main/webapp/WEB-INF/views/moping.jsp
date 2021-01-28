<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="ISO-8859-1"> -->
<title>modeofpayment Fee</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
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
    	
    });
        //$(".add-row").click(function(){
         function addRow(count,minmaxcountrow){ 
            
         alert("count:"+count+"minmaxcountrow:"+minmaxcountrow); 
            var newminmaxcountrow=Number(minmaxcountrow)+1;
            var markup="";
            if(minmaxcountrow=='first')
            	{
            	  markup = "<tr id='minmaxcount"+count+0+"'><td><input type='text' id='min"+count+0+"' onkeypress='return isNumberKey(event)' >
            	  </td>
            	  <td><input type='text' id='max"+count+0+"' onkeypress='return isNumberKey(event)'></td>
            	  <td><input type='text' id='fee"+count+0+"' onkeypress='return isNumberKey(event)'></td>
            	  <td><input type='text' id='ratetype"+count+0+"' onkeypress='return isNumberKey(event)'></td>
            	    markup=markup+"<option value=''>--select--</option><option value='flatfee'>Flat Fee</option><option value='percentage'>Percentage</option>";

            	    markup=markup+"<td><input type='submit' value='submit' onclick=addLimitation('"+count+"','"+0+"')></td></tr>";
            	}else{
            	
        	  markup = "<tr id='minmaxcount"+count+newminmaxcountrow+"'><td><input type='text' id='min"+count+newminmaxcountrow+"' onkeypress='return isNumberKey(event)' ></td><td><input type='text' id='max"+count+newminmaxcountrow+"' onkeypress='return isNumberKey(event)'></td><td><input type='text' id='fee"+count+newminmaxcountrow+"' onkeypress='return isNumberKey(event)'></td>
        	  <td><input type='submit' value='submit' onclick=addLimitation('"+count+"','"+newminmaxcountrow+"')></td></tr>";
           
            	}
         	var maxvalue1=$('#max'+count+minmaxcountrow).val();
          var minvalue=$('#min'+count+minmaxcountrow).val();
         var fees=$('#fee'+count+minmaxcountrow).val();
          
          if(maxvalue1=='' && minvalue=='' && fees=='')
    	   {
       
    	   alert("please submit previous row");
    	   $('#min'+count+minmaxcountrow).focus().css('outline','solid red 1px');
    	   $('#max'+count+minmaxcountrow).focus().css('outline','solid red 1px');
    	   $('#fee'+count+minmaxcountrow).focus().css('outline','solid red 1px');
    	   return false;
    	   }
          if(maxvalue1=='' && fees=='')
   	   {
      
   	   alert("please submit previous row");
   	 
   	   $('#max'+count+minmaxcountrow).focus().css('outline','solid red 1px');
   	   $('#fee'+count+minmaxcountrow).focus().css('outline','solid red 1px');
   	   return false;
   	   }
          if(maxvalue1=='')
     	   {
        
     	   alert("please provide fee value");
     	   $('#max'+count+minmaxcountrow).focus().css('outline','solid red 1px');
     	   return false;
     	   }
          if(fees=='')
   	   {
      
   	   alert("please provide fee value");
   	   $('#fee'+count+minmaxcountrow).focus().css('outline','solid red 1px');
   	   return false;
   	   }
          
          
          
           if(isNaN(maxvalue1)||maxvalue1=='')
        	  {
        	  
        	   $('#head'+count).after(markup); 
        	 $('#temprow'+count).remove();
        	   $('#min'+count+0).val(1).attr('readonly', 'true');
        	  }
          
        	   
        	   else{
        		  $("#minmaxcount"+count+minmaxcountrow).after(markup);   
              $('#min'+count+newminmaxcountrow).val(Number(maxvalue1)+1).attr('readonly', 'true');  
              

 
        	   }
        	    
         }
         
     function addLimitation(count,minmaxcountrow) {
    	 
    	var minvalue=$('#min'+count+minmaxcountrow).val();
    	alert('minvalue=='+minvalue);
    	var maxvalue=$('#max'+count+minmaxcountrow).val();
    	alert('maxvalue==='+maxvalue).val();
    	var fee=$('#fee'+count+minmaxcountrow).val();
    	alert('fee===='+fee);
    	var f_br=$('#f_br'+count).val();
    	alert('f_br===='+f_br);
    	var a_id=$('#adminid').val();
    	alert('a_id==='+a_id);
    	var mopid=$('#mopid'+count+minmaxcountrow).val();
    	alert('mopid====='+mopid);
    	var ratetype=$('#ratetype'+count+minmaxcountrow).val();
    	alert('ratetype====='+ratetype);
    	if(minvalue=='')
    		{
    		alert("please provide minimum value");
    		$('#min'+count+minmaxcountrow).focus().css('outline','solid red 1px');
    		return false;
    		}
    	if(maxvalue=='')
		{
		alert("please provide maximum value");
		$('#max'+count+minmaxcountrow).focus().css('outline','solid red 1px');
		return false;
		}
    	
    	if(fee=='')
		{
		alert("please provide fee value");
		$('#fee'+count+minmaxcountrow).focus().css('outline','solid red 1px');
		return false;
		}
    	if(Number(minvalue)>=Number(maxvalue))
    	{
    		alert("max value should be greater than min vlaue");
    	
    	return false;
    	}
    	
   // var query="minvalue="+minvalue+"&maxvalue="+maxvalue+"&fee="+fee+"&f_br="+f_br+"&t_br="+t_br+"&adminid="+a_id;
    
    	
	var querystring="min="+minvalue+"&max="+maxvalue+"&fee="+fee+"&adminid="+adminid+"&branchid="+f_br+"&mopid="+mopid+"&ratetype="+ratetype;
	alert("querystring:"+querystring);
		$.ajax({
		url:'common/saveModeOfPaymentLimitation',
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
        function updateLimitation(count,minmaxcountrow) {
        	
      alert('hhjkjkkk');
        	var message='';
        		
        	/* alert("minmaxcountrow:"+minmaxcountrow); */
        	/* for(var j=0;j<=minmaxcountrow;j++)
        		{ */
        	var modeOfPaymentFeeId=$('#modeOfPaymentFeeId'+count+minmaxcountrow).val();
        	alert('modeOfPaymentFeeId==='+modeOfPaymentFeeId);
        		var fee=$('#fee'+count+minmaxcountrow).val();
        	alert('fee===='+fee);
        	var a_id=$('#adminid').val();
        	alert('adminID==='+a_id);
        	if(fee=='')
        		{
        		alert("please provide fee value");
        		$('#fee'+count+j).focus().css('outline','solid red 1px');
        		return false;
        		}
        		
        	
        	
        	
       // var query="servicefeeid="+servicefeeid+"&fee="+fee+"&adminid="+a_id;
      
        var querystring="mopfeeid="+modeOfPaymentFeeId+"&fee="+fee;
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
        	
        	/* } */
        
        </script>
        
        <script>
 function deleteLimitation(count,minmaxcountrow) {
 alert('hjskkjdhj');
	var modeOfPaymentFeeId= $('#modeOfPaymentFeeId'+count+minmaxcountrow).val();
	alert('modeOfPaymentFeeId==='+modeOfPaymentFeeId);
		var querystring="mopfeeid="+modeOfPaymentFeeId;
		alert('mopfeeid==='+querystring);
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
      function changeValue(count,minmaxvalue)
      {
    	  
     
     
    	  var max=$('#max'+count+minmaxvalue).val();
   
          $('#min'+count+(Number(minmaxvalue)+1)).val(max+1);         
var max1=$('#max'+count+(Number(minmaxvalue)+1)).val();
alert("max1 value:"+max1);
   if(max1<max)
	   {
	   alert("please be in limit");
	   $('#max'+count+(Number(minmaxvalue)+1)).val(max1);
	   return false;
	   }
      }
      
      </script> 
       
</head>
<body>
 <%@include file="backendheader.jsp" %>
 <form action="">
 <input type="hidden" name="minvalue" id="minvalue"/>
 
 <input type="hidden" name="minvalue" id="minvalue"/>
 <input type="hidden" name="minvalue" id="minvalue"/>
 <input type="hidden" name="minvalue" id="minvalue"/>
 </form>  
  <main id="main-container">
             
                <div class="content">
                    
                    
<section class="block">
         <div class="">
              <div class="row">
                   <div class="col-md-12">
                        <div class="table-responsive">
                             <table id="my_table" class="table table-bordered mb-0" style="" >
                                    <thead class="">
                                            <tr class="table-primary">
                                     <th>country</th>
                                     <th>Values</th>
       	                                         <!-- <th>MinValue</th>
                                                 <th>MaxValue</th>
                                                 <th>Service_Fee</th> -->
                                                <!--  <th>Limitations</th> -->
                                                 <!--  <th>Action</th> -->
                                             </tr>
                                     </thead>
                                     
                               <tbody>
                               <c:set var="count" value="0"/>
                               
                                        
                                    <c:forEach   var="entry" items="${countries}"> 
                     <input type="hidden" id="adminid" value="${entry.admin.adminId }">
                     <input type="hidden" id="f_br${count }" value="${entry.branchId}"/>
                     
                                    <tr id="tr${count}">
                                    <th>
                                    <label>${entry.fromCountry.currencyCode}(${entry.fromCountry.countryName})
								                </label></th>	
                               <c:forTokens var="mop1" items="${entry.modeOfPayment}" delims=",">
                                    <c:set var="str5" value="${fn:split(mop1, '-')}" />  
                                        
								                	
								                	<td>
								                	${str5[1]}
									            <table id="table${count}">
									            
                                                <c:set var="rowcount" value="1"/>
                                               <c:set var="minmaxcountrow" value="0"/>
                                               <tr id="head${count}">
                                                <td>MINVALUE</td>
                               <td>MAXVALUE</td>
                               <td> FEE</td>
                                <td>RATE TYPE</td>
                               <td>ADD+</td>
                               <td>ACTION</td>
                                               
                                               </tr>
                                               <c:set var="servicelists" value="0"/>
                                               
                                               <c:forEach var="servicelist1" items="${mopfees}">
                                    <c:if test="${servicelist1.branchId.branchId eq entry.branchId && servicelist1.modeOfPaymentId.modeOfPaymentId eq str5[0]}">
                                             <c:set var="servicelists" value="${servicelists+1}"></c:set>
                                              </c:if>
                                               </c:forEach> 
                                               
                                     			<c:forEach var="servicelist" items="${mopfees}">
                                     			<c:if test="${servicelist.branchId.branchId eq entry.branchId && servicelist.modeOfPaymentId.modeOfPaymentId eq str5[0]}">
                                     			<td>${servicelist.branchId.branchId}</td>
                                     			<c:set var="rowcount" value="2"/>
                                       			<tr id="minmaxcount${count}${minmaxcountrow}"> 	
                                                
                                                <input type="hidden" id="mopid${count}${minmaxcountrow}" value="${str5[1]}">
	                                            
	                                            <td>
 									               <input type="text" name="minLimit" id="min${count}${minmaxcountrow}" value="${servicelist.minValue}" onkeypress="return isNumberKey(event)" readonly>
 									            </td>
 									            
 									            <td>
 									                <input type="text" name="maxLimit" id="max${count}${minmaxcountrow}" value="${ servicelist.maxValue}" onkeypress="return isNumberKey(event)" onchange="changeValue('${count}','${minmaxcountrow}')" readonly>
 									            </td>
                                       			
                                       			<td>
                                       			<input type="text" name="fee" id="fee${count}${minmaxcountrow}" value="${ servicelist.fee}" onkeypress="return isNumberKey(event)">
                                       			</td>
                                                  
                                                  <td>
                                                  <input type="text" id="ratetype${count}${minmaxcountrow}" name="ratetype" value="${servicelist.rateType}" readonly>
                                                  </td>
                                       			                                                <td><input type="text" id="modeOfPaymentFeeId${count}${minmaxcountrow}" value="${servicelist.modeOfPaymentFeeId}">
                                               </td>
                                       			
									  			    
									  			  <td><input type="button"  class="btn btn-alt-primary" onclick="updateLimitation('${count}','${ minmaxcountrow}')" value="Update" ></td>
									  			 <c:if test="${minmaxcountrow+1 eq servicelists}"> 
									  			  <td><input type="button"  class="btn btn-alt-primary" onclick="addRow('${count}','${minmaxcountrow}')"value="Add+" >
									  			  <input type="button"  class="btn btn-alt-primary" style="margin-left:2px;" onclick="deleteLimitation('${count}','${minmaxcountrow}')" value="Remove" required></td>
                                            </c:if> 
                                             <c:set var ="minmaxcountrow" value="${minmaxcountrow+1}"/>
                                             
                                             </tr>
                                       </c:if>
                                       
                                                 </c:forEach>
                                                 <c:if test="${rowcount eq 1 }">
                                      <tr id="temprow${count}">
                                      <td></td>
                                      <td></td>
                                      <td></td>
                                     
                                        <td><input type="button"  class="btn btn-alt-primary" onclick="addRow('${count}','first')"value="Add+" ></td>
                                        </tr> </c:if>
                                                 </table>
                                                 </td>
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
</html>