<%@page import="DAO.UserDao"%>
<%@page import="DTO.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>
<script type="text/javascript">
function export_data(){
	let data=document.getElementById('data');
	var fp=XLSX.utils.table_to_book(data,{sheet:'sheet1'});
	XLSX.write(fp,{
		bookType:'xlsx',
		type:'base64'
	});
	XLSX.writeFile(fp, 'test.xlsx');
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result</title>
</head>
<body>
 <%
if(session.getAttribute("id")==null){
		response.getWriter().print("<h1>Invalid Session Login again </h1>");
		request.getRequestDispatcher("Login.html").include(request, response);
	}else%>
 {
<%List <User> list=(List<User>)request.getAttribute("list"); %>
<table border="1">
<tr>
<th>User Id</th>
<th>User Name</th>
<th>User Email</th>
<th>User Gender</th>
<th>User Address</th>
<th>User Mobile</th>
<th>User Password</th>
<th>Delete</th>
<th>Edit</th>
</tr>
 
for(User user:list)
{%>
<tr>
<td><%=user.getId() %></td>
<td><%=user.getName() %></td>
<td><%=user.getEmail() %></td>
<td><%=user.getGender() %></td>
<td><%=user.getMobile()%></td>
<td><%=user.getPassword() %></td>
<td><%=user.getAddres() %></td>
<td><a href="delete?email=<%=user.getEmail()%>"><button>click</button></a></td>
<td><a href="edit.jsp?email=<%=user.getEmail()%>"><button>edit</button></a></td>
</tr>
<% }%>

</table>
<button onclick="window.print()">Print</button>
<button onclick="export_data()">Click</button>
<a href="Logout">Click</a>
<%} %>
</body>
</html>-