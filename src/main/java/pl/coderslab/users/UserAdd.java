package pl.coderslab.users;

import pl.coderslab.User;
import pl.coderslab.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserAdd", value = "/userAdd")
public class UserAdd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username =request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user =new User(username,email,password);
//        User user = new User(username, password, email);
        UserDao userDao = new UserDao();
        request.setAttribute("usersCreate", userDao.update(user));


        response.sendRedirect(request.getContextPath() + "/user/list");
    }
}
