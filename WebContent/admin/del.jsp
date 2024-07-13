<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="header.jsp"/>
    <%@include file="../connection.jsp" %>
<%
String id=request.getParameter("id");
try{
	 

	PreparedStatement pst=cn.prepareStatement("delete from menu where menuid=?" );
	
	pst.setString(1, id);
	
	int cnt=pst.executeUpdate();

	if(cnt>0){
		out.println("<script>alert('deleted successful');window.location='mnu.jsp'</script>");
	}
	else
		out.println("<script>alert('Problem Occured');</script>");

	
}catch(Exception ex){
	ex.printStackTrace();
}
%>