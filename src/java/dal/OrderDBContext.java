/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import entity.Order;
import entity.Status;
import java.util.ArrayList;
import entity.OrderDetail;

import entity.Status;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDBContext extends DBContext {

    public ArrayList<Order> getOrderByAccountDeliverId(int accountDeliverId) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT o.oid, o.sid, o.deliveryaddress, \n"
                    + "o.deliveryphone, o.recipientname, o.aid, o.payment \n"
                    + "FROM [Order] AS o\n"
                    + "INNER JOIN Deliver AS d ON o.oid = d.oid\n"
                    + "WHERE d.aid = ? AND o.sid != 4";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountDeliverId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                //Order
                Order order = new Order();
                order.setId(rs.getInt("oid"));
                order.setDeliveryAddress(rs.getString("deliveryaddress"));
                order.setDeliveryPhone(rs.getString("deliveryphone"));
                order.setRecipientName(rs.getString("recipientname"));
                order.setPayment(rs.getString("payment"));

                //Status
                Status status = new Status();
                status.setId(rs.getInt("sid"));
                order.setStatus(status);

                //Account
                Account account = new Account();
                account.setId(rs.getInt("aid"));
                order.setAccount(account);

                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public ArrayList<Order> getOrderByAccountDeliverIdAndOrderId(int accountDeliverId, int orderId) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT o.oid, o.sid, o.deliveryaddress, \n"
                    + "o.deliveryphone, o.recipientname, o.aid, o.payment \n"
                    + "FROM [Order] AS o\n"
                    + "INNER JOIN Deliver AS d ON o.oid = d.oid\n"
                    + "WHERE d.aid = ? AND o.oid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountDeliverId);
            stm.setInt(2, orderId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                //Order
                Order order = new Order();
                order.setId(rs.getInt("oid"));
                order.setDeliveryAddress(rs.getString("deliveryaddress"));
                order.setDeliveryPhone(rs.getString("deliveryphone"));
                order.setRecipientName(rs.getString("recipientname"));
                order.setPayment(rs.getString("payment"));

                //Status
                Status status = new Status();
                status.setId(rs.getInt("sid"));
                order.setStatus(status);

                //Account
                Account account = new Account();
                account.setId(rs.getInt("aid"));
                order.setAccount(account);

                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public ArrayList<Order> getOrderByAccountDeliverIdAndStatusId(int accountDeliverId, int statusId) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT o.oid, o.sid, o.deliveryaddress, \n"
                    + "o.deliveryphone, o.recipientname, o.aid, o.payment \n"
                    + "FROM [Order] AS o\n"
                    + "INNER JOIN Deliver AS d ON o.oid = d.oid\n"
                    + "WHERE d.aid = ? ";
            if (statusId != 0) {
                sql += " AND o.sid = ?";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountDeliverId);

            if (statusId != 0) {
                stm.setInt(2, statusId);
            }

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                //Order
                Order order = new Order();
                order.setId(rs.getInt("oid"));
                order.setDeliveryAddress(rs.getString("deliveryaddress"));
                order.setDeliveryPhone(rs.getString("deliveryphone"));
                order.setRecipientName(rs.getString("recipientname"));
                order.setPayment(rs.getString("payment"));

                //Status
                Status status = new Status();
                status.setId(rs.getInt("sid"));
                order.setStatus(status);

                //Account
                Account account = new Account();
                account.setId(rs.getInt("aid"));
                order.setAccount(account);

                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public ArrayList<Order> getOrdersByStatusId(int statusId) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT oid, sid, deliveryaddress, \n"
                    + "deliveryphone, recipientname, aid, payment \n"
                    + "FROM [Order]\n"
                    + "WHERE sid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, statusId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                //Order
                Order order = new Order();
                order.setId(rs.getInt("oid"));
                order.setDeliveryAddress(rs.getString("deliveryaddress"));
                order.setDeliveryPhone(rs.getString("deliveryphone"));
                order.setRecipientName(rs.getString("recipientname"));
                order.setPayment(rs.getString("payment"));

                //Status
                Status status = new Status();
                status.setId(rs.getInt("sid"));
                order.setStatus(status);

                //Account
                Account account = new Account();
                account.setId(rs.getInt("aid"));
                order.setAccount(account);

                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public ArrayList<Order> getOrdersByStatusIdAndOrderId(int statusId, int orderId) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT oid, sid, deliveryaddress, \n"
                    + "deliveryphone, recipientname, aid, payment \n"
                    + "FROM [Order]\n"
                    + "WHERE sid = ? AND oid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, statusId);
            stm.setInt(2, orderId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                //Order
                Order order = new Order();
                order.setId(rs.getInt("oid"));
                order.setDeliveryAddress(rs.getString("deliveryaddress"));
                order.setDeliveryPhone(rs.getString("deliveryphone"));
                order.setRecipientName(rs.getString("recipientname"));
                order.setPayment(rs.getString("payment"));

                //Status
                Status status = new Status();
                status.setId(rs.getInt("sid"));
                order.setStatus(status);

                //Account
                Account account = new Account();
                account.setId(rs.getInt("aid"));
                order.setAccount(account);

                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public ArrayList<Order> getOrdersShippedByOrderId(int statusId, int orderId) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT oid, sid, deliveryaddress, \n"
                    + "deliveryphone, recipientname, aid, payment \n"
                    + "FROM [Order]\n"
                    + "WHERE sid = ? AND oid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, statusId);
            stm.setInt(2, orderId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                //Order
                Order order = new Order();
                order.setId(rs.getInt("oid"));
                order.setDeliveryAddress(rs.getString("deliveryaddress"));
                order.setDeliveryPhone(rs.getString("deliveryphone"));
                order.setRecipientName(rs.getString("recipientname"));
                order.setPayment(rs.getString("payment"));

                //Status
                Status status = new Status();
                status.setId(rs.getInt("sid"));
                order.setStatus(status);

                //Account
                Account account = new Account();
                account.setId(rs.getInt("aid"));
                order.setAccount(account);

                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public Order getOrderByOrderId(int orderId) {
        try {
            String sql = "SELECT o.oid, o.sid, o.deliveryaddress, \n"
                    + "o.deliveryphone, o.recipientname, o.aid, o.payment,\n"
                    + "s.sname\n"
                    + "FROM [Order] AS o\n"
                    + "INNER JOIN [Status] AS s ON o.sid = s.sid\n"
                    + "WHERE o.oid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                //Order
                Order order = new Order();
                order.setId(rs.getInt("oid"));
                order.setDeliveryAddress(rs.getString("deliveryaddress"));
                order.setDeliveryPhone(rs.getString("deliveryphone"));
                order.setRecipientName(rs.getString("recipientname"));
                order.setPayment(rs.getString("payment"));

                //Status
                Status status = new Status();
                status.setId(rs.getInt("sid"));
                status.setName(rs.getString("sname"));
                order.setStatus(status);

                //Account
                Account account = new Account();
                account.setId(rs.getInt("aid"));
                order.setAccount(account);

                return order;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertOrderIdToDeliver(int orderId, int accountId) {
        try {
            String sql = "INSERT INTO [dbo].[Deliver]\n"
                    + "           ([aid]\n"
                    + "           ,[oid])\n"
                    + "     VALUES\n"
                    + "           (?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);
            stm.setInt(2, orderId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateStatusOrderByOrderId(int orderId, int statusId) {
        try {
            String sql = "UPDATE [dbo].[Order]\n"
                    + "   SET [sid] = ?\n"
                    + " WHERE oid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, statusId);
            stm.setInt(2, orderId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean updateOrder(Order order) {
        boolean isUpdated = false;
        try {
            connection.setAutoCommit(false);

            String sqlOrder = "UPDATE [Order] SET deliveryaddress = ?, deliveryphone = ?, recipientname = ? WHERE oid = ?";
            PreparedStatement stmOrder = connection.prepareStatement(sqlOrder);
            stmOrder.setString(1, order.getDeliveryAddress());
            stmOrder.setString(2, order.getDeliveryPhone());
            stmOrder.setString(3, order.getRecipientName());
            stmOrder.setInt(4, order.getId());
            int rowsAffected = stmOrder.executeUpdate();
            stmOrder.close();

            System.out.println("Rows affected: " + rowsAffected);

            if (rowsAffected > 0) {
                connection.commit();
                isUpdated = true;
            }
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException e) {
                System.out.println("Rollback error: " + e.getMessage());
            }
            System.out.println("SQL error: " + ex.getMessage());
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                System.out.println("Auto-commit error: " + e.getMessage());
            }
        }
        return isUpdated;
    }

    public boolean deleteOrder(int orderId) {
        boolean isDeleted = false;
        try {
            // Bắt đầu giao dịch
            connection.setAutoCommit(false);

            // Xóa chi tiết đơn hàng trước
            String sqlDeleteDetails = "DELETE FROM OrderDetails WHERE oid = ?";
            PreparedStatement stmDeleteDetails = connection.prepareStatement(sqlDeleteDetails);
            stmDeleteDetails.setInt(1, orderId);
            stmDeleteDetails.executeUpdate();
            stmDeleteDetails.close();

            // Xóa đơn hàng
            String sqlDeleteOrder = "DELETE FROM [Order] WHERE oid = ?";
            PreparedStatement stmDeleteOrder = connection.prepareStatement(sqlDeleteOrder);
            stmDeleteOrder.setInt(1, orderId);
            int rowsAffected = stmDeleteOrder.executeUpdate();
            stmDeleteOrder.close();

            if (rowsAffected > 0) {
                connection.commit();
                isDeleted = true;
            }
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException e) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, e);
            }
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return isDeleted;
    }

    public int insertOrder(Order order) {
        int orderId = -1;
        Status status = getDefaultStatus();
        try {
            // Bắt đầu giao dịch
            connection.setAutoCommit(false);

            // Chèn thông tin đơn hàng vào bảng Order
            String sqlOrder = "INSERT INTO [Order] (sid, aid, deliveryaddress, deliveryphone, recipientname, payment, amount, ordertime) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmOrder = connection.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
            stmOrder.setInt(1, status.getId());
            stmOrder.setInt(2, order.getAccount().getId());
            stmOrder.setString(3, order.getDeliveryAddress());
            stmOrder.setString(4, order.getDeliveryPhone());
            stmOrder.setString(5, order.getRecipientName());
            stmOrder.setString(6, order.getPayment());
            stmOrder.setFloat(7, order.getAmount());
            stmOrder.setTimestamp(8, new Timestamp(order.getOrdertime().getTime()));
            stmOrder.executeUpdate();

            ResultSet rs = stmOrder.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }
            rs.close();
            stmOrder.close();

            if (orderId != -1) {
                // Chèn thông tin chi tiết đơn hàng vào bảng OrderDetails
                String sqlOrderDetails = "INSERT INTO OrderDetails (oid, pdid, pname, quantity, price) "
                        + "VALUES (?, ?, ?, ?, ?)";
                PreparedStatement stmOrderDetails = connection.prepareStatement(sqlOrderDetails);

                for (OrderDetail detail : order.getOrderDetails()) {
                    stmOrderDetails.setInt(1, orderId);
                    stmOrderDetails.setInt(2, detail.getPdid());
                    stmOrderDetails.setString(3, detail.getPname());
                    stmOrderDetails.setInt(4, detail.getQuantity());
                    stmOrderDetails.setFloat(5, detail.getPrice());
                    stmOrderDetails.addBatch();
                }
                stmOrderDetails.executeBatch();
                stmOrderDetails.close();
            }

            // Hoàn tất giao dịch
            connection.commit();
        } catch (SQLException ex) {
            try {
                // Rollback nếu có lỗi
                connection.rollback();
            } catch (SQLException e) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, e);
            }
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                // Đặt lại chế độ auto-commit
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return orderId;
    }

    public Status getDefaultStatus() {
        Status status = null;
        try {
            String sql = "SELECT * FROM Status WHERE sname = N'Chờ xử lý'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                status = new Status();
                status.setId(rs.getInt("sid"));
                status.setName(rs.getString("sname"));
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }
    
    public void deleteOrderDeliverByAccountID(int aid) {
        try {
            String sql = "DELETE FROM [dbo].[Deliver]\n"
                    + "      WHERE aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteOrderByAccountID(int aid) {
        try {
            String sql = "DELETE FROM [dbo].[Order]\n"
                    + "      WHERE aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Order> getOrderHistoryByAccountID(int aid) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT o.oid, o.sid, s.sname, o.deliveryaddress, o.deliveryphone, o.recipientname,o.aid, o.payment, o.amount, o.ordertime \n"
                    + "FROM [Order] o JOIN [Status] s ON o.sid = s.sid WHERE o.aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("oid"));
                Status status = new Status();
                status.setId(rs.getInt("sid"));
                status.setName(rs.getString("sname"));
                order.setStatus(status);
                order.setDeliveryAddress(rs.getString("deliveryaddress"));
                order.setDeliveryPhone(rs.getString("deliveryphone"));
                order.setRecipientName(rs.getString("recipientname"));
                order.setPayment(rs.getString("payment"));
                order.setAmount(rs.getFloat("amount"));
                order.setOrdertime(rs.getDate("ordertime"));

                // Add logic to fetch status name based on ID if needed
                order.setStatus(status);
                Account account = new Account();
                account.setId(rs.getInt("aid"));
                // Add logic to fetch account details if needed
                order.setAccount(account);
                order.setOrderDetails(getOrderDetailsByOrderId(order.getId()));

                orders.add(order);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        try {
            String sql = "SELECT * FROM OrderDetails WHERE oid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderDetail detail = new OrderDetail();
                detail.setId(rs.getInt("id"));
                detail.setOid(rs.getInt("oid"));
                detail.setPdid(rs.getInt("pdid"));
                detail.setPname(rs.getString("pname"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setPrice(rs.getFloat("price"));
                orderDetails.add(detail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    public void deleteOrderInShippingListByAccountIdAndOrderId(int accountId, int orderId) {
        try {
            String sql = "DELETE FROM [dbo].[Deliver]\n"
                    + "      WHERE aid = ? AND oid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);
            stm.setInt(2, orderId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
