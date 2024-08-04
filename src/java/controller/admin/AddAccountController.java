/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.AccountDBContext;
import dal.ProductDetailDBContext;
import dal.RoleDBContext;
import entity.Account;
import entity.Product;
import entity.ProductDetail;
import entity.Role;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import util.UploadFile;

/**
 *
 * @author Hoang
 */
public class AddAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RoleDBContext roleDB = new RoleDBContext();
        ArrayList<Role> roles = roleDB.getRoles();

        request.setAttribute("roles", roles);
        request.getRequestDispatcher("../view/admin/addAccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Handle adding to temporary list
            HttpSession session = request.getSession();
            session.removeAttribute("error");
            List<Account> tempAccounts = (List<Account>) session.getAttribute("tempAccounts");
            if (tempAccounts == null) {
                tempAccounts = new ArrayList<>();
            }

            // Parse form parameters
            Account account = new Account();
            account.setUsername(request.getParameter("username"));
            account.setPassword(request.getParameter("password"));
            account.setStatus(request.getParameter("status").equalsIgnoreCase("active"));

            Role role = new Role();
            role.setId(Integer.parseInt(request.getParameter("roleid")));
            account.setRole(role);

            AccountDBContext accountDB = new AccountDBContext();
            ArrayList<Account> accounts =  accountDB.getAllAccount();
            for (Account acc : accounts) {
                if(account.getUsername().equalsIgnoreCase(acc.getUsername())){
                    
                    session.setAttribute("error", "Tài khoản đã tồn tại trên hệ thống");
                    response.sendRedirect("addaccount");
                    return;
                }
            }
            
            for (Account acc : tempAccounts) {
                if(account.getUsername().equalsIgnoreCase(acc.getUsername())){
                    
                    session.setAttribute("error", "Tài khoản đã tồn tại trong danh sách");
                    response.sendRedirect("addaccount");
                    return;
                }
            }
            
            tempAccounts.add(account);
            session.setAttribute("tempAccounts", tempAccounts);
            session.setAttribute("account", account);

            response.sendRedirect("addaccount");
        } else if ("save".equalsIgnoreCase(action)) {

            // Handle saving all to database
            HttpSession session = request.getSession();
            List<Account> tempAccounts = (List<Account>) session.getAttribute("tempAccounts");

            if (tempAccounts != null) {
                AccountDBContext accountDB = new AccountDBContext();
                for (Account acc : tempAccounts) {
                    accountDB.insertAccount(acc);
                    int accountId = accountDB.getAccountIdByUsername(acc.getUsername());
                    accountDB.insertRoleAccount(accountId, acc.getRole().getId());
                }
                session.removeAttribute("tempAccounts");
            }

            response.sendRedirect("listaccount");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
