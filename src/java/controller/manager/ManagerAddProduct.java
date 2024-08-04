package controller.manager;

import dal.BrandDBContext;
import dal.CategoryDBContext;
import dal.ProductDBContext;
import entity.Brand;
import entity.Category;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
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
public class ManagerAddProduct extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CategoryDBContext db = new CategoryDBContext();
        BrandDBContext db1 = new BrandDBContext();
        ProductDBContext productDBContext = new ProductDBContext();
        
        ArrayList<Product> products = productDBContext.listProduct();
        ArrayList<Category> categorys = db.listcategory();
        ArrayList<Brand> brands = db1.listbrand();
        
        request.setAttribute("products", products);
        request.setAttribute("categorys", categorys);
        request.setAttribute("brands", brands);
        
        request.getRequestDispatcher("../view/manager/addProduct.jsp").forward(request, response);
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // upload file 
        UploadFile uploadFile = new UploadFile();
        List<String> imgProduct = uploadFile.fileUpload(request, response);

        Product p = new Product();
        Category c = new Category();
        Brand b = new Brand();
        
        String name = request.getParameter("name");
        String categoryId = request.getParameter("cid");
        String brandId = request.getParameter("bid");
        String newCategoryName = request.getParameter("newCategoryName");
        String newBrandName = request.getParameter("newBrandName");
        String currentImage = request.getParameter("image");
        
        ProductDBContext productDBContext = new ProductDBContext();
        ArrayList<Product> products = productDBContext.listProduct();
        
        for (Product product : products) {
            if(name.equalsIgnoreCase(product.getName())){
                request.setAttribute("errorProductName", "Sản phẩm đã tồn tại");
                request.getRequestDispatcher("../view/manager/addProduct.jsp").forward(request, response);
                return;
            }
        }

        if (newCategoryName != null && !newCategoryName.isEmpty()) {
            CategoryDBContext categoryDAO = new CategoryDBContext();
            Category category = new Category();
            category.setName(newCategoryName);
            categoryDAO.insertCategory(category);
            categoryId = String.valueOf(category.getId());
        }

        if (newBrandName != null && !newBrandName.isEmpty()) {
            BrandDBContext brandDAO = new BrandDBContext();
            Brand brand = new Brand();
            brand.setName(newBrandName);
            brandDAO.insertBrand(brand);
            brandId = String.valueOf(brand.getId());
        }
        
        ProductDBContext productDAO = new ProductDBContext();
        Product product = new Product();
        product.setName(name);
        
        c.setId(Integer.parseInt(categoryId));
        product.setCategory(c);
        
        b.setId(Integer.parseInt(brandId));
        product.setBrand(b);
        
        // Get the current image from the form
       

        // Check if a new image was uploaded
        if (imgProduct != null && !imgProduct.isEmpty() && imgProduct.get(0) != null && !imgProduct.get(0).isEmpty()) {
            product.setImage(imgProduct.get(0)); // Use the new uploaded image if available
        } else {
            product.setImage(currentImage); // Use the existing image if no new image is uploaded
        }
        
        productDAO.insertProduct(product);
        
        response.sendRedirect("listproduct");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

