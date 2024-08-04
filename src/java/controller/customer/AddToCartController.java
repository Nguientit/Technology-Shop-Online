package controller.customer;

import com.google.gson.JsonObject;
import dal.CartDBContext;
import dal.ProductDetailDBContext;
import entity.Account;
import entity.Cart;
import entity.CartDetail;
import entity.ProductDetail;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddToCartController extends HttpServlet {

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
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        int productId = Integer.parseInt(request.getParameter("productId"));
        int productDetailId = Integer.parseInt(request.getParameter("productDetailId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        User user = (User) session.getAttribute("user");
        Cart cart;

        if (user == null) {
            // User is not logged in, handle cart using session
            cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        } else {
            // User is logged in, handle cart using database
            CartDBContext cartDB = new CartDBContext();
            Account account = user.getAccount();
            cart = cartDB.getCartByUserId(account.getId());
            if (cart == null) {
                cart = new Cart();
                cart.setAccount(account);
                cartDB.insertCart(cart);
            }
        }

        // Retrieve product detail from the database
        ProductDetailDBContext productDetailDB = new ProductDetailDBContext();
        ProductDetail pd = productDetailDB.getProductDetailById(productDetailId);

        JsonObject jsonResponse = new JsonObject();

        try {
            if (quantity > 0) {  // Add product
                CartDetail existingItem = cart.getItemByProductDetailId(productDetailId);
                if (pd != null && (existingItem == null || existingItem.getQuantity() + quantity <= pd.getQuantity())) {
                    if (existingItem != null) {
                        existingItem.setQuantity(existingItem.getQuantity() + quantity);
                        if (user != null) {
                            CartDBContext cartDB = new CartDBContext();
                            cartDB.updateCartDetail(existingItem, cart.getId());
                        }
                    } else {
                        CartDetail cartDetail = new CartDetail(0, quantity, pd);
                        cart.addItem(cartDetail);
                        if (user != null) {
                            CartDBContext cartDB = new CartDBContext();
                            cartDB.insertCartDetail(cartDetail, cart.getId());
                        }
                    }
                    jsonResponse.addProperty("status", "success");
                } else {
                    jsonResponse.addProperty("status", "error");
                    jsonResponse.addProperty("message", "Đã đạt giới hạn số lượng sản phẩm.");
                }
            } else {  // Reduce product quantity
                CartDetail existingItem = cart.getItemByProductDetailId(productDetailId);
                if (existingItem != null && existingItem.getQuantity() + quantity >= 1) {
                    existingItem.setQuantity(existingItem.getQuantity() + quantity);
                    if (user != null) {
                        CartDBContext cartDB = new CartDBContext();
                        cartDB.updateCartDetail(existingItem, cart.getId());
                    }
                    jsonResponse.addProperty("status", "success");
                } else {
                    jsonResponse.addProperty("status", "error");
                    jsonResponse.addProperty("message", "Số lượng không thể giảm xuống dưới 1.");
                }
            }
        } catch (Exception e) {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Đã xảy ra lỗi không mong muốn!");
            e.printStackTrace();
        }

        // Update cart size in session
        session.setAttribute("cartSize", cart.getItems().size());
        out.print(jsonResponse.toString());
        out.flush();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
