<%-- <%@page import="com.kws.sendito.service.impl.MinorHeadServiceImpl"%>
<%@page import="com.kws.sendito.service.MinorHeadService"%>
<%@page import="com.kws.sendito.service.SubHeadService"%>
<%@page import="com.kws.sendito.service.impl.SubHeadServiceImpl"%>
<%@page import="com.kws.sendito.service.MajorHeadService"%>
<%@page import="com.kws.sendito.service.impl.MajorHeadServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
.clear{
	clear:both;
}
#addcolumn0{
width:103%;
} 
#addcolumn1{
width:103%;
}
#addcolumn2{
width:103%;
}
#addcolumn3{
width:103%;
}
#addcolumn4{
width:103%;
}
#addcolumn5{ 
width:103%;
}
</style>
<style>
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 11px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 13px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 10px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Journal-Voucher</title>
<!--Date picker script  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/acct-style.css" type="text/css" rel="stylesheet" />
<script src="../js/jquery-1.4.2.js"></script>
<link href="../css/popup.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/css/jquery.ui.all.css" />
<script src="../ui/jquery.ui.core.js"></script>
<script src="../ui/jquery.ui.datepicker.js"></script>
<script>
$(function() {
	
	 $('.txtInput').on("cut copy paste",function(e) {
	      e.preventDefault();
	   });
	
	$( "#date" ).datepicker({
		changeMonth: true,
		changeYear: true,
		numberOfMonths: 1,
		showOn: 'both',
		buttonImage: "../images/calendar-icon.png",
		buttonText: 'Select Date',
		 buttonImageOnly: true,
		dateFormat: 'yy-mm-dd'
	});		
});
function addmore(){
	var j=0;
	var i=0;
	j=document.getElementById("addcount").value;
	i=j;
	j=Number(Number(j)+5);
	for(i;i<j;i++){
	document.getElementById("addcolumn"+i).style.display="block";
	}
	document.getElementById("addcount").value=Number(Number(document.getElementById("addcount").value)+5);
}
function majorheadsearch(j,mj){
	alert(mj+"==="+j);
	  var data1=$("#"+mj+j).val();
	  var hoid=$('#hoid').val();
var arr = [];
$.post('searchMajor.jsp',{q:data1,HAid:hoid},function(data)
{
	 
	var response = data.trim().split("\n");
	  for(var i=0;i<response.length;i++){
		 var d=response[i].split(",");
		 arr.push({
			 label: d[0]+" "+d[1],
		        sortable: true,
		        resizeable: true
		    });
	 }

		var availableTags=arr;
		$("#"+mj+j).autocomplete({
				 source: availableTags,
			 focus: function(event, ui) {
					// prevent autocomplete from updating the textbox
					event.preventDefault();
					// manually update the textbox
					$(this).val(ui.item.label);
				},
				select: function(event, ui) {
				// prevent autocomplete from updating the textbox
				event.preventDefault();
				// manually update the textbox and hidden field
				$(this).val(ui.item.label);
								}	 
		 
		 }); 
		});
} 
function minorheadsearch(j,mj,mn){
	  var data1=$('#'+mn+j).val();
	  var majorhead=$('#'+mj+j).val();
var arr = [];
$.post('searchMinior.jsp',{q:data1,q1:majorhead},function(data)
{	var response = data.trim().split("\n");
	  for(var i=0;i<response.length;i++){
		 var d=response[i].split(",");
		 arr.push({
			 label: d[0]+" "+d[1],
		        sortable: true,
		        resizeable: true
		    });
	 }
		var availableTags=arr;
		$('#'+mn+j).autocomplete({
				 source: availableTags,
			 focus: function(event, ui) {
					// prevent autocomplete from updating the textbox
					event.preventDefault();
					// manually update the textbox
					$(this).val(ui.item.label);
				},
				select: function(event, ui) {
				// prevent autocomplete from updating the textbox
				event.preventDefault();
				// manually update the textbox and hidden field
				$(this).val(ui.item.label);
								}	 
		 }); 
		});
}
function banksearch(){
		  var bankname=$('#bankname').val();
	  	var hoid=$('#hoid').val();
		var arr = [];
$.post('searchBanks.jsp',{q:bankname,HOA:hoid,filterby : 'credit'},function(data)
{	var response = data.trim().split("\n");
	  for(var i=0;i<response.length;i++){
		 var d=response[i].split(",");
		 if (d[0] == "BNK1004")	{
			 arr.push({
				 label: d[0]+" "+d[1],
				 amount:d[6],
				 banktype:d[4],
			        sortable: true,
			        resizeable: true
			    });
		 }
		 else	{
			 arr.push({
				 label: d[0]+" "+d[1],
				 amount:d[5],
				 banktype:d[4],
			        sortable: true,
			        resizeable: true
			    }); 
		 }
	  }
	  var availableTags=arr;
		$( '#bankname').autocomplete({
				 source: availableTags,
			 focus: function(event, ui) {
					// prevent autocomplete from updating the textbox
					event.preventDefault();
					// manually update the textbox
					$(this).val(ui.item.label);
				},
				select: function(event, ui) {
				// prevent autocomplete from updating the textbox
				event.preventDefault();
				// manually update the textbox and hidden field
				$(this).val(ui.item.label);
				$("#bankbalance").val(ui.item.amount);
				$("#banktype").val(ui.item.banktype);
				$('#bb').html(ui.item.amount);
				}	 
		 }); 
		});
}
function loanbanksearch(){
	  var loanbankname=$('#loanbankname').val();
	var hoid=$('#hoid').val();
	var arr = [];
$.post('searchBanks.jsp',{q:loanbankname,HOA:hoid,con: 'loanbank',filterby : 'debit'},function(data)
{	var response = data.trim().split("\n");
for(var i=0;i<response.length;i++){
	 var d=response[i].split(",");
	 arr.push({
		 label: d[0]+" "+d[1],
		 amount:d[5],
		 banktype:d[4],
	        sortable: true,
	        resizeable: true
	    });
}
var availableTags=arr;
	$( '#loanbankname').autocomplete({
			 source: availableTags,
		 focus: function(event, ui) {
				// prevent autocomplete from updating the textbox
				event.preventDefault();
				// manually update the textbox
				$(this).val(ui.item.label);
			},
			select: function(event, ui) {
			// prevent autocomplete from updating the textbox
			event.preventDefault();
			// manually update the textbox and hidden field
			$(this).val(ui.item.label);
			$("#loanbankbalance").val(ui.item.amount);
			$("#loanbanktype").val(ui.item.banktype);
			$('#bb').html(ui.item.amount);
			}	 
	 }); 
	});
}
function subheadsearch(j,mj,mn,sb){
	  var minorhead=$('#'+mn+j).val();
	  var majorhead=$('#'+mj+j).val();
	  var subhead=$('#'+sb+j).val();
	  var hoa=$('#hoid'+j).val();
var arr = [];
$.post('searchSubhead.jsp',{q:subhead,HID:hoa,q1:majorhead,q2:minorhead},function(data)
{
	 
	var response = data.trim().split("\n");
	  for(var i=0;i<response.length;i++){
		 var d=response[i].split(",");
		 arr.push({
			 label: d[0]+" "+d[1],
		        sortable: true,
		        resizeable: true
		    });
	 }

		var availableTags=arr;
		$('#'+sb+j).autocomplete({
				 source: availableTags,
			 focus: function(event, ui) {
					// prevent autocomplete from updating the textbox
					event.preventDefault();
					// manually update the textbox
					$(this).val(ui.item.label);
				},
				select: function(event, ui) {
				// prevent autocomplete from updating the textbox
				event.preventDefault();
				// manually update the textbox and hidden field
				$(this).val(ui.item.label);
								}	 
		 
		 }); 
		});
} 
function vendorsearch(){
	 var data1=$('#vendorname').val();
	  var headID=$('#hoid').val();
	  if($('#hoid').val().trim()==""){
			$('#hoid').focus();
			return false;
		}
	  $.post('searchVendor.jsp',{q:data1,b:headID},function(data)
	{
		var response = data.trim().split("\n");
		 var doctorNames=new Array();
		 var doctorIds=new Array();
		 for(var i=0;i<response.length;i++){
			 var d=response[i].split(",");
			 doctorIds.push(d[0]);
			 doctorNames.push(d[0] +" "+ d[1]);
		 }
		var availableTags=data.trim().split("\n");
		var availableIds=data.trim().split("\n");
		availableTags=doctorNames;
		 $( '#vendorname').autocomplete({source: availableTags}); 
			});
}
function Confirm(){
	var bankbalan=0;
	var debitamount=0;
	var creditamount=0;
	var type;
	var bankflag=$('input:radio[name=jvtype]:checked').val();
	if(bankflag=="withbank"){
		type = $("input[name='entryType1']:checked").val();
		bankbalan=$("#bankbalance").val();
//	   alert("balance"+bankbalan);
		if(bankbalan==""){
			alert("Please Enter Bank Name");
			$('#bankname').focus();
			return false;
		}
		bankbalan=Number(bankbalan);
		debitamount=Number($("#debittotalamnt").val());
		creditamount=Number($("#credittotalamnt").val());
		if(!bankbalan>0){
//			alert("Availble Balance in Account is negative.");
//			return false;
		}
		else if(debitamount>bankbalan && bankflag == "withloanbank"){
//			alert("Availble Balance in Account is RS : "+bankbalan+" /-.Entry cannot be processed.");
//			return false;
		} 
		else if(creditamount>bankbalan && bankflag == "withbank"){
//			alert("Availble Balance in Account is RS : "+bankbalan+" /-.Entry cannot be processed.");
//			return false;
		}else if(creditamount>0 && debitamount>0){
			alert("Both Debit and credit entry is not processed at a time. ");
			return false;
		}
		
	}else if(bankflag=="withloanbank"){
		type = $("input[name='entryType2']:checked").val();
		bankbalan=$("#loanbankbalance").val();
		if(bankbalan==""){
			alert("Please Enter Bank Name");
			$('#loanbankname').focus();
			return false;
		}
		bankbalan=Number(bankbalan);
		debitamount=Number($("#debittotalamnt").val());
		creditamount=Number($("#credittotalamnt").val());
		if(!bankbalan>0){
//			alert("Availble Balance in Account is negative.");
//			return false;
		}
		else if(debitamount>bankbalan && bankflag == "withloanbank"){
//			alert("Availble Balance in Account is RS : "+bankbalan+" /-.Entry cannot be processed.");
//			return false;
		} 
		else if(creditamount>bankbalan && bankflag == "withbank"){
//			alert("Availble Balance in Account is RS : "+bankbalan+" /-.Entry cannot be processed.");
//			return false;
		}else if(creditamount>0 && debitamount>0){
			alert("Both Debit and credit entry is not processed at a time. ");
			return false;
		}
		
	}
	var count = $('#addcount').val();
	count = Number(count);
	for (var i = 0 ; i < count ; i++)	{
				var subhead = $('#subId'+i).val();
				if ($.trim(subhead) !== "")	{
					if (type == 'debit')	{
						var debit = $('#debitAmt'+i).val();
						if (Number(debit) == 0)	{
							$('#debitAmt'+i).focus();
							return false;
						}
					}
					else	{
						var credit = $('#creditAmt'+i).val();
						if (Number(credit) == 0)	{
							$('#creditAmt'+i).focus();
							return false;
						}
					}
				}
				/* else	{
					$('#subhead'+i).focus();
					return false;
				} */
 }
	   var status = confirm('Submit the Voucher?  \n\n Click OK to proceed');
	   if(status == false){
	  	 return false;
	   }
	   else{
		 $('#sb2').show();
	  	 $('#send').val('Loading...');
	  	$('#send').attr('disabled',true);
		 return true; 
	   } 
}
$(document).ready(function() {
	 $('input[type=radio][name=jvtype]').change(function() {
	        if (this.value == 'withoutbank') {
				$(".bankclass").hide();
				$(".loanbankclass").hide();
				$(".vendorclass").hide();
				$('#bbl').hide();
	        }
	        else if (this.value == 'withbank') {
	        	$(".loanbankclass").hide();
	        	$(".bankclass").show();
	        	$(".vendorclass").hide();
	        	$('#bbl').show();
	        }
	        else if (this.value == 'withloanbank') {
	        	$(".loanbankclass").show();
	        	$(".bankclass").hide();
	        	$(".vendorclass").hide();
	        	$('#bbl').show();
	        } 
	        else if (this.value == 'withvendor') {
	        	$(".loanbankclass").hide();
	        	$(".bankclass").show();
	        	$(".vendorclass").show();
	        	$('#bbl').hide();
	        } 
	    });
	});
	
