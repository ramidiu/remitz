<%-- <%@page import="com.kws.sendito.service.SubHeadService"%>
<%@page import="com.kws.sendito.service.impl.SubHeadServiceImpl"%>
<%@page import="com.kws.sendito.entities.SubHead"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1" import="java.util.List"%>
<jsp:useBean id="SUB" class="com.kws.sendito.entities.SubHead"/>
<%


String s=request.getParameter("q");
String recCon="";
String majorid="";
String minorid="";
List<SubHead> MIN_List=null;
if(s.length()>=1)
	{
	
	SubHeadService subHeadService = new SubHeadServiceImpl();
		MIN_List = subHeadService.getOnlyRevenueSubheads(s);
	for(int i=0; i < MIN_List.size(); i++ ){
		SUB=(SubHead)MIN_List.get(i);
		 out.println(SUB.getSubHeadId()+","+SUB.getSubHeadName()+","+SUB.getAccNo()+","+SUB.getMajorHead()+","+SUB.getMinorHead());
		}
	
}
%> --%>