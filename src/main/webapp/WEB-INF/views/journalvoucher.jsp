<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <meta charset="ISO-8859-1">
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 
 
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<title></title>
	<style type="text/css">


.hide {
  display: none;
}
.hide1{
	display: none;
}
.hide2{
	display: none;
}
.hide3{
	display: none;
}
table{
	border-color: 1px solid grey;
}







	</style> <script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<!-- <script  src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 -->  <script type="text/javascript">
  function show1(){
document.getElementById('div3').style.display ='block';
}
function show5(){
document.getElementById('div1').style.display ='none';
}
function show2(){
document.getElementById('div1').style.display = 'block';
}
function show6(){
document.getElementById('div3').style.display = 'none';
}
function show7(){
	document.getElementById('div8').style.display = 'block';
	}

</script>
 <script type="text/javascript">
  function show3(){
document.getElementById('div1').style.display ='none';
}
 function show3(){
document.getElementById('div2').style.display ='none';
}
function show4(){
document.getElementById('div2').style.display = 'block';
}

</script>

<script>
 $( function() {
   $( "#datepicker" ).datepicker();
 } );
  </script>
  <script>
  $(document).ready(function() {
	  var jvtype = $('input[type=radio][name=jvtype]:checked').val();
	  if(this.value == "withoutbank"){
			document.getElementById("debit").innerHTML = "DEBIT AMOUNT(-)";
			document.getElementById("credit").innerHTML = "CREDIT AMOUNT(+)";
			$('#div1').hide();
			$('#div2').show();
	 /*  if (jvtype === "withoutbank")	{
			$('#div1').hide();
			$('#div2').show();
			document.getElementById("debit").innerHTML = "DEBIT AMOUNT(-)";
			document.getElementById("credit").innerHTML = "CREDIT AMOUNT(+)";
			$(".bankclass").hide();
			$(".loanbankclass").hide();
			$(".vendorclass").hide();
			$('#bbl').hide();
		}
	 */
  });  
  </script>
 <script>

function datepickerchange()
{
	var finYear=$("#finYear").val();
	alert('finYear==='+finYear);
	var yr = finYear.split('-');
	var startDate = yr[0]+",04,01";
	var endDate = parseInt(yr[0])+1+",03,31";
	
	$('#date').datepicker('option', 'minDate', new Date(startDate));
	$('#date').datepicker('option', 'maxDate', new Date(endDate));
	/* $('#toDate').datepicker('option', 'minDate', new Date(startDate));
	$('#toDate').datepicker('option', 'maxDate', new Date(endDate)); */
}

 </script>
<script></script>
<script>
function subheadsearch(){
	alert('vsd');
	 $.ajax({
			url : '/getsubheadsearch',
			type: 'GET',
         datatype:'json',
			success : function(response){
					var res=JSON.stringify(response, undefined, '\t');
					 $.each($.parseJSON(res),function(idx,obj){
						
						 //alert("testtttt"+obj.accNo);
					 })
					},
		
			error : function(xhr, status, error) {
				alert("error::::"+error);
			}
		 });
	/*  $( "#bankname" ).autocomplete({
		    source: obj.accNo
		  });
 */
	alert('sgf');
}
</script>
</head>

<body>


<br>
<%-- 
 <%@include file="backendheader.jsp" %>  

	 --%>
	 <div class="container">

	<div class="row">
		<div class="col-md-3">
			<label>Year</label><br>
			<select name="finYear" id="finYear"  Onchange="datepickerchange();">
					<option value="2020-21" name="year" <%if(request.getParameter("finYear") != null && request.getParameter("finYear").equals("2020-21")) {%> selected="selected"<%} %>>2020-2021</option>
 					<option value="2019-20" name="year" <%if(request.getParameter("finYear") != null && request.getParameter("finYear").equals("2019-20")) {%> selected="selected"<%} %>>2019-2020</option>
					<option value="2018-19" name="year" <%if(request.getParameter("finYear") != null && request.getParameter("finYear").equals("2018-19")) {%> selected="selected"<%} %>>2018-2019</option>
					</select>

</div>
<div class="col-md-3">

	<p>Date: <input type="text" id="datepicker" size="30"></p>
</div>
</div><br>
<div class="row">
	<div class="col-md-3">
	
		<label>Narration</label><br>
		<input type="hidden" name="voucherRefNo" id="billnumb" value="1"/>
		<textarea rows="3" cols="35" name="narration" id="narration">Write your narration</textarea>
	</div>
	<div class="col-md-5" style="margin-top: 50px">
		<div class="form-inline">
		<input type="radio" name="jvtype" id="jvtype" value="withbank" name="tab" value="igotnone" onclick="show2();show3();show6();">
		<label for="radio1" >With Bank/Cash</label>&nbsp&nbsp

		<input type="radio" name="jvtype" id="jvtype" value="withloanbank" onclick="show2();show3();show6();">
		<label for="radio2" >With loan Bank</label>&nbsp&nbsp
<input type="radio" name="jvtype" id="jvtype" value="withoutbank" onclick="show7();">
		<label for="radio2" >With out Bank/Cash</label>&nbsp&nbsp
<!-- 
<input type="radio" name="jvtype" id="jvtype" value="withoutbank" onclick="show7();" /><b>With out Bank/Cash</b> 
 -->
	<!-- 	<input type="radio" name="jvtype" id="jvtype" >show1();show5(); -radio1,2,3-><!-- onclick="subheadsearch();"
		<label for="radio3">With Out Bank/Cash</label>
 -->
	</div></div></div><br>
	<div id="div1" class="hide">
	<div class="row">
<div class="col-md-3">
<p>Bank Name:
		<input type="text" size="30" placeholder="Enter Bank name"></p>
	</div>

<div class="col-md-5">
	<h6>Select type</h6>
	<input type="radio"  id="debit" name="debit" onclick="show3()">
	<label for="radio4" style="color:red"> debit(+)</label>

	<input type="radio"  id="credit" name="credit" checked="checked" onclick="show4()">
	<label for="radio5" style="color:red"> credit(-)</label>
</div></div><div class="set-form">
	<h6>Current Bal:</h6><br><br>
      <table id="myTable2" class="table ">
        <tr>

          <th>SUB HEAD</th>
          <th>DEBIT AMOUNT(+)</th>
          <th>CREADIT AMOUNT(-)</th>
        </tr>
        <tr>

          <td>
            <input type="text" name="sub-head" placeholder="sub-head" th:field="${sub-headpsySet.sub-head}" id="sub-head"   style="resize: none; width: 100%;"></input>
          </td>
          <td>
            <input type="text" name="psy" placeholder="0.00" th:field="${sub-headpsySet.psy}" id="psy"
            style="resize: none; width: 50%;"  ></input>
          </td>
          <td><input type="text" name="psy" placeholder ="0.00" th: field = "${sub-headpsySet.psy}" id="psy" style="resize:none;width: 50%;" ></input></td >
        </tr>
      </table>
      <div class="set-form">
        <input  type="button" id="more_field" onclick="add_fie();" value="Add" class="btn btn-info" />
      </div><br>
         <div class="set-form">
        <input  type="button" id="more_field"  value="sumbit" class="btn btn-info" />

        <input  type="button" id="more_field"  value="reset" class="btn btn-info" />
      </div>
      </div>



</div>
	<!-- <div id="div2" class="hide2"> -->
<!-- <div class="row">

	<div class="col-md-3">

		</div></div></div>
 -->		<!-- <div id="div4" class="hide3"> -->
		<div class="hide" id="div8" >
		
		<form action="jvls"  method="post" onsubmit="return validateForm2();">
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
  </div>


</body>
<script>
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
	alert("validate");
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
	if (narration.trim() === "")	{
		$('#narration').css("border", "2px solid red");
		document.getElementById('narration').focus();
		return false;
	}
	document.getElementById('finYr').value = document.getElementById('finYear').value;
	document.getElementById('dt').value = document.getElementById('date').value;
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

</script>
</html>
