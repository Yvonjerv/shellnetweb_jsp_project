package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet(name = "LoginFilter", value = "/LoginFilter")
public class LoginFilter extends HttpServlet implements Filter{
    @Override
    public void doFilter(ServletRequest sRequest, ServletResponse sResponse,
                         FilterChain filterChain) throws IOException, ServletException {

        // Define interception rules and what URL requests can run through
        HttpServletRequest request = (HttpServletRequest) sRequest;
        HttpServletResponse response = (HttpServletResponse) sResponse;
        HttpSession session = request.getSession();

        //get request jsp url address
        String url = request.getServletPath();
        String url2 = request.getRequestURL().toString();

        System.out.println(url + "|" + url2);
        Enumeration<String> paras = request.getParameterNames();

        while(paras.hasMoreElements()){
            String parasName = paras.nextElement();
            System.out.println(parasName);
        }




        //通过的URL继续访问servlet容器，实现正常的请求
        filterChain.doFilter(sRequest, sResponse);
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub

    }
}
