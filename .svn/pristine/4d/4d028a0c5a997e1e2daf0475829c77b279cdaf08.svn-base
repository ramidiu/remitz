<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Calendar"%>

	<%
	
		Calendar calendar = Calendar.getInstance();
	calendar.setTimeZone(TimeZone.getTimeZone("IST"));
		int presentYear = calendar.get(Calendar.YEAR);
		int nextYear = presentYear + 1;
		int lastYear = presentYear - 1;
		SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String currentDatecurrentDate = SimpleDateFormat.format(calendar.getTime());
// 		String currentDatecurrentDate = "2018-04-01";
String finYear = "";
if (request.getParameter("finYear") != null)	{
	finYear = request.getParameter("finYear");
}


		if(currentDatecurrentDate.compareTo(""+presentYear+"-04-01") < 0){
			for(int i = 0 ; i < 10; i++){
// 				System.out.println(lastYear+ "-" + presentYear);
				
				%>
					<option value="<%=lastYear %>-<%=String.valueOf(presentYear).substring(2, 4) %>" <%if(finYear.equals(lastYear+"-"+String.valueOf(presentYear).substring(2, 4))){%> selected="selected" <%}%> ><%=lastYear %>-<%=presentYear %></option>
				<%
				presentYear = lastYear;
				lastYear = lastYear - 1;
			}
		}else{
			for(int i = 0 ; i < 10; i++){
// 				System.out.println(presentYear+ "-" + nextYear);
				%>
					<option value="<%=presentYear %>-<%=String.valueOf(nextYear).substring(2, 4) %>" <%if(finYear.equals(presentYear+"-"+String.valueOf(nextYear).substring(2, 4))){%> selected="selected" <%}%> ><%=presentYear %>-<%=nextYear %></option>
				<%
				nextYear = presentYear;
				presentYear = presentYear - 1;
			}
			
		}
		
	
	%>

