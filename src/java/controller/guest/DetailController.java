    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.guest;

import dal.BrandDBContext;
import dal.CategoryDBContext;
import dal.DiscountDBContext;
import dal.ProductDBContext;
import dal.ProductDetailDBContext;
import entity.Cart;
import entity.CartDetail;
import entity.Category;
import entity.Discount;
import entity.Product;
import entity.ProductDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DetailController", urlPatterns = {"/detail"})
public class DetailController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String searchP = request.getParameter("search");
        ProductDBContext productDB = new ProductDBContext();
        CategoryDBContext cateDB = new CategoryDBContext();
        DiscountDBContext disDB = new DiscountDBContext();
        BrandDBContext brandDB = new BrandDBContext();
        List<ProductDetail> listS = productDB.searchByName(searchP);
        List<Category> listC = cateDB.getAllCategory();
        List<Discount> listDC = disDB.getDiscounts();
        ProductDBContext listDB = new ProductDBContext();
        List<ProductDetail> list = listDB.getAllProduct();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    break;
                }
            }
        }
        DiscountDBContext discountDB = new DiscountDBContext();
        List<Discount> discounts = discountDB.getDiscounts();
        Cart cart = new Cart(txt, list);
        cart.getTotalMoney(discounts);
        List<CartDetail> ListItem = cart.getItems();
        request.setAttribute("cartSize", ListItem.size());
        request.setAttribute("cart", cart);
        request.setAttribute("listItemsInCart",ListItem);
        request.setAttribute("discounts", discounts);
        request.setAttribute("listP", listS);
        request.setAttribute("listC", listC);
        request.setAttribute("listDC", listDC);
        request.getRequestDispatcher("/view/guest/product-details.jsp").forward(request, response);
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
