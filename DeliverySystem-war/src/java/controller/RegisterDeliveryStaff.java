/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DeliveryStaff;
import model.DeliveryStaffFacade;

/**
 *
 * @author alext
 */
@WebServlet(name = "RegisterDeliveryStaff", urlPatterns = {"/RegisterDeliveryStaff"})
public class RegisterDeliveryStaff extends HttpServlet {

    @EJB
    private DeliveryStaffFacade deliveryStaffFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String id = request.getParameter("id");

        String user = request.getParameter("name");
        String pass = request.getParameter("pass");
        String position = request.getParameter("position");

        String gender = (request.getParameter("gender"));
        String address = request.getParameter("address");
        String con = (request.getParameter("contact"));
        String IC = request.getParameter("ic");
        String email = request.getParameter("email");
        int contact = Integer.parseInt(con);
        DeliveryStaff found = deliveryStaffFacade.find(id);

        request.getRequestDispatcher("registerDelivery.jsp").include(request, response);

        try (PrintWriter out = response.getWriter()) {

            if (id != null || user != null || pass != null || position != null || gender != null || address != null || con != null || IC != null || email != null) {

                if (found == null) {
                    DeliveryStaff staff2 = new DeliveryStaff(id, pass, user, position, gender, contact, address, IC, email, "Free");
                    deliveryStaffFacade.create(staff2);
                    out.println("<script>" + "alert('Registration done!')" + "</script>");
                } else {
                    out.println("<script>" + "alert('The username has been registered!')" + "</script>");
                }
            }else{
                out.println("<script>" + "alert('Please fill up the information!')" + "</script>");

            }
        } catch (Exception e) {
            out.println(e);

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