$('#formSubmit').bind('submit', function (e) {
    var button = $('#send');
	
    // Disable the submit button while evaluating if the form should be submitted
    button.prop('disabled', true);

    var valid = true;    

    // Do stuff (validations, etc) here and set
    // "valid" to false if the validation fails
//alert('111111');
    if (!valid) { 
        // Prevent form from submitting if validation failed
        e.preventDefault();
        
        // Reactivate the button if the form was not submitted
        button.prop('disabled', false);
    }
});
</script>
<script>

function datepickerchange()
{
	var finYear=$("#finYear").val();
	//alert('finYear==='+finYear);
	var yr = finYear.split('-');
	var startDate = yr[0]+",04,01";
	var endDate = parseInt(yr[0])+1+",03,31";
	
	$('#date').datepicker('option', 'minDate', new Date(startDate));
	$('#date').datepicker('option', 'maxDate', new Date(endDate));
	/* $('#toDate').datepicker('option', 'minDate', new Date(startDate));
	$('#toDate').datepicker('option', 'maxDate', new Date(endDate)); */
}

$(document).ready(function(){
	datepickerchange();
	addmoreRows('debit');
	addmoreRows('credit');
}); 
</script>


<script>
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
<!--Date picker script  -->
<script type='text/javascript' src='../main/lib/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='../main/lib/jquery.js'></script>
<link rel="stylesheet" type="text/css" href="../main/jquery.autocomplete.css"/>
<script type='text/javascript' src='../main/jquery.autocomplete.js'></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"/>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css"/>
</head>
<body>
<form id="formSubmit" name="tablets_Update" method="post" action="<%=request.getContextPath()%>/JournalEntryInsertCtrl" onsubmit="return Confirm();">
<div class="vendor-page">

