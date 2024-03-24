/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDate;

/**
 *
 * @author kienb
 */
public class Session {
    private Room room;
    private int slotid;
    private LocalDate date;
    private Course course;
    private Account teacher;
    private Class tier;
    private Boolean status;

    public Session() {
    }

    public Session(Room room, int slotid, LocalDate date, Course course, Account teacher, Class tier) {
        this.room = room;
        this.slotid = slotid;
        this.date = date;
        this.course = course;
        this.teacher = teacher;
        this.tier = tier;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public int getSlotid() {
        return slotid;
    }

    public void setSlotid(int slotid) {
        this.slotid = slotid;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Account getTeacher() {
        return teacher;
    }

    public void setTeacher(Account teacher) {
        this.teacher = teacher;
    }

    public Class getTier() {
        return tier;
    }

    public void setTier(Class tier) {
        this.tier = tier;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    
    

    
}
