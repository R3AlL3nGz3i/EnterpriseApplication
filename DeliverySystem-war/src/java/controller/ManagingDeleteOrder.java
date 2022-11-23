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
import model.CustomerOrder;
import model.CustomerOrderFacade;

/**
 *
 * @author alext
 */
@WebServlet(name = "ManagingDeleteOrder", urlPatterns = {"/ManagingDeleteOrder"})
public class ManagingDeleteOrder extends HttpServlet {

    @EJB
    private CustomerOrderFacade customerOrderFacade;

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
        Connection conn = null;
//        String cus_ID = (request.getParameter("cus_ID"));
//        String deliver_id = (request.getParameter("deliver_ID"));
//        double price = Double.parseDouble(request.getParameter("price_order"));
//        String address = (request.getParameter("address"));
//        String order_date = (request.getParameter("order_date"));
//
//        String order_status = (request.getParameter("order_status"));
//        String feedback = (request.getParameter("feedback"));
//
        CustomerOrder found = customerOrderFacade.find(order_id);
        String url = "jdbc:derby://localhost:1527/sample";
        try {

        Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
        conn = DriverManager.getConnection(url, "app", "app");

        Statement statement = conn.createStatement();
        statement.executeUpdate("DELETE FROM APP.CUSTOMER_CUSTOMERORDER WHERE CUSORDER_ID= " + order_id);
        statement.executeUpdate("DELETE FROM APP.CUSTOMERORDER WHERE ID = " + order_id );
        statement.close();
        
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
                if (found != null) {
                    customerOrderFacade.remove(found);
                    out.println("<script>" + "alert('Order cancel successfully!')" + "</script>");
                    request.getRequestDispatcher("managingOrderList.jsp").include(request, response);

                } else {
                    out.println("<script>" + "alert('Can't find order!')" + "</script>");

                }                

            }try {
                conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDeleteOrder.class.getName()).log(Level.SEVERE, null, ex);
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
