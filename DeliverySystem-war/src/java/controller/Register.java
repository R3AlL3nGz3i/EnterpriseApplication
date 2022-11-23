/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.String.valueOf;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ManagingStaff;
import model.ManagingStaffFacade;

/**
 *
 * @author alext
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    @EJB
    private ManagingStaffFacade managingStaffFacade;
    String Countrow = "";

    ResultSet resultSet = null;
    Statement statement = null;
    String query = null;
    Connection conn = null;
    String url = "jdbc:derby://localhost:1527/sample";

   

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

      

        String id = (request.getParameter("id"));
        String user = request.getParameter("name");
        String pass = request.getParameter("pass");
        String position = request.getParameter("position");

        String gender = (request.getParameter("gender"));
        String address = request.getParameter("address");
        String con = (request.getParameter("contact"));
        String IC = request.getParameter("ic");
        String email = request.getParameter("email");
        int contact = Integer.parseInt(con);

        ManagingStaff found = managingStaffFacade.find(id);

        try (PrintWriter out = response.getWriter()) {
            if (id != null || user != null || pass != null || position != null || gender != null || address != null || con != null || IC != null || email != null) {

                if (found == null) {
                    ManagingStaff staff2 = new ManagingStaff(id, pass, user, position, gender, contact, address, IC, email);
                    managingStaffFacade.create(staff2);
                       out.println("<script>" + "alert('Registration done!')" + "</script>");
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
