<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agent List</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/adm/js/nicEdit-latest.js" ></script>
  <script src="${pageContext.request.contextPath}/resources/adm/js/modal-windowRTF.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <style>
  
* {
	 -webkit-box-sizing: border-box;
	 -moz-box-sizing: border-box;
	 box-sizing: border-box;
	 outline: 0;
}
 html, body {
	 width: 100%;
	 height: 100%;
	 margin: 0;
	 padding: 0;
}
 body {
	 background-color: #f3f2f2;
	 color: #333;
	 font-family: sans-serif;
	 font-size: 14px;
}
 table {
	 border-collapse: collapse;
	 border-spacing: 0px;
	 line-height: 16px;
}
 th {
	 text-align: left;
	 font-weight: normal;
	 font-size: 12px;
}
 button {
	 background: none;
	 background-color: transparent;
	 box-shadow: none;
	 border: none;
	 font-family: inherit;
	 color: inherit;
	 border-radius: 0;
	 cursor: pointer;
}
 .number {
	 width: 1%;
	 white-space: nowrap;
	 text-align: right;
	 padding-left: 20px !important;
}
 .ellipsis {
	 overflow: hidden;
	 white-space: nowrap;
	 text-overflow: ellipsis;
}
 .textcenter {
	 text-align: center;
}
 . {
	 text-align: right;
}
 .minify {
	
	 white-space: nowrap;
}
 .table-icon {
	 width: 30px;
	 max-width: 30px;
	 text-align: center;
}
 .table-list {
	 height: 280px;
}
 .table-list {
	 background-color: #fff;
	 border: 1px solid #d2d2d2;
	 width: 100%;
	 margin: 0 auto;
}
 .table-list th {
	 border-bottom: 1px solid #d2d2d2;
}
 .table-list tbody td {
	 white-space: nowrap;
	 padding: 9px;
	 vertical-align: top;
	 height: 35px;
	 border-bottom: 1px solid #d2d2d2;
}
 tr:last-child td {
	 height: auto;
}
 .sort {
	 text-align: left;
	 padding: 9px;
	 border: none;
	 background: none;
	 display: block;
	 width: 100%;
	 color: #808080;
	 line-height: 14px;
}
 .sort.textcenter {
	 text-align: center;
}
 .sort. {
	 text-align: right;
}
 .caret {
	 line-height: 0;
}
 .caret:after {
	 content: "";
}
 .asc .caret:after {
	 width: 0;
	 height: 0;
	 border-left: 3px solid transparent;
	 border-right: 3px solid transparent;
	 border-top: 3px solid #808080;
	 content: "";
	 position: relative;
	 top: -3px;
	 right: -4px;
	 font-size: 0;
}
 .desc .caret:after {
	 width: 0;
	 height: 0;
	 border-left: 3px solid transparent;
	 border-right: 3px solid transparent;
	 border-bottom: 3px solid #808080;
	 content: "";
	 position: relative;
	 top: -7px;
	 right: -4px;
	 font-size: 0;
}
 .sort .caret {
	 display: none;
}
 .sort.asc .caret {
	 display: inline-block;
}
 .sort.desc .caret {
	 display: inline-block;
}

 .table-footer {
	 border-top: 1px solid #d2d2d2;
	 padding: 0;
}
 .table-filter {
	 float: right;
	 border-left: 1px solid #d2d2d2;
}
 .table-filter .search {
	 padding: 9px;
	 width: 300px;
	 border: none;
	 background: transparent;
	 box-shadow: none;
}
.popUpYes:hover
    {
      background-color: #005075;;
      color: white; /* SET COLOR IN BLACK */
    }  
    .popUpYes
    {width:100%;
    cursor: pointer;
    text-decoration: none;
    font-weight: bold;
    color: #464646;
    }
 .table-pagination {
	 display: table;
	 border-collapse: collapse;
	 width: 156px;
	 float: left;
	 border-right: 1px solid #d2d2d2;
	 padding: 6px;
}
 .btn-tablepage {
	 display: table-cell;
	 width: 33px;
	 padding: 9px;
}
 .pagination {
	 display: table-cell;
	 text-align: center;
	 list-style: none;
	 margin: 0;
	 padding: 0;
	 width: 90px;
}
 .pagination li {
	 display: inline-table;
	 border: 1px solid #eaeaea;
}
 .page {
	 display: block;
	 padding: 4px 0;
	 width: 22px;
	 text-align: center;
	 text-decoration: none;
	 line-height: 12px;
	 font-size: 12px;
	 color: #808080;
}
 .pagination .disabled {
	 display: none;
}
 .pagination .active {
	 border-color: #aaa;
}
 .active .page {
	 background: #aaa;
	 color: #fff;
}
/* unused */
 .table-btn-dropdown {
	 padding: 8px;
}
 .btn-with-caret {
	 position: relative;
	 padding-right: 24px;
}
 .btn-with-caret:after {
	 content: "";
	 display: block;
	 position: absolute;
	 top: 50%;
	 right: 10px;
	 margin-top: -2px;
	 width: 0;
	 height: 0;
	 border-top: 4px solid #333;
	 border-right: 4px solid transparent;
	 border-left: 4px solid transparent;
}
 
  
  </style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js">
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.2.0/list.min.js">
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/list.pagination.js/0.1.1/list.pagination.min.js"></script>
<body>

