/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.AccountDBContext;
import dal.CartDBContext;
import dal.FeedbackDBContext;
import dal.OrderDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Hoang
 */
public class DeleteAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().print("doGetDeleteAccount");
        int aid = Integer.parseInt(request.getParameter("accountID"));

        OrderDBContext orderDB = new OrderDBContext();
        UserDBContext userDB = new UserDBContext();
        AccountDBContext accountDB = new AccountDBContext();
        CartDBContext cartDB = new CartDBContext();
        FeedbackDBContext feedbackDB = new FeedbackDBContext();

        //Delete account-related data
        orderDB.deleteOrderDeliverByAccountID(aid);
        orderDB.deleteOrderByAccountID(aid);
        userDB.deleteUserByAccountID(aid);
        accountDB.deleteAccountRoleByAccountID(aid);
        feedbackDB.deleteFeedbackByAccountId(aid);
        
        //Delete cart of account
        int cartID = cartDB.getCartIdByAccountID(aid);
        cartDB.deleteCartProductDetailById(cartID);
        cartDB.deleteCartByAccountId(aid);
        
        accountDB.deleteAccountByAccountID(aid);
        
        response.sendRedirect(request.getContextPath() + "/admin/listaccount");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().print("doPostDeleteAccount");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
