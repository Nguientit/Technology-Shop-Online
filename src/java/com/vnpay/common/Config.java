package com.vnpay.common;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Random;
import jakarta.servlet.http.HttpServletRequest;

public class Config {

    public static String vnp_ReturnUrl = "http://localhost:8080/Technology_Store_SWP/VNPayReturn";
    public static String vnp_TmnCode = "2OWDQRY5";
    public static String vnp_HashSecret = "34HHHUDTFW1SH8V8IOGQZIJ7BDY3AZKP";
    public static String vnp_PayUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";

    public static String getRandomNumber(int len) {
        String chars = "0123456789";
        Random rnd = new Random();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        }
        return sb.toString();
    }

    public static String getIpAddress(HttpServletRequest request) {
        String ipAddress = request.getHeader("X-FORWARDED-FOR");
        if (ipAddress == null) {
            ipAddress = request.getRemoteAddr();
        }
        return ipAddress;
    }

    public static String hmacSHA512(String key, String data) {
        try {
            Mac sha512_HMAC = Mac.getInstance("HmacSHA512");
            SecretKeySpec secret_key = new SecretKeySpec(key.getBytes(), "HmacSHA512");
            sha512_HMAC.init(secret_key);
            byte[] bytes = sha512_HMAC.doFinal(data.getBytes());
            StringBuilder hash = new StringBuilder();
            for (byte b : bytes) {
                hash.append(String.format("%02x", b));
            }
            return hash.toString();
        } catch (Exception e) {
            throw new RuntimeException("Failed to generate HMAC SHA-512", e);
        }
    }
}
