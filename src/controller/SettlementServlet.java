package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SettlementServlet", value = "/settlement.do")
public class SettlementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get all data from choicegoods.jsp
        String s_colaprice = request.getParameter("colaprice");
        String s_colanumber = request.getParameter("colanumber");
        String s_hamburgerprice = request.getParameter("hamburgerprice");
        String s_hamburgernumber = request.getParameter("hamburgernumber");
        String s_frenchprice = request.getParameter("frenchFriesprice");
        String s_frenchnumber = request.getParameter("frenchFriesnumber");

        //convert into int
        try {
            int colaprice = Integer.parseInt(s_colaprice);
            int colanumber = Integer.parseInt(s_colanumber);
            int hamburgerprice = Integer.parseInt(s_hamburgerprice);
            int hamburgernumber = Integer.parseInt(s_hamburgernumber);
            int frenchprice = Integer.parseInt(s_frenchprice);
            int frenchnumber = Integer.parseInt(s_frenchnumber);
            int colaAccount = colanumber*colaprice;
            int hamburgerAccount = hamburgernumber*hamburgerprice;
            int frenchAccount = frenchnumber* frenchprice;
            int billAmount = colaAccount + hamburgerAccount + frenchAccount;

            request.setAttribute("colanumber",colanumber);
            request.setAttribute("colaprice",colaprice);
            request.setAttribute("colaAccount",colaAccount);

            request.setAttribute("hamburgerAccount",hamburgerAccount);
            request.setAttribute("hamburgernumber",hamburgernumber);
            request.setAttribute("hamburgerprice",hamburgerprice);

            request.setAttribute("frenchAccount",frenchAccount);
            request.setAttribute("frenchprice",frenchprice);
            request.setAttribute("frenchnumber",frenchnumber);

            request.setAttribute("billAmount", billAmount);
            RequestDispatcher rd = request.getRequestDispatcher("temp/checkAccount.jsp");
            rd.forward(request, response);

        }catch(Exception e){
            System.out.println("Your input value is not interger");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request, response);
    }
}
