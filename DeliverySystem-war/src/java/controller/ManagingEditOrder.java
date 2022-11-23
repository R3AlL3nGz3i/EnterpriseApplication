/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.CustomerOrder;
import model.CustomerOrderFacade;
import model.DeliveryStaff;
import model.DeliveryStaffFacade;

/**
 *
 * @author alext
 */
@WebServlet(name = "EditOrder", urlPatterns = {"/EditOrder"})
public class ManagingEditOrder extends HttpServlet {

    @EJB
    private DeliveryStaffFacade deliveryStaffFacade;

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

        int order_id = Integer.parseInt(request.getParameter("order_id"));
        String cus_ID = (request.getParameter("cus_ID"));
        String deliver_id = (request.getParameter("deliver_ID"));
        double price = Double.parseDouble(request.getParameter("price"));
        String address = (request.getParameter("address"));
        String order_date = (request.getParameter("order_date"));

        String status = request.getParameter("order_status");
        String feedback = (request.getParameter("feedback"));
//   
        if (status.equals("Delivering")) {
            status = "Delivering";
        }   else if ("Delivered".equals(status)) {
            status = "Delivered";}
            else if ("Pending".equals(status)) {
            status = "Pending";}

    
//        switch (order_status) {
//            case "Delivering":
//                status = "Delivering";
//                break;
//            case "Delivered":
//                status = "Delivered";
//                break;
//            default:
//                status = "Pending";
//                break;
//        }
       
        CustomerOrder found = customerOrderFacade.find(order_id);

        try (PrintWriter out = response.getWriter()) {


            if (cus_ID != null || deliver_id != null || address != null || order_date != null || status != null) {
                if (found != null) {
                    CustomerOrder o = new CustomerOrder(order_id,cus_ID, address, price, status, order_date, deliver_id, feedback);
                    customerOrderFacade.edit(o);
                    out.println("<script>" + "alert('Editing Done!')" + "</script>");
                    request.getRequestDispatcher("managingOrderList.jsp").include(request, response);

                } else {
                    out.println("<script>" + "alert('Can't find order!')" + "</script>");

                }
            } else {
                out.println("<script>" + "alert('Please enter all details!')" + "</script>");

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
