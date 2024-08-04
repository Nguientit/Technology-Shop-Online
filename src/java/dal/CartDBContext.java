package dal;

import entity.Account;
import entity.Cart;
import entity.CartDetail;
import entity.Product;
import entity.ProductDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CartDBContext extends DBContext {

    public void clearCart(int aid) {
        try {
            String sql = "DELETE FROM Cart_ProductDetail WHERE cid = (SELECT cid FROM Cart WHERE aid = ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteCartByAccountId(int aid) {
        try {
            String sql = "DELETE FROM Cart WHERE aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteCartProductDetailById(int id) {
        try {
            String sql = "DELETE FROM Cart_ProductDetail WHERE cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getCartIdByAccountID(int aid) {
        int cartId = -1;
        try {
            String sql = "SELECT cid FROM Cart WHERE aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cartId = rs.getInt("cid");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cartId;
    }

    public ProductDetail getProductById(int id) {
        try {
            String sql = "SELECT p.pid, p.pname, p.pimg, pd.pdcolor, pd.pdquantity, pd.pdprice, pd.pdid, pd.pdcriteria "
                    + "FROM Product p "
                    + "JOIN ProductDetails pd ON p.pid = pd.pid "
                    + "WHERE p.pid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int productId = rs.getInt("pid");
                String productName = rs.getString("pname");
                String productImage = rs.getString("pimg");
                String[] images = productImage.split(",");
                int productDetailId = rs.getInt("pdid");
                String productColor = rs.getString("pdcolor");
                float originalPrice = rs.getFloat("pdprice");
                int productQuantity = rs.getInt("pdquantity");
                String productCriteria = rs.getString("pdcriteria");

                Product product = new Product(productId, productName, null, null, productImage, null);
                return new ProductDetail(productDetailId, null, product, productColor, productColor, originalPrice, productQuantity, null, images, productCriteria, null, null);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }
        return null;
    }

    public ProductDetail getProductDetailById(int productDetailId) {
        try {
            String sql = "SELECT pd.pdid, pd.pdname, pd.pdimg, pd.pdcriteria, pd.pdcolor, pd.pdquantity, pd.pdprice, "
                    + "pd.pdspecification, pd.pddescribe, p.pname, p.pid, p.pimg "
                    + "FROM ProductDetails pd "
                    + "JOIN Product p ON pd.pid = p.pid "
                    + "WHERE pd.pdid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productDetailId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int pdid = rs.getInt("pdid");
                String pdname = rs.getString("pdname");
                String pdimg = rs.getString("pdimg");
                String pdcriteria = rs.getString("pdcriteria");
                String pdcolor = rs.getString("pdcolor");
                int pdquantity = rs.getInt("pdquantity");
                float pdprice = rs.getFloat("pdprice");
                String pdspecification = rs.getString("pdspecification");
                String pddescribe = rs.getString("pddescribe");

                int pid = rs.getInt("pid");
                String pname = rs.getString("pname");
                String pimg = rs.getString("pimg");

                String[] images = pdimg.split(",");

                Product product = new Product(pid, pname, null, null, pimg, null);
                return new ProductDetail(pdid, pdname, product, pdcolor, pdspecification, pdprice, pdquantity, pddescribe, images, pdcriteria, null, null);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }
        return null;
    }

    public void insertCart(Cart cart) {
        try {
            String sql = "INSERT INTO Cart (aid) VALUES (?)";
            PreparedStatement ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, cart.getAccount().getId());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                cart.setId(rs.getInt(1));
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", e);
        }
    }

    public void insertCartDetail(CartDetail cartDetail, int cartId) {
        try {
            String sql = "INSERT INTO Cart_ProductDetail (cid, pdid, quantity) VALUES (?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cartId);
            ps.setInt(2, cartDetail.getPd().getId());
            ps.setInt(3, cartDetail.getQuantity());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", e);
        }
    }

    public void updateCartDetail(CartDetail cartDetail, int cartId) {
        try {
            String sql = "UPDATE Cart_ProductDetail SET quantity = ? WHERE cid = ? AND pdid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cartDetail.getQuantity());
            ps.setInt(2, cartId);
            ps.setInt(3, cartDetail.getPd().getId());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", e);
        }
    }

    public void deleteCartDetail(int productDetailId, int cartId) {
        try {
            String sql = "DELETE FROM Cart_ProductDetail WHERE cid = ? AND pdid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cartId);
            ps.setInt(2, productDetailId);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", e);
        }
    }

    public Cart getCartByUserId(int userId) {
        Cart cart = null;
        try {
            String checkCartSql = "SELECT cid FROM Cart WHERE aid = ?";
            PreparedStatement checkCartPs = connection.prepareStatement(checkCartSql);
            checkCartPs.setInt(1, userId);
            ResultSet checkCartRs = checkCartPs.executeQuery();

            int cartId = -1;
            if (checkCartRs.next()) {
                cartId = checkCartRs.getInt("cid");
            }
            checkCartRs.close();
            checkCartPs.close();

            if (cartId != -1) {
                String sql = "SELECT c.cid, c.aid, cpd.pdid, cpd.quantity "
                           + "FROM Cart c "
                           + "LEFT JOIN Cart_ProductDetail cpd ON c.cid = cpd.cid "
                           + "WHERE c.aid = ?";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();

                Account account = new Account();
                account.setId(userId);

                while (rs.next()) {
                    if (cart == null) {
                        cart = new Cart();
                        cart.setId(rs.getInt("cid"));
                        cart.setAccount(account);
                        cart.setItems(new ArrayList<>());
                    }

                    if (rs.getInt("pdid") != 0) {
                        CartDetail cartDetail = new CartDetail();
                        cartDetail.setId(rs.getInt("pdid"));
                        cartDetail.setQuantity(rs.getInt("quantity"));

                        ProductDetail productDetail = getProductDetailById(rs.getInt("pdid"));
                        cartDetail.setPd(productDetail);

                        cart.getItems().add(cartDetail);
                    }
                }
                rs.close();
                ps.close();
            }
        } catch (SQLException e) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", e);
        }
        return cart;
    }
}
