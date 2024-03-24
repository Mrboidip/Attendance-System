/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Helper;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 *
 * @author kienb
 */
public class Common {

    public static List pagination(List list, int pagenum, int pagesize) {
        if (list == null || list.isEmpty()) {
            return Collections.EMPTY_LIST;
        }
        return list.subList((pagenum - 1) * pagesize, Math.min(pagenum * pagesize, list.size()));
    }

    public static Timestamp convertStringToTimestamp(String date) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date parsedDate = dateFormat.parse(date);
            Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
            return timestamp;
        } catch (Exception e) { //this generic but you can control another types of exception
            // look the origin of excption 
        }
        return null;
    }
}
