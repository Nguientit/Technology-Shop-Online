package controller.customer;

import com.google.gson.JsonObject;
import dal.CartDBContext;
import dal.ProductDetailDBContext;
import entity.Cart;
import entity.CartDetail;
import entity.ProductDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateCartController extends HttpServlet {

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

        String productIdParam = request.getParameter("productId");
        String oldProductDetailIdParam = request.getParameter("oldProductDetailId");
        String newProductDetailIdParam = request.getParameter("newProductDetailId");
        String newColor = request.getParameter("newColor");
        String newCriteria = request.getParameter("newCriteria");

        int productId = Integer.parseInt(productIdParam);
        int oldProductDetailId = Integer.parseInt(oldProductDetailIdParam);
        int newProductDetailId = Integer.parseInt(newProductDetailIdParam);

        // Get the cart from session
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        // Get the new product detail from the database
        ProductDetailDBContext productDetailDB = new ProductDetailDBContext();
        ProductDetail newProductDetail = productDetailDB.getProductDetailById(newProductDetailId);

        JsonObject jsonResponse = new JsonObject();

        try {
            // Replace the old product with the new one in the cart
            if (newProductDetail != null) {
                CartDetail oldCartDetail = cart.getItemByProductDetailId(oldProductDetailId);
                if (oldCartDetail != null) {
                    // Remove the old item
                    cart.removeItem(oldProductDetailId);
                    // Add the new item with the old item's quantity
                    CartDetail newCartDetail = new CartDetail(0, oldCartDetail.getQuantity(), newProductDetail);
                    cart.addItem(newCartDetail);
                    if (session.getAttribute("user") != null) {
                        // Update the database if the user is logged in
                        CartDBContext cartDB = new CartDBContext();
                        cartDB.deleteCartDetail(oldProductDetailId, cart.getId());
                        cartDB.insertCartDetail(newCartDetail, cart.getId());
                    }
                    jsonResponse.addProperty("status", "success");
                } else {
                    jsonResponse.addProperty("status", "error");
                    jsonResponse.addProperty("message", "Sản phẩm cũ không tồn tại trong giỏ hàng.");
                }
            } else {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "Không tìm thấy sản phẩm mới.");
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
