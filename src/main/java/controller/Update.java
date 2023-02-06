package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDao;
import DTO.User;
@WebServlet("/Update")
public class Update extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User user=new User();
		user.setName(req.getParameter("name"));
		user.setMobile(Long.parseLong(req.getParameter("phno")));
		user.setEmail(req.getParameter("email"));
		user.setPassword(req.getParameter("psd"));
		user.setGender(req.getParameter("gender"));
        user.setAddres(req.getParameter("address"));
        
        UserDao dao=new UserDao();
        dao.updateuser(user);
        
        List<User> list=dao.fetchAll();
    	req.setAttribute("list", list);
    	req.getRequestDispatcher("Result.jsp").forward(req, res);
    	
    
	}
}
