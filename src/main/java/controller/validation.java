package controller;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

import DAO.UserDao;
import DTO.User;

@WebServlet("/adabe")
public class validation extends GenericServlet {

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		User user=new User();
		user.setName(req.getParameter("name"));
		user.setMobile(Long.parseLong(req.getParameter("phno")));
		user.setEmail(req.getParameter("email"));
		user.setPassword(req.getParameter("psd"));
		user.setGender(req.getParameter("gender"));
        user.setAddres(req.getParameter("address"));
        
        UserDao dao=new UserDao();
        try{
        dao.save(user);
        res.getWriter().print("<h1> Account created successfull</h1>");
        res.getWriter().print("<h1> Account created successfull</h1>");
        req.getRequestDispatcher("Login.html").include(req, res);

        }
        catch(Exception e)
        {
        	res.getWriter().print("<h1>Email already excited</h1>");
//        req.getRequestDispatcher("Login.html").forward(req, res);
          req.getRequestDispatcher("validation.html").include(req, res);
        }
	}

}
