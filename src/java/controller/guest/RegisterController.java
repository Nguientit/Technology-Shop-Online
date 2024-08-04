/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.guest;

import dal.AccountDBContext;
import dal.GoogleAccountDBContext;
import dal.UserDBContext;
import entity.Account;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DateTimeHelper;
import util.Encryption;

/**
 *
 * @author Hoang
 */
public class RegisterController extends HttpServlet {

    private static final String REGISTER_JSP = "./view/authentication/register.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(REGISTER_JSP).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Get Information User Enter
        String name = request.getParameter("name");
        String tempDob = request.getParameter("dob");
        String tempGender = request.getParameter("gender");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String registerGoogle = request.getParameter("registerGoogle");

        //Move on the right Variable
        Boolean gender = tempGender.equals("male");
        java.sql.Date dob = java.sql.Date.valueOf(tempDob);

        UserDBContext userDB = new UserDBContext();
        AccountDBContext accountDB = new AccountDBContext();
        GoogleAccountDBContext ggAccountDB = new GoogleAccountDBContext();

        //Get phone, email and username to check duplicate
        ArrayList<String> emails = userDB.getEmails();
        ArrayList<String> phones = userDB.getPhones();
        ArrayList<String> usernames = accountDB.getUsernames();

        //Check for duplicate email
        for (String e : emails) {
            if (e.equalsIgnoreCase(email)) {
                request.setAttribute("name", name);
                request.setAttribute("dob", dob);
                request.setAttribute("gender", gender);
                request.setAttribute("email", email);
                request.setAttribute("address", address);
                request.setAttribute("phone", phone);
                request.setAttribute("username", username);
                request.setAttribute("errorEmail", "Email đã tồn tại trên hệ thống!");
                request.getRequestDispatcher(REGISTER_JSP).forward(request, response);
                return;
            }
        }

        //Check for duplicate phone
        for (String p : phones) {
            if (p.equalsIgnoreCase(phone)) {
                request.setAttribute("name", name);
                request.setAttribute("dob", dob);
                request.setAttribute("gender", gender);
                request.setAttribute("email", email);
                request.setAttribute("address", address);
                request.setAttribute("phone", phone);
                request.setAttribute("username", username);
                request.setAttribute("errorPhone", "Số điện thoại đã tồn tại trên hệ thống!");
                request.getRequestDispatcher(REGISTER_JSP).forward(request, response);
                return;
            }
        }

        //Check for duplicate username
        for (String u : usernames) {
            if (u.equals(username)) {
                request.setAttribute("name", name);
                request.setAttribute("dob", dob);
                request.setAttribute("gender", gender);
                request.setAttribute("email", email);
                request.setAttribute("address", address);
                request.setAttribute("phone", phone);
                request.setAttribute("username", username);
                request.setAttribute("errorUsername", "Tài khoản đã tồn tại trên hệ thống!");
                request.getRequestDispatcher(REGISTER_JSP).forward(request, response);
                return;
            }
        }

        //Insert User
//        User user = new User(0, name, dob, gender, email, address, phone);
//        userDB.insertUser(user);
        //Get user had insert to insert into table Account
        User userinserted = userDB.getUserByEmail(email);

        if (registerGoogle != null) {
            ggAccountDB.insertEmailRegister(email, userinserted.getId());
        } else {
            

            Account account = new Account();
            account.setUsername(username);
            account.setPassword(password);
            account.setStatus(true);
            accountDB.insertAccount(account);
            
            int accountID = accountDB.getAccountIdByUsername(username);
            
            account.setId(accountID);
            
            accountDB.insertRoleAccount(account.getId(), 1);
            
            User user = new User();
            user.setName(name);
            user.setDob(dob);
            user.setEmail(email);
            user.setAddress(address);
            user.setPhone(phone);
            user.setAccount(account);
            //Insert Account with uid had inserted
            accountDB.insertUsernamePasswordRegister(user);
        }

        request.setAttribute("notificationSuccessful", "Đăng ký thành công!");
        HttpSession session = request.getSession();
        session.setAttribute("register", null);
        request.getRequestDispatcher(REGISTER_JSP).forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
