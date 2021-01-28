<%-- <%@page import="com.kws.sendito.helpers.LedgerHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="java.io.*" %>
    <%@ page session = "false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script src="js/jquery-1.4.2.js"></script>
<link rel="stylesheet" href="./admin/themes/ui-lightness/jquery.ui.all.css" />
<script src="ui/jquery.ui.core.js"></script>
<script src="ui/jquery.ui.datepicker.js"></script>
<link href="../css/acct-style.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"/>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<script type="text/javascript">
function formsubmit()	{
	var fromDate = $('#fromdate').val();
	var toDate = $('#todate').val();
	var subHead = $('#subhead').val();
	var majorhead = $('#majorhead').val();
	var minorhead = $('#minorhead').val();
	var finYear = $('#finYear').val();
	if ($.trim(fromDate) == ""){ alert('select Date'); $('#fromdate').focus(); return false;}
	if ($.trim(toDate) == ""){ alert('select Date'); $('#todate').focus(); return false;}
	if ($.trim(subHead) == ""){alert('Enter SubHead'); $('#subhead').focus(); return false;}
}

</script>
<script type="text/javascript">
$(document).ready(function(){
	$('#print').click(function (){
		$('#title').val("");
		$('.printable').printThis();
	});
	
	$("#fromdate").datepicker({
		changeMonth: true,
		changeYear: true,
		numberOfMonths: 1,
		showOn: 'both',
		buttonImage: "../images/calendar-icon.png",
		buttonText: 'Select Date',
		buttonImageOnly: true,
		dateFormat: 'yy-mm-dd',
		minDate : new Date(2018,7,1),
		onSelect: function( selectedDate ) {
			$( "#todate" ).datepicker( "option", "minDate", selectedDate );
		}
	});
		$("#todate").datepicker({
		changeMonth: true,
		changeYear: true,
		numberOfMonths:1,
		showOn: 'both',
		buttonImage: "../images/calendar-icon.png",
		buttonText: 'Select Date',
		buttonImageOnly: true,
		dateFormat: 'yy-mm-dd',
		minDate : new Date(2018,7,1),
		onSelect: function( selectedDate ) {
			$( "#fromdate" ).datepicker( "option", "maxDate", selectedDate );
		}
	});
	
});
</script>

<script>

function datepickerchange()
{
	var finYear=$("#finYear").val();
	var yr = finYear.split('-');
	var startDate = yr[0]+",04,01";
	var endDate = parseInt(yr[0])+1+",03,31";
	
	$('#fromdate').datepicker('option', 'minDate', new Date(startDate));
	$('#fromdate').datepicker('option', 'maxDate', new Date(endDate));
	$('#todate').datepicker('option', 'minDate', new Date(startDate));
	$('#todate').datepicker('option', 'maxDate', new Date(endDate));
}


</script>
<script>

function getSubHead(subhead)	{
	
	
	var data = $('#subhead').val();

	
	if ($.trim(data) !==  "")	{
		$.ajax({
			url : "getsubheadsearch",
			type : "GET",
			data : {q : data },
			success : function(response)	{
				//alert(response);
				var subHeadArray = new Array();
				var branchList = JSON.stringify(response, undefined, '\t');
				  $.each($.parseJSON(branchList),function(idx,obj){
					 subHeadArray.push({
							label : obj.subHeadId+" "+obj.accNo,
							majorhead : obj.majorHeadId,
							minorhead : obj.minorHeadId,
					        sortable: true,
					        resizeable: true
						});
					  });
 			  $( '#subhead').autocomplete({
		              source:subHeadArray,
		          	focus: function(event, ui) {
						event.preventDefault();
						$(this).val(ui.item.label);
					},
					select: function(event, ui) {
						event.preventDefault();
						$(this).val(ui.item.label);
						var subhead = ui.item.label;
						var major = ui.item.majorhead;
						var minor = ui.item.minorhead;
						$('#majorhead').val(major);
						$('#minorhead').val(minor);
						console.log("major---"+major);
						console.log("minor---"+minor);
					}
					
					});
 			  
			}
		});
	}
}//function

</script>

<body>

