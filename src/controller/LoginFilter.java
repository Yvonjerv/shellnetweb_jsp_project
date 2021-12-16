package controller;

import business.dao.HotelDAO;
import business.impl.HotelDaoImpl;
import model.THotel;
import model.VUser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet(name = "LoginFilter", value = "/LoginFilter")
public class LoginFilter extends HttpServlet implements Filter {
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
        THotel hotel = null;
        VUser loginuser = (VUser) session.getAttribute("loginuser");
        while (paras.hasMoreElements()) {
            String parasName = paras.nextElement();
            System.out.println(parasName);
            // if param is hotelid, we need to get hotel object based on this hotelid

            if (parasName.equals("hotelid")) {
                String hotelid = request.getParameter("hotelid");
                if (hotelid != null || hotelid.equals("")) {
                    HotelDAO hdao = new HotelDaoImpl();
                    hotel = hdao.getHotelByid(Integer.parseInt(hotelid));
                }
            }
        }
        if (url.equals("")) url += "/";

        int pos = url.lastIndexOf(".");
        String extendsName = url.substring(pos, url.length());

        if (extendsName.equals(".do") || extendsName.equals(".jsp")) {

            if (url.endsWith("hotelmange.jsp")) {
                //Permission check
                if (loginuser == null || loginuser.getUtid() != 1) {
                    RequestDispatcher rd = request.getRequestDispatcher("prompt.jsp");
                    request.setAttribute("promptMsg", "You don't have permission");
                    request.setAttribute("backUrl", "beikemain.jsp");
                    rd.forward(request, response);
                    return;
                }

            } else if (url.endsWith("edithotel.jsp") || url.endsWith("editroom.jsp")) {
                //Permission check
                if (loginuser == null || loginuser.getUtid() != 1) {
                    RequestDispatcher rd =
                            request.getRequestDispatcher("prompt.jsp");
                    request.setAttribute("promptMsg", "You don't have permission");

                    request.setAttribute("backUrl", "beikemain.jsp");
                    rd.forward(request, response);
                    return;
                } else {
                    if (hotel == null) {
                        //it represnt this page will add new hotel
                    } else {
                        if (!hotel.getUserid().equals(loginuser.getUserid())) {
                            RequestDispatcher rd =
                                    request.getRequestDispatcher("prompt.jsp");
                            request.setAttribute("promptMsg", "You don't have permission");
                            request.setAttribute("backUrl", "beikemain.jsp");
                            rd.forward(request, response);
                            return;
                        }
                    }
                }
            }
        }
        //通过的URL继续访问servlet容器，实现正常的请求
        filterChain.doFilter(sRequest, sResponse);
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub

    }
}
