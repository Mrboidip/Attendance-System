/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDBContext;
import DAO.AttendDBContext;
import DAO.ClassDBContext;
import DAO.CourseDBContext;
import DTO.AttendDTO;
import Helper.Common;
import Model.Account;
import Model.Course;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author kienb
 */
public class UpdateAttendanceController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

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
        String classID = request.getParameter("class");
        String subjectID = request.getParameter("subject");
        String id = request.getParameter("id");
        AccountDBContext adc = new AccountDBContext();
        Account account = adc.getAccountByID(Integer.parseInt(id));
        ClassDBContext cdb = new ClassDBContext();
        Model.Class cls = cdb.getClassByID(Integer.parseInt(classID));
        CourseDBContext courseDBContext = new CourseDBContext();
        Course course = courseDBContext.getCourseByID(Integer.parseInt(subjectID));
        CourseDBContext courseDB = new CourseDBContext();
        List<AttendDTO> list = courseDB.getAttended(Integer.parseInt(classID), Integer.parseInt(subjectID), Integer.parseInt(id));
        request.setAttribute("list", list);
        request.setAttribute("account", account);
        request.setAttribute("classID", cls);
        request.setAttribute("course", course);
        request.getRequestDispatcher("UpdateAttendance.jsp").forward(request, response);
    }

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
        String roomID = request.getParameter("room");
        String slotID = request.getParameter("slot");
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        String date = request.getParameter("date");
        AttendDBContext atd = new AttendDBContext();
        atd.updateAttend(Integer.parseInt(roomID), Integer.parseInt(slotID), Integer.parseInt(id), status, Common.convertStringToTimestamp(date));
        String url = request.getHeader("referer");
        response.sendRedirect(url);
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
