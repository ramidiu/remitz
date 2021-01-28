<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>COA</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
 
 <script src="jquery-3.4.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Rubik:300,300i,400,400i,500,500i,700,700i,900,900i' type='text/css'>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/shortcut.css" />

<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/vendor/font-awesome/css/all.min.css" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/vendor/bootstrap-select/css/bootstrap-select.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/vendor/currency-flags/css/currency-flags.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/vendor/owl.carousel/assets/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/stylesheet1.css" />
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style1.css" />  --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/style3.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontend/bootstrap.css" />

<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style3.css" /> --%>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"
	integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk="
	crossorigin="anonymous"></script>

<style>

  input[type=text]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: none;
  background-color:#e4f2ed;
  color: black;
  border-radius:5px;
  outline:none;
}
#sel1{
width: 100%;

box-sizing: border-box;
border: none;
background-color:#e4f2ed;
color: black;
border-radius:5px;
outline:none;
}
#button{
background:#d44c53;
color:white;
margin-top:15px;
border:none;
margin-right:10px;
border-radius:5px;
outline:none;
padding:13px;
}
.th,td{
padding-right:30px;
padding-left:10px;
padding-bottom:10px;
padding-top:10px;
border:1px solid grey;

}
#th{width:30%;}
#tr{
width:20%
}
th{
background:#e4f2ed;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("p").click(function(){
    alert("The paragraph was clicked.");
  });
});
</script>

