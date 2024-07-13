<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="header.jsp"/>
    <%@include file="../connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class=container>
<h1 class=text-center>Feedback</h1>
<table class="table table-bordered">
<thead>
<tr>
<th>Email</th><th>Name</th><th>Feedback</th>
</tr>
</thead>
<tbody>
<%
	try{
		 
		String e,n,fdb;
		int cnt=0;
		PreparedStatement pst=cn.prepareStatement("select * from feedback" );
		
		
		
		ResultSet rs=pst.executeQuery();
	while(rs.next()){
		e=rs.getString("email");
			n=rs.getString("name");
			fdb=rs.getString("feedback");
		
			%>
<tr>
<td><%=e %></td>
<td><%=n %></td>
<td><%=fdb %></td>
</tr>
			<%
			
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}
	
%>
</tbody>
</table>
</div>
</body>
</html>