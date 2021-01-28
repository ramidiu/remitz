<%-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="../css/popup.css" rel="stylesheet" type="text/css" />
<!--Date picker script  -->
<link rel="stylesheet" href="themes/ui-lightness/jquery.ui.all.css" />
<script src="../ui/jquery.ui.core.js"></script>
<script src="../ui/jquery.ui.datepicker.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"/>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script>
$(document).ready(function(){
		
	$("#frombank").keyup(function(){
		   var data1=$("#frombank").val();
		   var banktype="credit";
		  /* $.post('searchBanks.jsp',{q:data1,filterby:banktype},function(data) */
			$.post('searchNormalAndLoanBank1.jsp',{q:data1},function(data)
		  {
			 var response = data.trim().split("\n");
			 var bankNames=new Array();
			 var doctorIds=new Array();
			  var arr = [];
			 for(var i=0;i<response.length;i++){
				 var d=response[i].split(",");
				 doctorIds.push(d[0]);
				 bankNames.push(d[0] +" "+ d[1]);
				 arr.push({
					 label: d[0]+" "+d[1],
				        amount:d[2],
			        sortable: true,
				        resizeable: true
				    });
			 }
			var availableTags=data.trim().split("\n");
			var availableIds=data.trim().split("\n");
			availableTags=arr;
			 $( "#frombank" ).autocomplete({
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
						$('#frombankamount').val(ui.item.amount);
		
						}	
			 }); 
				});
	});
	$("#tobank").keyup(function(){
		   var data1=$("#tobank").val();
		 /*  $.post('searchBanks.jsp',{q:data1},function(data) */
		   $.post('searchNormalAndLoanBank1.jsp',{q:data1},function(data)		 
		  {
			 var response = data.trim().split("\n");
			 var bankNames=new Array();
			 var doctorIds=new Array();
			  var arr = [];
			 for(var i=0;i<response.length;i++){
				 var d=response[i].split(",");
				 doctorIds.push(d[0]);
				 bankNames.push(d[0] +" "+ d[1]);
				 arr.push({
					 label: d[0]+" "+d[1],
				        amount:d[2],
				   	 banktype:d[4],
			        sortable: true,
				        resizeable: true
				    });
			 }
			var availableTags=data.trim().split("\n");
			var availableIds=data.trim().split("\n");
			availableTags=bankNames;
			 $( "#tobank" ).autocomplete({
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
					$("#tobanktype").val(ui.item.banktype);
									}	 
			 }); 
				});
	});
	/* if($("#contraid").val()!=""){
		 newwindow1=window.open('adminPannel.jsp?page=contraVocherPrint&CId='+$("#contraid").val(),'BillImageUpload','height=300,width=800,menubar=yes,status=yes,scrollbars=yes');
	} */
	});

</script>
<script>
 function validate(){
	var amnt=0;
	var totalbankamount=Number($("#frombankamount").val());
	var transferamnt=Number($("#amount").val());
	if (transferamnt <= 0)	{
		$("#amount").focus();
		return false;
	}
	/* alert("toatlbankAmount..."+totalbankamount);
		if(transferamnt>totalbankamount){
			$("#amount").val("0");
			alert("Sorry,Amount in Bank is "+totalbankamount);
			return false;
		
	} */
} 
</script>
<script>

function datepickerchange()
{
	
	var finYear=$("#finYear").val();
	var yr = finYear.split('-');
	var startDate = yr[0]+",04,01";
	var endDate = parseInt(yr[0])+1+",03,31";
	$('#date').datepicker('option', 'minDate', new Date(startDate));
	$('#date').datepicker('option', 'maxDate', new Date(endDate));
}

