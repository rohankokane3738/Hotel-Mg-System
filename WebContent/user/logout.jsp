<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
session.removeAttribute("name");
session.removeAttribute("email");
session.invalidate();
response.sendRedirect("../index.jsp");
%>