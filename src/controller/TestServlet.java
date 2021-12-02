package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "TestServlet", value = "/test1.do")
public class TestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       response.setContentType("text/html");
        PrintWriter out= response.getWriter();
        String userid = request.getParameter("userid");
        String pwd = request.getParameter("pwd");

        out.print("<center>");
        out.print("<h2>");
        out.print("I received getRequest by servlet");
        out.print("<br> userid = "+userid);
        out.print("<br> pwd = "+ pwd);
        out.print("</h2>");
        out.print("</center>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out= response.getWriter();
        String userid = request.getParameter("userid");
        String pwd = request.getParameter("pwd");
        out.print("<center>");
        out.print("<h2>");
        out.print("I received getRequest by servlet");
        out.print("<br> userid = "+userid);
        out.print("<br> pwd = "+ pwd);
        out.print("</h2>");
        out.print("</center>");
    }
}
