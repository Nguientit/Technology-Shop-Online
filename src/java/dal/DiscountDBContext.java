/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Discount;
import entity.Product;
import entity.ProductDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class DiscountDBContext extends DBContext {

    public void insertDiscount(Discount discount) {
        try {
            String sql = "INSERT INTO Discount (pdid, dprice) VALUES (?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, discount.getPd().getId());
            ps.setFloat(2, discount.getPriceDiscount());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteDiscount(int id) {
        try {
            String sql = "DELETE FROM Discount WHERE did = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateDiscount(Discount entity) {
        try {
            String sql = "UPDATE Discount SET dprice = ? WHERE did = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setFloat(1, entity.getPriceDiscount());
            stm.setInt(2, entity.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Discount> getListDiscounts() {
        List<Discount> listDiscounts = new ArrayList<>();
        try {
            String sql = "SELECT pd.pdid, pd.pdimg, pd.pdname, pd.pdcolor, pd.pdquantity, \n"
                    + "pd.pdprice, d.did, d.dprice FROM Discount d\n"
                    + "JOIN ProductDetails pd on d.pdid = pd.pdid";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ProductDetail pd = new ProductDetail();
                Discount d = new Discount();
                pd.setId(rs.getInt("pdid"));
                // Parse the comma-separated image string into an array
                String imageString = rs.getString("pdimg");
                if (imageString != null && !imageString.isEmpty()) {
                    pd.setImage(imageString.split(","));
                } else {
                    pd.setImage(new String[]{});
                }
                pd.setName(rs.getString("pdname"));
                pd.setColor(rs.getString("pdcolor"));
                pd.setQuantity(rs.getInt("pdquantity"));
                pd.setOriginalPrice(rs.getFloat("pdprice"));
                d.setPd(pd);
                d.setId(rs.getInt("did"));
                d.setPriceDiscount(rs.getFloat("dprice"));
                listDiscounts.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listDiscounts;
    }

    public List<Discount> getDiscounts() {
        List<Discount> list = new ArrayList<>();
        try {
            String sql = "SELECT did, pdid, dprice FROM Discount";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Discount d = new Discount();
                d.setId(rs.getInt("did"));

                ProductDetail pd = new ProductDetail();
                pd.setId(rs.getInt("pdid"));
                d.setPd(pd);
                d.setPriceDiscount(rs.getFloat("dprice"));
                list.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Discount getDiscountById(int id) {
        Discount discount = null;
        String sql = "SELECT did, pd.pdid, pd.pdimg, pd.pdname, pd.pdprice, pd.pdcolor, dprice FROM Discount d\n"
                + "JOIN ProductDetails pd on d.pdid = pd.pdid\n"
                + "WHERE did = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, id);
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    discount = new Discount();
                    discount.setId(rs.getInt("did"));

                    ProductDetail pd = new ProductDetail();
                    pd.setId(rs.getInt("pdid"));
                    pd.setName(rs.getString("pdname"));
                    // Parse the comma-separated image string into an array
                    String imageString = rs.getString("pdimg");
                    if (imageString != null && !imageString.isEmpty()) {
                        pd.setImage(imageString.split(","));
                    } else {
                        pd.setImage(new String[]{});
                    }
                    pd.setColor(rs.getString("pdcolor"));
                    pd.setOriginalPrice(rs.getFloat("pdprice"));
                    discount.setPd(pd);
                    discount.setPriceDiscount(rs.getFloat("dprice"));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return discount;
    }

    public List<Discount> getSearchByNameDiscount(String name) {
        List<Discount> discounts = new ArrayList<>();
        try {
            String sql = "select pd.pdid, pd.pdname, pd.pdcolor, pd.pdspecification, pd.pdprice, pd.pdquantity,"
                    + " pd.pddescribe, pd.pddateupdate, pd.pdstatus, pd.pdimg, pd.pdcriteria, d.did, d.dprice"
                    + " from Discount d join ProductDetails pd on pd.pdid = d.pdid";
            if (name != null && !name.isEmpty()) {
                sql += " where pd.pdname LIKE ?";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            if (name != null && !name.isEmpty()) {
                stm.setString(1, "%" + name + "%");
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ProductDetail pd = new ProductDetail();
                Discount d = new Discount();

                // Set ProductDetail properties
                pd.setId(rs.getInt("pdid"));
                pd.setName(rs.getString("pdname"));
                pd.setColor(rs.getString("pdcolor"));
                pd.setSepcifications(rs.getString("pdspecification"));
                pd.setOriginalPrice(rs.getFloat("pdprice"));
                pd.setQuantity(rs.getInt("pdquantity"));
                pd.setDescribe(rs.getString("pddescribe"));
                pd.setDateUpdate(rs.getDate("pddateupdate"));
                pd.setStatus(rs.getBoolean("pdstatus"));

                // Parse the comma-separated image string into an array
                String imageString = rs.getString("pdimg");
                if (imageString != null && !imageString.isEmpty()) {
                    pd.setImage(imageString.split(","));
                } else {
                    pd.setImage(new String[]{});
                }
                pd.setCriteria(rs.getString("pdcriteria"));

                // Set Discount properties
                d.setPd(pd);
                d.setId(rs.getInt("did"));
                d.setPriceDiscount(rs.getFloat("dprice"));

                discounts.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return discounts;
    }

    public int getTotalDiscount() {
        try {
            String sql = "select count(*) from Discount";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Discount> pagingDiscounts(int index) {
        List<Discount> listdDiscounts = new ArrayList<>();
        try {
            String sql = "select * from Discount\n"
                    + "order by did\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH FIRST 10 ROW ONLY;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 10);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Discount d = new Discount();
                d.setId(rs.getInt("did"));
                d.setPriceDiscount(rs.getFloat("dprice"));
                d.setPd(new ProductDetailDBContext().getProductDetailsById(rs.getInt("pdid")));
                listdDiscounts.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listdDiscounts;
    }

//    public static void main(String[] args) {
//        DiscountDBContext dbContext = new DiscountDBContext();
//        int d = 15;
//        dbContext.deleteDiscount(d);
//    }
    public static void main(String[] args) {
        DiscountDBContext db = new DiscountDBContext();
        List<Discount> d = db.getListDiscounts();
        for (Discount discount : d) {
            System.out.println(discount);
        }

    }
}
