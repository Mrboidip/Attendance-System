/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDBContext;
import DAO.ClassDBContext;
import DAO.CourseDBContext;
import Helper.Common;
import Model.Account;
import Model.Course;
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
 * @author kienb
 */
public class ViewAttendanceController extends HttpServlet {

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
            int pagenum = request.getParameter("pagenum") != null ? Integer.parseInt(request.getParameter("pagenum")) : 1;
            String classID = request.getParameter("class");
            String subjectID = request.getParameter("subject");
            AccountDBContext adc = new AccountDBContext();
            List<Account> list;
            if (classID != null && subjectID != null) {
                request.setAttribute("classid", new ClassDBContext().getClassByID(Integer.parseInt(classID)));
                request.setAttribute("courseid", new CourseDBContext().getCourseByID(Integer.parseInt(subjectID)));
                list = adc.getAllAccount(Integer.parseInt(classID), Integer.parseInt(subjectID));
            } else {
                list = new ArrayList<>();
            }
            List<Account> pagingList = Common.pagination(list, pagenum, 5);
            int totalPage = list.size() % 5 == 0 ? (list.size() / 5) : (list.size() / 5 + 1);
            ClassDBContext classDBContext = new ClassDBContext();
            List<Model.Class> classes = classDBContext.getAll();
            CourseDBContext context = new CourseDBContext();
            List<Course> courses = context.getAllCourse();
            request.setAttribute("classes", classes);
            request.setAttribute("courses", courses);
            request.setAttribute("pagenum", pagenum);
            request.setAttribute("totalpage", totalPage);
            request.setAttribute("list", pagingList);
            request.getRequestDispatcher("ViewAttendance.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
