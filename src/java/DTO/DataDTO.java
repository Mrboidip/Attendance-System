/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import Model.Course;
import Model.Slot;
import Model.Class;

/**
 *
 * @author kienb
 */
public class DataDTO {
    private Course course;
    private Slot slot;
    private Class tier;

    public DataDTO() {
    }

    public DataDTO(Course course, Slot slot, Class tier) {
        this.course = course;
        this.slot = slot;
        this.tier = tier;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Slot getSlot() {
        return slot;
    }

    public void setSlot(Slot slot) {
        this.slot = slot;
    }

    public Class getTier() {
        return tier;
    }

    public void setTier(Class tier) {
        this.tier = tier;
    }
    
    
}
