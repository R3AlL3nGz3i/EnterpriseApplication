/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CustomerOrder;
import model.CustomerOrderFacade;
import model.DeliveryStaff;

/**
 *
 * @author alext
 */
@WebServlet(name = "DeliveryPayment", urlPatterns = {"/DeliveryPayment"})
public class DeliveryPayment extends HttpServlet {

    @EJB
    private CustomerOrderFacade customerOrderFacade;

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

            
            int order_id = Integer.parseInt(request.getParameter("id"));
            
            CustomerOrder found = customerOrderFacade.find(order_id);

        try {
       
            HttpSession s = request.getSession();
            DeliveryStaff user_id = (DeliveryStaff) s.getAttribute("login");
            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
            Connection conn = DriverManager.getConnection(url, "app", "app");

            String user = user_id.getId();

            String query = null;
            String query2 = null;
            query = "UPDATE APP.DELIVERYSTAFF set STATUS= ? WHERE ID = ?";                    
            
            PreparedStatement prepstmt = conn.prepareStatement(query);
            prepstmt.setString(1, "Free");
            prepstmt.setString(2, user);
            prepstmt.executeUpdate();

            query2 = "UPDATE APP.CUSTOMERORDER SET DELIVERY_STATUS = ? WHERE ID = ?";
            
            PreparedStatement prepstmt2 = conn.prepareStatement(query2);
            prepstmt2.setString(1, "Delivered");
            prepstmt2.setInt(2, order_id);
            prepstmt2.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDeleteOrder.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CustomerDeleteOrder.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(CustomerDeleteOrder.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(CustomerDeleteOrder.class.getName()).log(Level.SEVERE, null, ex);
        }

        try (PrintWriter out = response.getWriter()) {

            out.println("Order ID : " + order_id);

            String cus_ID = (request.getParameter("cus_ID"));
            out.println("<p><p><p>Customer ID : " + cus_ID);

            String deliver_id = (request.getParameter("delivery_id"));
            out.println("<p><p><p>Deliver ID : " + deliver_id);

            String address = (request.getParameter("address"));
            out.println("<p><p><p>Address : " + address);

            String order_date = (request.getParameter("order_date"));
            out.println("<p><p><p>Order date : " + order_date);

            double price = Double.parseDouble(request.getParameter("price_order"));
            out.println("<p><p><p>Total Payment (RM): " + price);

          

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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
