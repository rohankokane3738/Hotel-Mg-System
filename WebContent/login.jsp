<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <jsp:include page="header.jsp"/>
    <%@include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container mt-3">
  <h2>Login form</h2>
  <form method=post>
    <div class="mb-3">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
    
    </div>
    <div class="mb-3">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
    </div>
    <div class="form-check mb-3">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"> Remember me
      </label>
    </div>
    <button type="submit" class="btn btn-primary"  name="btnsub">Submit</button>
  </form>
</div>
<%
if(request.getParameter("btnsub")!=null)
{
	String e,p;
	e=request.getParameter("email");
	p=request.getParameter("pwd");
	
	try{
		PreparedStatement pst=cn.prepareStatement("select * from register where email=? and password=?" );
		
		pst.setString(1,e);
		pst.setString(2,p);
		ResultSet rs=pst.executeQuery();
		if(rs.next()){
			
			session.setAttribute("name", rs.getString("name"));
			session.setAttribute("email", rs.getString("email"));
			out.println("<script>alert('login successful');window.location='user/index.jsp'</script>");
		}
		else
			out.println("<script>alert('Problem Occured');</script>");
	}
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
}

%>
</body>
</html>