<div class="vendor-box">
<table width="100%" cellpadding="0" cellspacing="0" id="tblExport">
	
						<tr><td colspan="4" align="center" style="font-weight: bold;">Journal Voucher</td></tr>
</table>
<div class="vender-details">
<%/* HeadOfAccountsService HOA_L=new HeadOfAccountsServiceImpl();
 */double creditamount,debitamount;
creditamount=debitamount=0.0;
MajorHeadService MJRL=new MajorHeadServiceImpl();
SubHeadService SUBL=new SubHeadServiceImpl();
MinorHeadService MINL=new MinorHeadServiceImpl();
String currentDate = "";
if (request.getParameter("entryDate") != null)	{
	currentDate = request.getParameter("entryDate");
}
else	{
	currentDate = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
}

int noofrooms,l;
noofrooms=l=0;

if(request.getParameter("noofrooms")!=null && request.getParameter("noofrooms")!=""){
	noofrooms=(Integer.parseInt(request.getParameter("noofrooms").toString()));
}
%>
<table width="80%" border="0" cellspacing="0" cellpadding="0">
<tr>
<!-- <td>Journal Voucher No</td> -->
<td>Select Fin Year</td>
<td>Date</td>
<!-- <td>Department</td> -->
</tr>
 <tr>
 <td>
