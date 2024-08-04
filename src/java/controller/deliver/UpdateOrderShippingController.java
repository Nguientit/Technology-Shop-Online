/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.deliver;

import dal.OrderDBContext;
import dal.StatusDBContext;
import entity.Order;
import entity.Status;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Hoang
 */
public class UpdateOrderShippingController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        int orderId = Integer.parseInt(request.getParameter("orderId"));
//
//        OrderDBContext orderDB = new OrderDBContext();
//        Order order = orderDB.getOrderByOrderId(orderId);
//
//        StatusDBContext statusDB = new StatusDBContext();
//        ArrayList<Status> listStatus = statusDB.getStatus();
//
//        request.setAttribute("order", order);
//        request.setAttribute("listStatus", listStatus);
//        request.getRequestDispatcher("../view/deliver/updateOrder.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        String action = request.getParameter("action");
        int statusId;
        if (action.equalsIgnoreCase("view")) {
            StatusDBContext statusDB = new StatusDBContext();
            statusId = statusDB.getStatusIdByStatusName(request.getParameter("orderStatus"));
        } else {
            statusId = Integer.parseInt(request.getParameter("orderStatus"));
        }

        OrderDBContext orderDB = new OrderDBContext();
        orderDB.updateStatusOrderByOrderId(orderId, statusId);
        response.sendRedirect("../deliver/listshipping");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
