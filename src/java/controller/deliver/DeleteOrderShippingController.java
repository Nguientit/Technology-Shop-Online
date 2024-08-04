/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.deliver;

import dal.OrderDBContext;
import dal.StatusDBContext;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta .servlet.ServletException;
import jakarta .servlet.http.HttpServlet;
import jakarta .servlet.http.HttpServletRequest;
import jakarta .servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Hoang
 */
public class DeleteOrderShippingController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderid"));
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int accountDeliverId = user.getAccount().getId();
        
        OrderDBContext orderDB = new OrderDBContext();
        orderDB.deleteOrderInShippingListByAccountIdAndOrderId(accountDeliverId, orderId);
        
        StatusDBContext statusDB = new StatusDBContext();
        int statusId = statusDB.getStatusIdByStatusName("Chờ xử lý");
        
        orderDB.updateStatusOrderByOrderId(orderId, statusId);
        
        response.sendRedirect("../deliver/listshipping");
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
