package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDao;
import DTO.User;
@WebServlet("/login")
public class Login extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	String Email=	req.getParameter("email");
	String Password=req.getParameter("psd");
	UserDao dao=new UserDao();
	User user=dao.find(Email);
	if(user==null){
		res.getWriter().print("<h1>Invalid email</h2>");
        req.getRequestDispatcher("Login.html").include(req, res);
        

	}
	if(user.getPassword().equals(Password))
	{
		
		req.getSession().setAttribute("id", "5defcedn");
//		res.getWriter().print("<h1>Login Succesfull</h2> ");
//		res.sendRedirect("https://www.youtube.com");
		List<User> list=dao.fetchAll();
//        for(User u:list)
//        {
//        res.getWriter().println(" <h1>Username:"+u.getName()+"</h1>");	
//        res.getWriter().println("<h1> UserEmail:"+u.getEmail()+"</h1>");
//        res.getWriter().println("<h1> UserGender:"+u.getGender()+"</h1>");
//        res.getWriter().println("<h1> UsernMobile:"+u.getMobile()+"</h1>");
//        res.getWriter().println("<h1> UserPassword:"+u.getPassword()+"</h1>");
//        res.getWriter().println("<h1> UserAddres:"+u.getAddres()+"</h1>");
//        res.getWriter().println("<h1>......******************.----..........</h1>");
               req.setAttribute("list",list);
              req.getRequestDispatcher("Result.jsp").forward(req, res);  
              //}
}
	else
	{
		res.setContentType("text/html");
//		res.getWriter().print("<h1>Invalid password</h2>");
		res.getWriter().print("Invalid password");

        req.getRequestDispatcher("Login.html").include(req, res);

	}
	}


   }
	


