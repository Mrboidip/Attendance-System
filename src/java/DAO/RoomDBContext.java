/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Room;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kienb
 */
public class RoomDBContext extends DBContext {

    public List<Room> getAllRoom() {
        try {
            List<Room> list = new ArrayList<>();
            String sql = "SELECT *\n"
                    + "  FROM [FPT_Attended].[dbo].[Room]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                r.setId(rs.getInt(1));
                r.setName(rs.getString(2));
                list.add(r);
            }
            return list;
        } catch (SQLException e) {
        }
        return null;
    }

    public Room getRoomByID(int id) {
        try {
            String sql = "Select * from Room where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                r.setId(rs.getInt(1));
                r.setName(rs.getString(2));
                return r;
            }
        } catch (SQLException e) {
        }
        return null;
    }
}
