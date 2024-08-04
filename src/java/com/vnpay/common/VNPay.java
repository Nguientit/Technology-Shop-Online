package com.vnpay.common;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.math.RoundingMode;

@WebServlet("/VNPay")
public class VNPay extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        String amountParam = req.getParameter("totalAmount");

        System.out.println("Total Amount from POST: " + amountParam); // Log giá trị amountParam từ POST

        long amount;
        try {
            if (amountParam == null || amountParam.isEmpty()) {
                throw new NumberFormatException("Total amount is null or empty");
            }
            BigDecimal bd = new BigDecimal(amountParam);
            bd = bd.setScale(0, RoundingMode.HALF_UP);
            amount = bd.longValue() * 100;
            System.out.println("Converted Amount: " + amount); // Log giá trị amount đã chuyển đổi
        } catch (NumberFormatException e) {
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("code", "01");
            errorResponse.addProperty("message", "Invalid amount: " + e.getMessage());
            Gson gson = new Gson();
            System.out.println("Error: " + e.getMessage()); // Log lỗi
            resp.getWriter().write(gson.toJson(errorResponse));
            return;
        }

        String bankCode = req.getParameter("bankCode");
        System.out.println("Bank Code: " + bankCode);

        String vnp_TxnRef = Config.getRandomNumber(8);
        String vnp_IpAddr = Config.getIpAddress(req);
        System.out.println("Transaction Reference: " + vnp_TxnRef);
        System.out.println("IP Address: " + vnp_IpAddr);

        String vnp_TmnCode = Config.vnp_TmnCode;
        System.out.println("Terminal Code: " + vnp_TmnCode);

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }

        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }

        // Add custom parameters to return URL
        String returnUrl = Config.vnp_ReturnUrl + "?orderId=" + URLEncoder.encode(req.getAttribute("orderId").toString(), "UTF-8")
                        + "&totalAmount=" + URLEncoder.encode(req.getAttribute("totalAmount").toString(), "UTF-8")
                        + "&paymentMethod=" + URLEncoder.encode(req.getAttribute("paymentMethod").toString(), "UTF-8")
                        + "&deliveryAddress=" + URLEncoder.encode(req.getAttribute("deliveryAddress").toString(), "UTF-8");

        vnp_Params.put("vnp_ReturnUrl", returnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator<String> itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }

        String queryUrl = query.toString();
        System.out.println("Query URL: " + queryUrl); // Log query URL

        String vnp_SecureHash = Config.hmacSHA512(Config.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        System.out.println("Payment URL: " + paymentUrl); // Log payment URL

        resp.sendRedirect(paymentUrl);
    }
}
