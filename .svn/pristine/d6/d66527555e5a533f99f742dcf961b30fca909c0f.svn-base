<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="ISO-8859-1"> -->
<title>Service Fee</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<style>
.addrates{
padding:50px 50px;
}
.map-placeses{
  box-shadow: 0 20px 40px 0 rgba(21, 12, 181, 0.5);

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
            
         /*   alert("count:"+count+"minmaxcountrow:"+minmaxcountrow); */
            var newminmaxcountrow=Number(minmaxcountrow)+1;
            var markup="";
            if(minmaxcountrow=='first')
            	{
            	  markup = "<tr id='minmaxcount"+count+0+"'><td><input type='text' id='min"+count+0+"' onkeypress='return isNumberKey(event)' ></td><td><input type='text' id='max"+count+0+"' onkeypress='return isNumberKey(event)'></td><td><input type='text' id='fee"+count+0+"' onkeypress='return isNumberKey(event)'></td><td><select id='ratetype"+count+0+"'>";
            	    markup=markup+"<option value=''>--select--</option><option value='flatfee'>Flat Fee</option><option value='percentage'>Percentage</option></select></td><td><input type='submit' value='submit' onclick=addLimitation('"+count+"','"+0+"')></td></tr>";
           	
            	}else{
            	
            		
        	  markup = "<tr id='minmaxcount"+count+newminmaxcountrow+"'><td><input type='text' id='min"+count+newminmaxcountrow+"' onkeypress='return isNumberKey(event)' ></td><td><input type='text' id='max"+count+newminmaxcountrow+"' onkeypress='return isNumberKey(event)'></td><td><input type='text' id='fee"+count+newminmaxcountrow+"' onkeypress='return isNumberKey(event)'></td><td><select id='ratetype"+count+newminmaxcountrow+"'>";
      	    markup=markup+"<option value=''>--select--</option><option value='flatfee'>Flat Fee</option><option value='percentage'>Percentage</option></select></td><td><input type='submit' value='submit' onclick=addLimitation('"+count+"','"+newminmaxcountrow+"')></td></tr>";
           
            	}/*  $("table tbody ").append(markup); */
            //$('table > tbody > tr').eq(count).after(markup); 
          
         	/* var maxvalue=$('#max'+count+(Number(minmaxcountrow)-1)).val(); */
         	/* var maxvalue=$('#max'+count+minmaxcountrow).val(); */
         	var maxvalue1=$('#max'+count+minmaxcountrow).val();
          var minvalue=$('#min'+count+minmaxcountrow).val();
         var fees=$('#fee'+count+minmaxcountrow).val();
          
         /*  alert("maxvalue:"+maxvalue1); */
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
        	  
        	  /* alert("if execute"); */
        	 /*  alert( $('#tr'+count+' > #minmaxcount'+minmaxcountrow).length); */
        	   $('#head'+count).after(markup); 
        	 $('#temprow'+count).remove();
        	   $('#min'+count+0).val(1).attr('readonly', 'true');
        	  }
          
        /* '#tr'+count */
        	   
        	   else{

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
        		  
        		 
        		  $("#minmaxcount"+count+minmaxcountrow).after(markup);   
              $('#min'+count+newminmaxcountrow).val(Number(maxvalue1)+1).attr('readonly', 'true');  
              

 
        	   }
        	    
         }
         
     function addLimitation(count,minmaxcountrow) {
    	 
    	var minvalue=$('#min'+count+minmaxcountrow).val();
    	var maxvalue=$('#max'+count+minmaxcountrow).val();
    	var fee=$('#fee'+count+minmaxcountrow).val();
    	var rateType=$('#ratetype'+count+minmaxcountrow).val();
    	//alert('rateType===='+rateType);
    	var f_br=$('#f_br'+count).val();
    	//alert('f_br==='+f_br);
    	var t_br=$('#t_br'+count).val();
    	//alert('t_br==='+t_br);
    	var a_id=$('#adminid').val();
    	//alert('a_id===='+a_id);
    
    
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
    	
    var query="minvalue="+minvalue+"&maxvalue="+maxvalue+"&fee="+fee+"&f_br="+f_br+"&t_br="+t_br+"&adminid="+a_id+"&rateType="+rateType;
    //alert('query====='+query);
    	
    	 $.ajax({
    		
    		type:'POST',
    		url:'addFeeLimitation',
    		data:query,
    		success:function(response){
    			if(response=='success')
    				
    			 location.reload(true); 
    			//alert("added successfully");
    		},
    		error:function(xhr,error,status)
    		{
    		   alert("fee limit error"+error+xhr+status);
    		}
    		}); 
    		
     }
    	
        </script>
        <script>
        function updateLimitation(count,minmaxcountrow) {
        	
      
        	var message='';
        		
        	/* alert("minmaxcountrow:"+minmaxcountrow); */
        	/* for(var j=0;j<=minmaxcountrow;j++)
        		{ */
        	var servicefeeid=$('#serviceid'+count+minmaxcountrow).val();
        	var fee=$('#fee'+count+minmaxcountrow).val();
        	var a_id=$('#adminid').val();
        	var rateType=$('#ratetype'+count+minmaxcountrow).val();
        	
        	if(fee=='')
        		{
        		alert("please provide fee value");
        		$('#fee'+count+j).focus().css('outline','solid red 1px');
        		return false;
        		}
        		
        	
        	
        	
        var query="servicefeeid="+servicefeeid+"&fee="+fee+"&adminid="+a_id+"&rateType="+rateType;
      
       
        	
        	 $.ajax({
        		
        		type:'POST',
        		url:'updateFeeLimitation',
        		data:query,
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
        	
        	/* } */
        
        </script>
        
        <script>
 function deleteLimitation(count,minmaxcountrow) {
	
 
	var servicefeeid= $('#serviceid'+count+minmaxcountrow).val();
	var a_id=$('#adminid').val(); 
	  	 	
	 var query="sid="+servicefeeid+"&adminid="+a_id;
	 
        	 $.ajax({
        		
        		type:'POST',
        		url:'deleteFeeLimitation',
        		data:query,
        		success:function(response){
        			if(response=='deleted')
        				
        			 location.reload(true); 
        			//alert("removed successfully");
        		},
        		error:function()
        		{
        		
        		}
        		}) 
        		
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
 <%@include file="headerNew.jsp" %>
 <div class="container "><br>
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
                                     <th style="background: #2e287b;color:white;text-align:center;">country</th>
                                     <th style="background: #2e287b;color:white;text-align:center;">Values</th>
                                             </tr>
                                     </thead>
                                     
                               <tbody>
                               <c:if test="${ list ne null}">
                               <c:set var="count" value="0"/>
                               <c:forEach var="list" items="${list}">
                               <input type="hidden" id="adminid" value="${list.admin.adminId }">
                                     			<c:if test="${list.functionality eq 'sending' or list.functionality eq 'both'}">
                                       			
                                        
                                       			<c:forEach var="rList" items="${list1}">
                                       			
                                     			<c:if test="${rList.functionality eq 'receiving' or rList.functionality eq 'both'}">
                                     			
                                     			 <c:choose>
                                     			 <c:when test="${list.fromCountry.countryName eq rList.fromCountry.countryName}">
                                     			 </c:when>
                                     			 <c:otherwise>
                                     			 <input type="hidden" id="f_br${count }" value="${list.branchId}"/>
                                     			   <input type="hidden" id="t_br${count}" value="${rList.branchId}"/>
                                     			     
                                     			     
                                     			      
                                     			      <tr id="tr${count}">
                                     			       <th>
<label>${list.fromCountry.currencyCode}-${rList.fromCountry.currencyCode}</label><br><label>(${list.fromCountry.countryName}-${rList.fromCountry.countryName})</label>
<br><label>(${list.branchName.toUpperCase()}-${rList.branchName.toUpperCase()})</label>
</th>								                	
                                              
								                	
								                	<td>
									            <table id="table${count}" class="table table-bordered">
                                                <c:set var="rowcount" value="1"/>
                                               <c:set var="minmaxcountrow" value="0"/>
                                               <tr id="head${count}">
                                          <td></td>      
                               <td style="background: #2e287b;color:white;text-align:center;">MINVALUE</td>
                               <td style="background: #2e287b;color:white;text-align:center;">MAXVALUE</td>
                               <td style="background: #2e287b;color:white;text-align:center;">SERVICE FEE</td>
                               <td style="background: #2e287b;color:white;text-align:center;">RATE TYPE</td>
                               <td style="background: #2e287b;color:white;text-align:center;">ADD+</td>
                               <td style="background: #2e287b;color:white;text-align:center;">ACTION</td>
                                               
                                               </tr>
                                               <c:set var="servicelists" value="0"/>
                                               
                                               <c:forEach var="servicelist1" items="${servicefeelist}">
                                               
                                               <c:if test="${servicelist1.fromBranch.fromCountry.countryName eq list.fromCountry.countryName && servicelist1.toBranch.fromCountry.countryName  eq rList.fromCountry.countryName && servicelist1.fromBranch.branchId eq list.branchId && servicelist1.toBranch.branchId eq rList.branchId }">
                                             <c:set var="servicelists" value="${servicelists+1}"></c:set>
                                              </c:if>
                                               </c:forEach> 

                                     			<c:forEach var="servicelist" items="${servicefeelist}">
                                     
                                     		                                
                                         
                              
                                     			
                                     			<c:if test="${servicelist.fromBranch.fromCountry.countryName eq list.fromCountry.countryName && servicelist.toBranch.fromCountry.countryName  eq rList.fromCountry.countryName && servicelist.fromBranch.branchId eq list.branchId && servicelist.toBranch.branchId eq rList.branchId}">
                                     			
                                     			<c:set var="rowcount" value="2"/>
                                     			
                                       		
                                       			<tr id="minmaxcount${count}${minmaxcountrow}"> 	
	                                          <td></td>
	                                            <td>
 									               <input type="text" name="minLimit" id="min${count}${minmaxcountrow}" value="${servicelist.minValue}" onkeypress="return isNumberKey(event)" readonly>
 									            </td>
 									            <td>
 									                <input type="text" name="maxLimit" id="max${count}${minmaxcountrow}" value="${ servicelist.maxValue}" onkeypress="return isNumberKey(event)" onchange="changeValue('${count}','${minmaxcountrow}')" readonly>
 									            </td>
                                       			<td><input type="text" name="servicefee" id="fee${count}${minmaxcountrow}" value="${ servicelist.serviceFee}" onkeypress="return isNumberKey(event)"  ></td>
                                       			<td>
 <select   name="ratetype" id="ratetype${count}${minmaxcountrow}"  >	
<option value="flatfee" ${servicelist.rateType=='flatfee'?'selected':''}>flatfee</option>
<option value="percentage" ${servicelist.rateType=='percentage'?'selected':''}>percentage</option>
</select>                                   
                                       			
                                       			</td>
                                       			   
                                                <input type="hidden" id="serviceid${count}${minmaxcountrow}" value="${servicelist.serviceFeeId}">
									  			   
									       
									  			    
									  			  <td><input type="button"  class="btn btn-alt-primary btn btn-primary btn-alt-secondary" onclick="updateLimitation('${count}','${ minmaxcountrow}')" value="Update" ></td>
									  			
									  			 <c:if test="${minmaxcountrow+1 eq servicelists}"> 
									  			  <td><input type="button"  class="btn btn-success" onclick="addRow('${count}','${ minmaxcountrow}')"value="Add+" >
									  			  <br><br><input type="button"  class="btn btn-danger" style="margin-left:2px;color:white;" onclick="deleteLimitation('${count}','${minmaxcountrow}')" value="Remove" required></td>
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
                                                 </tr>
                                                
                                                <c:set var="count" value="${count + 1}"/>  
                                             <input type="hidden" id="totalCount" value="${count}">
                                               
                                                   </c:otherwise>
                                                    
                                                   </c:choose>
                                                </c:if>
                                                </c:forEach>
                                             
                                      </c:if>
                             </c:forEach>        
                                          
                             </c:if>
                             
                                       
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