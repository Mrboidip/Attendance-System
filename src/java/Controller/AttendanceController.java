/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AttendDBContext;
import Model.Account;
import Model.Attended;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author kienb
 */
public class AttendanceController extends BasedAuthorizationController {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, Boolean isAuthorization) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Attended> list = (List<Attended>) session.getAttribute("listAtt");
        session.removeAttribute("listAtt");
        for (int idx = 0; idx < list.size(); idx++) {
            String status = request.getParameter(String.valueOf(list.get(idx).getStudent().getId()));
            boolean check = status.equals("1");
            list.get(idx).setStatus(check);
        }
        AttendDBContext adb = new AttendDBContext();
        adb.updateAttend(list);
        response.sendRedirect("weeklyTable");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, Boolean isAuthorization) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