<select name="finYear" id="finYear"  Onchange="datepickerchange();">
					<option value="2020-21" name="year" <%if(request.getParameter("finYear") != null && request.getParameter("finYear").equals("2020-21")) {%> selected="selected"<%} %>>2020-2021</option>
 					<option value="2019-20" name="year" <%if(request.getParameter("finYear") != null && request.getParameter("finYear").equals("2019-20")) {%> selected="selected"<%} %>>2019-2020</option>
					<option value="2018-19" name="year" <%if(request.getParameter("finYear") != null && request.getParameter("finYear").equals("2018-19")) {%> selected="selected"<%} %>>2018-2019</option>
					</select>
</td>
<td><input type="text" name="date" id="date"  value="" class="DatePicker" readonly/></td>
<td><input type="hidden" name="hoid" id="hoid">
</td>
 </tr>
 <tr><td>Narration*</td>
<td>Journal Voucher Type</td>
</tr>
<tr>
<td>
	<input type="hidden" name="voucherRefNo" id="billnumb" value="1"/>
	<textarea rows="5" cols="8" name="narration" id="narration" required placeHolder="Write your narration" onkeyup="javascript:this.value=this.value.toUpperCase();"></textarea>
</td>
<td style="position: relative;top: -37px;">
<input type="radio" name="jvtype" id="jvtype"  value="withbank" /><b>With Bank/Cash</b>
<input type="radio" name="jvtype" id="jvtype"  value="withloanbank"/><b>With Loan Bank</b>
<input type="radio" name="jvtype" id="jvtype" value="withoutbank" /><b>With out Bank/Cash</b> 
</td>
</tr>
<tr>
<td colspan="1"  style="display:none;" class="bankclass">
Bank Name
</td>
<td colspan="1"  style="display: none;" class="bankclass">Select Type</td>
<td colspan="1"  style="display:none;" class="vendorclass">
Vendor Name
</td>
</tr>
<tr>
<td colspan="1" style="display:none;" class="bankclass">
<input type="text" name="bankname" id="bankname" value="" onkeyup="banksearch();" placeholder="Enter Bank Name" autocomplete="off"/><br/>
<input type="hidden" name="bankbalance" id="bankbalance" value=""/>
<input type="hidden" name="banktype" id="banktype" value=""/>
</td>
<td colspan="1" style="display: none;color: red;" class="bankclass">
<input type="radio" name="entryType1"  value="debit">Debit(+)&nbsp;&nbsp;&nbsp;
<input type="radio" name="entryType1"  value="credit" checked="checked">Credit(-)&nbsp;&nbsp;&nbsp;
</td>
<td colspan="1" style="display:none;" class="vendorclass">
<input type="text" name="vendorname" id="vendorname" value="" onkeyup="vendorsearch();" placeholder="Enter Vendor Name" /><br/>
</td>
</tr>
 <!-- Loan Bank enable tr starts-->
