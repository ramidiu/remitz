<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Chart Of Account</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"
	integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk="
	crossorigin="anonymous"></script>
<style>
.greenText {
	font-weight: bold;
	color: #2f5687;
}

.level5 {
	color: #f5425d;
}

.level2 {
	color: #000044;
}

.level6 {
	color: #000066;
}
</style>
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
	$(document)
			.ready(
					function() {
						$('#update').hide();
						var d = new Date();

						var month = d.getMonth() + 1;
						var day = d.getDate();

						var output = d.getFullYear() + '/'
								+ (month < 10 ? '0' : '') + month + '/'
								+ (day < 10 ? '0' : '') + day;

						$('#date2').val(output);

						$('#reset')
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

						$('#save')
								.click(
										function() {
											alert('save clllllllllll')
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
												$('#nature').focus().css(
														'outline',
														'2px solid red');
												return false;
											}
											if (type == '') {
												$('#type').focus().css(
														'outline',
														'2px solid red');
												return false;
											}
											if (parent == '') {
												$('#parent').focus().css(
														'outline',
														'2px solid red');
												return false;
											}
											if (nextLevel == '') {
												$('#nextLevel').focus().css(
														'outline',
														'2px solid red');
												return false;
											}
											var testVal = '';
											if (newAcc == '') {
												$('#newAcc').focus().css(
														'outline',
														'2px solid red');
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
															data : "id="
																	+ newAcc,
															type : "POST",
															async : false,
															success : function(
																	response) {
																if ($
																		.trim(response) == 'exist') {
																	$('#newAcc')
																			.focus()
																			.css(
																					'outline',
																					'solid red 2px');
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
												$('#accDesc').focus().css(
														'outline',
														'2px solid red');
												return false;
											}
											if (accCode == '') {
												$('#accCode').focus().css(
														'outline',
														'2px solid red');
												return false;
											}
											$('#insert').attr("action",
													"insert");
											$('#insert').submit();
										});
						$('#update')
								.click(
										function() {

											var nature = $('#nature').val();
											var type = $(
													"input[name='optradio']:checked")
													.val();
											var parent = $('#parent').val();
											var value = $('#parent').val()
													.split(',');
											var nextLevel = $('#nextLevel')
													.val();
											var newAcc = $('#newAcc').val();
											var date2 = $('#date2').val();
											var accDesc = $('#accDesc').val();
											var accCode = $('#accCode').val();

											if (nature == '') {
												$('#nature').focus().css(
														'outline',
														'2px solid red');
												return false;
											}
											if (type == '') {
												$('#type').focus().css(
														'outline',
														'2px solid red');
												return false;
											}
											if (parent == '') {
												$('#parent').focus().css(
														'outline',
														'2px solid red');
												return false;
											}
											if (nextLevel == '') {
												$('#nextLevel').focus().css(
														'outline',
														'2px solid red');
												return false;
											}
											var testVal = '';
											if (newAcc == '') {
												$('#newAcc').focus().css(
														'outline',
														'2px solid red');
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
															data : "id="
																	+ newAcc,
															type : "POST",
															async : false,
															success : function(
																	response) {
																if ($
																		.trim(response) == 'exist') {
																	$('#newAcc')
																			.focus()
																			.css(
																					'outline',
																					'solid red 2px');
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
												$('#accDesc').focus().css(
														'outline',
														'2px solid red');
												return false;
											}
											if (accCode == '') {
												$('#accCode').focus().css(
														'outline',
														'2px solid red');
												return false;
											}
											$('#insert').attr("action",
													"update");
											$('#insert').submit();

										});

						$('#search').click(
										function() {
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
<style>
.modal-content {
	height: 900px;
}
</style>
</head>
<body>
	<form id="getAllHeadsForm">
		<input type="hidden" id="natureId" name="natureId" value="">
	</form>


	<jsp:include page="${request.contextPath}/header"></jsp:include>
	<div class="chartaccounts mt-50">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12  pb-50 "
					style="display: block; width: 100%; padding: 0 0px; margin: 0 0px;">
					<h3 class="admin-heading mb-30">Charts Of Accounts</h3>
				</div>
				<input type="hidden" value="" id="subHeadList" />

				<form id="insert" method="post">
					<input type="hidden" value="" id="headId" name="headId" />
					<div class="col-md-4 mt-30">
						<label>Group</label> <select class="form-control" id="nature"
							name="nature" onchange="validateHeads();"
							onclick="removeError('majorHeadNature');">
							<option value="">--select--</option>
							<option value="Liabilities" ${nature=='Liabilities'?'selected':''}>Liability</option>
							<option value="Assets" ${nature=='Assets'?'selected':''}>Assets</option>
							<option value="Revenue" ${nature=='Revenue'?'selected':''}>Revenue</option>
							<option value="Equity" ${nature=='Equity'?'selected':''}>Equity</option>
							<option value="Expenses" ${nature=='Expenses'?'selected':''}>Expenses</option>
						</select>
					</div>
					<div class="col-md-4 mt-30">
						<label>Registration Date</label> 
						<input type="text" name="date2" class="form-control" id="date2" value="" onkeyup="removeError('date2');">
					</div>
					
					<div class="clear"></div>
					<div class="clear"></div>
					<div class="col-md-4 mt-30">
						<label>parent</label> <select class="form-control" id="parent"
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
							</select>
						</div>
					<div class="col-md-4 mt-30">
						<label>Level</label> <input type="text" class="form-control"
							id="nextLevel" value="3" name="nextLevel"
							onkeyup="removeError('nextLevel');">
					</div>
					<div class="clear"></div>
					<div class="clear"></div>
					<div class="col-md-4 mt-30">
						<label>New Account No</label> <input type="text"
							class="form-control" id="newAcc" value="" name="newAcc"
							onkeyup="removeError('newAcc');" placeholder="new account no:">
					</div>
					<div class="col-md-4 mt-30">
						<label>Account Description</label> <input type="text"
							class="form-control" id="accDesc" name="accDesc"
							onkeyup="removeError('accDesc');"
							placeholder="Enter account description">
					</div>
					<div class="col-md-4 mt-30">
						<label>Account code</label> <input type="text"
							class="form-control" id="accCode" name="accCode"
							onkeyup="removeError('accCode');"
							placeholder="Enter account code">
					</div>
					<div class="clear"></div>

					<div class="clear"></div>
					<div class="col-md-12 mt-30 mb-30">
						<button type="button" class="btn btn-blue btn-submit mt-20"
							id="save">Save</button>
						<button type="button" class="btn btn-blue btn-submit mt-20"
							id="update">Update</button>
						<button type="button" class="btn btn-blue btn-submit mt-20"
							id="search">Search</button>
						<!-- 	<button type="button"  class="btn btn-blue btn-submit mt-20" >Search</button>
			<button type="button"  class="btn btn-blue btn-submit mt-20" >Reset</button>
			<button type="button"  class="btn btn-blue btn-submit mt-20"  data-toggle="modal" data-target="#myModal1">Add</button>
			<button type="button"  class="btn btn-blue btn-submit mt-20" data-toggle="modal" data-target="#myModal">Edit</button>
			<button type="button"  class="btn btn-blue btn-submit mt-20" >Delet</button> -->
					</div>
				</form>
				<div class="clear"></div>
				<div id='tableDiv'></div>
				<div id="searchDiv"></div>
			</div>
		</div>
	</div>

</body>
</html>