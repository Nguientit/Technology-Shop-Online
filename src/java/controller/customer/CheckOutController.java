package controller.customer;

import dal.CategoryDBContext;
import dal.DiscountDBContext;
import dal.OrderDBContext;
import dal.ProductDBContext;
import dal.ProductDetailDBContext;
import dal.UserDBContext;
import entity.Account;
import entity.Cart;
import entity.CartDetail;
import entity.Category;
import entity.Discount;
import entity.Order;
import entity.Status;
import entity.ProductDetail;
import entity.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "CheckOutController", urlPatterns = {"/checkout"})
public class CheckOutController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String searchP = request.getParameter("search");
        ProductDBContext productDB = new ProductDBContext();
        CategoryDBContext cateDB = new CategoryDBContext();
        DiscountDBContext disDB = new DiscountDBContext();
        ProductDetailDBContext pdDB = new ProductDetailDBContext();

        List<ProductDetail> list = productDB.searchByName(searchP);
        List<Category> listC = cateDB.getAllCategory();
        List<Discount> listDC = disDB.getDiscounts();

        request.setAttribute("listP", list);
        request.setAttribute("listC", listC);
        request.setAttribute("listDC", listDC);

        HttpSession session = request.getSession();
        // Check the cart
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }

        // Remove product from cart
        String tRid = request.getParameter("rid");
        if (tRid != null) {
            try {
                int rid = Integer.parseInt(tRid);
                cart.removeItem(rid);
            } catch (NumberFormatException e) {
                // Handle error
            }
        }

        // Get discounts list
        List<Discount> discounts = disDB.getDiscounts();
        List<CartDetail> listItemsInCart = cart.getItems();

        // Update total money in cart
        double totalMoney = cart.getTotalMoney(discounts);

        //
        User user = (User) session.getAttribute("user");
        int userId = user.getId();
        UserDBContext userDB = new UserDBContext();
        User userGetted = userDB.getUserById(userId);
        request.setAttribute("user", userGetted);
        // Update session and attributes
        session.setAttribute("cart", cart);
        session.setAttribute("listItemsInCart", listItemsInCart);
        session.setAttribute("cartSize", listItemsInCart.size());
        session.setAttribute("discounts", discounts);
        session.setAttribute("listDC", discounts);
        session.setAttribute("totalMoney", totalMoney);

        // Set request attributes
        request.setAttribute("cart", cart);
        request.setAttribute("listItemsInCart", listItemsInCart);
        request.setAttribute("cartSize", listItemsInCart.size());
        request.setAttribute("discounts", discounts);
        request.setAttribute("totalMoney", totalMoney);

        // Forward to checkout page
        request.getRequestDispatcher("/view/customer/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processOrder(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    protected void processOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login"); // Redirect to login page if user is not logged in
            return;
        }

        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String number = request.getParameter("number");
        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("paymentMethod");
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

        // Get the cart from session
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart"); // Redirect to cart page if cart is empty
            return;
        }

        // Create a new order
        Order order = new Order();
        order.setRecipientName(name);
        order.setDeliveryPhone(number);
        order.setDeliveryAddress(address);
        order.setPayment(paymentMethod);

        // Set the default status to "Chờ xử lý"
        OrderDBContext orderDB = new OrderDBContext();
        Status status = orderDB.getDefaultStatus();
        order.setStatus(status);
        order.setAccount(user.getAccount());

        // Insert the order into the database
        int orderId = orderDB.insertOrder(order);
        order.setId(orderId);

        // Insert order details
//        for (CartDetail cartDetail : cart.getItems()) {
//            OrderDetail orderDetail = new OrderDetail();
//            orderDetail.setOrder(order);
//            orderDetail.setProductDetail(cartDetail.getPd());
//            orderDetail.setQuantity(cartDetail.getQuantity());
//            orderDB.insertOrderDetail(orderDetail);
//        }

        // Clear the cart
        cart.clear();
        session.setAttribute("cart", cart);
        session.setAttribute("cartSize", 0);
        
        // Set order attributes for success page
        request.setAttribute("orderId", order.getId());
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("deliveryAddress", address);
        request.setAttribute("paymentMethod", paymentMethod);

        // Forward to order success page
        request.getRequestDispatcher("/success.jsp").forward(request, response);
    }
}
