package controller.customer;

import dal.OrderDBContext;
import dal.CartDBContext;
import entity.Order;
import entity.OrderDetail;
import entity.Cart;
import entity.CartDetail;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/order")
public class OrderController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String recipientName = request.getParameter("recipientName");
        String deliveryAddress = request.getParameter("deliveryAddress");
        String deliveryPhone = request.getParameter("deliveryPhone");
        String paymentMethod = request.getParameter("paymentMethod");

        Order order = new Order();
        order.setAccount(user.getAccount());
        order.setDeliveryAddress(deliveryAddress);
        order.setDeliveryPhone(deliveryPhone);
        order.setRecipientName(recipientName);
        order.setPayment(paymentMethod);
        order.setOrdertime(new Date());

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            List<OrderDetail> orderDetails = new ArrayList<>();
            for (CartDetail cartDetail : cart.getItems()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setPdid(cartDetail.getPd().getId());
                orderDetail.setPname(cartDetail.getPd().getName());
                orderDetail.setQuantity(cartDetail.getQuantity());
                orderDetail.setPrice(cartDetail.getPd().getOriginalPrice());
                orderDetails.add(orderDetail);
            }
            order.setOrderDetails(orderDetails); // Đặt danh sách chi tiết đơn hàng vào order
        }

        OrderDBContext orderDB = new OrderDBContext();
        CartDBContext cartDB = new CartDBContext();

        float totalAmount = Float.parseFloat(request.getParameter("totalAmount"));
        order.setAmount(totalAmount); // Set the amount to the order

        if ("COD".equals(paymentMethod)) {
            int orderId = orderDB.insertOrder(order);
            if (orderId != -1) {
                // Xóa giỏ hàng sau khi đặt hàng thành công
                cartDB.clearCart(user.getAccount().getId());
                session.removeAttribute("cart");

                // Đặt các thuộc tính vào request và chuyển hướng đến trang success.jsp
                request.setAttribute("orderId", orderId);
                request.setAttribute("totalAmount", totalAmount);
                request.setAttribute("paymentMethod", paymentMethod);
                request.setAttribute("deliveryAddress", deliveryAddress);
                request.getRequestDispatcher("success.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to process order");
            }
        } else if ("VNPAY".equals(paymentMethod)) {
            int orderId = orderDB.insertOrder(order);
            if (orderId != -1) {
                // Xóa giỏ hàng sau khi đặt hàng thành công
                cartDB.clearCart(user.getAccount().getId());
                session.removeAttribute("cart");
                
                // Chuyển hướng tới servlet VNPay để xử lý thanh toán
                request.setAttribute("orderId", orderId);
                request.setAttribute("totalAmount", totalAmount);
                request.setAttribute("paymentMethod", paymentMethod);
                request.setAttribute("deliveryAddress", deliveryAddress);
                request.getRequestDispatcher("VNPay").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to process order");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Order Controller";
    }
}


