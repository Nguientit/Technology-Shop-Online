/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.AccountDBContext;
import dal.UserDBContext;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Random;
import util.Encryption;

/**
 *
 * @author Hoang
 */
public class ResetPasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String checkOTP = (String) request.getAttribute("checkOTP");
        //If going from servelet CheckOTP to
        if (checkOTP != null) {
            doPost(request, response);
            return;
        } else {
            //Normal
            request.getRequestDispatcher("./view/common/resetpassword.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Get information from user enter
        String checkInfo = request.getParameter("checkInfo");
        //If going from servelet CheckOTP to
        String checkOTP = (String) request.getAttribute("checkOTP");
        
        //If going from resetpassword.jsp
        String isSubmitForm = request.getParameter("isSubmitForm");
        if (isSubmitForm != null) {
            checkOTP = request.getParameter("checkOTP");
        }

        //Check the user exists or not
        UserDBContext userDB = new UserDBContext();
        AccountDBContext accountDB = new AccountDBContext();
        User user = userDB.getUserByGmailOrPhone(checkInfo);

        if (user != null) {
            if (checkOTP != null) {
                //Show new password entry feature in jsp
                request.setAttribute("checkInfo", checkInfo);
                request.setAttribute("infoTrue", "infoTrue");
                request.setAttribute("checkOTP", "checkOTP");
                String newPassword = request.getParameter("newPassword");
                String cfnewPassword = request.getParameter("cfnewPassword");

                //Check password matches or not
                if (newPassword != null && cfnewPassword != null) {
                    accountDB.updatePasswordAccountByAid(Encryption.toSHA1(newPassword), user.getAccount().getId());
                    response.sendRedirect("./home");
                    return;
                }
            } else {
                //Go to the OTP code check page
                String gmail = user.getEmail();
                request.setAttribute("gmail", gmail);
                request.setAttribute("checkInfo", checkInfo);
                request.getRequestDispatcher("./checkotp").forward(request, response);
                return;
            }
        } else {
            request.setAttribute("infoFalse", "Tài khoản không tồn tại trên hệ thống!");
        }

        request.getRequestDispatcher("./view/common/resetpassword.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
