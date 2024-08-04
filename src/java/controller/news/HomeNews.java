/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.news;


import dal.NewsDBContext;
import entity.News;
import entity.NewsType;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author PC
 */
public class HomeNews extends HttpServlet {

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
        NewsDBContext db = new NewsDBContext();
        //lấy danh sách danh mục type
        List<NewsType> types = db.getAllBlogsTypes();
        request.setAttribute("type", types);

        //lấy blog detail 
        String blogIdParam = request.getParameter("blogId");
        if (blogIdParam != null) {
            int blogId = Integer.parseInt(blogIdParam);
            News blogs = db.selectBlog(blogId);
            request.setAttribute("blogId", blogs);
            request.getRequestDispatcher("./view/sale/newsDetails.jsp").forward(request, response);
            return;
        }

        String categoryIdParam = request.getParameter("categoryId");
        List<News> blogs;
        String typeName = null;
        if (categoryIdParam != null) {
            int categoryId = Integer.parseInt(categoryIdParam);
            blogs = db.getNewsByCategory(categoryId);
            for (NewsType type : types) {
                if (type.getId() == categoryId) {
                    typeName = type.getType();
                    break;
                }
            }
        } else {
            blogs = db.getAllBlogs(); // hoặc lấy tất cả tin tức
        }

        request.setAttribute("news", blogs);
        request.setAttribute("types", typeName);
        request.getRequestDispatcher("./view/sale/homeNews.jsp").forward(request, response);
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
    
    private void handleRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String indexPage = request.getParameter("index");
    if (indexPage == null) {
        indexPage = "1";
    }
    int index = Integer.parseInt(indexPage);

    String search = request.getParameter("search");
    NewsDBContext db = new NewsDBContext();
    List<News> blogs;

    if (search == null || search.isEmpty()) {
        int count = db.getTotalBlogs();
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage++;
        }
        blogs = db.pagingNews(index);
        request.setAttribute("endP", endPage);
    } else {
        blogs = db.getSearchByTitle(search);
        int count = blogs.size();
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage++;
        }
        int start = (index - 1) * 10;
        int end = Math.min(start + 10, count);
        blogs = blogs.subList(start, end);
        request.setAttribute("endP", endPage);
        request.setAttribute("search", search);
    }

    request.setAttribute("tag", index);
    request.setAttribute("blogs", blogs);
    request.getRequestDispatcher("./view/sale/homeNews.jsp").forward(request, response);
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
