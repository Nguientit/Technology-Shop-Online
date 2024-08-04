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
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hoang
 */
public class AccountListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDBContext accountDB = new AccountDBContext();
        RoleDBContext roleDB = new RoleDBContext();
        ArrayList<Role> roles = roleDB.getRoles();
        
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        
        int count = accountDB.getTotalAccount();
        int endPage = count/10;
        if(count % 10 !=0){
            endPage++;
        }
        ArrayList<Account> accounts = accountDB.pagingAccounts(index);
        
        request.setAttribute("accounts", accounts);
        request.setAttribute("endPage", endPage);
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("../view/admin/accountList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        RoleDBContext roleDB = new RoleDBContext();
        ArrayList<Role> roles = roleDB.getRoles();
        
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        
        if (action.equalsIgnoreCase("Search")) {
            String search = request.getParameter("search");
            response.getWriter().print(search);
            AccountDBContext accountDB = new AccountDBContext();
            List<Account> accounts = accountDB.getAccountByUsernameOrEmail(search);

            int count = accounts.size();
            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }
            int start = (index - 1) * 10;
            int end = Math.min(start + 10, count);
            accounts = accounts.subList(start, end);
            request.setAttribute("endPage", endPage);
            
            request.setAttribute("search", search);
            request.setAttribute("accounts", accounts);
        }

        if (action.equalsIgnoreCase("Filter")) {
            int roleId = Integer.parseInt(request.getParameter("role"));
            int statusId = Integer.parseInt(request.getParameter("status"));
            
            AccountDBContext accountDB = new AccountDBContext();
            List<Account> accounts = accountDB.getAccountByRoleOrStatus(roleId,statusId);

            int count = accounts.size();
            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }
            int start = (index - 1) * 10;
            int end = Math.min(start + 10, count);
            accounts = accounts.subList(start, end);
            request.setAttribute("endPage", endPage);
            
            request.setAttribute("accounts", accounts);
        }
        
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("../view/admin/accountList.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
