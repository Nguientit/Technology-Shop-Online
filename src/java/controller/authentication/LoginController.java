/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dal.AccountDBContext;
import dal.RoleDBContext;
import dal.UserDBContext;
import entity.Account;
import entity.GoogleAccount;
import entity.Role;
import entity.User;
import util.Encryption;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.Encryption;

/**
 *
 * @author PC
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Get code access email
        String code = request.getParameter("code");

        //Get register status to check whether register is required or not
        HttpSession session = request.getSession();
        String register = (String) session.getAttribute("register");

        //If the user login with google will have code
        if (code != null) {
            //Get user information in gmail
            GoogleLogin gg = new GoogleLogin();
            String accessToken = gg.getToken(code);
            GoogleAccount ac = gg.getUserInfo(accessToken);
            String email = ac.getEmail();

            //Get user by email
            UserDBContext userDB = new UserDBContext();
            User user = userDB.getUserByEmail(email);

            //If the user is registering an account by google(register = true and user = null)
            //Or user login with google first time(register = null and user = null)
            if (register != null || user == null) {
                request.setAttribute("email", email);
                request.setAttribute("registerGoogle", "registerGoogle");
                request.getRequestDispatcher("/register").forward(request, response);
                return;
            } else {
                session.setAttribute("user", user);
                request.getRequestDispatcher("home").forward(request, response);
            }
        } else {
            //Login normally
            response.sendRedirect("view/authentication/login.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Get login information from user
        String credential = request.getParameter("credential");
        String password = request.getParameter("password");

        //Check the account exists or not
        AccountDBContext accountDB = new AccountDBContext();
        Account accountUsername = accountDB.getAccountByCredential(credential, Encryption.toSHA1(password), "username");
        Account accountGmail = accountDB.getAccountByCredential(credential, Encryption.toSHA1(password), "gmail");
        Account accountPhone = accountDB.getAccountByCredential(credential, Encryption.toSHA1(password), "phone");

        if (accountUsername != null || accountGmail != null || accountPhone != null) {
            Cookie cUser = new Cookie("credential", credential);
            Cookie cPass = new Cookie("password", Encryption.toSHA1(password));
            cUser.setMaxAge(60 * 60 * 24);
            cPass.setMaxAge(60 * 60 * 24);
            response.addCookie(cUser);
            response.addCookie(cPass);

            UserDBContext userDB = new UserDBContext();
            User user = new User();
            //Get user information based on login information
            if (accountUsername != null) {
                user = userDB.getUserByCredential(credential, Encryption.toSHA1(password), "username");
            }
            if (accountGmail != null) {
                user = userDB.getUserByCredential(credential, Encryption.toSHA1(password), "gmail");
            }
            if (accountPhone != null) {
                user = userDB.getUserByCredential(credential, Encryption.toSHA1(password), "phone");
            }

            if (user == null) {
                HttpSession session = request.getSession();
                session.setAttribute("accountUsername", accountUsername);
                response.sendRedirect(request.getContextPath() + "/firsttime");
                return;
            }

            //Assign users to session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            //Get role
            RoleDBContext roleDB = new RoleDBContext();
            Role role = roleDB.getRoleByAccountID(user.getAccount().getId());

            if (role.getName().equals("Manager")) {
                response.sendRedirect("./homepagemanager");
                return;
            }
            if (role.getName().equals("Admin")) {
                response.sendRedirect("view/admin/homePageAdmin.jsp");
                return;
            }
            if (role.getName().equals("Sale")) {
                response.sendRedirect("./hompagesale");
                return;
            }
            if (role.getName().equals("Deliver")) {
                response.sendRedirect("view/deliver/homePageDeliver.jsp");
                return;
            }
            if (role.getName().equals("Customer")) {
                response.sendRedirect("home");
                return;
            }
        } else {
            //Error message when user enters incorrectly
            request.setAttribute("errorMessage", "Tài khoàn hoặc mật khẩu không đúng");
            request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
