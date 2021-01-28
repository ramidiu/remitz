<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jvl</title>
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <!-- <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
    <!-- <script>
  
$(document).ready(function() {
	
	 $('input[type=radio][name=jvtype]').change(function() {
		
		 if(this.value == "withloanbank"){
			$('#div1').show();
			$('#div2').hide();
		}else if(this.value == "withbank"){
			document.getElementById("debit").innerHTML = "DEBIT AMOUNT(+)";
			document.getElementById("credit").innerHTML = "CREDIT AMOUNT(-)";
			$('#div1').show();
			$('#div2').hide();
		}else if(this.value == "withoutbank"){
			document.getElementById("debit").innerHTML = "DEBIT AMOUNT(-)";
			document.getElementById("credit").innerHTML = "CREDIT AMOUNT(+)";
			$('#div1').hide();
			$('#div2').show();
			
		}
	});
	 
		var jvtype = $('input[type=radio][name=jvtype]:checked').val();
		if (jvtype === "withoutbank")	{
			$('#div1').hide();
			$('#div2').show();
			document.getElementById("debit").innerHTML = "DEBIT AMOUNT(-)";
			document.getElementById("credit").innerHTML = "CREDIT AMOUNT(+)";
			$(".bankclass").hide();
			$(".loanbankclass").hide();
			$(".vendorclass").hide();
			$('#bbl').hide();
		}
		else if(jvtype === "withloanbank"){
			$('#div1').show();
			$('#div2').hide();
			$(".loanbankclass").show();
        	$(".bankclass").hide();
        	$(".vendorclass").hide();
        	$('#bbl').show();
		}else if(jvtype === "withbank"){
			document.getElementById("debit").innerHTML = "DEBIT AMOUNT(+)";
			document.getElementById("credit").innerHTML = "CREDIT AMOUNT(-)";
			$('#div1').show();
			$('#div2').hide();
			$(".loanbankclass").hide();
        	$(".bankclass").show();
        	$(".vendorclass").hide();
        	$('#bbl').show();
		}
	});
</script>
  <script>
  function banksearch(){
	  var bankname=$('#bankname').val();
	  var jvtype=$('#jvtype');
	  var bankname1='';
	  var id11='';
	  var paymenttype='';
	  var payment='';
	  var bankId='';
	  var withbank=$('#withbank').val();
	  if(jvtype=='withbank'){
		
		 
if(bankname=='CORPORATION BANK-CURRENT ACCOUNT'){
	id11='101001001';
	paymentype='bank';
	payment='debit';
	bankname1=bankname;
	bankId='BNK111';
}
else  {
	id11='101001002';
	paymentype='bank';
	payment='debit';
	bankname1=bankname;//STATE BANK OF INDIA- CURRENT A/C
	bankId='BNK222';
}}
	  else if(jvtype=='withloanbank'){
if (bankname=='CORPORATION BANK OD ACCOUNT') {
	id11='101001003';
	paymentype='bank';
	payment='credit';
	bankname1=bankname;
	bankId='BNK333';
}
else   {
	id11='101001004';
	paymentype='bank';
	payment='credit';
	bankname1=bankname;//bankname=='SBI Demand Loan Against FD
	bankId='BNK444';
}}
	  
else {
	id11='101001005';
	paymentype='cash';
	payment='debit';
	bankname1=bankname;
	bankId='BNK555';
}

$('#subHeadId').val(id11);
$('#paymentype').val(paymentype);
$('#payment').val(payment);
$('#bankname').val(bankname1);
$('#bankstatus').val('Active');
$('#bankId').val('bankId');



  }  
	  
	  
  
  
  
  

  </script>
 -->  
 <script type="text/javascript">
$(function test(){
 alert("sad");
var data1='';
var n1='';
      
var data1= $('#withbank').val();
 n1=data1.split(',');


$( "#bankname" ).autocomplete({
    source: n1
  });

	
});
 </script>
