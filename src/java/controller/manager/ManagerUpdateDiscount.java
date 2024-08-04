/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.manager;

import dal.DiscountDBContext;
import entity.Discount;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ManagerUpdateDiscount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DiscountDBContext db = new DiscountDBContext();
        List<Discount> discounts = db.getListDiscounts();
        request.setAttribute("discount", discounts);
        request.getRequestDispatcher("../view/manager/updateDiscount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("savediscount")) {
            saveDiscount(request, response);
        } else {
            processSelectedDiscounts(request, response);
        }
    }
    
    private void processSelectedDiscounts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] selectedDiscountsId = request.getParameterValues("selectedDiscounts");
        if (selectedDiscountsId != null) {
            DiscountDBContext db = new DiscountDBContext();
            List<Discount> selectedDiscounts = new ArrayList<>();
            for (String discountId : selectedDiscountsId) {
                Discount discount = db.getDiscountById(Integer.parseInt(discountId));
                selectedDiscounts.add(discount);
            }
            request.setAttribute("selectedDiscounts", selectedDiscounts);
            request.getRequestDispatcher("../view/manager/newUpdateDiscount.jsp").forward(request, response);
        } else {
            response.sendRedirect("updatediscount");
        }
    }
    
    private void saveDiscount(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String[] discountIds = request.getParameterValues("discountId");
    String discountType = request.getParameter("discountType");
    String discountValueStr = request.getParameter("discountValue");

    if (discountIds != null && discountValueStr != null) {
        DiscountDBContext db = new DiscountDBContext();
        boolean valid = true;
        float discountValue = Float.parseFloat(discountValueStr);

        for (String discountId : discountIds) {
            Discount productDetail = db.getDiscountById(Integer.parseInt(discountId));
            float originalPrice = productDetail.getPriceDiscount();
            float finalDiscountPrice = 0;

            if ("percentage".equals(discountType)) {
                finalDiscountPrice = originalPrice - (originalPrice * discountValue / 100);
            } else if ("fixed".equals(discountType)) {
                finalDiscountPrice = originalPrice - discountValue;
                if (finalDiscountPrice < 0) {
                    finalDiscountPrice = 0; // Điều chỉnh giá bán mới nếu giá quá thấp
                }
            }

            if (finalDiscountPrice <= 0) {
                valid = false;
                break;
            }

            productDetail.setPriceDiscount(finalDiscountPrice);
            db.updateDiscount(productDetail);
        }

        if (valid) {
            response.sendRedirect("listdiscount");
        } else {
            request.setAttribute("errorMessage", "Giá giảm phải lớn hơn 0 và nhỏ hơn giá gốc");
            processSelectedDiscounts(request, response);
        }
    } else {
        response.sendRedirect("updatediscount");
    }
}


    @Override
    public String getServletInfo() {
        return "Servlet for editing discounts";
    }
}