<tr>
<td colspan="1" style="display:none;" class="loanbankclass">
Bank Name
</td>
<td colspan="1" style="display: none;" class="loanbankclass">
Select Type
</td>
</tr>
<tr>
<td colspan="1" style="display:none;" class="loanbankclass">
<input type="text" name="loanbankname" id="loanbankname" value="" onkeyup="loanbanksearch();" placeholder="Enter Bank Name" autocomplete="off"/><br/>
Enter Loan Bank Name or Bank Id
<input type="hidden" name="bankbalance" id="loanbankbalance" value=""/>
<input type="hidden" name="banktype" id="loanbanktype" value=""/>
</td>
<td colspan="1" style="display: none;color:red;" class="loanbankclass">
<input type="radio" name="entryType2"  value="debit">Debit(+)&nbsp;&nbsp;&nbsp;
<input type="radio" name="entryType2"  value="credit" checked="checked">Credit(-)&nbsp;&nbsp;&nbsp;
</td>
</tr>
<tr id="bbl" style="display: none;">
<td>
<span style="font-weight: bold;">Current Bal:&nbsp;</span><span style="color: blue;font-weight: bold;" id="bb"></span>
</td>
</tr>
 <!-- Loan Bank enable tr ends-->
</table>
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

<%if(noofrooms<1){
	for(int i=0; i < 50; i++ ){%>  
	<div <%if(i>4){ %>style="display: none;"<%} %> id="addcolumn<%=i%>" > 
		<div class="sno1 MT13"><%=i+1%></div>   
		<input type="hidden" name="count" id="check<%=i%>"  value="<%=i %>"/> 
		<input type="hidden" name="subId<%=i%>" id="subId<%=i%>">
		<div class="ven-nme1" style="width:250px; cursor: pointer;">
		<input type="text" name="subhead<%=i%>" id="subhead<%=i%>"  onkeyup="getSubHead('<%=i%>','subhead','subId','lb');" class="" value="" placeholder="Find a subhead here" <%if(i==0){ %> required <%} %>  autocomplete="off" style="width:100%;" class="txtInput"/>
		<span style="font-weight:bold;">Currents Bal:&nbsp;</span><span style="font-weight:bold;color: blue;" id="lb<%=i%>"></span>
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
<img src="../images/Rupee-Symbol-PNG-Clipart.png;" style="width:10px; height:10px;"><input type="text" name="credittotalamnt" id="credittotalamnt" value="<%=creditamount %>" style="width: 150px;"/>
</div>
<div class="add-ven">
<input type="button" name="button" value="Add Fields" onclick="addmore()" class="button"/>
<span style="margin:0 80px 0 0">&nbsp;</span>
<span style="margin:0 360px 0 0">&nbsp;</span>
<input type="reset" value="Reset" class="button" style="border:none;"/>
<input type="submit" id="send" name="saveonly" value="SUBMIT" class="button" style="border:none; "/>&nbsp;&nbsp;<span style="display: none;" id="sb2"><i class="fa fa-refresh fa-spin"></i></span>
</div>
<div class="tot-ven"></div>
</div>

</div>
</form>
	
	<div class="vendor-list" id="div2" style="display: none;position: relative;top: -113px;">
	
	<form action="/jvls" method="post" onsubmit="return validateForm2();">
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
<script type="text/javascript">
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : evt.keyCode;
   if (charCode != 46 && charCode > 31 
     && (charCode < 48 || charCode > 57))
      return false;

   return true;
}
function addmoreRows(type)	{
		if (type === "credit")	{
			
			var count = document.getElementById('creditcount').value;
			count = Number(count);
			//alert(count);
			$('#cr').remove();
			for (var i = (count+1) ; i <= (count+2) ; i++)	{
				var html = "<tr>";
				html += "<td>"+i+"</td>";
				html += "<input type='hidden' id='subIdCr"+i+"' name='subIdCr"+i+"'></td>";
				html += "<td colspan='3'><input type='text' id='sbc"+i+"' name='sb"+i+"' onkeyup=\"getSubHead('"+i+"','sbc','subIdCr','clb');\" style='width:100%;' class='txtInput'";
				if (i == 1)	{
					html += "required='required' >";
				}
				else	{
					html += ">";
				}
				html += "<span style='font-weight:bold;'>Current Bal:&nbsp;</span><span style='font-weight:bold;color:blue;' id='clb"+i+"'></span></td>";
				html += "<td align='right'><input type='text' readonly='readonly' style='background-color: #F7F9F9'></td>";
				html += "<td align='right'><input type='text' id='credit"+i+"' name='credit"+i+"'  onkeypress='return isNumberKey(event)' value='0.00' onkeyup=\"calculateAmount('credit',"+i+");\"></td>";
				html += "</tr>";
				$('#body2').append(html);
			}
			$('#body2').append("<tr id='cr'><td colspan='6'><input type='button' name='button' value='Add Fields' class='button' onclick=\"addmoreRows('credit')\" ></td></tr>");
			
			document.getElementById('creditcount').value = Number(count) + Number(2);
		}
		else if(type === "debit")	{
			var count = document.getElementById('debitcount').value;
			count = Number(count);
			$('#dr').remove();
			for (var i = (count+1) ; i <= (count+2) ; i++)	{
			//	alert(i);
				var html = "<tr>";
				html += "<td>"+i+"</td>";
				html += "<input type='hidden' id='subIdDr"+i+"' name='subIdDr"+i+"'>";
				html += "<td colspan='3'><input type='text' id='sub"+i+"' name='sub"+i+"' onkeyup=\"getSubHead('"+i+"','sub','subIdDr','dlb');\" style='width:100%;' class='txtInput'";
				if (i == 1)	{
					html += " required='required'>";
				}
				else	{
					html += ">";
				}
				html += "<span style='font-weight:bold;'>Current Bal:&nbsp;</span><span style='font-weight:bold;color:blue;' id='dlb"+i+"'></span></td>";
				html += "<td align='right'><input type='text' id='debit"+i+"' name='debit"+i+"'  onkeypress='return isNumberKey(event)' value='0.00' onkeyup=\"calculateAmount('debit',"+i+");\"></td>";
				html += "<td align='right'><input type='text' readonly='readonly' style='background-color: #F7F9F9'></td>";
				html += "</tr>";
				alert(i);
				
				$('#body1').append(html);
			}
			$('#body1').append("<tr id='dr'><td colspan='6'><input type='button' name='button' value='Add Fields' class='button' onclick=\"addmoreRows('debit')\" ></td></tr>");
		
			document.getElementById('debitcount').value = Number(count) + Number(2);
					}
}


function calculateAmount(type,index)	{
	if (type === "credit")	{
		var count = document.getElementById('creditcount').value;
		count = Number(count);
		var amount = 0;
		for (var i = 1 ; i <= count ; i++)	{
			var amt = document.getElementById('credit'+i).value;
			amount = Number(amount) + Number(amt);
		}
		document.getElementById('creditTotal').value = Number(amount).toFixed(2);
	}
	else if (type === "debit")	{
		var count = document.getElementById('debitcount').value;
		count = Number(count);
		var amount = 0;
		for (var i = 1 ; i <= count ; i++)	{
			var amt = document.getElementById('debit'+i).value;
			amount = Number(amount) + Number(amt);
		}
		document.getElementById('debitTotal').value = Number(amount).toFixed(2);
	}
}
function validateForm2()	{
	var crcount = document.getElementById('creditcount').value;
	var drcount = document.getElementById('debitcount').value;
	for (var i = 1 ; i <= crcount ; i++)	{
		var sub = document.getElementById('subIdCr'+i).value;
		if (sub !== undefined && sub.trim() !== "")	{
			var amount = document.getElementById('credit'+i).value;
			if (!Number(amount) > 0)	{
				document.getElementById('credit'+i).focus();
				return false;
			}
		}
	}
	for (var i = 1 ; i <= drcount ; i++)	{
		var sub = document.getElementById('subIdDr'+i).value;
		if (sub !== undefined && sub.trim() !== "")	{
			var amount = document.getElementById('debit'+i).value;
			if (!Number(amount) > 0)	{
				document.getElementById('debit'+i).focus();
				return false;
			}
		}
	}
	var narration = document.getElementById('narration').value;
//	var billnumb = document.getElementById('billnumb').value;
	if (narration.trim() === "")	{
		$('#narration').css("border", "2px solid red");
		document.getElementById('narration').focus();
		return false;
	}
	/* if (billnumb.trim() === "")	{
		document.getElementById('billnumb').focus();
		return false;
	} */
	
	document.getElementById('finYr').value = document.getElementById('finYear').value;
	document.getElementById('dt').value = document.getElementById('date').value;
	document.getElementById('dept').value = document.getElementById('hoid').value;
	document.getElementById('refno').value = document.getElementById('billnumb').value;
	document.getElementById('desc').value = document.getElementById('narration').value;
	
	var debitTotal = document.getElementById('debitTotal').value;
	var creditTotal = document.getElementById('creditTotal').value;
	if (Number(debitTotal) !== Number(creditTotal))	{
		alert("Credit and Debit Amount Not Matching");
		return false;
	}
	
	document.getElementById('submit2').disabled = true;
	document.getElementById('submit2').value = "Please Wait...";
	$('#sb1').show();
	
	$('#submit2').bind('keydown', function(e) {
	    if (e.keyCode == 13) {
	        e.preventDefault();
	    }
	});
}

function getSubHead(index,subhead,subid,bid)	{
	alert('rdgtfyyg');
	$('#'+bid+index).html("");
	var data = $('#'+subhead+index).val();
	alert('data====='+data);
	//var hoa = $('#hoid').val();
	if ($.trim(data) !==  "")	{
		alert('if sucess');
		$.ajax({
		//	alert('data====='+data);
			url : "getsubheadsearch",
			type : "GET",
			data : {q : data },
			success : function(response)	{
				alert(response);
				var subheads = response.trim().split("\n");
				var subHeadArray = new Array();
				for (var i = 0 ; i < subheads.length ; i++)	{
					var data = subheads[i].split(",");
					subHeadArray.push({
						label : data[0]+" "+data[1]
					});
				}
				$('#'+subhead+index).autocomplete({
					source : subHeadArray,
					focus: function(event, ui) {
						event.preventDefault();
						$(this).val(ui.item.label);
					},
					select: function(event, ui) {
						event.preventDefault();
						$(this).val(ui.item.label);
						var subhead = ui.item.label.split(" ")[0];
						var finYear = $('#finYear').val();
						var todate = $('#date').val();
						$('#'+subid+index).val(subhead);
						$.ajax({
							url : "getLedgerBalance.jsp",
							type : "POST",
							data : {subhead:subhead,finYear:finYear,todate:todate},
							success : function(response)	{
								var data = $.trim(response);
								$('#'+bid+index).html(data);
							}
						});
					}
				});
			}
		});
	}
}//function

$(function()	{
	$('#narration').keyup(function()	{
		var val = $(this).val();
		if ($.trim(val) !== "")	{
			$('#narration').css("border","none");
		}
	});
	checkData();
	
	$("input[name='entryType1']").change(function(){
		checkData();
		for (var i = 0 ; i < 50 ; i ++)	{
//			$('#subhead'+i).val('');
			$('#debitAmt'+i).val('0.00');
			$('#creditAmt'+i).val('0.00');
		}
		$('#debittotalamnt').val('0.00');
		$('#credittotalamnt').val('0.00');
	});
	
	$("input[name='entryType2']").change(function(){
		checkData();
		for (var i = 0 ; i < 50 ; i ++)	{
//			$('#subhead'+i).val('');
			$('#debitAmt'+i).val('0.00');
			$('#creditAmt'+i).val('0.00');
		}
		$('#debittotalamnt').val('0.00');
		$('#credittotalamnt').val('0.00');
	});
});

function checkData()	{
	var jvtype = $("input[name='jvtype']:checked").val();
	var etype;
	if (jvtype == 'withbank')	{
		etype = $("input[name='entryType1']:checked").val();
	}
	else if (jvtype == 'withloanbank')	{
		etype = $("input[name='entryType2']:checked").val();
	}
	if (etype == "debit")	{
		for (var i = 0 ; i < 50 ; i++)	{
			alert("sdfdddddddddddddddddddddddd")
			$('#debitAmt'+i).attr('readonly',false);
			$('#creditAmt'+i).val('0.00');
			$('#creditAmt'+i).attr('readonly',true);
		}
	}
	else	{
		for (var i = 0 ; i < 50 ; i++)	{
			$('#creditAmt'+i).attr('readonly',false);
			$('#debitAmt'+i).val('0.00');
			$('#debitAmt'+i).attr('readonly',true);
		}
	}
}

function calculate(i){
	var u=0;
	var debitamount=0.0;
	var creditamount=0.0;
	u=document.getElementById("addcount").value;
	if(document.getElementById("subId"+i).value != ""){
		var jvtype = $("input[name='jvtype']:checked").val();
		var ntype;
		if (jvtype == "withbank")	{
			ntype	= $("input[name='entryType1']:checked").val();
		}
		else	{
		ntype	= $("input[name='entryType2']:checked").val();
		}
		if (ntype == "debit")	{
			for(var j=0;j<u;j++){
				if(document.getElementById("debitAmt"+j).value!=""){
				debitamount=Number(parseFloat(debitamount)+parseFloat(document.getElementById("debitAmt"+j).value)).toFixed(2);
				}
			}
			document.getElementById("debittotalamnt").value=debitamount;
		}
		else	{
			for(var j=0;j<u;j++){
			if(document.getElementById("creditAmt"+j).value!=""){
				creditamount=Number(parseFloat(creditamount)+parseFloat(document.getElementById("creditAmt"+j).value)).toFixed(2);
				}	
			}
			document.getElementById("credittotalamnt").value=creditamount;
		}		
	}
	else	{
		document.getElementById("subhead"+i).focus();
	}
}
</script>
</body>
</html>
 --%>