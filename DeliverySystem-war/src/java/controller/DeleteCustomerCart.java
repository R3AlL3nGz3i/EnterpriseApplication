/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.CartFacade;
import model.CustomerOrderFacade;
import model.Product;

/**
 *
 * @author alext
 */
@WebServlet(name = "deleteCustomerCart", urlPatterns = {"/deleteCustomerCart"})
public class DeleteCustomerCart extends HttpServlet {

    @EJB
    private CartFacade cartFacade;


    Connection conn;

    
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

        long cartID = Long.parseLong(request.getParameter("id"));
        
        Cart found = cartFacade.find(cartID);
        double price = found.getPrice();
        String product_id = found.getProduct_id();
        int qty = found.getQuantity();
        String cus_ID = found.getCus_id();
        double total = found.getTotal_item();
        
            try (PrintWriter out = response.getWriter()) {
                if (found != null){
                    Cart x = new Cart(cartID, price, product_id, qty, cus_ID,total);
                    cartFacade.remove(x);
                    out.println("<script>" + "alert('Item deleted successfully!')" + "</script>");
                    request.getRequestDispatcher("customerCartList.jsp").include(request, response);

                }else{
                    out.println("<script>" + "alert('Cant find item!')" + "</script>");

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