$(document).ready(function(){
	datepickerchange();
	
}); 
</script>
</head>
<body>
<%if(session.getAttribute("adminId")!=null){ 
	/* String contraId="";
	if(request.getParameter("cid")!=null){
	contraId=request.getParameter("cid");
	} */
%>
<input type="hidden" name="contraid" id="contraid" value="<%=contraId%>"> 
<div>
<div class="vendor-page">
<div class="vendor-box">
<style>
.yourID.fixed {
    position: fixed;
    top: 0;
    left: 0px;
    z-index: 1;
    width:96%;margin:0 2%;
    background:#d0e3fb;
}

</style>
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>-->
<script>
$(document).ready(function () {  
  var top = $('.yourID').offset().top - parseFloat($('.yourID').css('marginTop').replace(/auto/, 100));
  $(window).scroll(function (event) {
    // what the y position of the scroll is
    var y = $(this).scrollTop();

    // whether that's below the form
    if (y >= top) {
      // if so, ad the fixed class
      $('.yourID').addClass('fixed');
	      
    } else {
      // otherwise remove it 
      $('.yourID').removeClass('fixed');
	        
    }
  });
});
</script>
<table width="100%" cellpadding="0" cellspacing="0" id="tblExport"  >
<tr><td colspan="4" height="10"></td> </tr>
	<tr><td colspan="4" align="center" style="font-weight: bold;font-size: 19px;"> **ASHTALAKSHMI DEVALAYAM**</td></tr>
						<tr><td colspan="4" align="center" style="font-size: 14px;">(Under Kanchi Kamakoti Peetam)</td></tr>
						<tr><td colspan="4" align="center">Vasavi Colony,Hyderabad,TS-500 102,Ph:91-40-23341681,91-40-23346081</td></tr>
						<tr><td colspan="4" align="center" style="font-weight: bold;font-size: 20px;">Contra Bank Entry FORM </td></tr>
</table>
<div class="vender-details">
<%String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); %>
<form  method="post" action="<%=request.getContextPath()%>/ContraBankInsertCtrl" onsubmit="return validate();">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>Select Fin Year</td>
<td>Department</td>
<td>Deposit Date</td>
<td>From Bank*</td>
<td>To Bank*</td>
</tr>
<tr>
<td><select name="finYear" id="finYear"  Onchange="datepickerchange();">
						<option value="2021-22" name="year" <%if(request.getParameter("finYear") != null && request.getParameter("finYear").equals("2021-22")) {%> selected="selected"<%} %>>2021-2022</option>
					<option value="2020-21" name="year" <%if(request.getParameter("finYear") != null && request.getParameter("finYear").equals("2020-21")) {%> selected="selected"<%} %>>2020-2021</option>
					<option value="2019-20" name="year" <%if(request.getParameter("finYear") != null && request.getParameter("finYear").equals("2019-20")) {%> selected="selected"<%} %>>2019-2020</option>
					<option value="2018-19" name="year" <%if(request.getParameter("finYear") != null && request.getParameter("finYear").equals("2018-19")) {%> selected="selected"<%} %>>2018-2019</option>
					<option value="2017-18" name="year" <%if(request.getParameter("finYear") != null && request.getParameter("finYear").equals("2017-18")) {%> selected="selected"<%} %>>2017-2018</option>
					<option value="2016-17" name="year" <%if(request.getParameter("finYear") != null && request.getParameter("finYear").equals("2016-17")) {%> selected="selected"<%} %>>2016-2017</option>
	</select>
</td>
<td>
<%
HeadOfAccountsService hService = new HeadOfAccountsServiceImpl();
List<HeadOfAccounts> hoaList = hService.getHeadOfAccountsList();
if (hoaList != null)	{%>
	<select name="hoid" id="hoid">
	<%for (int i = 0 ; i < hoaList.size() ; i++)	{%>
		<option value="<%=hoaList.get(i).getHead_account_id() %>"><%=hoaList.get(i).getName() %></option>
	<%}%>
	</select>
<%}%>
</td>
<td>
<input type="hidden" name="frombankamount" id="frombankamount" value="">
<input type="hidden" name="tobanktype" id="tobanktype" value=""/>
<input type="text" name="date" id="date" value="<%=currentDate %>" readonly/></td>
<td><input type="text" name="frombank" id="frombank" value="" placeHolder="Find a bank here" required style="height: 22px;"/></td>
<td><input type="text" name="tobank" id="tobank" value="" placeHolder="Find a bank here" required style="height: 22px;"/>
<input type="hidden" name="category" id="category" value="deposit" /></td>
</tr>
<tr>
<td>Amount*</td>
<td>Reference</td>
</tr>
<tr>
<td><input type="text" name="amount" id="amount" value="0" onKeyPress="return numbersonly(this, event,true);" /></td>
<td><input type="text" name="extra1" id="extra1" value=""></td>
</tr>
<tr>
<td colspan="2"><textarea rows="1" cols="4" name="Narration" id="Narration" required placeholder="Write your narration here"></textarea></td>
</tr>
<tr>
<td align="right" colspan="2"><input type="submit" value="Transfer" class="click" style="border:none;"/></td>
</tr>
</table>
</form>
</div>

</div>
</div>
<div class="vendor-list">

<div class="clear"></div>
<!-- <div class="arrow-down"><img src="../images/Arrow-down.png"></div>

