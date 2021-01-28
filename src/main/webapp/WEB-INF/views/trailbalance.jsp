<%-- <%@page import="com.kws.sendito.service.impl.MajorHeadServiceImpl"%>
<%@page import="com.kws.sendito.service.MajorHeadService"%>
<%@page import="com.kws.sendito.entities.MajorHead"%>
<%@page import="com.kws.sendito.entities.MinorHead"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<style>
	.table-head td{
	font-size:16px; 
	line-height:28px; 
	text-align:center; 
	font-weight:bold;

}
table td{
	height:10px;
}
.new-table{
	border:1px solid #000;
}
.new-table td{
		border:1px solid #000 ;
}
.new-table td{
padding: 2px 0 2px 5px !important;}

@media print{
thead
            {
                display:  table-header-group;  
            }
            .list-details  tr {
    border-left: 1px solid;
    }
   .print_table{ 
    width: 900px;
    border: solid 1px;
    border-collapse: collapse;
}
/*.print_table th{
    border-color: black;
    font-size: 12px;
    border: solid 1px;
    border-collapse: collapse;
    margin: 0;
    padding: 0;
}*/
.print_table td{
    border-color: black;
    font-size: 12px;
    border: solid 1px;
    border-collapse: collapse;
    margin: 0;
    padding: 0;
    text-align: center;
}
.print_table tr:nth-child(odd){
    background-color:#E8E8E8;
}
.print_table tr:nth-child(even){
    background-color:#ffffff;
}
.new-table{
border:0 !important;
	font-size:13px;
	text-transform:lowercase;
	height:15px;
	width:90%;
	}
	.new-table td::first-letter {

text-transform: uppercase !important;

}
.new-table td{
		border:0px solid #000 ;
}
.table-in th{
/* 	border-top:1px solid ;
	border-bottom:1px solid; */
	border:1px solid;
	font-size:15px;
	height:10px;
}
.new-table{
font-size:12px;
	border:1px solid;
}
.new-table td {
font-size:12px;
    padding: 0px 0 0px 5px !important;
}
.new-table td {
    border-right: 1px solid #000;
    border-left:1px solid #000;
}
.total td { 

	border:1px solid #000; 
}
.assets td{
		border:1px solid #000; 
}
.liabilities td{
	border:1px solid #000;
}
}
</style>

<script src="../js/jquery-1.4.2.js"></script>
<script type="text/javascript" lang="javascript" src="../js/modal-window.js"></script>	
<link rel="stylesheet" href="themes/ui-lightness/jquery.ui.all.css" />
<script src="../ui/jquery.ui.core.js"></script>
<script src="../ui/jquery.ui.datepicker.js"></script>
<script>
$(function() {
	$( "#fromDate" ).datepicker({
		
		changeMonth: true,
		changeYear: true,
		numberOfMonths: 1,
		showOn: 'both',
		buttonImage: "../images/calendar-icon.png",
		buttonText: 'Select Date',
		 buttonImageOnly: true,
		dateFormat: 'yy-mm-dd',
		onSelect: function( selectedDate ) {
			$( "#toDate" ).datepicker( "option", "minDate", selectedDate );
		}
	});
		$( "#toDate" ).datepicker({
		
		changeMonth: true,
		changeYear: true,
		numberOfMonths:1,
		showOn: 'both',
		buttonImage: "../images/calendar-icon.png",
		buttonText: 'Select Date',
		 buttonImageOnly: true,
		dateFormat: 'yy-mm-dd',
		onSelect: function( selectedDate ) {
			$( "#fromDate" ).datepicker( "option", "maxDate", selectedDate );
		}
	});
});

function datepickerchange()
{
	var finYear=$("#finYear").val();
	var yr = finYear.split('-');
	var startDate = yr[0]+",04,01";
	var endDate = parseInt(yr[0])+1+",03,31";
	$('#fromDate').datepicker('option', 'minDate', new Date(startDate));
	$('#fromDate').datepicker('option', 'maxDate', new Date(endDate));
	$('#toDate').datepicker('option', 'minDate', new Date(startDate));
	$('#toDate').datepicker('option', 'maxDate', new Date(endDate));
}

