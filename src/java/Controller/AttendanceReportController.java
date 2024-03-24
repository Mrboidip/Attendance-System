/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CourseDBContext;
import DTO.AttendDTO;
import Model.Account;
import Model.Course;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author kienb
 */
public class AttendanceReportController extends BasedRequiredAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        CourseDBContext context = new CourseDBContext();
        int id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : 0;
        Course course = context.getCourseByID(id);
        HashMap<Course, List<AttendDTO>> list = context.getAllCourseByStudents(acc.getId());
        if(course == null){
            for(Course i : list.keySet()){
                course = i;
                break;
            }
        }
        request.setAttribute("listAtt", list.get(course));
        request.setAttribute("course", course);
        request.setAttribute("list", list.keySet());
        request.getRequestDispatcher("AttendanceReport.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
