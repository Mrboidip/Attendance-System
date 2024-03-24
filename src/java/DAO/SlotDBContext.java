/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Slot;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kienb
 */
public class SlotDBContext extends DBContext{
    public List<Slot> getAllSlot() {
        try {
            List<Slot> list = new ArrayList<>();
            String sql = "SELECT *\n"
                    + "  FROM [FPT_Attended].[dbo].[Slot]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Slot r = new Slot();
                r.setId(rs.getInt(1));
                r.setName(rs.getString(2));
                list.add(r);
            }
            return list;
        } catch (SQLException e) {
        }
        return null;
    }
}
