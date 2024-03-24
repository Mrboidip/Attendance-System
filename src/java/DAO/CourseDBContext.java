/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.AttendDTO;
import Model.Course;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kienb
 */
public class CourseDBContext extends DBContext {

    public List<Course> getAllCourse() {
        try {
            List<Course> list = new ArrayList<>();
            String sql = "SELECT *\n"
                    + "  FROM [FPT_Attended].[dbo].[Course]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2)));
            }
            return list;
        } catch (SQLException e) {
        }
        return null;
    }

    public HashMap<Course, List<AttendDTO>> getAllCourseByStudents(int id) {
        try {
            AccountDBContext adc = new AccountDBContext();
            RoomDBContext rdbc = new RoomDBContext();
            ClassDBContext classDBContext = new ClassDBContext();
            HashMap<Course, List<AttendDTO>> maps = new HashMap<>();
            String sql = "Select c.id,c.name from Course c join Account_Class ac on c.id = ac.CourseID where AccountID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course(rs.getInt(1), rs.getString(2));
                String xSQL = "Select * from [Session] s left join Attended a on s.roomid = a.roomid and s.slotid = a.slotid and s.[date] = a.[date] \n"
                        + "where courseid = ? and studentid = ?";
                PreparedStatement as = connection.prepareStatement(xSQL);
                as.setInt(1, course.getId());
                as.setInt(2, id);
                ResultSet resultSet = as.executeQuery();
                List<AttendDTO> list = new ArrayList<>();
                while (resultSet.next()) {
                    AttendDTO attendDTO = new AttendDTO();
                    attendDTO.setDate(resultSet.getTimestamp(3).toLocalDateTime().toLocalDate());
                    attendDTO.setRoom(rdbc.getRoomByID(resultSet.getInt(1)));
                    attendDTO.setSlotid(resultSet.getInt(2));
                    attendDTO.setTeacher(adc.getAccountByID(resultSet.getInt(5)));
                    attendDTO.setStatus(resultSet.getBoolean(11));
                    attendDTO.setTier(classDBContext.getClassByID(resultSet.getInt(6)));
                    list.add(attendDTO);
                }
                maps.put(course, list);
            }
            return maps;
        } catch (SQLException e) {
        }
        return null;
    }

    public Course getCourseByID(int id) {
        try {
            List<Course> list = new ArrayList<>();
            String sql = "SELECT *\n"
                    + "  FROM [FPT_Attended].[dbo].[Course] where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Course(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<AttendDTO> getAttended(int classID, int courseID, int studentID) {
        try {
            AccountDBContext adc = new AccountDBContext();
            RoomDBContext rdbc = new RoomDBContext();
            ClassDBContext classDBContext = new ClassDBContext();
            String xSQL = "Select * from [Session] s left join Attended a on s.roomid = a.roomid and s.slotid = a.slotid and s.[date] = a.[date] \n"
                    + "where courseid = ? and studentid = ? and classID = ?";
            PreparedStatement as = connection.prepareStatement(xSQL);
            as.setInt(1, courseID);
            as.setInt(2, studentID);
            as.setInt(3, classID);
            ResultSet resultSet = as.executeQuery();
            List<AttendDTO> list = new ArrayList<>();
            while (resultSet.next()) {
                AttendDTO attendDTO = new AttendDTO();
                attendDTO.setDate(resultSet.getTimestamp(3).toLocalDateTime().toLocalDate());
                attendDTO.setRoom(rdbc.getRoomByID(resultSet.getInt(1)));
                attendDTO.setSlotid(resultSet.getInt(2));
                attendDTO.setTeacher(adc.getAccountByID(resultSet.getInt(5)));
                attendDTO.setStatus(resultSet.getBoolean(11));
                attendDTO.setTier(classDBContext.getClassByID(resultSet.getInt(6)));
                list.add(attendDTO);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
