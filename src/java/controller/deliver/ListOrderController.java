/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.deliver;

import dal.AccountDBContext;
import dal.OrderDBContext;
import dal.StatusDBContext;
import entity.Account;
import entity.Order;
import entity.Status;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta .servlet.ServletException;
import jakarta .servlet.http.HttpServlet;
import jakarta .servlet.http.HttpServletRequest;
import jakarta .servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hoang
 */
public class ListOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        StatusDBContext statusDB = new StatusDBContext();
        ArrayList<Status> listStatus = statusDB.getStatus();
        int statusId = statusDB.getStatusIdByStatusName("Chờ xử lý");
        OrderDBContext orderDB = new OrderDBContext();
        ArrayList<Order> orders = orderDB.getOrdersByStatusId(statusId);
        
        
                
        request.setAttribute("orders", orders);
        request.setAttribute("listStatus", listStatus);
        request.getRequestDispatcher("../view/deliver/orderList.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        StatusDBContext statusDB = new StatusDBContext();
        ArrayList<Status> listStatus = statusDB.getStatus();
        int statusId = statusDB.getStatusIdByStatusName("Chờ xử lý");
        
        if (action.equalsIgnoreCase("Search")) {
            String search = request.getParameter("search");
            OrderDBContext orderDB = new OrderDBContext();
            ArrayList<Order> orders = orderDB.getOrdersByStatusIdAndOrderId(statusId, Integer.parseInt(request.getParameter("search")));
            
            request.setAttribute("search", search);
            request.setAttribute("orders", orders);
        }
        
        request.setAttribute("listStatus", listStatus);
        request.getRequestDispatcher("../view/deliver/orderList.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
