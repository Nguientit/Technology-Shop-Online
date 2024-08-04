/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.AccountDBContext;
import dal.RoleDBContext;
import entity.Account;
import entity.Role;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta .servlet.ServletException;
import jakarta .servlet.http.HttpServlet;
import jakarta .servlet.http.HttpServletRequest;
import jakarta .servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Hoang
 */
public class UpdateAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int accountId = Integer.parseInt(request.getParameter("accountID"));
        AccountDBContext accountDB = new AccountDBContext();
        RoleDBContext roleDB = new RoleDBContext();
        
        
        Account account = accountDB.getAccountByAccountID(accountId);
        ArrayList<Role> roles = roleDB.getRoles();
        
        
        request.setAttribute("account", account);
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("../view/admin/updateAccount.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int accountId = Integer.parseInt(request.getParameter("accountID"));
        String temp_status = request.getParameter("status");
        int roleId = Integer.parseInt(request.getParameter("roleID"));
        
        boolean status = temp_status.equalsIgnoreCase("active");
        
        AccountDBContext accountDB = new AccountDBContext();
        RoleDBContext roleDB = new RoleDBContext();
        accountDB.updateStatusByAccountId(status, accountId);
        roleDB.updateRoleByAccountId(roleId, accountId);

        response.sendRedirect(request.getContextPath() + "/admin/listaccount");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
