package controller;

import business.dao.UserDAO;
import business.impl.UserDaoImpl;
import model.VUser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login.do")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1 receive user account and pwd from login.jsp
        String userid = request.getParameter("userid");
        String pwd = request.getParameter("pwd");
        //2 Verify user account and pwd null or not
        String msg = null;
        if (userid == null || userid.equals(" ")) {
            msg = "user account cannot be empty";
        } else if (pwd == null || pwd.equals(" ")) {
            msg = "login pwd cannot be empty";
        }

        if (msg != null) {
            request.setAttribute("errMsg", msg);
            request.setAttribute("backUrl", "login.jsp");
            RequestDispatcher rd = request.getRequestDispatcher("errors.jsp");
            rd.forward(request, response);
            return;
        }
        //3 call userdao to verify whether user id or not
        //4 jump to webpage base on the result

        UserDAO userDAO = new UserDaoImpl();
        VUser loginuser = userDAO.login(userid, pwd);

        if (loginuser == null || loginuser.getUserid() == null) {
            request.setAttribute("errMsg", "Your user error");
            request.setAttribute("backUrl", "login.jsp");
            RequestDispatcher rd = request.getRequestDispatcher("errors.jsp");
            rd.forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("loginuser", loginuser);
            response.sendRedirect("beikemain.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
