/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.List;
import Model.Class;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kienb
 */
public class ClassDBContext extends DBContext {

    public List<Class> getAll() {
        try {
            List<Class> list = new ArrayList<>();
            String sql = "Select * from Class";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Class c = new Class();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                list.add(c);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ClassDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertAccountClass(int classID, int courseID, int accountID) {
        try {
            String sql = "INSERT INTO [dbo].[Account_Class]\n"
                    + "           ([CourseID]\n"
                    + "           ,[AccountID]\n"
                    + "           ,[ClassID])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, courseID);
            ps.setInt(2, accountID);
            ps.setInt(3, classID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ClassDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean isExisted(int courseID, int accountID) {
        try {
            String sql = "Select * from Account_Class where CourseID = ? and AccountID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, courseID);
            ps.setInt(2, accountID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClassDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public Class getClassByID(int id) {
        try {
            String sql = "Select * from Class where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Class c = new Class();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClassDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
