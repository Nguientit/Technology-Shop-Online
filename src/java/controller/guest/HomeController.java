/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.guest;

import dal.CartDBContext;
import dal.ProductDBContext;
import dal.DiscountDBContext;
import dal.CategoryDBContext;
import dal.ProductDetailDBContext;
import entity.Cart;
import entity.CartDetail;
import entity.ProductDetail;
import entity.Discount;
import entity.Category;
import entity.Product;
import entity.ProductDetailDTO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

/**
 *
 * @author Admin
 */
public class HomeController extends HttpServlet {

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

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String id = request.getParameter("pid");
        String pdcriteria = request.getParameter("pdcriteria");

        if (pdcriteria != null) {
            pdcriteria = pdcriteria.trim();
        } else {
            pdcriteria = "";
        }

        // Lấy dữ liệu từ các database context
        ProductDBContext productDB = new ProductDBContext();
        ProductDetailDBContext db = new ProductDetailDBContext();
        DiscountDBContext disDB = new DiscountDBContext();
        CategoryDBContext cateDB = new CategoryDBContext();
        CartDBContext cartDB = new CartDBContext();

        // Lấy danh sách các ProductDetailDTO theo id và criteria
        List<ProductDetailDTO> pd = db.getProductDetailsByPidAndCriteria(id, pdcriteria);

        // Lấy danh sách các danh mục sản phẩm
        List<Category> listC = cateDB.getAllCategory();
        List<ProductDetail> listA = db.getAppleProductDetail();
        List<ProductDetail> listS = db.getSamSungProductDetail();
        List<ProductDetail> listX = db.getXiaomiProductDetail();
        List<ProductDetail> listO = db.getOppoProductDetail();
        List<ProductDetail> listM = db.getMacbookProductDetail();

        List<Discount> listDC = disDB.getDiscounts();

        // Truy xuất thông tin giỏ hàng từ Cookies
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

        // Lấy danh sách các sản phẩm
        List<ProductDetail> list = productDB.getAllProduct();
        Cart cart = new Cart(txt, list);

        // Lấy tổng tiền trong giỏ hàng sau khi áp dụng giảm giá
        cart.getTotalMoney(listDC);

        // Đặt các thuộc tính cho request
        request.setAttribute("listDetails", pd);
        request.setAttribute("listC", listC);
        request.setAttribute("listA", listA);
        request.setAttribute("listS", listS);
        request.setAttribute("listX", listX);
        request.setAttribute("listO", listO);
        request.setAttribute("listM", listM);
        request.setAttribute("listDC", listDC);
        request.setAttribute("user", user);
        request.setAttribute("cartSize", cart.getItems().size());
        request.setAttribute("cart", cart);
        request.setAttribute("listItemsInCart", cart.getItems());
        request.setAttribute("discounts", listDC);

        // Forward request tới trang index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
