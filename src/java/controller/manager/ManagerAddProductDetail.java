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
import jakarta.servlet.http.HttpSession;
import util.UploadFile;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class ManagerAddProductDetail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDBContext dBContext = new ProductDBContext();

        // Get the product ID from the request parameters
        int productId = Integer.parseInt(request.getParameter("id"));

        ProductDetailDBContext detailDBContext = new ProductDetailDBContext();
        ProductDetail pd = detailDBContext.getProductDetailsById(productId);

        ArrayList<Product> products = dBContext.listProduct();
        ArrayList<ProductDetail> productDetails = detailDBContext.getListProductDetails();

        request.setAttribute("productdetail", productDetails);
        request.setAttribute("products", products);
        request.setAttribute("pd", pd);
        request.setAttribute("productId", productId); // Pass the product ID to the JSP

        request.getRequestDispatcher("../view/manager/addProductDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        // Handle adding to temporary list
        HttpSession session = request.getSession();
        List<ProductDetail> tempProductDetails = (List<ProductDetail>) session.getAttribute("tempProductDetails");
        if (tempProductDetails == null) {
            tempProductDetails = new ArrayList<>();
        }
        if ("add".equals(action)) {
            // Handle file upload
            UploadFile uploadFile = new UploadFile();
            List<String> imgProduct1 = uploadFile.fileUpload(request, response);

            // Parse form parameters
            ProductDetail pd = new ProductDetail();
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

            String currentImages = request.getParameter("currentImagesValue");
            if (!imgProduct1.isEmpty() && imgProduct1.get(0) != null && !imgProduct1.get(0).isEmpty()) {
                pd.setImage(String.join(",", imgProduct1)); // sử dụng ảnh mới tải lên nếu có 
            } else {
                pd.setImage(currentImages); // Sử dụng hình ảnh hiện có nếu không có hình ảnh mới được tải lên
            }

            tempProductDetails.add(pd);
            session.setAttribute("tempProductDetails", tempProductDetails);
            session.setAttribute("pd", pd);

            response.sendRedirect("addproductdetail?id=" + productId);
        } else if ("save".equals(action)) {
            if (tempProductDetails != null) {
                ProductDetailDBContext db = new ProductDetailDBContext();
                for (ProductDetail pd : tempProductDetails) {
                    db.insertProductDetail(pd);
                }
                session.removeAttribute("tempProductDetails");
            }

            int productId = Integer.parseInt(request.getParameter("pid"));
            response.sendRedirect("listproductdetails?id=" + productId);
        } else if ("delete".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            if (index >= 0 && index < tempProductDetails.size()) {
                tempProductDetails.remove(index);
            }
            session.setAttribute("tempProductDetails", tempProductDetails);
            response.getWriter().write("{\"status\":\"success\"}");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

