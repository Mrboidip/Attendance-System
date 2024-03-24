/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;


import Model.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author sonnt
 */
public abstract class BasedAuthorizationController extends BasedRequiredAuthenticationController {

    private boolean isAuthorized(Account LoggedUser, HttpServletRequest request) {
        String username = LoggedUser.getUsername();
        String url = request.getServletPath();        
        return LoggedUser.isIsTeacher();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        if (isAuthorized(LoggedUser, request)) {
            doPost(request, response, LoggedUser, true);
        } else {
            request.setAttribute("error", "Access denied!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        if (isAuthorized(LoggedUser, request)) {
            doGet(request, response, LoggedUser, true);
        } else {
            request.setAttribute("error", "Access denied!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response,Account LoggedUser, Boolean isAuthorization) throws ServletException, IOException;

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response,Account LoggedUser, Boolean isAuthorization) throws ServletException, IOException;

}
