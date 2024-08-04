/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.DiscountDBContext;
import dal.ProductDetailDBContext;
import entity.ProductDetail;
import entity.Discount;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ManagerAddDiscount extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        showDiscountList(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("savediscount")) {
            saveDiscount(request, response);
        } else {
            processSelectedProducts(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void showDiscountList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDetailDBContext db = new ProductDetailDBContext();
        List<ProductDetail> products = db.getProductsWithoutDiscount();
        request.setAttribute("products", products);
        request.getRequestDispatcher("../view/manager/addDiscount.jsp").forward(request, response);
    }

    private void processSelectedProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] selectedProductIds = request.getParameterValues("selectedProducts");
        if (selectedProductIds != null) {
            ProductDetailDBContext productDetailDB = new ProductDetailDBContext();
            List<ProductDetail> selectedProducts = new ArrayList<>();
            for (String productId : selectedProductIds) {
                ProductDetail productDetail = productDetailDB.getProductDetailsById(Integer.parseInt(productId));
                selectedProducts.add(productDetail);
            }
            request.setAttribute("selectedProducts", selectedProducts);
            request.getRequestDispatcher("../view/manager/newAddDiscount.jsp").forward(request, response);
        } else {
            response.sendRedirect("adddiscount");
        }
    }

    private void saveDiscount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] productIds = request.getParameterValues("productId");
        String discountType = request.getParameter("discountType");
        String discountValueStr = request.getParameter("discountValue");

        if (productIds != null && discountValueStr != null) {
            DiscountDBContext db = new DiscountDBContext();
            boolean valid = true;
            float discountValue = Float.parseFloat(discountValueStr);

            for (String productId : productIds) {
                ProductDetailDBContext productDetailDB = new ProductDetailDBContext();
                ProductDetail productDetail = productDetailDB.getProductDetailsById(Integer.parseInt(productId));
                float originalPrice = productDetail.getOriginalPrice();
                float finalDiscountPrice = 0;

                if ("percentage".equals(discountType)) {
                    finalDiscountPrice = originalPrice - (originalPrice * discountValue / 100);
                } else if ("fixed".equals(discountType)) {
                    finalDiscountPrice = originalPrice - discountValue;
                }

                if (finalDiscountPrice <= 0) {
                    valid = false;
                    break;
                }

                Discount discount = new Discount();
                discount.setPd(productDetail);
                discount.setPriceDiscount(finalDiscountPrice);
                db.insertDiscount(discount);
            }

            if (valid) {
                response.sendRedirect("listdiscount");
            } else {
                request.setAttribute("errorMessage", "Giá giảm phải lớn hơn 0 và nhỏ hơn giá gốc");
                processSelectedProducts(request, response);
            }
        } else {
            response.sendRedirect("adddiscount");
        }
    }
}
