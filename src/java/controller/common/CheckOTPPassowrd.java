/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import Validations.SendEmail;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Random;

/**
 *
 * @author Hoang
 */
public class CheckOTPPassowrd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String input1 = request.getParameter("input1");
        String input2 = request.getParameter("input2");
        String input3 = request.getParameter("input3");
        String input4 = request.getParameter("input4");
        String input5 = request.getParameter("input5");
        String checkInfo = request.getParameter("checkInfo");
        String randomNumbers = request.getParameter("randomNumbers");
        int countFalse = Integer.parseInt(request.getParameter("countFalse"));

        //Get the OTP the user entered
        String OTP = input1 + input2 + input3 + input4 + input5;

        //Compare whether the user entered correctly with the OTP sent to gmail
        if (randomNumbers != null && randomNumbers.equals(OTP)) {
            request.setAttribute("checkOTP", "checkOTP");
            request.setAttribute("checkInfo", checkInfo);
            request.getRequestDispatcher("reset").forward(request, response);
        } else {
            countFalse++;
            //If the user enters incorrectly more than 3 times, they will return to the home page
            if (countFalse == 3) {
                request.setAttribute("falseOTP", "Bạn đã nhập sai quá 3 lần, vui lòng kiểm tra lại thông tin!");
            }
            
            //Go to check OTP and enter again
            request.setAttribute("checkInfo", checkInfo);
            request.setAttribute("randomNumbers", randomNumbers);
            request.setAttribute("countFalse", countFalse);
            request.getRequestDispatcher("./view/common/checkOTPreset.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String checkInfo = (String) request.getAttribute("checkInfo");
        String gmail = (String) request.getAttribute("gmail");

        //Generate a random OTP of 5 numbers
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 5; i++) {
            int randomNumber = random.nextInt(10);
            sb.append(randomNumber);
        }
        String randomNumbers = sb.toString();

        //Send Email To Account Reset Password
        sendOTP(gmail, randomNumbers);

        //Go to screen check OTP
        request.setAttribute("checkInfo", checkInfo);
        request.setAttribute("randomNumbers", randomNumbers);
        request.setAttribute("countFalse", 0);
        request.getRequestDispatcher("./view/common/checkOTPreset.jsp").forward(request, response);
    }

    public void sendOTP(String gmail, String OTP) {
        SendEmail.sendMail(gmail, "OTP Reset Password",
                "<html lang=\"zxx\"><div style=\"font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2\">\n"
                + "  <div style=\"margin:50px auto;width:70%;padding:20px 0\">\n"
                + "    <div style=\"border-bottom:1px solid #eee\">\n"
                + "      <a href=\"\" style=\"font-size:1.4em;color: #00466a;text-decoration:none;font-weight:600\">Tech Haven Shop</a>\n"
                + "    </div>\n"
                + "    <p style=\"font-size:1.1em\">Xin chào,</p>\n"
                + "    <p>Sử dụng OTP sau để hoàn tất thủ tục Đặt Lại Mật Khẩu của bạn. OTP có hiệu lực trong 5 phút.</p>\n"
                + "    <h2 style=\"background: #00466a;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;\">" + OTP + "</h2>\n"
                + "    <p style=\"font-size:0.9em;\">Trân trọng,<br />Tech Haven Shop</p>\n"
                + "    <hr style=\"border:none;border-top:1px solid #eee\" />\n"
                + "    <div style=\"float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300\">\n"
                + "    </div>\n"
                + "  </div>\n"
                + "</div></html>");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
