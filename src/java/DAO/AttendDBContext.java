/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Attended;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kienb
 */
public class AttendDBContext extends DBContext {

    public void updateAttend(List<Attended> list) {
        int rid = list.get(0).getRoomid();
        int slotid = list.get(0).getSlotid();
        Timestamp date = list.get(0).getDate();
        try {
            String sql = "delete from Attended where roomid = ? and slotid = ? and [date] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, rid);
            ps.setInt(2, slotid);
            ps.setTimestamp(3, date);
            ps.executeUpdate();
            String xSQL = "INSERT INTO [dbo].[Attended]\n"
                    + "           ([roomid]\n"
                    + "           ,[slotid]\n"
                    + "           ,[date]\n"
                    + "           ,[studentid]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?)";
            PreparedStatement ptm = connection.prepareStatement(xSQL);
            for (Attended i : list) {
                ptm.setInt(1, rid); //not sure if String or int or long
                ptm.setInt(2, slotid);
                ptm.setTimestamp(3, date);
                ptm.setInt(4, i.getStudent().getId());
                ptm.setBoolean(5, i.getStatus());
                ptm.addBatch();
            }
            ptm.executeBatch();
        } catch (SQLException e) {
        }
    }

    public void updateAttend(int classID, int subjectID, int studentID, String status, Timestamp date) {
        try {
            String xSQL = "DELETE FROM [dbo].[Attended]\n"
                    + "      WHERE roomid = ? and slotid = ? and [date] = ? and studentid = ?";
            PreparedStatement xtm = connection.prepareStatement(xSQL);
            xtm.setInt(1, classID);
            xtm.setInt(2, subjectID);
            xtm.setTimestamp(3, date);
            xtm.setInt(4, studentID);
            xtm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AttendDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (!status.equals("2")) {
            try {
                String sql = "INSERT INTO [dbo].[Attended]\n"
                        + "           ([roomid]\n"
                        + "           ,[slotid]\n"
                        + "           ,[date]\n"
                        + "           ,[studentid]\n"
                        + "           ,[status])\n"
                        + "     VALUES\n"
                        + "           (?,?,?,?,?)";
                PreparedStatement ptm = connection.prepareStatement(sql);
                ptm.setBoolean(5, status.equals("1"));
                ptm.setInt(1, classID);
                ptm.setInt(2, subjectID);
                ptm.setTimestamp(3, date);
                ptm.setInt(4, studentID);
                ptm.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(AttendDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
