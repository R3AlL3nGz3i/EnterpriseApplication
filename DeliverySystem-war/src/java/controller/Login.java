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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.CustomerFacade;
import model.DeliveryStaff;
import model.DeliveryStaffFacade;
import model.ManagingStaff;
import model.ManagingStaffFacade;

/**
 *
 * @author alext
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @EJB
    private CustomerFacade customerFacade;

    @EJB
    private DeliveryStaffFacade deliveryStaffFacade;

    @EJB
    private ManagingStaffFacade managingStaffFacade;

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
        //Preregister managing staff
        ManagingStaff staff1 = new ManagingStaff("admin", "123", "Alex555", "ManagingStaff", "M", 6012, "13", "57", "@outlook");
        ManagingStaff preregistered = (managingStaffFacade).find("admin");

        String value = request.getParameter("rememberMe");
        String userid = request.getParameter("userid");
        String pass = request.getParameter("password");

        boolean check = false;
        if (value != null && value.equalsIgnoreCase("on")) {
            check = true;
        }
        if (check) {           //If your checkbox value is true
            Cookie cookieUsername = new Cookie("userid", userid);
            Cookie cookiePassword = new Cookie("pass", pass);

            // Make the cookie one year last
            cookieUsername.setMaxAge(60 * 60 * 24 * 365);
            cookiePassword.setMaxAge(60 * 60 * 24 * 365);
            //Adding the cookies to response header
            response.addCookie(cookieUsername);
            response.addCookie(cookiePassword);
        }

        ManagingStaff found = (managingStaffFacade).find(userid);
        DeliveryStaff found2 = (deliveryStaffFacade).find(userid);
        Customer cusFound = (customerFacade).find(userid);

        if (preregistered == null) {
            managingStaffFacade.create(staff1);
        }

        try (PrintWriter out = response.getWriter()) {

            if (found != null) {
                if (pass.equals(found.getPassword())) {
                    HttpSession s = request.getSession();
                    s.setAttribute("login", found);
                    request.getRequestDispatcher("managingStaffHome.jsp").include(request, response);

                } else {
                    request.getRequestDispatcher("login.jsp").include(request, response);
                    out.println("<script>" + "alert('Sorry, wrong password!')" + "</script>");
                }
            } else if (found2 != null) {
                if (pass.equals(found2.getPassword())) {
                    HttpSession s = request.getSession();
                    s.setAttribute("login", found2);
                    
                    request.getRequestDispatcher("deliveryStaffHome.jsp").include(request, response);

                } else {
                    request.getRequestDispatcher("login.jsp").include(request, response);
                    out.println("<script>" + "alert('Sorry, wrong password!')" + "</script>");
                }

            } else if (cusFound != null) {
                if (pass.equals(cusFound.getPassword())) {

                    HttpSession s = request.getSession();
                    s.setAttribute("login", cusFound);
                    request.getRequestDispatcher("customerProductList.jsp").include(request, response);

                } else {
                    request.getRequestDispatcher("login.jsp").include(request, response);
                        out.println("<script>" + "alert('Sorry, wrong password!')" + "</script>");
                }
            } else if (userid == " " || pass == " ") {
                out.println("<script>" + "alert('Please enter your id and password!')" + "</script>");

            } else {
                out.println("<script>" + "alert('Sorry you are not registered!')" + "</script>");

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
