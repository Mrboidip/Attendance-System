/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import Model.Account;
import Model.Class;
import Model.Room;
import java.time.LocalDate;

/**
 *
 * @author kienb
 */
public class AttendDTO {
    private Room room;
    private int slotid;
    private LocalDate date;
    private Account teacher;
    private Model.Class tier;
    private Boolean status;

    public AttendDTO() {
    }

    public AttendDTO(Room room, int slotid, LocalDate date, Account teacher, Class tier, Boolean status) {
        this.room = room;
        this.slotid = slotid;
        this.date = date;
        this.teacher = teacher;
        this.tier = tier;
        this.status = status;
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
