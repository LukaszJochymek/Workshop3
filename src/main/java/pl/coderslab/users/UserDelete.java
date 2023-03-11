package pl.coderslab.users;

import pl.coderslab.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserDelete", value = "/userDelete")
public class UserDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = Boolean.parseBoolean(request.getParameter("check"));
        if (check ==true) {
            UserDao userDao = new UserDao();

            request.setAttribute("deleteUser", userDao.delete(id));
            response.sendRedirect(request.getContextPath() + "/user/list");
        }




    }
}
