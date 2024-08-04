/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.product;

import dal.BrandDBContext;
import dal.CategoryDBContext;
import dal.DiscountDBContext;
import dal.ProductDBContext;
import dal.ProductDetailDBContext;
import entity.Brand;
import entity.Category;
import entity.Discount;
import entity.ProductDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author Admin
 */
public class ProductController extends HttpServlet {

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

        ProductDetailDBContext detailsDB = new ProductDetailDBContext();
        BrandDBContext brandDB = new BrandDBContext();
        CategoryDBContext cateDB = new CategoryDBContext();
        ProductDBContext productDB = new ProductDBContext();
        DiscountDBContext disDB = new DiscountDBContext();

        String searchP = request.getParameter("search");
        String cateID = request.getParameter("cid");
        String brandID = request.getParameter("bid");
        String sort = request.getParameter("sort");
        String storageOption = request.getParameter("storage");
        String bid = request.getParameter("bid");

        // Lấy danh sách giảm giá
        List<Discount> listDC = disDB.getDiscounts();
        // Lấy danh sách tất cả các danh mục
        List<Category> listC = cateDB.getAllCategory();
        // Lấy danh sách tất cả các thương hiệu
        List<Brand> listB = brandDB.getAllBrand();
        // Lấy danh sách tất cả các sản phẩm
        List<ProductDetail> listP = productDB.getAllProduct();

        
        // Kiểm tra các tham số lọc
        if (searchP != null && !searchP.isEmpty()) {
            listP = productDB.searchByName(searchP);
        } else if (cateID != null && !cateID.isEmpty()) {
            listP = cateDB.getProductDetailByCategory(cateID);
        } else if (brandID != null && !brandID.isEmpty()) {
            listP = brandDB.getProductDetailByBrand(brandID);
        } else {
            // Nếu không có tham số lọc, lấy tất cả sản phẩm
            listP = productDB.getAllProduct();
        }

        if (brandID != null && !brandID.isEmpty()) {
            listP = brandDB.getProductDetailByBrand(brandID);
        }
        
        // Áp dụng sắp xếp theo giá nếu có tham số sort
        if (sort != null && !sort.isEmpty()) {
            listP = productDB.sortByPrice(listP, sort);
        }

        // Áp dụng lọc theo dung lượng nếu có tham số storageOption
        if (storageOption != null && !storageOption.isEmpty()) {
            listP = detailsDB.getProductsByStorage(storageOption, brandID, cateID, searchP);
        }
        if (cateID != null) {
            int cid = Integer.parseInt(cateID);
            Category categoryName = cateDB.getNameByCategoryId(cid);
            request.setAttribute("categoryName", categoryName);
        }
        if (brandID != null) {
            int brandid = Integer.parseInt(brandID);
            Brand brandName = brandDB.getBrandById(brandid);
            request.setAttribute("brandName", brandName);
        }
        List<ProductDetail> listTopProduct = detailsDB.top3ProductNewByDate();
        request.setAttribute("searchP", searchP);
        request.setAttribute("listP", listP);
        request.setAttribute("listDC", listDC);
        request.setAttribute("listB", listB);
        request.setAttribute("listC", listC);
        request.setAttribute("bid", bid);
        request.setAttribute("listTopProduct", listTopProduct);
        request.setAttribute("storageOption", storageOption);
        request.getRequestDispatcher("/view/guest/product.jsp").forward(request, response);
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