$(document).ready(function(){
	datepickerchange();
}); 
</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"/>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="../js/jquery.print.js"></script>
<script src="../js/jquery.battatech.excelexport.js"></script>
</head>
<body>
<%
if(session.getAttribute("adminId")!=null){ 
DecimalFormat df=new DecimalFormat("#,###.00");
Calendar c1 = Calendar.getInstance(); 
//TimeZone tz = TimeZone.getTimeZone("IST");
DateFormat dateFormat2= new SimpleDateFormat("yyyy-MM-dd");
String fromdate="";
String onlyfromdate="";
String todate="";
String onlytodate="";
c1.getActualMaximum(Calendar.DAY_OF_MONTH);
int lastday = c1.getActualMaximum(Calendar.DATE);
c1.set(Calendar.DATE, lastday);  
todate=(dateFormat2.format(c1.getTime())).toString();
c1.getActualMinimum(Calendar.DAY_OF_MONTH);
int firstday = c1.getActualMinimum(Calendar.DATE);
c1.set(Calendar.DATE, firstday); 
fromdate=(dateFormat2.format(c1.getTime())).toString();
if(request.getParameter("fromDate")!=null && !request.getParameter("fromDate").equals("")){
fromdate=request.getParameter("fromDate");
}
if(request.getParameter("toDate")!=null && !request.getParameter("toDate").equals("")){
todate=request.getParameter("toDate");
}
%>
<div class="vendor-page">
<div>
<form action="trailBalances" method="post" style="padding-left: 70px;padding-top: 30px;">
<table width="80%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
<td colspan="2">Select Financial<br/>Year</td>
<td class="border-nn">&nbsp;&nbsp;From Date</td>
<td class="border-nn">To Date</td>
<td class="border-nn">Select Head</td>
<!-- <td class="border-nn">Report Type</td> -->
</tr>
<tr>
<td colspan="2">
<select name="finYear" id="finYear"  Onchange="datepickerchange();">
<%@ include file="yearDropDown1.jsp" %>
</select>
</td> 
<td class="border-nn">&nbsp;&nbsp;<input type="text"  name="fromDate" id="fromDate" readonly="readonly" value="<%=fromdate%>" /> </td>
<td class="border-nn"><input type="text" name="toDate" id="toDate" readonly="readonly" value="<%=todate%>"/>
<select name="headtype" id="headtype">

 <option value="SubHead" ${status eq 'SubHead'?'selected':''}>SubHead</option>
 <option value="MinorHead" ${status eq 'MinorHead'?'selected':''}>MinorHead</option>
 </select>
 
<input type="hidden" name="page" value="trailBalanceReport_newBySitaram"/>
</td>
</td>
<td class="border-nn">
</td>
<td class="border-nn"><input type="submit" value="SEARCH" class="click"/></td>
</tr></tbody></table> </form>
<table width="90%" cellpadding="0" cellspacing="0" style="    margin-bottom: 10px; margin-top:10px; margin:auto;">
<tbody><tr>
						</tr>
					<tr><td colspan="3" align="center" style="font-weight: bold;">Trail Balance Report</td></tr>
				</tbody></table>
<div style="clear:both"></div>

<table width="90%" border="0" cellspacing="0" cellpadding="0"  style="margin:0 auto;" class="new-table">
  <tbody>
  	<thead>
  <tr class="table-in">
    <th width="38%" height="29" align="center">Account Name</th>
    <th width="29%" align="center">Debits</th>
    <th width="33%" align="center">Credits</th>
  </tr>
  </thead>
  
  <%
  double debit1 = 0.0;
  double credit1 = 0.0;
  double balance1 = 0.0;
  double balance2=0.0;
  double debitTotal=0.0;
  double creditTotal=0.0;
  double tt=0.0;
double incomeSubs=0.0;
double incomeMin=0.0;
  %>
<tr>
 <c:set var="total" value="${0}"/>
 <c:forEach var="assetsBanks" items="${assetsBanks}">
<c:set var="total" value="${total+assetsBanks.bankBal }"/>
<c:set var="debitTotal" value="${debitTotal+assetsBanks.bankBal }"/>
</c:forEach>

 <c:set var="debittotals" value="${0}"/>
 <c:forEach var="allSubHeadsJournalEntries" items="${allSubHeadsJournalEntries}">
<c:set var="debittotals" value="${debittotals+allSubHeadsJournalEntries.rate }"/>
</c:forEach>



<c:set var="liabtotal" value="${0}"/>
 <c:forEach var="liabBanks" items="${liabBanks}">
<c:set var="liabtotal" value="${liabtotal+liabBanks.bankBal }"/>
<c:set var="creditTotal" value="${creditTotal+liabBanks.bankBal }"/>
</c:forEach>
<c:set var="u" value="${0}"/>






-----------------------Income Starts---------------------------------------------
 <c:set var="incometotals" value="${0}"/>

<c:set var="username" value="Income"/>
 <c:forEach var="incomemajhdlist" items="${incomemajhdlist}">
  <c:if test="${username eq 'Income'}">
<tr><td style="text-align:center"><b><c:out value="${username}"/></b></td>
<td></td><!-- incometotals,expensetotals,assetstotals,liabtotals -->
<td></td>
</tr>
</c:if>
<c:remove var="username"/>
<td><b>${incomemajhdlist.majorHeadName},${incomemajhdlist.accNo}</b></td>- majorhead name and accno
<td><%=debit1 %></td>
<td><%=credit1 %></td>
</tr>
<c:forEach var="incomeminorheadlistHeads" items="${ incomeminorheadlistHeads}">
<c:choose>
<c:when test="${incomemajhdlist.majorHeadName eq incomeminorheadlistHeads.type }">-comparing  majorhead names in both majorhead and minorhead
<tr><td><b><I>${incomeminorheadlistHeads.minorHeadName},${incomeminorheadlistHeads.accNo}</I></b></td>- minorhead name and accno
<td><%=debit1 %></td>
<td><%=credit1 %></td>
</tr>
<c:forEach var="allSubHeadsJournalEntries" items="${allSubHeadsJournalEntries}">
<c:forEach var="allSubHeads" items="${allSubHeads}">


<c:choose>
<c:when test="${incomeminorheadlistHeads.minorHeadName eq allSubHeads.accType  and allSubHeads.subHeadId eq allSubHeadsJournalEntries.subHeadId }">- subhead name and accno

<c:set var="incometotals" value="${incometotals+allSubHeadsJournalEntries.rate }"/>

<tr><td>  ${allSubHeads.accCode },${allSubHeads.accNo}  </td>
<td>${allSubHeadsJournalEntries.rate }</td>
<td><%=credit1 %></td>
</tr>
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose>
</c:forEach>
</c:forEach>
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose>


 </c:forEach>

</c:forEach>

-----------------------Income Ends---------------------------------------------
-----------------------Expenditure Starts---------------------------------------------
 <c:set var="expensetotals" value="${0}"/>

<c:set var="username" value="Expenditure"/>
 <c:forEach var="expendmajhdlist" items="${expendmajhdlist}">
  <c:if test="${username eq 'Expenditure'}">
<tr><td style="text-align:center"><b><c:out value="${username}"/></b></td>
<td></td><!-- incometotals,expensetotals,assetstotals,liabtotals -->
<td></td>
</tr>
</c:if>
<c:remove var="username"/>
<td><b>${expendmajhdlist.majorHeadName},${expendmajhdlist.accNo}</b></td>- majorhead name and accno
<td><%=debit1 %></td>
<td><%=credit1 %></td>
</tr>
<c:forEach var="ExpensesminorheadlistHeads" items="${ ExpensesminorheadlistHeads}">
<c:choose>
<c:when test="${expendmajhdlist.majorHeadName eq ExpensesminorheadlistHeads.type }">-comparing  majorhead names in both majorhead and minorhead
<tr><td><b><I>${ExpensesminorheadlistHeads.minorHeadName},${ExpensesminorheadlistHeads.accNo}</I></b></td>- minorhead name and accno
<td><%=debit1 %></td>
<td><%=credit1 %></td>
</tr>
<c:forEach var="allSubHeadsJournalEntries" items="${allSubHeadsJournalEntries}">
<c:forEach var="allSubHeads" items="${allSubHeads}">


<c:choose>
<c:when test="${ExpensesminorheadlistHeads.minorHeadName eq allSubHeads.accType  and allSubHeads.subHeadId eq allSubHeadsJournalEntries.subHeadId }">- subhead name and accno

<c:set var="expensetotals" value="${expensetotals+allSubHeadsJournalEntries.rate }"/>

<tr><td>  ${allSubHeads.accCode },${allSubHeads.accNo}  </td>
<td>${allSubHeadsJournalEntries.rate }</td>
<td><%=credit1 %></td>
</tr>
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose>
</c:forEach>
</c:forEach>
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose>


 </c:forEach>

</c:forEach>


------------------------------------------Expenditure Ending-----------------------------------
 ------------------------------------------Assets Starts Ending-----------------------------------
  <c:set var="assetstotals" value="${0}"/>
 
  <c:set var="username" value="Assets"/>
 <c:forEach var="assetsmajhdlist" items="${assetsmajhdlist}">

  <c:if test="${username eq 'Assets'}">
<tr><td style="text-align:center"><b><c:out value="${username}"/></b></td>
<td></td>
<td></td>
</tr>
</c:if>
<c:remove var="username"/>
<td><b>${assetsmajhdlist.majorHeadName},${assetsmajhdlist.accNo}</b></td>
<td><%=debit1%></td>
<td><%=credit1 %></td>
</tr>
<c:forEach var="AssetsminorheadlistHeads" items="${AssetsminorheadlistHeads}">

<c:choose>
<c:when test="${assetsmajhdlist.majorHeadName eq AssetsminorheadlistHeads.type }"><!-- -comparing  majorhead names in both majorhead and minorhead -->
<tr><td><b><I>${AssetsminorheadlistHeads.minorHeadName},${AssetsminorheadlistHeads.accNo}</I></b></td><td>0.0</td><td>0.0</td></tr>-<!--  minorhead name and accno -->

<c:forEach var="assetsBanks" items="${assetsBanks}" >
<c:choose>
<c:when test="${AssetsminorheadlistHeads.accNo eq 101001 }">
<tr>
<td><c:out value="${assetsBanks.typeOfBank }"/></td>
<td><c:out value="${assetsBanks.bankBal }"/> </td>
<td><%=credit1 %></td>
</tr>
</c:when>
<c:otherwise>
<tr></tr>
</c:otherwise>
</c:choose>
</c:forEach>
<c:forEach var="allSubHeadsJournalEntries" items="${allSubHeadsJournalEntries}">
<c:forEach var="allSubHeads" items="${allSubHeads}">
<c:choose>
<c:when test="${AssetsminorheadlistHeads.minorHeadName eq allSubHeads.accType and allSubHeads.subHeadId eq allSubHeadsJournalEntries.subHeadId}">- subhead name and accno

<c:set var="assetstotals" value="${assetstotals+allSubHeadsJournalEntries.rate }"/>

<tr><td>  ${allSubHeads.accCode },${allSubHeads.accNo}  </td>
<td>${allSubHeadsJournalEntries.rate}</td>
<td><%=credit1 %></td>
</tr>
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose>
</c:forEach>
</c:forEach>



</c:when>
<c:otherwise>
<tr></tr>
</c:otherwise>

</c:choose>

 </c:forEach>

</c:forEach>
 
  ------------------------------------------Assets Starts Ending-----------------------------------
  -----------------------Liability Start-----------------------
   <c:set var="liabtotals" value="${0}"/>
  
 
  <c:set var="username" value="Liability"/>
 <c:forEach var="liabilmajhdlist" items="${liabilmajhdlist}">

  <c:if test="${username eq 'Liability'}">
<tr><td style="text-align:center"><b><c:out value="${username}"/></b></td>
<td></td>
<td></td>
</tr>
</c:if>
<c:remove var="username"/>
<td><b>${liabilmajhdlist.majorHeadName},${liabilmajhdlist.accNo}</b></td>
<td><%=debit1%></td>
<td><%=credit1 %></td>
</tr>
<c:forEach var="LiabilitiesminorheadlistHeads" items="${LiabilitiesminorheadlistHeads}">

<c:choose>
<c:when test="${liabilmajhdlist.majorHeadName eq LiabilitiesminorheadlistHeads.type }"><!-- -comparing  majorhead names in both majorhead and minorhead -->
<tr><td><b><I>${LiabilitiesminorheadlistHeads.minorHeadName},${LiabilitiesminorheadlistHeads.accNo}</I></b></td><td>0.0</td><td>0.0</td></tr>-<!--  minorhead name and accno -->

<c:forEach var="liabBanks" items="${liabBanks}" >
<c:choose>
<c:when test="${LiabilitiesminorheadlistHeads.accNo eq 201001 }">
<tr>
<td><c:out value="${liabBanks.typeOfBank }"/></td>

<td><%=credit1 %></td>
<td><c:out value="${liabBanks.bankBal }"/> </td>
</tr>
</c:when>
<c:otherwise>
<tr></tr>
</c:otherwise>
</c:choose>
</c:forEach>
<c:forEach var="allSubHeadsJournalEntries" items="${allSubHeadsJournalEntries}">
<c:forEach var="allSubHeads" items="${allSubHeads}">
<c:choose>
<c:when test="${LiabilitiesminorheadlistHeads.minorHeadName eq allSubHeads.accType and allSubHeads.subHeadId eq allSubHeadsJournalEntries.subHeadId}">- subhead name and accno

<c:set var="liabtotals" value="${liabtotals+allSubHeadsJournalEntries.rate }"/>


<tr><td>  ${allSubHeads.accCode },${allSubHeads.accNo}  </td>
<td><%=debit1 %></td>
<td>${allSubHeadsJournalEntries.rate}</td>
</tr>
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose>
</c:forEach>
</c:forEach>



</c:when>
<c:otherwise>
<tr></tr>
</c:otherwise>

</c:choose>

 </c:forEach>

</c:forEach>
 
  
  
  -----------------------Liability ENDS-----------------------
 
   -----------------Liability Ends-------------------------->
 <c:set var="total" value="${0}"/>
 <c:forEach var="liabilmajhdlist" items="${liabilmajhdlist}">
<c:set var="total" value="${total+1 }"/>
<c:if test="${total eq 1}">
<tr>
<td><b><c:out value="Total(Rupees)"/></b></td>
<td><b><c:out value="${debitTotal+incometotals+assetstotals}"/></b></td><!-- incometotals,expensetotals,assetstotals,liabtotals -->
<td><b><c:out value="${liabtotals+creditTotal+expensetotals}"/></b></td>
</tr>
</c:if>

  </c:forEach>

  </tbody>
  </table>

  	
<%}else{
	response.sendRedirect("index.jsp");
} %>
</body>
</html> --%>