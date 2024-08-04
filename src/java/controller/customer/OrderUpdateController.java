package controller.customer;

import dal.OrderDBContext;
import entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orderupdate")
public class OrderUpdateController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderUpdateController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderUpdateController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        OrderDBContext orderDB = new OrderDBContext();
        boolean success = false;

        if ("update".equals(action)) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String recipientName = request.getParameter("recipientName");
            String deliveryAddress = request.getParameter("deliveryAddress");
            String deliveryPhone = request.getParameter("deliveryPhone");
            String payment = request.getParameter("payment");
            float amount = Float.parseFloat(request.getParameter("amount"));
            
            Order order = new Order();
            order.setId(orderId);
            order.setRecipientName(recipientName);
            order.setDeliveryAddress(deliveryAddress);
            order.setDeliveryPhone(deliveryPhone);
            order.setPayment(payment);
            order.setAmount(amount);

            success = orderDB.updateOrder(order);

        } else if ("delete".equals(action)) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            success = orderDB.deleteOrder(orderId);
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
