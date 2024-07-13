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
  <h2>Registeration form</h2>
  <form method=post>
  <div class="mb-3 mt-3">
      <label for="nm">Name:</label>
      <input type="text" class="form-control" id="nm" placeholder="Enter name" name="nm" required="required" pattern="[a-zA-Z]+">
      <span style="color:red">* Name can contain only alphabets</span>
    </div>
    
    <div class="mb-3">
      <label for="co">Contact:</label>
      <input type="text" class="form-control" id="co" placeholder="Enter contact" name="co" required="required" pattern="[0-9]{10}">
      <span style="color:red">* Contact No can contain only 10 digits</span>
    </div>
    
    <div class="mb-3">
      <label for="add">Address:</label>
      <input type="text" class="form-control" id="add" placeholder="Enter address" name="add" required="required">
    </div>
  
    <div class="mb-3">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required="required">
    
    </div>
    <div class="mb-3">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" required="required">
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
	String n,a,e,p,c;
	n=request.getParameter("nm");
	a=request.getParameter("add");
	e=request.getParameter("email");
	p=request.getParameter("pwd");
	c=request.getParameter("co");
	try{
		PreparedStatement pst=cn.prepareStatement("insert into register (name,contact,address ,email,password) values (?,?,?,?,?)" );
		pst.setString(1,n);
		pst.setString(2,c);
		pst.setString(3,a);
		pst.setString(4,e);
		pst.setString(5,p);
		int count=pst.executeUpdate();
		if(count>0){
			out.println("<script>alert('Registration successful');window.location='login.jsp'</script>");
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