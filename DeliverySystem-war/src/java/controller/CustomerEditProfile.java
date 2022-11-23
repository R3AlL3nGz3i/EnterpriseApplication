/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.CustomerFacade;

/**
 *
 * @author alext
 */
@WebServlet(name = "CustomerEditProfile", urlPatterns = {"/CustomerEditProfile"})
public class CustomerEditProfile extends HttpServlet {

    @EJB
    private CustomerFacade customerFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         String id = request.getParameter("id");
        String pass = request.getParameter("pass");

        String name = request.getParameter("name");

        String con =  (request.getParameter("contact"));

        String gender = (request.getParameter("gender"));
        String address = request.getParameter("address");
        String IC = request.getParameter("ic");
        String email = request.getParameter("email");
        int contact = Integer.parseInt(con);

        Customer found = customerFacade.find(id);

        try (PrintWriter out = response.getWriter()) {
            HttpSession s = request.getSession(false);
                if (id != null || pass != null || name != null || gender != null || address != null || con != null || IC != null || email != null) {

                    if (found != null) {
                        Customer c = new Customer(id, name, pass, gender, contact, address, IC, email);
                        customerFacade.edit(c);
                        out.println("<script>" + "alert('Edit done!')" + "</script>");
                        request.getRequestDispatcher("customerEditProfile.jsp").include(request, response);

                    } else {
                        out.println("<script>" + "alert('The username has been used!')" + "</script>");
                    }
                }
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
