/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.ProductDBContext;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author PC
 */
public class ManagerListProduct extends HttpServlet {

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
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        String search = request.getParameter("search");
        ProductDBContext db = new ProductDBContext();
        List<Product> products;

        if (search == null || search.isEmpty()) {
            int count = db.getTotalProduct();
            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }
            products = db.pagingProducts(index);
            request.setAttribute("endP", endPage);
        } else {
            products = db.getsearchByName(search);
            int count = products.size();
            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }
            int start = (index - 1) * 10;
            int end = Math.min(start + 10, count);
            products = products.subList(start, end);
            request.setAttribute("endP", endPage);
            request.setAttribute("search", search); // Set the search term
        }

        request.setAttribute("products", products);
        request.setAttribute("tag", index);
        request.getRequestDispatcher("../view/manager/listProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String name = req.getParameter("search");
        String indexPage = req.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        ProductDBContext db = new ProductDBContext();
        List<Product> products;

        // Perform search by name
        if (name == null || name.isEmpty()) {
            products = db.getsearchByName(null); // Fetch all products if name is empty or null
        } else {
            products = db.getsearchByName(name);
        }

        // Calculate pagination for the search results
        int count = products.size(); // Total count of products after search
        int endPage = count / 10; // Number of pages (assuming 10 products per page)
        if (count % 10 != 0) {
            endPage++;
        }

        // Get the sublist of products for the current page
        int start = (index - 1) * 10;
        int end = Math.min(start + 10, count);
        List<Product> paginatedProducts = products.subList(start, end);

        req.setAttribute("products", paginatedProducts);
        req.setAttribute("endP", endPage);
        req.setAttribute("tag", index); // Set the current page
        req.setAttribute("search", name); // Set the search term

        req.getRequestDispatcher("../view/manager/listProduct.jsp").forward(req, resp);
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