<script>
	$(function() {
		$("#datepicker").datepicker({
			changeMonth : true,
			changeYear : true
		});
		$("#datepicker1").datepicker({
			changeMonth : true,
			changeYear : true
		});
		$("#datepicker2").datepicker({
			changeMonth : true,
			changeYear : true
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
						$('#update').hide();
						var d = new Date();
						var month = d.getMonth() + 1;
						var day = d.getDate();
						var output = d.getFullYear() + '/'
								+ (month < 10 ? '0' : '') + month + '/'
								+ (day < 10 ? '0' : '') + day;
						$('#date2').val(output);
						$('#reset').click(function() {
                        $('#parent').empty();
						$('#parent').append('<option value="">--select--</option>');
											$('#nextLevel').val('');
											$('#newAcc').val('');
											$('#accDesc').val('');
											$('#accCode').val('');
											/* $('#zako').prop('checked', false);
											$('#needApproval').prop('checked',
													false); */
										});

						$('#close')
								.click(
										function() {
											$('#parent').empty();
											$('#parent')
													.append(
															'<option value="">--select--</option>');
											$('#nextLevel').val('');
											$('#newAcc').val('');
											$('#accDesc').val('');
											$('#accCode').val('');
											/* $('#zako').prop('checked', false);
											$('#needApproval').prop('checked',
													false);
 */										});

						$('#save').click(
										function() {
											
											var nature = $('#nature').val();             
											var type = $(
													"input[name='optradio']:checked")
													.val();
											
											var parent = $('#parent').val();
											
											var nextLevel = $('#nextLevel')
													.val();
											var newAcc = $('#newAcc').val();
                             				var date2 = $('#date2').val();
											var accDesc = $('#accDesc').val();
										
											var accCode = $('#accCode').val();


											if (nature == '') {
												alert('please select nature');
												$('#nature').focus().css('outline','2px solid red');
												return false;
											}
											if (type == '') {
												$('#type').focus().css('outline','2px solid red');
												return false;
											}
											if (parent == '') {
												alert('please select parent type');
												
												$('#parent').focus().css('outline','2px solid red');
												return false;
											}
											if (nextLevel == '') {
												$('#nextLevel').focus().css('outline','2px solid red');
												return false;
											}
											var testVal = '';
											if (newAcc == '') {
												
												$('#newAcc').focus().css('outline','2px solid red');
												return false;
											} else {
												var url = '';
												if (nextLevel == '3') {
													url = 'checkminorheadid';
												}
												if (nextLevel == '4') {
													url = 'checksubheadid';
												}
												$
														.ajax({
															url : url,
															data : "id="+ newAcc,
															type : "POST",
															async : false,
															success : function(
																	response) {
																if ($.trim(response) == 'exist') {
																	$('#newAcc').focus().css('outline','solid red 2px');
																	alert("New Account already Exist");
																	testVal = 1;
																	return false;
																}
															}
														});
											}
											if (testVal != "") {
												return false;
											}

											if (date2 == '') {
													$('#date2').focus().css(
														'outline',
														'2px solid red');
												return false;
											}

											if (accDesc == '') {
												alert('please enter accDesc');
												$('#accDesc').focus().css('outline','2px solid red');
												return false;
											}
											if (accCode == '') {
												alert('please enter accCode');
												$('#accCode').focus().css('outline','2px solid red');
												return false;
											}
											$('#insert').attr("action",
													"insert");
											$('#insert').submit();
										});
						$('#update')
								.click(
										function() {
alert("swdfc")
											
											var nature = $('#nature').val();             
											var type = $(
													"input[name='optradio']:checked")
													.val();
											
											//var parent = $('#parent').val();
											
											var nextLevel = $('#nextLevel')
													.val();
											var newAcc = $('#newAcc').val();
                             				var date2 = $('#date2').val();
											var accDesc = $('#accDesc').val();
										
											var accCode = $('#accCode').val();


											if (nature == '') {
												alert('please select nature');
												$('#nature').focus().css('outline','2px solid red');
												return false;
											}
											if (type == '') {
												$('#type').focus().css('outline','2px solid red');
												return false;
											}
										/* 	if (parent == '') {
												alert('please select parent type');
												
												$('#parent').focus().css('outline','2px solid red');
												return false;
											}
										 */	if (nextLevel == '') {
												$('#nextLevel').focus().css('outline','2px solid red');
												return false;
											}
											var testVal = '';
											if (newAcc == '') {
												
												$('#newAcc').focus().css('outline','2px solid red');
												return false;
											} else {
												var url = '';
												if (nextLevel == '3') {
													url = 'checkminorheadid';
												}
												if (nextLevel == '4') {
													url = 'checksubheadid';
												}
												$
														.ajax({
															url : url,
															data : "id="+ newAcc,
															type : "POST",
															async : false,
															success : function(
																	response) {
																if ($.trim(response) == 'exist') {
																	$('#newAcc').focus().css('outline','solid red 2px');
																	alert("New Account already Exist");
																	testVal = 1;
																	return false;
																}
															}
														});
											}
											if (testVal != "") {
												return false;
											}

											if (date2 == '') {
													$('#date2').focus().css(
														'outline',
														'2px solid red');
												return false;
											}

											if (accDesc == '') {
												alert('please enter accDesc');
												$('#accDesc').focus().css('outline','2px solid red');
												return false;
											}
											if (accCode == '') {
												alert('please enter accCode');
												$('#accCode').focus().css('outline','2px solid red');
												return false;
											}
											$('#insert').attr("action","update");
											$('#insert').submit();

										});

						$('#search')
								.click(
										function() {
											alert("svadvfs");
											$('#searchDiv').empty();
											$
													.ajax({
														url : 'getAllSubHeadsBasedOnAdminId',
														type : 'post',
														success : function(
																response) {
														
															var list = JSON
																	.stringify(
																			response,
																			undefined,
																			'\t');
															
															var op1 = '<table class="table table-bordered mt-30"><thead><tr class="bg-blue"><th>Acc No</th><th>Acc Name</th><th>Description</th><th>Group Description</th><th>Type</th><th>Update</th></tr></thead><tbody>';
															var op2 = '';
															var op3 = '</tbody></table>';
															$
																	.each(
																			$
																					.parseJSON(list),
																			function(
																					idx,
																					obj) {
																				
																				op2 = op2
																						+ '<tr class="bg-blue"><td>'
																						+ obj.accNo
																						+ '</td><td>'
																						+ obj.subHeadName
																						+ '</td><td>'
																						+ obj.accDesc
																						+ '</td><td>'
																						+ obj.nature
																						+ '</td><td>'
																						+ obj.type
																						+ '</td><td><a href="#"  onclick=setDetails2("'
																						+ obj.subHeadId
																						+ '","'
																						+ obj.accNo
																						+ '","'
																						 + obj.subHeadName
																							.replace(
																										/\s/g,
																										"&nbsp;")
																						+ '","'
																						+ obj.accDesc
																								.replace(
																										/\s/g,
																										"&nbsp;")
																						+ '","'
																						 
																								+ obj.level
																						+ '","'
																						+ obj.nature
																						+ '","'
																						+ obj.minorHead.accNo
																						+ '","'
																						+ obj.minorHead.minorHeadName
																						+ '","'
																						+ obj.minorHead.minorHeadId
																						+ '");>Edit</a></td></tr>';
																						
																			});

															$('#searchDiv')
																	.append(
																			op1
																					+ op2
																					+ op3);

														},
														error : function(xhr,
																error, status) {
															alert(xhr.responseText);
														}
													});
										});
					});
</script>
<script type="text/javascript">
	function validateHeads() {
		$('#natureId').val($('#nature').val());
		$('#getAllHeadsForm').attr('action', 'chartofaccounts');
		$('#getAllHeadsForm').attr('method', 'get');
		$('#getAllHeadsForm').submit();
	}
</script>


<script type="text/javascript">
	function validateLevel() {
		var value = $('#parent').val().split(',');
		alert('value===' + value);
		var id1=value[1];
		var id = value[2];
		//alert('id===' + id);
		var acno = value[0];
		//alert('acno===' + acno);
		var level = value[1];
	
		$('#nextLevel').val(Number(level) + 1);
		$('#tableDiv').empty();
		var op1 = '<table class="table table-bordered mt-30"><thead><tr class="bg-blue"><th>Account</th><th>Acc Name</th><th>Parent</th><th>Levels</th><th>Type</th><th>Group Desc</th><th>Update</th></tr></thead><tbody>';
		var op2 = '';
		var op3 = '</tbody></table>';
var res='';
var newAcc1='';
		if (level == '2') {
			//alert('level====1111' + level);
			var data = "majorHeadId=" + id;
	
			alert('data====' + data);
			$.ajax({
				url : "getMinorHeadBasedOnMajorHeadId",
				
				data : data,
				type : "post",
				success : function(response) {
					var newAcc = '0';

					minorHeadList = JSON.stringify(response, undefined, '\t');
					$.each($.parseJSON(minorHeadList), function(idx, obj) {
						//op2=op2+'<tr class="bg-blue"><td>'+obj.accNo+'</td><td>'+obj.minorHeadName+'</td><td>'+acno+'</td><td>'+obj.level+'</td><td>Detail</td><td>'+obj.majorHead.majorHeadNature+'</td><td><a href="#" onclick=setDetails("'+obj.minorHeadId+'","'+obj.accNo+'","'+obj.minorHeadName.replace(/\s/g,"&nbsp;")+'","'+obj.description.replace(/\s/g,"&nbsp;")+'","'+obj.level+'");>Edit</a></td></tr>';
						if (Number(obj.accNo > Number(newAcc))) {
							newAcc = obj.accNo;
						}
					});
					
					alert('res==='+res);
					if (newAcc == '') {
						newAcc = acno + '001';
						alert("acno----------"+acno);
					} else {
						
						
						
						if (newAcc > 0) {
							newAcc = parseInt(newAcc) + 1;
							alert("acno----------"+acno);
						} 
						else{
							newAcc1=Number(value[0])+'001';
							newAcc=parseInt(newAcc1);	
						}
						
					alert('newAcc'+newAcc+"============"+value[0]+"value[0]");
					}
					
					$('#newAcc').val(newAcc);

					//	$('#tableDiv').append(op1+op2+op3);
				},
				error : function(xhr, status, error) {
					alert("fail");
					alert(xhr.responseText);
				}
			});
		}


		if(level=='3'){
			var data="minorHeadId="+id;
			alert(data+"==data==");
			$.ajax({
				url : "getSubHeadBasedOnMinorHeadId",
				data : data,
				type : "post",
				success : function(response){
					var newAcc='';
					subHeadList = JSON.stringify(response, undefined, '\t');
					$.each($.parseJSON(subHeadList), function(idx, obj) {
					//op2=op2+'<tr><td>'+obj.accNo+'</td><td>'+obj.subHeadName+'</td><td>'+acno+'</td><td>'+obj.level+'</td><td>Detail</td><td>'+obj.majorHead.majorHeadNature+'</td><td><a href="#" onclick=setDetails("'+obj.subHeadId+'","'+obj.accNo+'","'+obj.subHeadName.replace(/\s/g,"&nbsp;")+'","'+obj.accDesc.replace(/\s/g,"&nbsp;")+'","'+obj.level+'");>Edit</a></td></tr>';
					newAcc=obj.accNo;
					});
					if(newAcc==''){
						newAcc=acno+'001';
						alert('==========accno====='+acno);
						alert('==========newacc====='+newAcc);
						
					}else{
						newAcc=Number(newAcc)+1;
					}
					$('#newAcc').val(newAcc);
			//$('#tableDiv').append(op1+op2+op3);
				},
				error : function(xhr,status,error){
					alert(xhr.responseText);
				}
			});
		}
		
		
	}
</script>
<script type="text/javascript">
	function setDetails(id, accNo, name, desc, level) {
		$('#save').hide();
		$('#search').hide();
		$('#nextLevel').val(level);
		$('#newAcc').val(accNo);
		$('#accDesc').val(desc);
		$('#accCode').val(name);
		$('#update').show();
		$('#headId').val(id);
	}
</script>
<script type="text/javascript">
	function setDetails2(id, accNo, name, desc, level, nature, parentId,
			parentName, id2) {

		$('#save').hide();
		$('#search').hide();
		$("#nature").find('option[value="' + nature + '"]').prop("selected",true);
		$("#parent").append(
				'<option value='+parentId+','+parentName+','+id2+'>' + parentId
						+ '-' + parentName + '</option>');
		$('#nextLevel').val(level);
		$('#newAcc').val(accNo);
		$('#accDesc').val(desc);
		$('#accCode').val(name);
		$('#update').show();
		$('#headId').val(id);
	}
</script>
<script type="text/javascript">
	function removeError(id) {
		$('#' + id).css('outline', '#B0C4DE');
	}
</script>

</head>
<body>
<p>Click on this paragraph.</p>

	<form id="getAllHeadsForm">
		<input type="hidden" id="natureId" name="natureId" value="">
	</form>

<%@include file="backendheader.jsp" %> 
<br><br><br><br><br>
    <div class="container">
    <div class="row">
    <form id="insert" method="post">
    <input type="hidden" value="" id="headId" name="headId" />
      <div class="col-md-4">
        <h6>Group</h6>
    <select class="form-control" id="nature"
							name="nature" onchange="validateHeads();"
							onclick="removeError('majorHeadNature');">
                            <option>    ---select----</option>      
							<option value="Liabilities" ${nature=='Liabilities'?'selected':''}>Liability</option>
							<option value="Assets" ${nature=='Assets'?'selected':''}>Assets</option>
							<option value="Revenue" ${nature=='Revenue'?'selected':''}>Revenue</option>
							<option value="Equity" ${nature=='Equity'?'selected':''}>Equity</option>
							<option value="Expenses" ${nature=='Expenses'?'selected':''}>Expenses</option>
    </select>
    </div>

    <div class="col-md-4">
      <h6>Registration</h6>
      <input type="text" name="date2" class="form-control" id="date2" value="" onkeyup="removeError('date2');">
      </div>
     
  </div><br>
  <div class="row">
    <div class="col-md-4">
      <h6>Parent</h6>
  <select class="form-control" id="parent"
							onchange="validateLevel()" name="parent"
							onkeyup="removeError('parent');">
							<option value="">--select--</option>
			<c:if test="${fn:length(majorHeadList) > 0}">
			<c:forEach var='mList' items="${majorHeadList}">
			<option value="${mList.accNo},${mList.level},${mList.majorHeadId }">${mList.accNo}-${mList.majorHeadName}</option>
								
			<c:if test="${fn:length(minorHeadList) > 0}">
          	<c:forEach var = 'minList' items="${minorHeadList}">
          	<c:if test="${(minList.majorHead.majorHeadId eq mList.majorHeadId) && (minList.createdBy eq adminId)}">
          	<option  value="${minList.accNo},${minList.level},${minList.minorHeadId }">${minList.accNo}-${minList.minorHeadName}</option>
				          	 	</c:if>
								</c:forEach>
								</c:if>
								</c:forEach>
							</c:if>
							</select></div>
  <div class="col-md-4">
    <h6>Level</h6>
    <input type="text"  class="form-control"
							id="nextLevel" value="3" name="nextLevel"
							onkeyup="removeError('nextLevel');">
    </div>
</div><br>
<div class="row">
  <div class="col-md-4">
      <h6>New Account no</h6>
      <input type="text" class="form-control" id="newAcc" value="" name="newAcc"
							onkeyup="removeError('newAcc');" placeholder="new account no:">
      </div>
        <div class="col-md-4">
      <h6>Account Description</h6>
      <input type="text" class="form-control" id="accDesc" name="accDesc"
							onkeyup="removeError('accDesc');"
							placeholder="Enter account description">
      </div>
        <div class="col-md-4">
      <h6>Account code</h6>
      <input type="text" class="form-control" id="accCode" name="accCode"
							onkeyup="removeError('accCode');"
							placeholder="Enter account code">
      </div>
<div>
<button type="button" id="save">save</button>
						<button type="button" id="search">search</button>
						<button type="button" id="update">update</button>
		</div>	
      </form>
     	<div class="clear"></div>
				<div id='tableDiv'></div>
				<div id="searchDiv"></div> 
</div>
</div>
   <br><br>
<!-- ghjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Journel Information</h4>
        </div>
        <div class="modal-body">
          <div class="col-md-4">
          <label class="checkbox-inline"><input type="checkbox" value="">Is Activ Wakii</label>
          </div>
          <div class="col-md-4">
          	<label class="checkbox-inline"><input type="checkbox" value="">Zako</label>
			<label class="checkbox-inline"><input type="checkbox" value="">Main</label>
          </div>
          <div class="col-md-4"></div>
          <div class="clear"></div>
          <div class="col-md-6 mt-30">
          	<label>Account No</label>
          	<input type="text" class="form-control">
          </div>
          <div class="col-md-6 mt-30">
          	<label>Level</label>
          		<input type="text" class="form-control">
          </div>
          <div class="clear"></div>
          <div class="col-md-6 mt-30">
          	<label>Parent</label>
          	<input type="text" class="form-control">
          </div>
          <div class="col-md-6 mt-30">
          	<label>Registration Date</label>
          		<input type="text" class="form-control" id="datepicker1">
          
          </div>
          <div class="clear"></div>
          <div class="col-md-6 mt-30">
          	<label>Group Desc</label>
          	<input type="text" class="form-control">
          </div>
           <div class="col-md-6 mt-30">
          	<label>Description</label>
          		<input type="text" class="form-control">
          </div>
          <div class="clear"></div>
          <div class="col-md-6 mt-30">
          	<label>Account Name</label>
          	<input type="text" class="form-control">
          </div>
          <div class="col-md-6 mt-30">
          	<label class="radio-inline"><input type="radio" name="optradio" checked>Detail</label>
<label class="radio-inline"><input type="radio" name="optradio">General</label>
          </div>
          <div class="clear"></div>
          <div class="col-md-12 mt-30"> 
          
          	<button type="button"  class="btn btn-blue btn-submit mt-20" >Submit</button>
          	 	<button type="button"  class="btn btn-blue btn-submit mt-20" >Reset</button>
          	 	 	<button type="button"  class="btn btn-blue btn-submit mt-20" >Close</button>
          </div>
        </div>
       
      </div>
      
    </div>
  </div>


  
</body>
</html>