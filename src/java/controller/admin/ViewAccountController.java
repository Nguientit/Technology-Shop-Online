/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.AccountDBContext;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta .servlet.ServletException;
import jakarta .servlet.http.HttpServlet;
import jakarta .servlet.http.HttpServletRequest;
import jakarta .servlet.http.HttpServletResponse;

/**
 *
 * @author Hoang
 */
public class ViewAccountController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        int accountId = Integer.parseInt(request.getParameter("account"));
//        AccountDBContext accountDB = new AccountDBContext();
//        Account account = accountDB.getAccountByAccountID(accountId);
//        
//        request.setAttribute("account", account);
//        request.getRequestDispatcher("../view/admin/viewAccount.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.getWriter().print("doPostViewAccountController");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
