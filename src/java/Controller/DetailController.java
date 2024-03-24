/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDBContext;
import DAO.SessionDBContext;
import Model.Account;
import Model.Attended;
import Model.Session;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author kienb
 */
public class DetailController extends BasedRequiredAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String sid = request.getParameter("sid");
            String slid = request.getParameter("slid");
            String date = request.getParameter("date");
            SessionDBContext sdb = new SessionDBContext();
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            LocalDate localDate = LocalDate.parse(date);
            Timestamp timestamp = Timestamp.valueOf(localDate.atStartOfDay());
            if (!acc.isIsTeacher()) {
                Session s = sdb.getSession(Integer.parseInt(sid), Integer.parseInt(slid), timestamp);
                request.setAttribute("detail", s);
                request.getRequestDispatcher("CourseDetail.jsp").forward(request, response);
            } else {
                LocalDate lcd = LocalDate.parse(date);
                if (lcd.isEqual(LocalDate.now())) {
                    AccountDBContext adb = new AccountDBContext();
                    List<Attended> list = adb.getAllAccountByClass(Integer.parseInt(sid), Integer.parseInt(slid), timestamp);
                    request.setAttribute("listAtt", list);
                    session.setAttribute("listAtt", list);
                    request.getRequestDispatcher("Attendance.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Hết thời gian sửa điểm danh");
                    Session s = sdb.getSession(Integer.parseInt(sid), Integer.parseInt(slid), timestamp);
                    request.setAttribute("detail", s);
                    request.getRequestDispatcher("CourseDetail.jsp").forward(request, response);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
