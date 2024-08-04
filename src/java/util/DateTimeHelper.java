/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Hoang
 */
public class DateTimeHelper {

    public static java.sql.Date utilDateToSqlDate(java.util.Date utilDate) {
        if (utilDate == null) {
            return null;
        } else {
            long milliseconds = utilDate.getTime();
            return new java.sql.Date(milliseconds);
        }
    }

    public static java.util.Date sqlDateToUtilDate(Date sqlDate) {
        return sqlDate == null ? null : new java.util.Date(sqlDate.getTime());
    }
}
