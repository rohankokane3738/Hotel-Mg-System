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
<h1 class=text-center>Your Orders</h1>
<table class="table table-bordered">
<thead>
<tr>
<th>Order no</th><th>Menu</th><th>Quantity</th><th>Amount</th>
</tr>
</thead>
<tbody>
<%
	try{
		 
		String n,i,qty,amount;
		int cnt=0;
		PreparedStatement pst=cn.prepareStatement("select * from userorder where emailid=?" );
		
		pst.setString(1,(String)session.getAttribute("email"));
		
		ResultSet rs=pst.executeQuery();
	while(rs.next()){
		i=rs.getString("ono");
			n=rs.getString("menuname");
			qty=rs.getString("qty");
			amount=rs.getString("amount");
			%>
<tr>
<td><%=i %></td>
<td><%=n %></td>
<td><%=qty %></td>
<td><%=amount %></td>
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