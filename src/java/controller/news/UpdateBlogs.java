/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.news;

import dal.NewsDBContext;
import entity.News;
import entity.NewsType;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class UpdateBlogs extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        NewsDBContext db = new NewsDBContext();
        List<News> blog = db.getAllBlogs();
        int id = Integer.parseInt(request.getParameter("id"));
        
        News blogs = db.selectBlog(id);
        List<NewsType> blogsTypes = db.getAllBlogsTypes();
        
        request.setAttribute("blogs", blog);
        request.setAttribute("blogType", blogsTypes);
        request.setAttribute("blog", blogs);
        request.getRequestDispatcher("./view/sale/updateBlog.jsp").forward(request, response);

    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Upload file logic
        UploadFile uploadFile = new UploadFile();
        List<String> imgProduct = uploadFile.fileUpload(request, response);

        News b = new News();
        NewsType bt = new NewsType();
        bt.setId(Integer.parseInt(request.getParameter("btid")));
        b.setNewsType(bt);
        
        b.setId(Integer.parseInt(request.getParameter("id")));
        b.setTitle(request.getParameter("title"));
        // Get the current image from the form
        String currentImage = request.getParameter("currentImageHidden");

        // Check if a new image was uploaded
        if (imgProduct != null && !imgProduct.isEmpty() && imgProduct.get(0) != null && !imgProduct.get(0).isEmpty()) {
            b.setImage(imgProduct.get(0)); // Use the new uploaded image if available
        } else {
            b.setImage(currentImage); // Use the existing image if no new image is uploaded
        }
        b.setContent(request.getParameter("contents"));
        b.setStatus(Boolean.parseBoolean(request.getParameter("status")));
        
        NewsDBContext db = new NewsDBContext();
        try {
            db.updateBlog(b);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateBlogs.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("listnews");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
