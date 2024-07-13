<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.sql.*"%>
    <jsp:include page="header.jsp"/>
    <%@include file="connection.jsp" %>
<div class=container>
<h1 class=text-center>Veg Menus</h1>
<div class="row">    
<%
	try{
		 
		String n,t,s,h,f,p,i;
		int cnt=0;
		PreparedStatement pst=cn.prepareStatement("select * from menu where type=?" );
		
		pst.setString(1,"veg");
		
		ResultSet rs=pst.executeQuery();
	while(rs.next()){
		i=rs.getString("menuid");
			n=rs.getString("menuname");
			t=rs.getString("type");
			s=rs.getString("subtype");
			h=rs.getString("halfprice");
			f=rs.getString("fullprice");
			p=rs.getString("photo");
			cnt++;
			%>
			<div class=col-sm-3>
			<div class=thumbnail>
			<img src="http://localhost:8080/ChineseHotel/images/<%=p %>" width=200 height=200 class="img-rounded"><br>
			<h3><%=n %></h3>
			<h4>Type:<%=t %></h4>
			<h4>Subtype:<%=s %></h4>
			<h4>Half Price:<%=h %></h4>
			<h4>Full Price:<%=f %></h4>
			
			
			</div>
			</div>
			<%
			if(cnt==4)
			{
				out.println("</div><div class=row>");
				cnt=0;
			}
			
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}
	
%>
</div>
</div>
</body>
</html>