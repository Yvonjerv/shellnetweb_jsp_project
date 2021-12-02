package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

@WebServlet(name = "GetInfoServlet", value = "/GetInfoServlet.do")
public class GetInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        ServletContext servletContext=getServletContext();
        PrintWriter out = response.getWriter();
        out.println("<HTML>");
        out.println("  <BODY style=\"font-size:20px\">");
        out.println("server name: " + request.getServerName() + "<br>");
        out.println("server port: " + request.getServerPort() + "<br>");
        out.println("server path: " + request.getServletPath() + "<br>");
        out.println("server information: " + servletContext.getServerInfo() + "<br>");
        out.println("client name: " + request.getRemoteHost() + "<br>");
        out.println("client ip address: " + request.getRemoteAddr() + "<br>");
        out.println("client port: " + request.getRemotePort() + "<br>");
        out.println("client protocol: " + request.getProtocol() + "<br>");
        out.println("client encoding: " + request.getCharacterEncoding() + "<br>");
        Enumeration e = request.getParameterNames();
        while(e.hasMoreElements())
            out.println("all parameter from request: " + (String)e.nextElement() + "<br>");
        out.println("  </BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
