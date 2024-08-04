/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.DiscountDBContext;
import entity.Discount;
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
public class ManagerListDiscount extends HttpServlet {

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
        handleRequest(request, response);
//        String indexPage = request.getParameter("index");
//        if (indexPage == null) {
//            indexPage = "1";
//        }
//        int index = Integer.parseInt(indexPage);
//
//        String search = request.getParameter("search");
//        DiscountDBContext db = new DiscountDBContext();
//        List<Discount> discounts;
//
//        if (search == null || search.isEmpty()) {
//            int count = db.getTotalDiscount();
//            int endPage = count / 10;
//            if (count % 10 != 0) {
//                endPage++;
//            }
//            discounts = db.pagingDiscounts(index);
//            request.setAttribute("endP", endPage);
//        } else {
//            discounts = db.getSearchByNameDiscount(search);
//            int count = discounts.size();
//            int endPage = count / 10;
//            if (count % 10 != 0) {
//                endPage++;
//            }
//            int start = (index - 1) * 10;
//            int end = Math.min(start + 10, count);
//            discounts = discounts.subList(start, end);
//            request.setAttribute("endP", endPage);
//            request.setAttribute("search", search);
//        }
//
//        request.setAttribute("tag", index);
//        request.setAttribute("discount", discounts);
//        request.getRequestDispatcher("../view/manager/listDiscount.jsp").forward(request, response);
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
        handleRequest(request, response);
//        String name = request.getParameter("search");
//        String indexPage = request.getParameter("index");
//        if (indexPage == null) {
//            indexPage = "1";
//        }
//        int index = Integer.parseInt(indexPage);
//
//        DiscountDBContext db = new DiscountDBContext();
//        List<Discount> discounts;
//
//        if (name == null || name.isEmpty()) {
//            discounts = db.getSearchByNameDiscount(null);
//        } else {
//            discounts = db.getSearchByNameDiscount(name);
//        }
//
//        int count = discounts.size();
//        int endPage = count / 10;
//        if (count % 10 != 0) {
//            endPage++;
//        }
//
//        int start = (index - 1) * 10;
//        int end = Math.min(start + 10, count);
//        List<Discount> paginnatedDiscounts = discounts.subList(start, end);
//        
//        request.setAttribute("discount", paginnatedDiscounts);
//        request.setAttribute("endP", endPage);
//        request.setAttribute("tag", index);
//        request.setAttribute("search", name);
//        request.getRequestDispatcher("../view/manager/listDiscount.jsp").forward(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        String search = request.getParameter("search");
        DiscountDBContext db = new DiscountDBContext();
        List<Discount> discounts;

        if (search == null || search.isEmpty()) {
            int count = db.getTotalDiscount();
            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }
            discounts = db.pagingDiscounts(index);
            request.setAttribute("endP", endPage);
        } else {
            discounts = db.getSearchByNameDiscount(search);
            int count = discounts.size();
            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }
            int start = (index - 1) * 10;
            int end = Math.min(start + 10, count);
            discounts = discounts.subList(start, end);
            request.setAttribute("endP", endPage);
            request.setAttribute("search", search);
        }

        request.setAttribute("tag", index);
        request.setAttribute("discount", discounts);
        request.getRequestDispatcher("../view/manager/listDiscount.jsp").forward(request, response);
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
