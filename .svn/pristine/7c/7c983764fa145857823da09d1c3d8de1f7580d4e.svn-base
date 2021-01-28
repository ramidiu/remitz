<%-- <%@page import="com.kws.sendito.entities.SubHead"%>
<%@page import="java.util.List"%>
<%@page import="com.kws.sendito.service.impl.SubHeadServiceImpl"%>
<%@page import="com.kws.sendito.service.SubHeadService"%>
<%@page import="com.kws.sendito.service.impl.MajorHeadServiceImpl"%>
<%@page import="com.kws.sendito.service.MajorHeadService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		System.out.println("Sj::::"+request.getParameter("q"));
		if (request.getParameter("q") != null) {
			String s = request.getParameter("q");
		
			if (s.length() >= 1) {
			SubHeadService sub=new SubHeadServiceImpl();
				List<SubHead> sublist=sub.getOnlyRevenueSubheads(s);

				for (int i = 0; i < sublist.size(); i++) {
					SubHead majorhead = sublist.get(i);
					out.println(majorhead.getSubHeadId().trim() + ","+ majorhead.getSubHeadName().trim());
				}

				if (sublist.size() == 0) {
					out.print(request.getParameter("q") + "," + " ");
				}
			}
		}
	%>

</body>
</html> --%>