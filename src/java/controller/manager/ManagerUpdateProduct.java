/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.BrandDBContext;
import dal.CategoryDBContext;
import dal.ProductDBContext;
import entity.Brand;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import util.UploadFile;

/**
 *
 * @author PC
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class ManagerUpdateProduct extends HttpServlet {

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
        ProductDBContext db = new ProductDBContext();
        CategoryDBContext db1 = new CategoryDBContext();
        BrandDBContext db2 = new BrandDBContext();

        int id = Integer.parseInt(request.getParameter("id"));

        Product product = db.getProductById(id);
        ArrayList<Category> cats = db1.listcategory();
        ArrayList<Brand> brands = db2.listbrand();
        ArrayList<Product> products = db.listProduct();

        request.setAttribute("products", products);
        request.setAttribute("product", product);
        request.setAttribute("cats", cats);
        request.setAttribute("brands", brands);

        request.getRequestDispatcher("../view/manager/updateProduct.jsp").forward(request, response);

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
        ProductDBContext db = new ProductDBContext();

        // Upload file logic
        UploadFile uploadFile = new UploadFile();
        List<String> imgProduct = uploadFile.fileUpload(request, response);

        Product p = new Product();
        Category c = new Category();
        Brand b = new Brand();
        c.setId(Integer.parseInt(request.getParameter("cid")));
        p.setCategory(c);

        b.setId(Integer.parseInt(request.getParameter("bid")));
        p.setBrand(b);

        p.setId(Integer.parseInt(request.getParameter("id")));
        p.setName(request.getParameter("name"));

        // Get the current image from the form
        String currentImage = request.getParameter("currentImageHidden");

        // Check if a new image was uploaded
        if (imgProduct != null && !imgProduct.isEmpty() && imgProduct.get(0) != null && !imgProduct.get(0).isEmpty()) {
            p.setImage(imgProduct.get(0)); // Use the new uploaded image if available
        } else {
            p.setImage(currentImage); // Use the existing image if no new image is uploaded
        }

        db.updateProduct(p);
        response.sendRedirect("listproduct");
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
