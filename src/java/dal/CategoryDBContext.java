/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Brand;
import entity.Category;
import entity.Product;
import entity.ProductDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class CategoryDBContext extends DBContext {

    public Category getCategoryById(int id) {
        try {
            String sql = "select a.cid,a.cname from Category as a\n"
                    + "where a.cid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                return c;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Category> listcategory() {
        ArrayList<Category> categorys = new ArrayList<>();
        try {
            String sql = "select  cid, cname from Category";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("cid"));
                category.setName(rs.getString("cname"));
                categorys.add(category);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categorys;
    }

    public Category getNameByCategoryId(int id) {
        try {
            String sql = "SELECT cid, cname\n"
                    + "FROM Category\n"
                    + "WHERE cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                // Category
                Category c = new Category();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                return c;
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        try {
            String sql = "select * from category";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ProductDetail> getProductDetailByCategory(String cid) {
        List<ProductDetail> list = new ArrayList<>();
        try {
            String sql = "WITH CTE AS (\n"
                    + "    SELECT pdid, pid, pdcolor, pdspecification, pdprice, pdquantity, \n"
                    + "           pddescribe, pdimg, pddateupdate,pdcriteria,\n"
                    + "           ROW_NUMBER() OVER(PARTITION BY pid ORDER BY pdid) AS RowNum\n"
                    + "    FROM dbo.ProductDetails\n"
                    + ")\n"
                    + "SELECT C.pdid, C.pid, C.pdcolor, C.pdspecification, C.pdprice, C.pdquantity, \n"
                    + "       C.pddescribe, C.pdimg, C.pddateupdate, P.pname, P.cid, P.bid, \n"
                    + "       P.pimg , P.pdateupdate , Cat.cname, C.pdcriteria\n"
                    + "FROM CTE C\n"
                    + "JOIN dbo.Product P ON C.pid = P.pid\n"
                    + "JOIN dbo.Category Cat ON P.cid = Cat.cid\n"
                    + "WHERE C.RowNum = 1 AND P.cid = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, cid);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                // Product
                int productId = rs.getInt("pid");
                String productName = rs.getString("pname");
                String productImage = rs.getString("pimg");
                String[] images = productImage.split(",");
                String productColor = rs.getString("pdcolor");
                String productSpecification = rs.getString("pdspecification");
                int productQuantity = rs.getInt("pdquantity");

                // Category
                int categoryId = rs.getInt("cid");
                String categoryName = rs.getString("cname");
                Category category = new Category(categoryId, categoryName);

                // ProductDetail
                int productDetailId = rs.getInt("pdid");
                float originalPrice = rs.getFloat("pdprice");
                String pdCriteria = rs.getString("pdcriteria");
                Product product = new Product(productId, productName, category, null, productImage, null);
                ProductDetail productDetail = new ProductDetail(productDetailId, null, product, productColor, productSpecification, originalPrice, productQuantity, null, images, pdCriteria, null, null);

                list.add(productDetail);
            }

            rs.close();
            stm.close();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public List<ProductDetail> sortByPrice(List<ProductDetail> products, String sortOrder) {
        return new ProductDBContext().sortByPrice(products, sortOrder);
    }

    public void insertCategory(Category entity) {
    try {
        String sql = "INSERT INTO [dbo].[Category] ([cname]) VALUES (?)";
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, entity.getName());
        stm.executeUpdate();
        
        // Lấy ID mới được tạo
        ResultSet rs = stm.getGeneratedKeys();
        if (rs.next()) {
            entity.setId(rs.getInt(1));
        }
    } catch (SQLException ex) {
        Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
    }
}


    public List<Product> searchCategoryList(int id) {
        List<Product> products = new ArrayList<>();
        try {
            String sql = "select pid, pname, c.cid, c.cname, b.bid, b.bname,\n"
                    + "pimg, pdateupdate from Product p\n"
                    + "join Category c on c.cid = p.cid\n"
                    + "join Brand b on b.bid = p.bid\n";
            if (id > 0) {
                sql += "where c.cid = ?";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            if (id > 0) {
                stm.setInt(1, id);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                Category c = new Category();
                Brand b = new Brand();

                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                p.setCategory(c);
                b.setId(rs.getInt("bid"));
                b.setName(rs.getString("bname"));
                p.setBrand(b);

                p.setId(rs.getInt("pid"));
                p.setName(rs.getString("pname"));
                p.setImage(rs.getString("pimg"));
                p.setDateUpdate(rs.getDate("pdateupdate"));
                products.add(p);

            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    //test lay du lieu tu db
    public static void main(String[] args) {
        CategoryDBContext p = new CategoryDBContext();
        List<ProductDetail> list = p.getProductDetailByCategory("1");
        for (ProductDetail c : list) {
            System.out.println(c);
        }
    }
}
