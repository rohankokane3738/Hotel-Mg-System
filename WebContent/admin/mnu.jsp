<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
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
  <h2>Add Menus</h2>
  <form method=post enctype="multipart/form-data" action="upload.jsp">
   <div class="mb-3">
      <label for="myfile">Photo:</label>
      <input type="file" class="form-control" id="myfile" placeholder="Select Photo" name="myfile"><br>
      <input type="submit" value="Upload"> 
    </div>
  </form>
  
  <form method=post>
  <div class="mb-3 mt-3">
      <label for="mnm">Menu Name:</label>
      <input type="text" class="form-control" id="mnm" placeholder="Enter menu name" name="mnm">
    </div>
    
    <div class="mb-3">
      <label for="ty">Type:</label>
      <select class="form-control" id="ty" name="ty">
      <option value="">--select--</option>
      <option value="veg">veg</option>
      <option value="non-veg">non veg</option>
      
      </select>
    </div>
    
    <div class="mb-3">
      <label for="sty">Sub Type:</label>
      <select class="form-control" id="sty"  name="sty">
      <option>--select--</option>
      <option value="Rice">Rice</option>
      <option value="Noodles">Noodles</option>
      </select>
    </div>
  
    <div class="mb-3">
      <label for="hpr">Half Price:</label>
      <input type="text" class="form-control" id="hpr" placeholder="Enter Half Price" name="hpr">
    
    </div>
    <div class="mb-3">
      <label for="fpr">Full Price:</label>
      <input type="text" class="form-control" id="fpr" placeholder="Enter Full Price" name="fpr">
    </div>
   
    <button type="submit" class="btn btn-primary"  name="btnsub">Submit</button>
  </form>
  
  
  <h1>Manage Menus</h1>
  <table class="table table-bordered">
  <thead>
  <tr>
  <th>Menu Id</th><th>Menu Name</th><th>Type</th><th>SubType</th><th>Half Price</th><th>Full Price</th><th>Photo</th><th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <%
  try{
		 
		String n,t,s,h,f,p,i;
		int cnt=0;
		PreparedStatement pst=cn.prepareStatement("select * from menu" );
		
		ResultSet rs=pst.executeQuery();
	while(rs.next()){
		i=rs.getString("menuid");
			n=rs.getString("menuname");
			t=rs.getString("type");
			s=rs.getString("subtype");
			h=rs.getString("halfprice");
			f=rs.getString("fullprice");
			p=rs.getString("photo");
			
			%>
			<tr>
			<td><%=i %> </td>
			<td><%=n %> </td>
			<td><%=t %> </td>
			<td><%=s %> </td>
			<td><%=h %> </td>
			<td><%=f %> </td>
			<td><img src="http://localhost:8080/ChineseHotel/images/<%=p %>" width=100 height=100> </td>
			<td>
		<a href="del.jsp?id=<%=i %>" class="btn btn-danger">Delete</a>
		 <a href="up.jsp?id=<%=i %>" class="btn btn-info">Update</a>
			</td>
			</tr>
			<%
			
	}
  }
  catch(Exception ex)
  {
	  ex.printStackTrace();
  }
  %>
  </tbody>
  </table>
</div>
<%
if(request.getParameter("btnsub")!=null)
{
	String mnm,ty,sty,hpr,fpr,photo;
	mnm=request.getParameter("mnm");
	ty=request.getParameter("ty");
	sty=request.getParameter("sty");
	hpr=request.getParameter("hpr");
	fpr=request.getParameter("fpr");
	photo =(String) session.getAttribute("filepath");
	try{
		PreparedStatement pst=cn.prepareStatement("insert into menu (menuname,type,subtype ,halfprice,fullprice,photo) values (?,?,?,?,?,?)" );
		pst.setString(1,mnm);
		pst.setString(2,ty);
		pst.setString(3,sty);
		pst.setString(4,hpr);
		pst.setString(5,fpr);
		pst.setString(6, photo);
		
		int count=pst.executeUpdate();
		if(count>0){
			out.println("<script>alert('Menu Uploaded');</script>");
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