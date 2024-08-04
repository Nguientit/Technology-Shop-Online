/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Role;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;

/**
 *
 * @author Hoang
 */
public class RoleDBContext extends DBContext {

    public ArrayList<Role> getRoles() {
        ArrayList<Role> roles = new ArrayList<>();
        try {
            String sql = "SELECT roleid, rolename FROM Role";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role role = new Role();
                role.setId(rs.getInt("roleid"));
                role.setName(rs.getString("rolename"));
                roles.add(role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roles;
    }

    public Role getRoleByAccountID(int accountID) {
        try {
            String sql = "SELECT r.roleid, r.rolename FROM Account a\n"
                    + "INNER JOIN Account_Role ra ON a.aid = ra.aid\n"
                    + "INNER JOIN Role r ON ra.roleid = r.roleid\n"
                    + "WHERE a.aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Role role = new Role();
                role.setId(rs.getInt("roleid"));
                role.setName(rs.getString("rolename"));
                return role;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Role> getByUsernameAndUrl(String username, String url) {
        ArrayList<Role> roles = new ArrayList<>();
        try {
            String sql = "SELECT r.roleid,r.rolename FROM Account a\n"
                    + "INNER JOIN Role_Account ra ON ra.username = a.username\n"
                    + "INNER JOIN [Role] r ON r.roleid = ra.roleid\n"
                    + "INNER JOIN [Role_Feature] rf ON rf.roleid = r.roleid\n"
                    + "INNER JOIN Feature f ON f.fid = rf.fid\n"
                    + "WHERE \n"
                    + "a.username = ? AND f.url = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, url);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setId(rs.getInt("roleid"));
                r.setName(rs.getString("rolename"));
                roles.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RoleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roles;
    }

    public void updateRoleByAccountId(int rid, int aid) {
        try {
            String sql = "UPDATE [dbo].[Account_Role]\n"
                    + "   SET [roleid] = ?\n"
                    + " WHERE aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, rid);
            stm.setInt(2, aid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
