<%@page import="DTO.User"%>
<%@page import="DAO.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit</title>
</head>
<body>
<%
if(session.getAttribute("id")==null){
		response.getWriter().print("<h1>Invalid Session Login again </h1>");
		request.getRequestDispatcher("Login.html").include(request, response);
	}else%>
	{
<%String email=request.getParameter("email"); 
UserDao dao=new UserDao();
User user=dao.find(email);
%>
<form action="Update" >
    <table>
    <tr>
    <td><label for="id">Id:</label></td>
    <td><input type="text" name="id" value="<%=user.getId()%>">
    </tr>
        <tr>
            <td><label for="name">NAME:</label></td>
            <td><input type="text" name="name" value="<%=user.getName()%>"></td>
         
        </tr>
        <tr>
            <td><label for="phno">PhoneNo:</label></td>
            <td><input type="text" name="phno" value="<%=user.getMobile()%>"></td>
            
        </tr>
        <tr>
            <td><label for="email">EMAIL</label></td>
            <td><input type="text" name="email" value="<%=user.getEmail()%>"></td>
        </tr>
        <tr>
            <td><label for="psd">PASSWORD:</label></td>
            <td><input type="password" name="psd" value="<%=user.getPassword()%>"></td>
        </tr>
        <tr >
            <td><label for="gender">GENDER:</label></td>
            <%if(user.getGender().equals("male")){ %>
            <td><input type="radio" name="gender" value="male" checked="checked">MALE</td>
            <td><input type="radio" name="gender" value="female">FEMALE</td>
            <%} else{ %>
            <td><input type="radio" name="gender" value="male" checked="checked">MALE</td>
            <td><input type="radio" name="gender" value="female" checked="checked">FEMALE</td>
          <%} %>
        </tr>
        <tr>
            <td ><label for="address">ADDRESS:</label></td>
            <td><textarea name="address" value="<%=user.getAddres()%>" cols="30" rows="10"></textarea></td>
        </tr>
       
               <tr>
            <td><button>Update</button></td>
            <td><button type="reset">Cancel</button></td>
              </tr>
        
        

    </table>
</form>
</body>
</html>