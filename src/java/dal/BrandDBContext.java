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
public class BrandDBContext extends DBContext {

    public Brand getBrandById(int id) {

        try {
            String sql = "select a.bid,a.bname from Brand as a\n"
                    + "where a.bid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Brand c = new Brand();
                c.setId(rs.getInt("bid"));
                c.setName(rs.getString("bname"));
                return c;
            }

        } catch (SQLException ex) {
            Logger.getLogger(BrandDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Brand> listbrand() {
        ArrayList<Brand> brands = new ArrayList<>();
        try {
            String sql = "select  bid, bname from Brand";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setId(rs.getInt("bid"));
                b.setName(rs.getString("bname"));
                brands.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return brands;
    }

    public List<ProductDetail> getProductsByBrandId(int brandId) {
        List<ProductDetail> list = new ArrayList<>();
        try {
            String sql = "WITH CTE AS (\n"
                    + "SELECT [pdid], [pid], [pdcolor], \n"
                    + "[pdspecification], [pdprice],[pdcriteria], \n"
                    + "[pdquantity], [pddescribe], \n"
                    + "[pdimg],\n"
                    + "ROW_NUMBER() OVER(PARTITION BY [pid] ORDER BY [pdid]) AS RowNum\n"
                    + "FROM [dbo].[ProductDetails]\n"
                    + ")\n"
                    + "SELECT C.[pdid], C.[pid], C.[pdcolor], C.[pdspecification], \n"
                    + "C.[pdprice], C.[pdquantity], C.[pddescribe], C.[pdimg], \n"
                    + "P.[pname], C.[pdcriteria],\n"
                    + "P.[pimg]\n"
                    + "FROM CTE C\n"
                    + "JOIN [dbo].[Product] P ON C.[pid] = P.[pid]\n"
                    + "WHERE C.RowNum = 1 AND P.bid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, brandId); // Set brandId as parameter
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                // Product
                int productId = rs.getInt("pid");
                String productName = rs.getString("pname");
                String productImage = rs.getString("pimg");
                String[] images = productImage.split(",");
                // ProductDetail attributes
                int productDetailId = rs.getInt("pdid");
                String productColor = rs.getString("pdcolor");
                String productSpecification = rs.getString("pdspecification");
                int productQuantity = rs.getInt("pdquantity");
                float originalPrice = rs.getFloat("pdprice");
                String pdCriteria = rs.getString("pdcriteria");

                // Create Product object
                Product product = new Product(productId, productName, null, null, productImage, null);

                // Create ProductDetail object
                ProductDetail productDetail = new ProductDetail(productDetailId, null, product, productColor, productSpecification, originalPrice, productQuantity, null, images, pdCriteria, null, null);
                // Add to list
                list.add(productDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Brand> getTop6Brands() {
        List<Brand> brands = new ArrayList<>();
        String sql = "SELECT TOP 6 bid, bname FROM Brand";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Brand brand = new Brand();
                    brand.setId(rs.getInt("bid"));
                    brand.setName(rs.getString("bname"));
                    brands.add(brand); // Thêm vào danh sách brands
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return brands;
    }

    public List<Brand> getAllBrand() {
        List<Brand> list = new ArrayList<>();
        try {
            String sql = "select * from brand";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ProductDetail> getProductDetailByBrand(String cid) {
        List<ProductDetail> list = new ArrayList<>();
        try {
            String sql = "WITH CTE AS (\n"
                    + "    SELECT pdid, pid, pdcolor, pdspecification, pdprice, pdquantity, \n"
                    + "           pddescribe, pdimg, pddateupdate, pdcriteria,\n"
                    + "           ROW_NUMBER() OVER(PARTITION BY pid ORDER BY pdid) AS RowNum\n"
                    + "    FROM dbo.ProductDetails\n"
                    + ")\n"
                    + "SELECT C.pdid, C.pid, C.pdcolor, C.pdspecification, C.pdprice, C.pdquantity, \n"
                    + "       C.pddescribe, C.pdimg, C.pddateupdate, P.pname, P.cid, P.bid, \n"
                    + "       P.pimg , P.pdateupdate , Cat.cname, C.pdcriteria\n"
                    + "FROM CTE C\n"
                    + "JOIN dbo.Product P ON C.pid = P.pid\n"
                    + "JOIN dbo.Category Cat ON P.cid = Cat.cid\n"
                    + "WHERE C.RowNum = 1 AND P.bid = ?";

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

                //
                Product product = new Product(productId, productName, category, null, productImage, null);

                // ProductDetail
                int productDetailId = rs.getInt("pdid");
                float originalPrice = rs.getFloat("pdprice");
                String pdCriteria = rs.getString("pdcriteria");
                ProductDetail productDetail = new ProductDetail(productDetailId, null, product, productColor, productSpecification, originalPrice, productQuantity, null, images, pdCriteria, null, null);

                // Create Product object
                list.add(productDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ProductDetail> sortByPrice(List<ProductDetail> products, String sortOrder) {
        return new ProductDBContext().sortByPrice(products, sortOrder);
    }

//    public void insertBrand(Brand entity) {
//        try {
//            String sql = "INSERT INTO [dbo].[Brand]\n"
//                    + "           ([bname])\n"
//                    + "     VALUES\n"
//                    + "           (?)";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setString(1, entity.getName());
//            stm.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(BrandDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    public int insertBrand(Brand entity) {
        int newBrandId = -1;
        try {
            String sql = "INSERT INTO [dbo].[Brand] ([bname]) VALUES (?)";
            PreparedStatement stm = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            stm.setString(1, entity.getName());
            int affectedRows = stm.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet rs = stm.getGeneratedKeys()) {
                    if (rs.next()) {
                        newBrandId = rs.getInt(1);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newBrandId;
    }

    //test lay du lieu tu db
    public static void main(String[] args) {
        BrandDBContext p = new BrandDBContext();
        List<Brand> list = p.getAllBrand();
        for (Brand c : list) {
            System.out.println(c);
        }
    }

}
