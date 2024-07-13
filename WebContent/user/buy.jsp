<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="header.jsp"/>
    <%@include file="../connection.jsp" %>


<%
String name = request.getParameter("nm");
String type = request.getParameter("type");
String subtype = request.getParameter("subtype");
String hp = request.getParameter("hp");
String fp = request.getParameter("fp");

%>


<div class="container mt-3">
  <h2>Buy form</h2>
  <form method=post>
    <div class="mb-3">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name"  name="name" value=<%=name %> readonly>
    
    </div>
    <div class="mb-3">
      <label for="type">Type:</label>
      <input type="text" class="form-control" id="type"  name="type" value=<%=type %> readonly>
    </div>
    <div class="mb-3">
      <label for="subtype">Sub Type:</label>
      <input type="text" class="form-control" id="subtype"  name="subtype" value=<%=subtype %> readonly>
    </div>
    <div class="mb-3">
      <label for="hp">Half Price:</label>
      <input type="text" class="form-control" id="hp"  name="hp" value=<%=hp %> readonly>
    </div>
    <div class="mb-3">
      <label for="fp">Full Price:</label>
      <input type="text" class="form-control" id="fp"  name="fp" value=<%=fp %> readonly>
    </div>
     <div class="mb-3">
      <label for="qt">Quantity:</label>
      <input type="text" class="form-control" id="qt"  name="qt">
    </div>
     <div class="mb-3">
      <label for="dtype">Dish Type:</label>
      <select class="form-control" id="dtype"  name="dtype">
      <option>--select--</option>
      <option>Half</option>
      <option>Full</option>
      </select>
    </div>
     <div class="mb-3">
      <label for="amt">Amount:</label>
      <input type="text" class="form-control" id="amt"  name="amt" readonly onfocus="cal()">
    </div>
<script type="text/javascript">
function cal()
{
	var qt, dtype,amount,price;
	qt =  document.getElementById("qt").value;
	dtype =  document.getElementById("dtype").value;
if(dtype=="Half")
	price=parseInt(document.getElementById("hp").value)
else if(dtype=="Full")
	price=parseInt(document.getElementById("fp").value)
		
	amount =  price*qt
	document.getElementById("amt").value=amount;
	}
</script>    
    <button type="submit" class="btn btn-primary"  name="btnsub">Submit</button>
  </form>
</div>


<%
if(request.getParameter("btnsub")!=null)
{
String email=(String)session.getAttribute("email");
try
{
	PreparedStatement pst=cn.prepareStatement("insert into userorder(emailid,menuname,qty,amount)values(?,?,?,?)");
	pst.setString(1,email);
	pst.setString(2,name);
	pst.setString(3,request.getParameter("qt"));
	pst.setString(4,request.getParameter("amt"));
	int count=pst.executeUpdate();
	if(count>0){
		
	out.println("<script>alert('order placed');</script>");
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