<%@include file="headerNew.jsp" %>
<div class="container">
<br>
<div class="row">

<div class="col-md-12">
<h5>Access Logs</h5>
</div><br>
<div class="col-md-11">
<div class="row">

<div class="col-md-3">
<label>	 Start Date</label>
<input type="date" name="logondate" id="logondate" class="form-control">
</div>
<div class="col-md-3">
<label>Login End Date</label>
<input type="date" name="logoffdate" id="logoffdate" class="form-control">
</div>
<div class="col-md-2">
<label>Username</label>
<input type="text" name="username" id="username" class="form-control">
</div>
<div class="col-md-2">

<input type="submit" class="form-control popUpYes" onclick="getList();"  style="margin-top:25px;">
</div>
</div>
</div>
</div><br>
<!-- <div class="row">
<div class="col-md-11">

<div class="" id="tableID">
  <table class="table-bordered table" data-currentpage="1">
  <tfoot>
      <tr>
        <td colspan="3" class="table-footer">
          <div class="table-pagination">
            <button type="button" class="btn-tablepage jTablePagePrev">&laquo;</button>
            <ul class="pagination"></ul>
            <button type="button" class="btn-tablepage jTablePageNext">&raquo;</button>
          </div>
          

        </td>
      </tr>
    </tfoot></table>
 -->  <table class="table-bordered table" data-currentpage="1">
    <thead>
    <tr style="background: #0c036c;padding:5px;color:white;">
<th>Date</th>
<th>CATEGORYs</th>
<th>Username</th>
<th>UserType</th>
<th>IP Address</th>
<th>Source Country</th>
<th>Agent</th>
<th>Transaction</th>
<th>Message</th>
<th>Original Data</th>
<th>Changed Data</th>
      </tr>
    </thead>
    <!-- IMPORTANT, class="list" must be on tbody -->
    <tbody class="list">
     <c:forEach items="${list}" var="list">
      <tr>
               <td class="text-center">${list.date}</td>
          <td class="text-center">${list.category}</td>
         <td class="text-center">${list.userName}</td>
         <td class="text-center">${list.userType}</td>
         <td class="text-center">${list.ipAddress}</td>
           <td class="text-center">${list.sourceCountry}</td>
           <td class="text-center">${list.agent}</td>
          <td class="text-center">${list.transaction}</td>
         <td class="text-center">${list.message}</td>
         <td class="text-center">${list.originalData}</td>
         <td class="text-center">${list.changedData}</td>
</tr>
 </c:forEach>
    </tbody>
    
  </table>

</div>
</body>
<script type="text/javascript">
var pagingRows = 7;

var paginationOptions = {
    innerWindow: 1,
    left: 0,
    right: 0
};
var options = {
  valueNames: [ 'sortID', 'sortDesc','sortDesc1', 'sortTotal','sortTotal1' ],
  page: pagingRows,
  plugins: [ ListPagination(paginationOptions) ],
};

var tableList = new List('tableID', options);

$('.jTablePageNext').on('click', function(){
    var list = $('.pagination').find('li');
    $.each(list, function(position, element){
        if($(element).is('.active')){
            $(list[position+1]).trigger('click');
        }
    })
})
$('.jTablePagePrev').on('click', function(){
    var list = $('.pagination').find('li');
    $.each(list, function(position, element){
        if($(element).is('.active')){
            $(list[position-1]).trigger('click');
        }
    })
})



</script>
<script type="text/javascript">

function getList(){
	var logondate=$('#logondate').val();
	var logoffdate=$("#logoffdate").val();
	var username=$('#username').val();
	var data='';
	var url='';
	if(logondate!='' && username=='' && username==''){
		if(logoffdate==''){
			alert('please select logoff date ');
			return false;
		}
		data="date1="+logondate+"&date2="+logoffdate;
		url="getAdtListbwdates";
	}
	if( logondate=='' && logoffdate=='' && username!='' ){
		data="username="+username;
		url="getListByusername";
		}
	if( logondate!='' && logoffdate!='' && username!=''){
		data="date1="+logondate+"&date2="+logoffdate+"&username="+username;
		url="getListbwdatesAndUsername";
		
	}

$.ajax({
	  url:url,
	  type:'POST',
	  data:data,
	  success:function(response)
	  {
		  var txnList = JSON.stringify(response, undefined, '\t');
			//alert('txnList===='+txnList);
		  var rows='';
			 var counts=1;
			 var opt='';
			  $.each($.parseJSON(txnList),function(idx,obj){
				  var count='0';
					var td='';

					 rows=rows+"<tr style='background:#fff'><td class='text-center'>"+obj.date+"</td><td class='text-center'>"+obj.category+"</td><td class='text-center'>"+obj.userName+"</td><td class='text-center'>"+obj.userType+"</td><td class='text-center'> "+obj.ipAddress+"</td><td class='text-center'> "+obj.sourceCountry+"</td><td class='text-center'> "+obj.agent+"</td><td class='text-center'> "+obj.transaction+"</td><td class='text-center'>"+obj.message+"</td><td class='text-center'>"+obj.originalData+"</td><td class='text-center'>"+obj.changedData+"</td></tr>";

					  counts++; 
				 });
			  $('table').find("tr:gt(0)").remove(); 
			  $('table tbody').append(rows);
	  },
		error:function()
		{
			alert("get AccessLogs error");
		}

			
	  }); 
			





}


</script>
</html>