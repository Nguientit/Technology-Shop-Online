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

public class AddBlogs extends HttpServlet {

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
        NewsDBContext db = new NewsDBContext();
        List<News> blogs = db.getAllBlogs();
        List<NewsType> blogsTypes = db.getAllBlogsTypes();

        request.setAttribute("blogType", blogsTypes);
        request.setAttribute("blog", blogs);
        request.getRequestDispatcher("./view/sale/addBlog.jsp").forward(request, response);
        
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
        // upload file 
        UploadFile uploadFile = new UploadFile();
        List<String> imgProduct = uploadFile.fileUpload(request, response);

        News b = new News();
        NewsType bt = new NewsType();

        bt.setId(Integer.parseInt(request.getParameter("btid")));
        b.setNewsType(bt);

        b.setTitle(request.getParameter("title"));
        if (!imgProduct.isEmpty()) {
            b.setImage(imgProduct.get(0)); // Assuming only one image is uploaded
        } else {
            b.setImage(request.getParameter("image")); // Fallback to the original image if no new image is uploaded
        }
        b.setContent(request.getParameter("contents"));
        b.setStatus(request.getParameter("status").equals("1"));

        NewsDBContext db = new NewsDBContext();
        db.insertBlog(b);
        response.sendRedirect("listnews");

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
