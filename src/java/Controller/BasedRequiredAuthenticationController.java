/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDBContext;
import Model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 *
 * @author sonnt
 */
public abstract class BasedRequiredAuthenticationController extends HttpServlet {

    private boolean isAuthenticated(HttpServletRequest request) {
        Account account = (Account) request.getSession().getAttribute("account");
        if (account != null) {
            return true;
        } else {
            String user = null;
            String pass = null;
            Cookie[] cookies = request.getCookies();
            for (Cookie cooky : cookies) {
                if (user != null && pass != null) {
                    break;
                }
                if (cooky.equals("user")) {
                    user = cooky.getValue();
                }
                if (cooky.equals("pass")) {
                    pass = cooky.getValue();
                }
            }

            if (user != null && pass != null) {
                AccountDBContext db = new AccountDBContext();
                account = db.getAccount(user, pass);

                if (account != null) {
                    request.getSession().setAttribute("account", account);
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) {
            doGet(request, response, (Account) request.getSession().getAttribute("account"));
        } else {
            request.setAttribute("error", "You need login first");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException;

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException;

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) {
            doPost(request, response, (Account) request.getSession().getAttribute("account"));
        } else {
            request.setAttribute("error", "You need login first");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
