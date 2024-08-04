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
import jakarta .servlet.ServletException;
import jakarta .servlet.http.HttpServlet;
import jakarta .servlet.http.HttpServletRequest;
import jakarta .servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.Encryption;

/**
 *
 * @author Hoang
 */
public class ChangePasswordController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("./view/common/changepassword.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String oldPassword = Encryption.toSHA1(request.getParameter("oldPassword"));
        String newPassword = request.getParameter("newPassword");
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        //Get password by user login
        AccountDBContext accountDB = new AccountDBContext();
        String password =accountDB.getPasswordByUserId(user.getId());
        
        
        
        //Check if the old password is correct or not
        if (password.equals(oldPassword)) {
            //Check if the new password matches the old password
            if(oldPassword.equals(newPassword)){
                request.setAttribute("newPasswordFalse", "Mật khẩu mới trùng với mật khẩu cũ!");
            }else{
                //Update new password
                accountDB.updatePasswordByUserId( Encryption.toSHA1(newPassword), user.getId());
                response.sendRedirect(request.getContextPath() + "/viewprofile");
                return;
            }
        } else {
            request.setAttribute("oldPasswordFalse", "Mật khẩu cũ không đúng!");
        }
        request.getRequestDispatcher("./view/common/changepassword.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