</head>
<body onload="my()">
 <form id="formSubmit" name="tablets_Update" method="post" action="<%=request.getContextPath()%>/JournalEntryInsertCtrl" onsubmit="return Confirm();">
 <tr><td>select Fin Yr</td><td> <select name="finYear" id="finYear"  >
					<option value="2020-21" name="year" <%if(request.getParameter("finYear") != null && request.getParameter("finYear").equals("2020-21")) {%> selected="selected"<%} %>>2020-2021</option>
 					<option value="2019-20" name="year" <%if(request.getParameter("finYear") != null && request.getParameter("finYear").equals("2019-20")) {%> selected="selected"<%} %>>2019-2020</option>
					<option value="2018-19" name="year" <%if(request.getParameter("finYear") != null && request.getParameter("finYear").equals("2018-19")) {%> selected="selected"<%} %>>2018-2019</option>
					</select></td></tr><br>
 
<tr><td>Date:</td><td> <input type="text" id="datepicker"></td></tr><br>
<tr>
<td>Narration:</td>
<td>

	<input type="hidden" name="voucherRefNo" id="billnumb" value="1"/>
	<textarea rows="5" cols="8" name="narration" id="narration" required placeHolder="Write your narration" onkeyup="javascript:this.value=this.value.toUpperCase();"></textarea>
</td>
</tr><br>
<input type="hidden"  name="withbank" id="withbank" value="${withbank}" >
<input type="hidden"  name="withloanbank" id="withloanbank" value="${withloanbank}">
<input type="hidden"  name="cash" id="cash" value="${cash}">
<tr>
<td>select journal voucher type:</td>
<td style="position: relative;top: -37px;">
<input type="radio" name="jvtype" id="jvtype"  value="withbank" checked="checked" /><b>With Bank/Cash</b>
<input type="radio" name="jvtype" id="jvtype"  value="withloanbank"/ onclick="test(jvtype);"><b>With Loan Bank</b>
<input type="radio" name="jvtype" id="jvtype" value="withoutbank" /><b>With out Bank/Cash</b> 
</td></td>

</tr><br>
<tr>
<!-- <td>
bank name
</td><td><input type="bankname" name="bankname" id="bankname"></td></tr>
 -->
</div>
<div style="clear:both;"></div>
</div>

<div class="vendor-list" id="div1" style="display: none;">
<div class="bgcolr yourID"  style=" float:left;width:103%;">
<div class="sno1 bgcolr">S.NO.</div> 
<div class="ven-nme1 bgcolr" style="width:250px; ">SUB HEAD</div>
<div class="ven-nme1 bgcolr" id="debit">DEBIT AMOUNT(+)</div>
<div class="ven-nme1 bgcolr" id="credit">CREDIT AMOUNT(-)</div>
</div>
<input type="hidden" name="addcount" id="addcount" value="5"/>
<%int noofrooms,l; 
noofrooms=l=0;%>

<%if(noofrooms<1){
	for(int i=0; i < 50; i++ ){%>  
	<div <%if(i>4){ %>style="display: none;"<%} %> id="addcolumn<%=i%>" > 
		<div class="sno1 MT13"><%=i+1%></div>   
		<input type="hidden" name="count" id="check<%=i%>"  value="<%=i %>"/> 
		<input type="hidden" name="subId<%=i%>" id="subId<%=i%>">
		<div class="ven-nme1" style="width:250px; cursor: pointer;">
		<input type="text" name="subhead<%=i%>" id="subhead<%=i%>"  onkeyup="getSubHead('<%=i%>','subhead','subId','lb');" class="" value="" placeholder="Find a subhead here" <%if(i==0){ %> required <%} %>  autocomplete="off" style="width:100%;" class="txtInput"/>
		<span style="font-weight:bold;">Current Bal:&nbsp;</span><span style="font-weight:bold;color: blue;" id="lb<%=i%>"></span>
		</div>
		<div class="ven-nme1" ><img src="../images/Rupee-Symbol-PNG-Clipart.png;" style="width:10px; height:10px;"><input type="text" name="debitAmt<%=i%>" id="debitAmt<%=i%>"  onkeyup="calculate('<%=i%>')" value="0"  style="width: 150px; " onkeypress="return isNumberKey(event)"></input></div>
		<div class="ven-nme1" ><img src="../images/Rupee-Symbol-PNG-Clipart.png;" style="width:10px; height:10px;"><input type="text" name="creditAmt<%=i%>" id="creditAmt<%=i%>"  value="0"  onkeyup="calculate('<%=i%>')" style="width: 150px;" onkeypress="return isNumberKey(event)"></input></div>    
		<div class="clear"></div>   
	</div>    
<%} // for 
} // if%>