<div class="icons">
<span><img src="../images/printer.png" style="margin:0 20px 0 0" title="print"/></span>
<span><img src="../images/excel.png" style="margin:0 20px 0 0" title="export to excel"/></span>
<span>
</span></div> -->
<div class="clear"></div>
<div class="list-details">
<%BankCalculations BNKCAL=new BankCalculations();
BankBalanceService BBAL_L=new BankBalanceServiceImpl();
DecimalFormat formatter = new DecimalFormat("#,###.00");
BankDetailsService BNK_CL = new BankDetailsServiceImpl();

List<BankDetails> BNK_List=BNK_CL.getActiveBankDetails();
HeadOfAccountsService HOA_CL = new HeadOfAccountsServiceImpl();
Map<String, HeadOfAccounts> headOfAccountsMap = HOA_CL.getHeadOfAccountsMap();

if(BNK_List.size()>0){%>
<table width="100%" cellpadding="0" cellspacing="0" >
<tr><td colspan="5"><table width="100%" cellpadding="0" cellspacing="0" class="yourID">
<tr>
<!-- <td class="bg" width="3%"><input type="checkbox"></td> -->
<td class="bg" width="10%" align="center">S.No.</td>
<td class="bg" width="18%">Bank Name</td>
<td class="bg" width="12%">Bank Branch</td>
<td class="bg" width="30%">Account Holder Name</td>
<td class="bg" width="20%">Total Amount</td>
</tr>
</table></td></tr>
<%
DateFormat dateFormat2= new SimpleDateFormat("yyyy-MM-dd");
TimeZone tz = TimeZone.getTimeZone("IST");
dateFormat2.setTimeZone(tz);

Calendar c2 = Calendar.getInstance(); 
String currentDateNew=(dateFormat2.format(c2.getTime())).toString();
String monthInString=currentDateNew.substring(5, 7);
int month = Integer.parseInt(monthInString);
String yearInString=currentDateNew.substring(0, 4);
int year = Integer.parseInt(yearInString);
String finStartYr = "";

if(month >= 4)
{
		finStartYr = Integer.toString(year);
}
else
{
	 int finStartYrInInt = year - 1;
	 finStartYr = Integer.toString(finStartYrInInt);
}
String finStartAndEndYr = "";

String tempInString = finStartYr.substring(2, 4);
int tempInInt = Integer.parseInt(tempInString)+1;
finStartAndEndYr = finStartYr+"-"+tempInInt;


for(int i=0; i < BNK_List.size(); i++ ){
	BankDetails BNK= BNK_List.get(i); %>
<tr>
<!-- <td><input type="checkbox"></td> -->
<td  width="10%" align="center"><%=BNK.getBank_id()%></td>
<td width="20%"><ul>
<li><span><a href="adminPannel.jsp?page=bankDetails&id=<%=BNK.getBank_id()%>"><%=BNK.getBank_name()%>  </a></span><br />
<span><%=headOfAccountsMap.get(BNK.getHeadAccountId()).getName() %></span></li>
</ul></td>
<td width="12%"><%=BNK.getBank_branch()%></td>
<td width="30%"><%=BNK.getAccount_holder_name()%></td>
<%double bankopeningbal = 0.0;

 if(BNK.getExtra2().equals("debit")){
 	bankopeningbal=BNKCAL.getBankOpeningBalance(BNK.getBank_id(),finStartYr+"-04-01 00:00:01",currentDateNew+" 23:59:59","bank","");
	double finOpeningBalNew = BBAL_L.getBankOpeningBal(BNK.getBank_id(),"bank",finStartAndEndYr);
	bankopeningbal += finOpeningBalNew;
 }	else if(BNK.getExtra2().equals("credit")){
	 bankopeningbal=BNKCAL.getCreditBankOpeningBalance(BNK.getBank_id(),finStartYr+"-04-01 00:00:01",currentDateNew+" 23:59:59","");
		double finOpeningBalNew = BBAL_L.getBankOpeningBal(BNK.getBank_id(),"bank",finStartAndEndYr);
		bankopeningbal += finOpeningBalNew;
 }
 //System.out.println("opening balance.."+formatter.format(bankopeningbal));
 %>	
<td width="20%"><%=BNK.gettotal_amount()%></td>
<td><%=formatter.format(bankopeningbal)%></td>
</tr>

<%} %>
</table>
<%}else{%>
<div align="center"><h1>No Banks Added Yet</h1></div>
<%}%>


</div>
</div>
</div>
<%}else{
	response.sendRedirect("index.jsp");
} %>
</body>
</html> --%>