<%
if(session.getAttribute("adminId")!=null) {
	String fdate = "";
	String tdate = "";
	String subh = "";
	String finr = "";
	SimpleDateFormat SDF2 = new SimpleDateFormat("dd MMMM yyyy");
	DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	if (request.getParameter("fromdate") != null && request.getParameter("todate") != null && request.getParameter("subhead") != null)	{
		fdate = request.getParameter("fromdate");
		tdate = request.getParameter("todate");
		subh = request.getParameter("subhead");
	}
%>

<form method="post" id="subHeadSearch" action="adminPannel.jsp" onsubmit="return formsubmit();">
			<input type="hidden" name="page" value="SubHeadLedger">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td style="width:14%;">Select Financial Year</td>
						<td style="width:12%;position: relative;left: -76px;">From Date</td>
						<td style="width:14%;position: relative;left: -136px;">To Date</td>
						<td style="width:14%;position: relative;left: -187px;">Sub Head</td>
					</tr>
					<tr>
						<td style="width:14%;padding-top:10px;">
			 				<select name="finYear" id="finYear" Onchange="datepickerchange();" style="width:54%;">
								<%@ include file="yearDropDown1.jsp" %>
							</select>
						</td> 
						<td style="width:5%;padding-top:10px;position:relative;left: -98px;">
							<input type="text" name="fromdate" id="fromdate" readonly="readonly" value="" style="margin-right: 10px;"/>
						</td>
						<td style="width:14%;position: relative;padding-top: 10px;left: -147px;">
							<input type="text" name="todate" id="todate" readonly="readonly" value="" style="margin-right: 10px;"/> 
						</td>
 						<td style="width:14%;padding-top:10px;position: relative;left: -209px;">
							<input type="text" name="subhead" id="subhead"  value="" style="width: 144%;"  onkeyup="getSubHead(subhead);" />
							<input type="hidden" id="majorhead" value="">
							<input type="hidden" id="minorhead" value=""> 
						</td>
 					</tr>
					<tr>
					<td><input type="submit" value="SEARCH" class="click" style="margin-top:20px;"/></td>
					</tr>
				</table>
			</form>
			<div>
			<table class="new-table" width="100%" cellpadding="0" cellspacing="0" style="display: block;margin: 0 auto;" id="tblExport">
                      <thead style=" display:table-header-group;">
						<tr class="table-in">
							<td class="bg" align="center" style="font-size:12px;font-weight: bold;width: 4%;border-top:1px solid;border-bottom:1px solid;">Date</td>
							<td class="bg" align="center" style="font-size:12px;font-weight: bold; border-top:1px solid;border-bottom:1px solid;width: 2%">VoucherNo</td>
							<td class="bg" align="center" style="font-size:12px;font-weight: bold;border-top:1px solid;border-bottom:1px solid;width: 8%">Particulars</td>
							<td class="bg" align="center" style="font-size:12px;font-weight: bold;border-top:1px solid;border-bottom:1px solid;width: 2.5%">VoucherType</td>
							<td class="bg" align="center" style="font-size:12px;font-weight: bold;border-top:1px solid;border-bottom:1px solid;width: 2.5%">Debit</td>
							<td class="bg" align="center" style="font-size:12px;font-weight: bold;border-top:1px solid;border-bottom:1px solid;width: 2.5%">Credit</td>
						</tr> 
					 </thead>
					 <%
					 (request.getParameter("fromdate") != null && request.getParameter("todate") != null && request.getParameter("subhead") != null && request.getParameter("finYear") != null)	{
							String fromdate = request.getParameter("fromdate");
							String todate = request.getParameter("todate");
							String subhead = request.getParameter("subhead");
							
							DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							SimpleDateFormat SDF1 = new SimpleDateFormat("dd-MM-YYYY");
							Date d1 = format.parse(fromdate+" 00:00:00");
							Date d2 = format.parse(todate+" 23:59:59");
							long difference = d2.getTime() - d1.getTime();
							long days =  difference/1000/60/60/24 ;


					 	double debitopeningBal = 0.0,creditOpenigBal=0.0,balance=0.0,debitAmount = 0.0,creditAmount = 0.0;
			LedgerHelper lh=new LedgerHelper();
			double[] openingbalances = lh.getLedgerOpeningBalance(fromdate, todate, request.getParameter("finYear"), subhead);
			%>		
			<tbody>
					 
					 
					 
					 </tbody>
					 </table>
			</div>
</body>
</html> --%>