<div class="add-ven">
<span style="margin:0 259px 0 4px">Total Amount : </span>
<img src="../images/Rupee-Symbol-PNG-Clipart.png;" style="width:10px; height:10px;"><input type="text" name="debittotalamnt" id="debittotalamnt" value="0.0" style="width: 150px;"/>
<img src="../images/Rupee-Symbol-PNG-Clipart.png;" style="width:10px; height:10px;"><input type="text" name="credittotalamnt" id="credittotalamnt" value="0.0" style="width: 150px;"/><!-- add creditamount and declare it in caluculate(i)-->
</div>
<div class="add-ven">

<input type="button" name="button" value="Add Fields" onclick="addmore()" class="button"/>
<span style="margin:0 80px 0 0">&nbsp;</span>
<span style="margin:0 360px 0 0">&nbsp;</span>
<input type="reset" value="Reset" class="button" style="border:none;"/>
<input type="submit" id="send" name="saveonly" value="SUBMIT" class="button" style="border:none; "/>&nbsp;&nbsp;<span style="display: none;" id="sb2"><i class="fa fa-refresh fa-spin"></i></span>
</div>
<div class="tot-ven">
<h1>fsdsg</h1></div>
</div>

</div>
</form>
	
	
	<div class="vendor-list" id="div2" style="display: none;position: relative;top: -113px;">
	<form action="<%=request.getContextPath()%>/WithOutBankJournalEntry" method="post" onsubmit="return validateForm2();">
			<input type="hidden"  id="debitcount"  value="0"  name="debitcount">
			<input type="hidden"  id="creditcount"  value="0"  name="creditcount">
	<table class="table table-bordered">
		<thead>
			<tr>
			<th class="bgcolr p-5" align="center">S.NO.</th>
			<th class="bgcolr p-5" align="center" colspan="3">SUB HEAD</th>
			<th class="bgcolr p-5" align="center">DEBIT AMOUNT</th>
			<th class="bgcolr p-5" align="center">CREDIT AMOUNT</th>
			</tr>
			</thead>
			<tbody id="body1">
			</tbody>
		
			<tbody id="body2">
			</tbody>
			<tfoot>
			<tr>
				<td colspan="4" align="right"><strong>Total:</strong></td>
				<td align="right"><input type="text" name="debitTotal" id="debitTotal" readonly="readonly" value="0.00"></td>
				<td align="right"><input type="text" name="creditTotal" id="creditTotal" readonly="readonly" value="0.00"></td>
			</tr>
			<tr>
				<td colspan="6" align="center">
				<input type="submit" name="button" value="Create JV" class="button" id="submit2">&nbsp;&nbsp;<span style="display:none" id="sb1"><i class="fa fa-refresh fa-spin"></i></span>
				</td>
			</tr>
			</tfoot>		
	</table>
	<input type="hidden" name="finYr" id="finYr">
	<input type="hidden" name="dt" id="dt">
	<input type="hidden" name="dept" id="dept">
	<input type="hidden" name="refno" id="refno">
	<input type="hidden" name="desc" id="desc">
	</form>
	</div>
</body> 
</html>