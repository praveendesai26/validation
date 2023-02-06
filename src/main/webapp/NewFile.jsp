<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Hello world!....</h1>
<%List li=new ArrayList();
li.add(0);
li.add(9);
%>
<%=li %>
<%--------- --%> 
<% int a=10;

System.out.println(a);  
out.println("<h1>"+a+"</h1>");
//response.getWriter().print("<h1>"+a+"</h1>");
%>
<h1> <%=a %> </h1>
<%! int a=19; %>
<%=this.a %>     
</body>
</html>