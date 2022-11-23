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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.CustomerFacade;
import model.CustomerOrder;
import model.CustomerOrderFacade;
import model.DeliveryStaff;

/**
 *
 * @author alext
 */
@WebServlet(name = "AddOrder", urlPatterns = {"/AddOrder"})
public class AddOrder extends HttpServlet {

    @EJB
    private CustomerFacade customerFacade;

    @EJB
    private CustomerOrderFacade customerOrderFacade;

    String delivery_id = " ";
    String feedback = " ";
    String order_status = " ";
    Calendar calendar = Calendar.getInstance();
    LocalDate currentdate = LocalDate.now();
    String order_date = currentdate.toString();

    ResultSet resultSet = null;
    Statement statement = null;
    String query1 = null;
    Connection conn = null;
    String url = "jdbc:derby://localhost:1527/sample";
    String cus_ID = null;
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
        
        String product_id = request.getParameter("product_id");
        Double price = Double.parseDouble(request.getParameter("total_price"));
        int qty = Integer.parseInt(request.getParameter("quantity"));

        try (PrintWriter out = response.getWriter()) {

            HttpSession s = request.getSession(false);
            Customer user_id = (Customer) s.getAttribute("login"); //request user id from session
            s.setAttribute("AddOrder", user_id); //set user id            

            cus_ID = user_id.getId();//get cus id    
            String address = user_id.getAddress();   // get cus address

            
            CustomerOrder o = new CustomerOrder(cus_ID, address, price, "Pending", order_date, " ", order_status);
            customerOrderFacade.create(o);
            int orderID = o.getId();
            
            ArrayList<CustomerOrder> cusOrder = user_id.getOrder();
            cusOrder.add(o);
            user_id.setOrder(cusOrder);
            customerFacade.edit(user_id);
            
            
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                conn = DriverManager.getConnection(url, "app", "app");
                statement = conn.createStatement();
                query1 = "DELETE FROM APP.CART ";
                String query2 = "UPDATE APP.PRODUCT SET quantity = quantity - "+ qty + " WHERE ID = '" + product_id +"' " ;
                
                statement.executeUpdate(query1);
                PreparedStatement prepstmt2 = conn.prepareStatement(query2);
                prepstmt2.executeUpdate();
                
//                statement.executeUpdate("DELETE FROM APP.CUSTOMER_CUSTOMERORDER WHERE CUSORDER_ID = '" + orderID +"' ");
                
                
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InstantiationException ex) {
                Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            request.getRequestDispatcher("customerOrderList.jsp").include(request, response);

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
