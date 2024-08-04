/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.UserDBContext;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Hoang
 */
public class UpdateProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userId = user.getId();
        UserDBContext userDB = new UserDBContext();
        User userGetted = userDB.getUserById(userId);

        request.setAttribute("user", userGetted);
        request.getRequestDispatcher("./view/common/updateprofile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().print("doPostUpdateProfile");
        String name = request.getParameter("name");
        String tempDob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String gmail = request.getParameter("gmail");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        java.sql.Date dob = null;
        if (tempDob != null && !tempDob.isEmpty()) {
            try {
                dob = java.sql.Date.valueOf(tempDob);
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            }
        }

        //Get user id by user login
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userId = user.getId();

        UserDBContext userDB = new UserDBContext();
        ArrayList<String> emails = userDB.getEmails();
        ArrayList<String> phones = userDB.getPhones();

        if (!gmail.equalsIgnoreCase(userDB.getEmailByUserID(userId))) {
            //Check for duplicate email
            for (String e : emails) {
                if (e.equalsIgnoreCase(gmail)) {
                    request.setAttribute("name", name);
                    request.setAttribute("dob", dob);
                    request.setAttribute("gender", gender);
                    request.setAttribute("address", address);
                    request.setAttribute("phone", phone);
                    request.setAttribute("errorEmail", "Email đã tồn tại trên hệ thống!");
                    request.getRequestDispatcher("./view/common/updateprofile.jsp").forward(request, response);
                    return;
                }
            }
        }

        if (!phone.equalsIgnoreCase(userDB.getPhoneByUserID(userId))) {
            //Check for duplicate phone
            for (String p : phones) {
                if (p.equalsIgnoreCase(phone)) {
                    request.setAttribute("name", name);
                    request.setAttribute("dob", dob);
                    request.setAttribute("gender", gender);
                    request.setAttribute("email", gmail);
                    request.setAttribute("address", address);
                    request.setAttribute("errorPhone", "Số điện thoại đã tồn tại trên hệ thống!");
                    request.getRequestDispatcher("./view/common/updateprofile.jsp").forward(request, response);
                    return;
                }
            }
        }

        //Update user profile
        User userUpdate = new User(0, name, dob, gender, gmail, address, phone, null);
        userDB.updateUserByUid(userUpdate, userId);

        response.sendRedirect(request.getContextPath() + "/viewprofile");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
