/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.deliver;

import dal.OrderDBContext;
import dal.StatusDBContext;
import entity.Order;
import entity.Status;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta .servlet.ServletException;
import jakarta .servlet.http.HttpServlet;
import jakarta .servlet.http.HttpServletRequest;
import jakarta .servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Hoang
 */
public class ShippingListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        StatusDBContext statusDB = new StatusDBContext();
        ArrayList<Status> listStatus = statusDB.getStatus();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int accountDeliverId = user.getAccount().getId();
        OrderDBContext orderDB = new OrderDBContext();
        ArrayList<Order> orders = orderDB.getOrderByAccountDeliverId(accountDeliverId);

        
        request.setAttribute("orders", orders);
        request.setAttribute("listStatus", listStatus);
        request.getRequestDispatcher("../view/deliver/shippingList.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        StatusDBContext statusDB = new StatusDBContext();
        ArrayList<Status> listStatus = statusDB.getStatus();
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int accountDeliverId = user.getAccount().getId();
        
        if (action.equalsIgnoreCase("Search")) {
            String search = request.getParameter("search");
            response.getWriter().print(search);
            OrderDBContext orderDB = new OrderDBContext();
            ArrayList<Order> orders = orderDB.getOrderByAccountDeliverIdAndOrderId(accountDeliverId, Integer.parseInt(request.getParameter("search")));

            request.setAttribute("search", search);
            request.setAttribute("orders", orders);
        }

        if (action.equalsIgnoreCase("Filter")) {
            int statusId = Integer.parseInt(request.getParameter("status"));
            
            OrderDBContext orderDB = new OrderDBContext();
            ArrayList<Order> orders = orderDB.getOrderByAccountDeliverIdAndStatusId(accountDeliverId, statusId);
            
            request.setAttribute("orders", orders);
        }
        
        request.setAttribute("listStatus", listStatus);
        request.getRequestDispatcher("../view/deliver/shippingList.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
