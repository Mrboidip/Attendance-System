/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;

/**
 *
 * @author kienb
 */
public class Attended {
    private int roomid;
    private int slotid;
    private Timestamp date;
    private Account student;
    private Boolean status;

    public Attended() {
    }

    public Attended(int roomid, int slotid, Timestamp date, Account student, Boolean status) {
        this.roomid = roomid;
        this.slotid = slotid;
        this.date = date;
        this.student = student;
        this.status = status;
    }

    

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public int getSlotid() {
        return slotid;
    }

    public void setSlotid(int slotid) {
        this.slotid = slotid;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public Account getStudent() {
        return student;
    }

    public void setStudent(Account student) {
        this.student = student;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    
    
    
}
