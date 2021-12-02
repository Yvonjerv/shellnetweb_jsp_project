package controller;

import business.dao.HotelDAO;
import business.impl.HotelDaoImpl;
import model.THotel;
import model.VUser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SaveHotelServlet", value = "/savehotel.do")
public class SaveHotelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //receive all  input value from jsp
        //hotelid, hotelname country province city detailaddr features server photourl

        String id = request.getParameter("hotelid");
        String hotelname = request.getParameter("hotelname");
        String country = request.getParameter("country");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String detailaddr = request.getParameter("detailaddr");
        String features = request.getParameter("features");
        String server = request.getParameter("server");
        String photourl = request.getParameter("photourl");


        HttpSession session = request.getSession();
        VUser loginuser = (VUser) session.getAttribute("loginuser");

//check parameter
        String errMgs = "";
        String backUrl = "edithotel.jsp";
        if (hotelname == null || hotelname.equals("")) {
            errMgs = "hotel name cannot be empty";
        }
        if (loginuser == null || loginuser.getUserid() == null || loginuser.getUtid() == 2) {
            errMgs = "You need to be an administrator to add new hotel";

        }
        if (errMgs != null && !errMgs.equals("")) {
            RequestDispatcher rd = request.getRequestDispatcher("errors.jsp");
            request.setAttribute("errMsg", errMgs);
            request.setAttribute("backUrl", backUrl);
            rd.forward(request, response);
            return;
        }

        //
        HotelDAO hdao = new HotelDaoImpl();

        if (id == null || id.equals("")) {//add new hotel info
            THotel hotel = new THotel();
            hotel.setHotelname(hotelname);
            hotel.setCountry(country);
            hotel.setCity(city);
            hotel.setDetailaddr(detailaddr);
            hotel.setFeatures(features);
            hotel.setServer(server);
            hotel.setProvince(province);
            hotel.setUserid(loginuser.getUserid());
            hotel.setPhotourl(photourl);

            if(hdao.addHotel(hotel)>0){
                RequestDispatcher rd = request.getRequestDispatcher("prompt.jsp");
                request.setAttribute("promptMsg", "Sucessfully added");
                request.setAttribute("backUrl", "hotelmanage.jsp");
                rd.forward(request, response);
                return;
            }else{
                RequestDispatcher rd = request.getRequestDispatcher("errors.jsp");
                request.setAttribute("errMsg", "Failed");
                request.setAttribute("backUrl", backUrl);
                rd.forward(request, response);
                return;
            }

        } else { //update hotel info to database

          THotel hotel = hdao.getHotelByid(Integer.parseInt(id));
//            hotel.setHotelid(Integer.parseInt(id));
            hotel.setHotelname(hotelname);
            hotel.setCountry(country);
            hotel.setCity(city);
            hotel.setDetailaddr(detailaddr);
            hotel.setFeatures(features);
            hotel.setServer(server);
            hotel.setProvince(province);
            hotel.setUserid(loginuser.getUserid());
            hotel.setPhotourl(photourl);

            if(hdao.updateHotel(hotel)){
                RequestDispatcher rd = request.getRequestDispatcher("prompt.jsp");
                request.setAttribute("promptMsg", "Sucessfully updated");
                request.setAttribute("backUrl", "hotelmanage.jsp");
                rd.forward(request, response);
                return;
            }else{
                RequestDispatcher rd = request.getRequestDispatcher("errors.jsp");
                request.setAttribute("errMsg", "update Failed");
                request.setAttribute("backUrl", backUrl);
                rd.forward(request, response);
                return;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
