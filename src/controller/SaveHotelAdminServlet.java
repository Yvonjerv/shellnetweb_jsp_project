package controller;

import business.dao.UserDAO;
import business.impl.UserDaoImpl;
import model.TUser;
import model.VUser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SaveHotelAdminServlet", value = "/savehotelmember.do")
public class SaveHotelAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userid = request.getParameter("userid");
        String pwd = request.getParameter("pwd");
        String pwd2 = request.getParameter("pwd2");
        String username = request.getParameter("username");
        String mail = request.getParameter("mail");
        String mobile = request.getParameter("mobile");
        String companyname = request.getParameter("companyname");

        String errMsg = "";
        String backUrl = "addhotelmember.jsp";
        UserDAO udao = new UserDaoImpl();


        if (userid == null || userid.equals("")) {
            errMsg += " User account cannot be empty";
        }else if(userid!=null && userid.equals("")) {
            boolean validID =  udao.isUseridValid(userid);
            if (validID== false){
                errMsg= "the user account exists already";
            }
        }else if (username == null || username.equals("")) {
            errMsg = "user name cannot be empty";
        } else if (mobile == null || mobile.equals("")) {
            errMsg = "user mobile cannot be empty";
        } else if (mail == null || mail.equals("")) {
            errMsg = "user mail cannot be empty";
        } else if (pwd == null || pwd.equals("")) {
            errMsg = "user pwd cannot be empty";
        } else if (pwd2 == null || pwd2.equals("")) {
            errMsg = "user pwd confirm cannot be empty";
        } else if (!pwd.equals(pwd2)) {
            errMsg = "the password confirm is not consistent";
        }


        if(!errMsg.equals("")) { //Data verification failed
            request.setAttribute("errMsg", errMsg);
            request.setAttribute("backUrl", backUrl);
            RequestDispatcher rd = request.getRequestDispatcher("errors.jsp");
            rd.forward(request, response);
            return;
        }
        HttpSession session = request.getSession();
        VUser loginuser = (VUser) session.getAttribute("loginuser");

        if (loginuser == null) { // register
            TUser user = new TUser();
            user.setUserid(userid);
            user.setUsername(username);
            user.setUtid(1); //1 is hotel member
            user.setPwd(pwd);
            user.setMobile(mobile);
            user.setMail(mail);
            user.setCompanyname(companyname);
            boolean su = udao.registerUser(user);

            if (su) {
                request.setAttribute("promptMsg", "Hotel member user registered successfully, please return to the home page to log in.");
                request.setAttribute("backUrl", "beikemain.jsp");
                RequestDispatcher rd = request.getRequestDispatcher("prompt.jsp");
                rd.forward(request, response);
                return;
            }else {
                request.setAttribute("errMsg", " Registration failed and the user account already exists");
                request.setAttribute("backUrl", backUrl);
                RequestDispatcher rd = request.getRequestDispatcher("errors.jsp");
                rd.forward(request, response);
                return;
            }


        } else {//edit

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    }
}
