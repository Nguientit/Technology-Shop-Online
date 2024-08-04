package controller.customer;

import dal.OrderDBContext;
import entity.Account;
import entity.Order;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

public class OrderHistoryController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderHistoryController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderHistoryController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        OrderDBContext db = new OrderDBContext();
        ArrayList<Order> orders = db.getOrderHistoryByAccountID(user.getAccount().getId());

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("./view/common/orderhistory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        OrderDBContext orderDB = new OrderDBContext();
        boolean success = false;

        try {
            if ("update".equals(action)) {
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                String recipientName = request.getParameter("recipientName");
                String deliveryAddress = request.getParameter("deliveryAddress");
                String deliveryPhone = request.getParameter("deliveryPhone");

                Order order = new Order();
                order.setId(orderId);
                order.setRecipientName(recipientName);
                order.setDeliveryAddress(deliveryAddress);
                order.setDeliveryPhone(deliveryPhone);

                success = orderDB.updateOrder(order);

            } else if ("delete".equals(action)) {
                int orderId = Integer.parseInt(request.getParameter("orderId"));

                success = orderDB.deleteOrder(orderId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (success) {
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
