/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.manager;

import com.google.gson.Gson;
import dal.BrandDBContext;
import entity.Brand;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

public class ManagerAddBrand extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BrandDBContext db = new BrandDBContext();
        ArrayList<Brand> brands = db.listbrand();
        request.setAttribute("brands", brands);
        request.getRequestDispatcher("../view/manager/addBrand.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");

        // Thêm thương hiệu vào database
        BrandDBContext brandDAO = new BrandDBContext();
        Brand brand = new Brand();
        brand.setName(name);
        brandDAO.insertBrand(brand);

    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(new Gson().toJson(brand));
       
//        Brand c = new Brand();
//        c.setName(request.getParameter("name"));
//        
//        BrandDBContext db = new BrandDBContext();
//        db.insertBrand(c);
//        response.sendRedirect("addproduct");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

