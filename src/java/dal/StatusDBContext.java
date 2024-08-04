/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import entity.Order;
import entity.Status;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hoang
 */
public class StatusDBContext extends DBContext {

    public ArrayList<Status> getStatus() {
        ArrayList<Status> listStatus = new ArrayList<>();
        try {
            String sql = "SELECT sid, sname FROM [Status]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {

                Status status = new Status();
                status.setId(rs.getInt("sid"));
                status.setName(rs.getString("sname"));

                listStatus.add(status);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listStatus;
    }

    public int getStatusIdByStatusName(String status) {
        try {
            String sql = "SELECT sid FROM [Status]\n"
                    + "WHERE sname LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + status + "%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                return rs.getInt("sid");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
}
