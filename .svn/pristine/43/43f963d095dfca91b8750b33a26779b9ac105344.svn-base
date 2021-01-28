<%-- <%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->
<title>AshtaLakshmi-Admin Pannel</title>
<link href="../css/acct-style.css" type="text/css" rel="stylesheet" />
<link href="../css/popup.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.4.2.js"></script>
<script type="text/javascript" lang="javascript" src="../js/modal-window.js"></script>	
<script language="javascript">
function combochange(denom,desti,jsppage) {
        var com_id = document.getElementById(denom).options[document.getElementById(denom).selectedIndex].value; 
        document.getElementById(desti).options.length = 0;
		var sda1 = document.getElementById(desti);
		$.post(jsppage,{ id: com_id } ,function(data)
 		{
		var where_is_mytool=data;
		//alert(where_is_mytool);
		var mytool_array=where_is_mytool.split("\n");
		var ab=mytool_array.length-5;
		//alert(mytool_array.length);
		for(var i=0;i<mytool_array.length;i++)
		{
		if(mytool_array[i] !="")
		{
		//alert (mytool_array[i]);
		var y=document.createElement('option');
		var val_array=mytool_array[i].split(":");
		
					y.text=val_array[1];
					y.value=val_array[0];
					try
					{
					sda1.add(y,null);
					}
					catch(e)
					{
					sda1.add(y);
					}
		}
		}
		});
   } 
function combochangewithdefaultoption(denom,desti,jsppage) {
    var com_id = document.getElementById(denom).options[document.getElementById(denom).selectedIndex].value; 
 /*    document.getElementById(desti).options.length = 0; */
	var sda1 = document.getElementById(desti);
	$.post(jsppage,{ id: com_id } ,function(data)
		{
	var where_is_mytool=data;
	//alert(where_is_mytool);
	var mytool_array=where_is_mytool.split("\n");
	var ab=mytool_array.length-5;
	//alert(mytool_array.length);
	for(var i=0;i<mytool_array.length;i++)
	{
	if(mytool_array[i] !="")
	{
	//alert (mytool_array[i]);
	var y=document.createElement('option');
	var val_array=mytool_array[i].split(":");
	
				y.text=val_array[1];
				y.value=val_array[0];
				try
				{
				sda1.add(y,null);
				}
				catch(e)
				{
				sda1.add(y);
				}
	}
	}
	});
}
function numbersonly(myfield, e, dec)
{
var key;
var keychar;

if (window.event)
   key = window.event.keyCode;
else if (e)
   key = e.which;
else
   return true;
keychar = String.fromCharCode(key);

// control keys
if ((key==null) || (key==0) || (key==8) || 
    (key==9) || (key==13) || (key==27) )
   return true;

// numbers
else if ((("0123456789-").indexOf(keychar) > -1))
   return true;

// decimal point jump
else if (dec && (keychar == "."))
   {
   myfield.form.elements[dec].focus();
   return false;
   }
else
   return false;
}
function goBack() {
    window.history.back()
}
</script>




<!--scroll up-->
<!-- <script type="text/javascript" src="../js/scrolltopcontrol.js"></script> -->
<style>
.vendor-page
{
	background:#FFF; 
	width:100% !important;
	min-height:563px;
	  float:left;
	  margin-left:0px;
	  margin-top:40px;
</style>
 
</head>
<body>
<!-- <body onLoad="init()">
 PLEASE WAIT CODING STARTS
<div id="loading" style="position:absolute; width:100%; text-align:center; top:300px;"><img src="../img/loading2.gif" border=0/></div>
<script>
var ld=(document.all);  
var ns4=document.layers; =
var ns6=document.getElementById&&!document.all; 
var ie4=document.all; 
if (ns4) ld=document.loading; 
else if (ns6 ||ns4 ) ld=document.getElementById("loading").style; 
else if (ie4) ld=document.all.loading.style; 
function init() 
{
	if(ns4){ld.visibility="hidden";
} else if (ns6||ie4) 
	
	ld.display="none";
} </script>
PLEASE WAIT CODING ENDS.....  -->
<%

if(session.getAttribute("adminId")!=null){ %>
<%if(request.getParameter("page") != null  && !request.getParameter("page").equals("null")){ %>
<div></div>
<%} else{%>
 <div></div> 
<%-- <%@include file="header.jsp" %>
<%@include file="sideNav2.jsp" %> --%>
<%} %>
<%if(request.getParameter("page")!=null && !request.getParameter("page").equals(""))
{
	 String includejsp=request.getParameter("page")+".jsp";
	 System.out.println("jsp page..."+request.getParameter("page"));
%>
<div><jsp:include page="<%=includejsp%>" flush="true"/></div>
<%} %>

<%}else{
	response.sendRedirect(request.getContextPath()+"/admin/index.jsp");
} %>



<div style=""><a href="#" class="scrollup"></a></div>
</body>
</html>