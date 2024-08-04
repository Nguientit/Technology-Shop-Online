/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import entity.User;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;
import java.util.List;

/**
 *
 * @author Hoang
 */
public class UserDBContext extends DBContext {

    public void deleteUserByAccountID(int aid) {
        try {
            String sql = "DELETE FROM [dbo].[UserProfile]\n"
                    + "      WHERE aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<String> getEmails() {
        ArrayList<String> emails = new ArrayList<>();
        try {
            String sql = "SELECT ugmail AS email FROM [UserProfile]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                String e = rs.getString("email");
                emails.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return emails;
    }

    public ArrayList<String> getPhones() {
        ArrayList<String> phones = new ArrayList<>();
        try {
            String sql = "SELECT uphone AS phone FROM [UserProfile]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                String e = rs.getString("phone");
                phones.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return phones;
    }

    public void insertUser(User user) {
        try {
            String sql = "INSERT INTO [dbo].[UserProfile]\n"
                    + "           ([uname]\n"
                    + "           ,[udob]\n"
                    + "           ,[ugender]\n"
                    + "           ,[ugmail]\n"
                    + "           ,[uaddress]\n"
                    + "           ,[uphone])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user.getName());
            stm.setDate(2, (Date) user.getDob());
            stm.setString(3, user.getGender());
            stm.setString(4, user.getEmail());
            stm.setString(5, user.getAddress());
            stm.setString(6, user.getPhone());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getUserByEmail(String email) {
        try {
            String sql = "SELECT uid,uname,udob,ugender,ugmail,uaddress,uphone FROM [UserProfile]\n"
                    + "WHERE ugmail = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("uid"));
                user.setName(rs.getString("uname"));
                user.setDob(rs.getDate("udob"));
                user.setGender(rs.getString("ugender"));
                user.setEmail(rs.getString("ugmail"));
                user.setAddress(rs.getString("uaddress"));
                user.setPhone(rs.getString("uphone"));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUserByCredential(String credential, String password, String credentialType) {
        String sql = null;
        switch (credentialType) {
            case "username":
                sql = "SELECT\n"
                        + "u.uid, u.uname,u.udob,u.ugender,u.ugmail,u.uaddress,u.uphone,\n"
                        + "a.aid\n"
                        + "FROM Account AS a\n"
                        + "INNER JOIN [UserProfile] AS u ON a.aid = u.aid\n"
                        + "WHERE a.username = ? AND a.password = ?";
                break;
            case "gmail":
                sql = "SELECT\n"
                        + "u.uid,u.uname,u.udob,u.ugender,u.ugmail,u.uaddress,u.uphone,\n"
                        + "a.aid\n"
                        + "FROM Account AS a\n"
                        + "INNER JOIN [UserProfile] AS u ON a.aid = u.aid\n"
                        + "WHERE u.ugmail = ? AND a.password = ?";
                break;
            case "phone":
                sql = "SELECT\n"
                        + "u.uid,u.uname,u.udob,u.ugender,u.ugmail,u.uaddress,u.uphone,\n"
                        + "a.aid\n"
                        + "FROM Account AS a\n"
                        + "INNER JOIN [UserProfile] AS u ON a.aid = u.aid\n"
                        + "WHERE u.uphone = ? AND a.password = ?";
                break;
            default:
                throw new IllegalArgumentException("Invalid credential type: " + credentialType);
        }
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, credential);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("uid"));
                user.setName(rs.getString("uname"));
                user.setDob(rs.getDate("udob"));
                user.setGender(rs.getString("ugender"));
                user.setEmail(rs.getString("ugmail"));
                user.setAddress(rs.getString("uaddress"));
                user.setPhone(rs.getString("uphone"));
                Account account = new Account();
                account.setId(rs.getInt("aid"));
                user.setAccount(account);
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUserByGmailOrPhone(String info) {
        try {
            String sql = "SELECT uid, uname, udob, ugender,ugmail,uaddress,uphone,aid FROM [UserProfile]\n"
                    + "WHERE ugmail LIKE ?\n"
                    + "OR uphone LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, info);
            stm.setString(2, info);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("uid"));
                user.setName(rs.getString("uname"));
                user.setDob(rs.getDate("udob"));
                user.setGender(rs.getString("ugender"));
                user.setEmail(rs.getString("ugmail"));
                user.setAddress(rs.getString("uaddress"));
                user.setPhone(rs.getString("uphone"));
                Account account = new Account();
                account.setId(rs.getInt("aid"));
                user.setAccount(account);
                return user;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUserById(int id) {
        try {
            String sql = "SELECT uid, uname, udob, ugender, ugmail, uaddress, uphone, aid FROM [UserProfile]\n"
                    + "WHERE uid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("uid"));
                user.setName(rs.getString("uname"));
                user.setDob(rs.getDate("udob"));
                user.setGender(rs.getString("ugender"));
                user.setEmail(rs.getString("ugmail"));
                user.setAddress(rs.getString("uaddress"));
                user.setPhone(rs.getString("uphone"));
                Account account = new Account();
                account.setId(rs.getInt("aid"));
                user.setAccount(account);
                return user;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateUserByUid(User user, int uid) {
        try {
            String sql = "UPDATE [dbo].[UserProfile]\n"
                    + "   SET [uname] = ?\n"
                    + "      ,[udob] = ?\n"
                    + "      ,[ugender] = ?\n"
                    + "      ,[ugmail] = ?\n"
                    + "      ,[uaddress] = ?\n"
                    + "      ,[uphone] = ?\n"
                    + " WHERE uid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user.getName());
            stm.setDate(2, (Date) user.getDob());
            stm.setString(3, user.getGender());
            stm.setString(4, user.getEmail());
            stm.setString(5, user.getAddress());
            stm.setString(6, user.getPhone());
            stm.setInt(7, uid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertUserFirstTimeByAccountID(User user, int aid) {
        try {
            String sql = "INSERT INTO [dbo].[UserProfile]\n"
                    + "           ([uname]\n"
                    + "           ,[ugmail]\n"
                    + "           ,[uphone]\n"
                    + "           ,[aid])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user.getName());
            stm.setString(2, user.getEmail());
            stm.setString(3, user.getPhone());
            stm.setInt(4, aid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getEmailByUserID(int uid) {
        try {
            String sql = "SELECT ugmail FROM UserProfile\n"
                    + "WHERE uid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String email;
                email = rs.getString("ugmail");
                return email;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public String getPhoneByUserID(int uid) {
        try {
            String sql = "SELECT uphone FROM UserProfile\n"
                    + "WHERE uid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String phone;
                phone = rs.getString("uphone");
                return phone;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
