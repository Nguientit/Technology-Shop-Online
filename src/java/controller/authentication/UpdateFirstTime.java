/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.authentication;

import dal.UserDBContext;
import entity.Account;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta .servlet.ServletException;
import jakarta .servlet.http.HttpServlet;
import jakarta .servlet.http.HttpServletRequest;
import jakarta .servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Hoang
 */
public class UpdateFirstTime extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("accountUsername");
                
        request.setAttribute("account", account);
        request.getRequestDispatcher("./view/authentication/firstTime.jsp").forward(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int accountID = Integer.parseInt(request.getParameter("accountID"));
        String name = request.getParameter("name");
        String gmail = request.getParameter("email");
        String phone = request.getParameter("phone");
        
        User user = new User();
        user.setName(name);
        user.setEmail(gmail);
        user.setPhone(phone);
        
        UserDBContext userDB = new UserDBContext();
        
       userDB.insertUserFirstTimeByAccountID(user, accountID);
       
       response.sendRedirect(request.getContextPath()+"/login");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
