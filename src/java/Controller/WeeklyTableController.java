/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.SessionDBContext;
import DTO.DayDTO;
import DTO.SessionDTO;
import Helper.DateHelper;
import Model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Year;
import java.util.List;
import java.util.TreeMap;

/**
 *
 * @author kienb
 */
public class WeeklyTableController extends BasedRequiredAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        String yearString = request.getParameter("year");
        int year = Year.now().getValue();
        if(yearString != null){
            year = Integer.parseInt(yearString);
        }
        List<DayDTO> list = DateHelper.workingDayOfYear(year);
        String weekString = request.getParameter("DateRange");
        int week = DateHelper.getWeek(list, LocalDate.now());
        if(weekString != null){
            week = Integer.parseInt(weekString);
        }
        int idx = DateHelper.getIndexByWeek(list, week);
        List<SessionDTO> dTOs = list.get(idx).getList();
        SessionDBContext sdc = new SessionDBContext();
        TreeMap<String, List<SessionDTO>> map = sdc.getAllSessionWithCondition(dTOs.get(0).getDate(), dTOs.get(dTOs.size() - 1).getDate(),acc.getId(),acc.isIsTeacher());
        request.setAttribute("map", map);
        request.setAttribute("selectedWeek", week);
        request.setAttribute("selectedYear", year);
        request.setAttribute("listDayDTO", list);
        request.setAttribute("dayWeeks", dTOs);
        request.getRequestDispatcher("WeeklyTimeTable.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        String yearString = request.getParameter("year");
        int year = Year.now().getValue();
        if(yearString != null){
            year = Integer.parseInt(yearString);
        }
        List<DayDTO> list = DateHelper.workingDayOfYear(year);
        String weekString = request.getParameter("DateRange");
        int week = DateHelper.getWeek(list, LocalDate.now());
        if(weekString != null){
            week = Integer.parseInt(weekString);
        }
        int idx = DateHelper.getIndexByWeek(list, week);
        List<SessionDTO> dTOs = list.get(idx).getList();
        SessionDBContext sdc = new SessionDBContext();
        TreeMap<String, List<SessionDTO>> map = sdc.getAllSessionWithCondition(dTOs.get(0).getDate(), dTOs.get(dTOs.size() - 1).getDate(),acc.getId(),acc.isIsTeacher());
        request.setAttribute("map", map);
        request.setAttribute("selectedWeek", week);
        request.setAttribute("selectedYear", year);
        request.setAttribute("listDayDTO", list);
        request.setAttribute("dayWeeks", dTOs);
        request.getRequestDispatcher("WeeklyTimeTable.jsp").forward(request, response);
    }
   
    
}
