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
<div class="container mt-3">
  <h2>Feedback form</h2>
  <form method=post>
    <div class="mb-3">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name"  name="name" >
    
    </div>
    <div class="mb-3">
      <label for="fbk">Feedback:</label><br><br>
      <textarea rows="5" cols="30" id="feedback" name="feedback"></textarea>
    </div>
    <button type="submit" class="btn btn-primary"  name="btnsub">Submit</button>
    </form>
</div>
   <%
   if(request.getParameter("btnsub")!=null){
String email=(String)session.getAttribute("email");
try
{
	PreparedStatement pst=cn.prepareStatement("insert into feedback(email,name,feedback)values(?,?,?)");
	pst.setString(1,email);
	pst.setString(2,request.getParameter("name"));
	pst.setString(3,request.getParameter("feedback"));
	
	
	
	
	int count=pst.executeUpdate();
	if(count>0){
		
	out.println("<script>alert('Feedback store successfully');</script>");
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