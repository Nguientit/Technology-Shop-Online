/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.deliver;

import dal.OrderDBContext;
import dal.ProductDetailDBContext;
import dal.StatusDBContext;
import entity.Order;
import entity.ProductDetail;
import entity.Status;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hoang
 */
public class AddOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().print("doGetAddOrderDeliver");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] selectedOrderIds = request.getParameterValues("selectedOrders");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int accountId = user.getAccount().getId();
        if (selectedOrderIds != null) {
            OrderDBContext orderDB = new OrderDBContext();
            StatusDBContext statusDB = new StatusDBContext();
            int statusId = statusDB.getStatusIdByStatusName("Chờ lấy hàng");
            for (String orderId : selectedOrderIds) {
                orderDB.insertOrderIdToDeliver(Integer.parseInt(orderId), accountId);
                orderDB.updateStatusOrderByOrderId(Integer.parseInt(orderId), statusId);
            }
            response.sendRedirect("../deliver/listshipping");
        } else {
            response.sendRedirect("listorder");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
