package com.vnpay.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/VNPayReturn")
public class VNPayReturn extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderId = req.getParameter("orderId");
        String totalAmount = req.getParameter("totalAmount");
        String paymentMethod = req.getParameter("paymentMethod");
        String deliveryAddress = req.getParameter("deliveryAddress");

        req.setAttribute("orderId", orderId);
        req.setAttribute("totalAmount", totalAmount);
        req.setAttribute("paymentMethod", paymentMethod);
        req.setAttribute("deliveryAddress", deliveryAddress);

        req.getRequestDispatcher("success.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}