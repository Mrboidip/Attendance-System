/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.DataDTO;
import DTO.SessionDTO;
import Helper.DateHelper;
import Model.Account;
import Model.Course;
import Model.Room;
import Model.Session;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.HashMap;
import Model.Class;
import Model.Slot;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

/**
 *
 * @author kienb
 */
public class SessionDBContext extends DBContext {

    public TreeMap<String, List<SessionDTO>> getAllSessionWithCondition(LocalDate fromDate, LocalDate toDate, int accountID, boolean isTeacher) {
        try {
            HashMap<String, List<SessionDTO>> map = new HashMap<>();
            String sql;
            if (!isTeacher) {
                sql = "Select * from Slot s left join ( Select * from [Session] where [date] >= ? and [date] <= ? ) se\n"
                        + "on s.id = se.slotid left join Room r on se.roomid = r.id left join Course course on se.courseid = course.id \n"
                        + "left join Account a on se.teacherId = a.id left join Class c on se.classID = c.id left join (Select * from Account_Class where AccountID = ?) ac\n"
                        + "on se.courseid = ac.CourseID and se.classID = ac.ClassID left join (Select * from Attended where studentid = ?) [at] on [at].roomid = se.roomid and [at].slotid = se.slotid \n"
                        + "and [at].[date] = se.[date]  order by s.id,se.[date]";
            } else {
                sql = "Select * from Slot s left join ( Select * from [Session] where [date] >= ? and [date] <= ? and teacherId = ?) se\n"
                        + "on s.id = se.slotid left join Room r on se.roomid = r.id left join Course course on se.courseid = course.id \n"
                        + "left join Account a on se.teacherId = a.id left join Class c on se.classID = c.id left join Account_Class ac\n"
                        + "on se.courseid = ac.CourseID and se.classID = ac.ClassID left join (Select * from Attended) [at] on [at].roomid = se.roomid and [at].slotid = se.slotid \n"
                        + "and [at].[date] = se.[date]  order by s.id,se.[date]";
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setTimestamp(1, Timestamp.valueOf(fromDate.atStartOfDay()));
            ps.setTimestamp(2, Timestamp.valueOf(toDate.atStartOfDay()));
            ps.setInt(3, accountID);
            if(!isTeacher){
                ps.setInt(4, accountID);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String slotName = rs.getString(2);
                int slotId = rs.getInt(1);
                LocalDate date = null;
                if (rs.getTimestamp(5) != null) {
                    date = rs.getTimestamp(5).toLocalDateTime().toLocalDate();
                }
                List<SessionDTO> list = DateHelper.getDateBetween(fromDate, toDate);
                if (map.containsKey(slotName)) {
                    list = map.get(slotName);
                }
                Session session = null;
                if (rs.getString(19) != null) {
                    session = new Session();
                    session.setDate(date);
                    session.setSlotid(slotId);
                    Room room = new Room();
                    room.setId(rs.getInt(3));
                    room.setName(rs.getString(10));
                    Course course = new Course(rs.getInt(11), rs.getString(12));
                    Account acc = new Account(rs.getInt(13), rs.getString(14), rs.getString(15), rs.getBoolean(16));
                    Class tier = new Class(rs.getInt(17), rs.getString(18));
                    session.setCourse(course);
                    session.setRoom(room);
                    session.setTeacher(acc);
                    session.setTier(tier);
                    session.setStatus(rs.getObject("status") == null ? null : rs.getBoolean("status"));
                }
                for (int i = 0; i < list.size(); i++) {
                    if (date != null && date.isEqual(list.get(i).getDate())) {
                        list.get(i).setSession(session);
                    }
                }
                map.put(slotName, list);
            }
            TreeMap<String, List<SessionDTO>> sorted = new TreeMap<>();

            // Copy all data from hashMap into TreeMap
            sorted.putAll(map);
            return sorted;
        } catch (SQLException e) {
        }
        return null;
    }

    public Session getSession(int rid, int sid, Timestamp date) {
        try {
            String sql = "Select * from [Session] s left join Room r on s.roomid = r.id left join Slot sl on s.slotid = sl.id\n"
                    + "left join Course c on s.courseid = c.id left join Account a on s.teacherId = a.id \n"
                    + "left join [Class] cl on s.classID = cl.id left join (Select * from Attended) [at] \n"
                    + "on [at].roomid = s.roomid and [at].slotid = s.slotid and [at].[date] = s.[date] where s.roomid = ? and s.slotid = ? \n"
                    + "and s.[date] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, rid);
            ps.setInt(2, sid);
            ps.setTimestamp(3, date);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Session session = new Session();
                session.setDate(date.toLocalDateTime().toLocalDate());
                Room room = new Room();
                room.setId(rid);
                session.setSlotid(sid);
                room.setName(rs.getString(10));
                Course course = new Course(rs.getInt(11), rs.getString(12));
                Account acc = new Account(rs.getInt(13), rs.getString(14), rs.getString(15), rs.getBoolean(16));
                Class tier = new Class(rs.getInt(17), rs.getString(18));
                session.setCourse(course);
                session.setRoom(room);
                session.setTeacher(acc);
                session.setTier(tier);
                session.setStatus(rs.getObject("status") == null ? null : rs.getBoolean("status"));
                return session;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean updateSession(int parseInt, int parseInt0, Timestamp timestamp, int parseInt1, int parseInt2, Timestamp newtimestamp) {
        try {
            String sql = "UPDATE [dbo].[Session]\n"
                    + "   SET [roomid] = ?\n"
                    + "      ,[slotid] = ?\n"
                    + "      ,[date] = ?\n"
                    + " WHERE roomid = ? and slotid = ? and [date] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, parseInt1);
            ps.setInt(2, parseInt2);
            ps.setTimestamp(3, newtimestamp);
            ps.setInt(4, parseInt);
            ps.setInt(5, parseInt0);
            ps.setTimestamp(6, timestamp);
            int rsUpdate = ps.executeUpdate();
            return rsUpdate > 0;
        } catch (SQLException e) {
        }
        return false;
    }

    public List<DataDTO> getData() {
        List<DataDTO> list = new ArrayList<>();
        try {
            String sql = "Select c.id,c.[name],cl.id,cl.[name],sl.id,sl.[name] from Course c join [Session] s on c.id = s.courseid join Class cl on cl.id = s.classID \n"
                    + "join Slot sl on sl.id = s.slotid\n"
                    + "where s.date >= '08/01/2023' and s.date <= '09/05/2023'\n"
                    + "group by c.id,c.[name],cl.id,cl.[name],sl.id,sl.[name]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DataDTO data = new DataDTO();
                data.setCourse(new Course(rs.getInt(1), rs.getString(2)));
                data.setTier(new Model.Class(rs.getInt(3), rs.getString(4)));
                data.setSlot(new Slot(rs.getInt(5), rs.getString(6)));
                list.add(data);
            }
            return list;
        } catch (SQLException e) {
        }
        return null;
    }
    
}
