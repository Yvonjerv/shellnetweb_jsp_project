package controller;

import business.dao.RoomTypeDAO;
import business.impl.RoomTypeDaoImpl;
import model.THotel;
import model.TRoomType;
import model.VUser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SaveRoomTypeServlet", value = "/saveroom.do")
public class SaveRoomTypeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//photourl, roomtype, area bedtype roomserver wifi personamount roomamount price hotelid id

        String id = request.getParameter("typeId");
        String hotelid = request.getParameter("hotelid");
        String roomtype = request.getParameter("roomtype");
        String area = request.getParameter("area");
        String bedtype = request.getParameter("bedtype");
        String roomserver = request.getParameter("server");
        String wifi = request.getParameter("wifi");
        String personamount = request.getParameter("personamount");
        String roomamount = request.getParameter("roomamount");
        String price = request.getParameter("price");
        String photourl = request.getParameter("photourl");

        HttpSession session = request.getSession();
        VUser loginuser = (VUser) session.getAttribute("loginuser");

        //check parameter
        String errMgs = "";
        String backUrl = "editroom.jsp";
        if (roomtype == null || roomtype.equals("")) {
            errMgs = "Room type cannot be empty";
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

        RoomTypeDAO rdao = new RoomTypeDaoImpl();
        if (id == null || id.equals("")) {//add new room info
            TRoomType room = new TRoomType();

            room.setRoomtype(roomtype);
            room.setBedtype(bedtype);
            room.setArea(Integer.parseInt(area));
            room.setRoomamount(Integer.parseInt(roomamount));
            room.setPersonamount(Integer.parseInt(personamount));
            room.setHotelid(Integer.parseInt(hotelid));
            room.setPrice(Integer.parseInt(price));
            room.setPhotourl(photourl);
            room.setWifi(wifi);
            room.setRoomserver(roomserver);

            if (rdao.addHotelRoomType(room)) {
                RequestDispatcher rd = request.getRequestDispatcher("prompt.jsp");
                request.setAttribute("promptMsg", "Sucessfully added");
                request.setAttribute("backUrl", "hotelmanage.jsp");
                rd.forward(request, response);
                return;
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("errors.jsp");
                request.setAttribute("errMsg", "Failed");
                request.setAttribute("backUrl", backUrl);
                rd.forward(request, response);
                return;
            }
        } else {
            TRoomType room = rdao.getRoomTypeById(Integer.parseInt(id));
            room.setRoomtype(roomtype);
            room.setBedtype(bedtype);
            room.setArea(Integer.parseInt(area));
            room.setRoomamount(Integer.parseInt(roomamount));
            room.setPersonamount(Integer.parseInt(personamount));
            room.setPrice(Integer.parseInt(price));
            room.setPhotourl(photourl);
            room.setWifi(wifi);
            room.setRoomserver(roomserver);

            if (rdao.updateHotelRoomType(room)) {
                RequestDispatcher rd = request.getRequestDispatcher("prompt.jsp");
                request.setAttribute("promptMsg", "Updated Sucessfully");
                request.setAttribute("backUrl", "hotelmanage.jsp");
                rd.forward(request, response);
                return;
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("errors.jsp");
                request.setAttribute("errMsg", "Failed");
                request.setAttribute("backUrl", backUrl);
                rd.forward(request, response);
                return;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }
}
