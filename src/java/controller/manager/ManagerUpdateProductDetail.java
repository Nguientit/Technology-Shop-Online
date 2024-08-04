/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.ProductDBContext;
import dal.ProductDetailDBContext;
import entity.Product;
import entity.ProductDetail;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.lang.System.Logger.Level;
import util.UploadFile;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class ManagerUpdateProductDetail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDetailDBContext productDetailDBContext = new ProductDetailDBContext();
        ProductDBContext dBContext = new ProductDBContext();
        int id = Integer.parseInt(request.getParameter("id"));

        ProductDetail productdetail = productDetailDBContext.getProductDetailsById(id);
        ArrayList<Product> products = dBContext.listProduct();

        request.setAttribute("productdetail", productdetail);
        request.setAttribute("products", products);
        request.getRequestDispatcher("../view/manager/updateProductDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Handle file upload
        UploadFile uploadFile = new UploadFile();
        List<String> imgProduct1 = uploadFile.fileUpload(request, response);

        // Parse form parameters
        ProductDetail pd = new ProductDetail();
        int productDetailId = Integer.parseInt(request.getParameter("pdid")); // Get ProductDetail ID
        pd.setId(productDetailId); // Set ProductDetail ID
        int productId = Integer.parseInt(request.getParameter("pid"));

        Product p = new Product();
        p.setId(productId);
        pd.setProduct(p);

        pd.setName(request.getParameter("name"));
        pd.setColor(request.getParameter("color"));
        pd.setSepcifications(request.getParameter("specification"));
        pd.setOriginalPrice(Float.parseFloat(request.getParameter("price")));
        pd.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        pd.setDescribe(request.getParameter("describe"));
        pd.setStatus(Boolean.valueOf(request.getParameter("status")));

        String currentImages = request.getParameter("currentImages");
        if (!imgProduct1.isEmpty() && imgProduct1.get(0) != null && !imgProduct1.get(0).isEmpty()) {
            pd.setImage(String.join(",", imgProduct1)); // sử dụng ảnh mới tải lên nếu có 
        } else {
            pd.setImage(currentImages); // Sử dụng hình ảnh hiện có nếu không có hình ảnh mới được tải lên
        }

        // Update in database
        ProductDetailDBContext detailDBContext = new ProductDetailDBContext();
        detailDBContext.updateProductDetail(pd);

        // Redirect to list page
        response.sendRedirect("listproductdetails?id=" + productId);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
