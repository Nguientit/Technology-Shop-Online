/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import entity.Product;
import entity.Role;
import entity.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.Encryption;

/**
 *
 * @author PC
 */
public class AccountDBContext extends DBContext {

    public int getAccountIdByUsername(String username) {
        try {
            String sql = "SELECT aid FROM Account\n"
                    + "WHERE username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int accountId = rs.getInt("aid");
                return accountId;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public void updateStatusByAccountId(boolean status, int aid) {
        try {
            String sql = "UPDATE [dbo].[Account]\n"
                    + "   SET [status] = ?\n"
                    + " WHERE aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, status);
            stm.setInt(2, aid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Account getAccountByAccountID(int aid) {
        try {
            String sql = "SELECT\n"
                    + "a.aid,a.username,a.status,\n"
                    + "u.uid,u.uname,u.udob,u.ugender,u.ugmail,u.uaddress,u.uphone,\n"
                    + "r.roleid,r.rolename\n"
                    + "FROM Account a\n"
                    + "INNER JOIN UserProfile u ON a.aid = u.aid\n"
                    + "INNER JOIN Account_Role ar ON a.aid = ar.aid\n"
                    + "INNER JOIN Role r ON ar.roleid = r.roleid\n"
                    + "WHERE a.aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                //Account
                Account acc = new Account();
                acc.setId(rs.getInt("aid"));
                acc.setUsername(rs.getString("username"));
                acc.setStatus(rs.getBoolean("status"));
                //User
                User user = new User();

                user.setId(rs.getInt("uid"));
                user.setName(rs.getString("uname"));
                user.setDob(rs.getDate("udob"));
                user.setGender(rs.getString("ugender"));
                user.setEmail(rs.getString("ugmail"));
                user.setAddress(rs.getString("uaddress"));
                user.setPhone(rs.getString("uphone"));
                acc.setUser(user);
                //Role
                Role role = new Role();
                role.setId(rs.getInt("roleid"));
                role.setName(rs.getString("rolename"));
                acc.setRole(role);

                return acc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void deleteAccountByAccountID(int aid) {
        try {
            String sql = "DELETE FROM [dbo].[Account]\n"
                    + "      WHERE aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAccountRoleByAccountID(int aid) {
        try {
            String sql = "DELETE FROM [dbo].[Account_Role]\n"
                    + "      WHERE aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Account> getAllAccount() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "a.aid,a.username,a.status,\n"
                    + "u.uid,u.ugmail,\n"
                    + "r.roleid,r.rolename\n"
                    + "FROM Account a\n"
                    + "INNER JOIN UserProfile u ON a.aid = u.aid\n"
                    + "INNER JOIN Account_Role ar ON a.aid = ar.aid\n"
                    + "INNER JOIN Role r ON ar.roleid = r.roleid";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                //Account
                Account acc = new Account();
                acc.setId(rs.getInt("aid"));
                acc.setUsername(rs.getString("username"));
                acc.setStatus(rs.getBoolean("status"));
                //User
                User user = new User();
                user.setId(rs.getInt("uid"));
                user.setEmail(rs.getString("ugmail"));
                acc.setUser(user);
                //Role
                Role role = new Role();
                role.setId(rs.getInt("roleid"));
                role.setName(rs.getString("rolename"));
                acc.setRole(role);

                accounts.add(acc);

            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }

    public List<Account> getAccountByUsernameOrEmail(String search) {
        List<Account> accounts = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "a.aid,a.username,a.status,\n"
                    + "u.uid,u.ugmail,u.uname,u.udob,u.ugender,u.uaddress,u.uphone,\n"
                    + "r.roleid,r.rolename\n"
                    + "FROM Account a\n"
                    + "LEFT JOIN UserProfile u ON a.aid = u.aid\n"
                    + "LEFT JOIN Account_Role ar ON a.aid = ar.aid\n"
                    + "LEFT JOIN Role r ON ar.roleid = r.roleid\n"
                    + "WHERE a.username LIKE ? OR u.ugmail LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            stm.setString(2, "%" + search + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                //Account
                Account acc = new Account();
                acc.setId(rs.getInt("aid"));
                acc.setUsername(rs.getString("username"));
                acc.setStatus(rs.getBoolean("status"));
                //User
                User user = new User();
                user.setId(rs.getInt("uid"));
                user.setEmail(rs.getString("ugmail"));
                user.setName(rs.getString("uname"));
                user.setDob(rs.getDate("udob"));
                user.setGender(rs.getString("ugender"));
                user.setAddress(rs.getString("uaddress"));
                user.setPhone(rs.getString("uphone"));
                acc.setUser(user);
                //Role
                Role role = new Role();
                role.setId(rs.getInt("roleid"));
                role.setName(rs.getString("rolename"));
                acc.setRole(role);

                accounts.add(acc);

            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }

    public List<Account> getAccountByRoleOrStatus(int roleId, int statusId) {
        List<Account> accounts = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "a.aid, a.username, a.status,\n"
                    + "u.uid, u.ugmail,u.uname,u.udob,u.ugender,u.uaddress,u.uphone,\n"
                    + "r.roleid, r.rolename\n"
                    + "FROM Account a\n"
                    + "LEFT JOIN UserProfile u ON a.aid = u.aid\n"
                    + "LEFT JOIN Account_Role ar ON a.aid = ar.aid\n"
                    + "LEFT JOIN Role r ON ar.roleid = r.roleid\n"
                    + "WHERE 1=1";

            if (roleId != 0) {
                sql += " AND r.roleid = ?";
            }
            if (statusId != -1) {
                sql += " AND a.status = ?";
            }

            PreparedStatement stm = connection.prepareStatement(sql);

            int paramIndex = 1;
            if (roleId != 0) {
                stm.setInt(paramIndex++, roleId);
            }
            if (statusId != -1) {
                stm.setInt(paramIndex++, statusId);
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                //Account
                Account acc = new Account();
                acc.setId(rs.getInt("aid"));
                acc.setUsername(rs.getString("username"));
                acc.setStatus(rs.getBoolean("status"));
                //User
                User user = new User();
                user.setId(rs.getInt("uid"));
                user.setEmail(rs.getString("ugmail"));
                user.setName(rs.getString("uname"));
                user.setDob(rs.getDate("udob"));
                user.setGender(rs.getString("ugender"));
                user.setAddress(rs.getString("uaddress"));
                user.setPhone(rs.getString("uphone"));
                acc.setUser(user);
                //Role
                Role role = new Role();
                role.setId(rs.getInt("roleid"));
                role.setName(rs.getString("rolename"));
                acc.setRole(role);

                accounts.add(acc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }

    public void updatePasswordByUserId(String password, int id) {
        try {
            UserDBContext userDB = new UserDBContext();
            User user = userDB.getUserById(id);

            String sql = "UPDATE [dbo].[Account]\n"
                    + "   SET [password] = ?\n"
                    + " WHERE aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, password);
            stm.setInt(2, user.getAccount().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getPasswordByUserId(int id) {
        try {
            String sql = "SELECT a.password FROM UserProfile u\n"
                    + "JOIN Account a ON u.aid = a.aid\n"
                    + "WHERE u.uid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                String password = rs.getString("password");
                return password;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getAccountByCredential(String credential, String password, String credentialType) {
        String sql = null;
        switch (credentialType) {
            case "username":
                sql = "SELECT aid FROM Account WHERE username = ? AND password = ?";
                break;
            case "gmail":
                sql = "SELECT a.aid FROM Account a JOIN [UserProfile] u ON a.aid = u.aid WHERE u.ugmail = ? AND a.password = ?";
                break;
            case "phone":
                sql = "SELECT a.aid FROM Account a JOIN [UserProfile] u ON a.aid = u.aid WHERE u.uphone = ? AND a.password = ?";
                break;
            default:
                throw new IllegalArgumentException("Invalid credential type: " + credentialType);
        }

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, credential);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setId(rs.getInt("aid"));
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertAccount(Account account) {
        try {
            String sql = "INSERT INTO [dbo].[Account]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[status])\n"
                    + "     VALUES(?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getUsername());
            stm.setString(2, Encryption.toSHA1(account.getPassword()));
            stm.setBoolean(3, account.isStatus());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertRoleAccount(int accountId, int roleId) {
        try {
            String sql = "INSERT INTO [dbo].[Account_Role]\n"
                    + "           ([aid]\n"
                    + "           ,[roleid])\n"
                    + "     VALUES\n"
                    + "           (?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);
            stm.setInt(2, roleId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertUsernamePasswordRegister(User user) {
        try {
            String sql = "INSERT INTO [dbo].[UserProfile]\n"
                    + "           ([uname]\n"
                    + "           ,[udob]\n"
                    + "           ,[ugmail]\n"
                    + "           ,[uaddress]\n"
                    + "           ,[uphone]\n"
                    + "           ,[aid])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user.getName());
            stm.setDate(2, (Date) user.getDob());
            stm.setString(3, user.getEmail());
            stm.setString(4, user.getAddress());
            stm.setString(5, user.getPhone());
            stm.setInt(6, user.getAccount().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePasswordAccountByAid(String password, int aid) {
        try {
            String sql = "UPDATE [dbo].[Account]\n"
                    + "   SET [password] = ?\n"
                    + " WHERE aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, password);
            stm.setInt(2, aid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<String> getUsernames() {
        ArrayList<String> usernames = new ArrayList<>();
        try {
            String sql = "SELECT username FROM Account";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeQuery();
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                String u = rs.getString("username");
                usernames.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usernames;
    }

    public int getTotalAccount() {
        try {
            String sql = "select count(*) from Account";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }
        return 0;
    }

    public ArrayList<Account> pagingAccounts(int index) {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "a.aid,a.username,a.status,\n"
                    + "u.uid,u.ugmail,u.uname,u.udob,u.ugender,u.uaddress,u.uphone,\n"
                    + "r.roleid,r.rolename\n"
                    + "FROM Account a\n"
                    + "LEFT JOIN UserProfile u ON a.aid = u.aid\n"
                    + "LEFT JOIN Account_Role ar ON a.aid = ar.aid\n"
                    + "LEFT JOIN Role r ON ar.roleid = r.roleid\n"
                    + "order by a.aid\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH FIRST 10 ROW ONLY;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 10);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                //Account
                Account acc = new Account();
                acc.setId(rs.getInt("aid"));
                acc.setUsername(rs.getString("username"));
                acc.setStatus(rs.getBoolean("status"));
                //User
                User user = new User();
                user.setId(rs.getInt("uid"));
                user.setEmail(rs.getString("ugmail"));
                user.setName(rs.getString("uname"));
                user.setDob(rs.getDate("udob"));
                user.setGender(rs.getString("ugender"));
                user.setAddress(rs.getString("uaddress"));
                user.setPhone(rs.getString("uphone"));
                acc.setUser(user);
                //Role
                Role role = new Role();
                role.setId(rs.getInt("roleid"));
                role.setName(rs.getString("rolename"));
                acc.setRole(role);

                accounts.add(acc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return accounts;
    }
}
