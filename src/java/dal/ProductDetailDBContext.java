/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Brand;
import entity.Category;
import entity.Discount;
import entity.Product;
import entity.ProductDetail;
import entity.ProductDetailDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class ProductDetailDBContext extends DBContext {

    public ArrayList<ProductDetail> getListProductDetails() {
        ArrayList<ProductDetail> productDetails = new ArrayList<>();
        try {
            String sql = "select pdid, pdname, pid, pdcolor, pdspecification, pdprice, pdquantity,\n"
                    + "pddescribe, pddateupdate, pdstatus, pdimg, pdcriteria\n"
                    + "from ProductDetails";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ProductDetail productDetail = new ProductDetail();
                productDetail.setId(rs.getInt("pdid"));
                productDetail.setName(rs.getString("pdname"));
                productDetail.setProduct(new ProductDBContext().getProductById(rs.getInt("pid")));
                productDetail.setColor(rs.getString("pdcolor"));
                productDetail.setSepcifications(rs.getString("pdspecification"));
                productDetail.setOriginalPrice(rs.getFloat("pdprice"));
                productDetail.setQuantity(rs.getInt("pdquantity"));
                productDetail.setDescribe(rs.getString("pddescribe"));
                productDetail.setDateUpdate(rs.getDate("pddateupdate"));
                productDetail.setStatus(rs.getBoolean("pdstatus"));
                // Parse the comma-separated image string into an array
                String imageString = rs.getString("pdimg");
                if (imageString != null && !imageString.isEmpty()) {
                    productDetail.setImage(imageString.split(","));
                } else {
                    productDetail.setImage(new String[]{});
                }
                productDetail.setCriteria(rs.getString("pdcriteria"));
                productDetails.add(productDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productDetails;
    }

    public ProductDetail getProductDetailsById(int id) {//m
        try {
            String sql = "select pdid, pdname, pid, pdcolor, pdspecification, pdprice, pdquantity,\n"
                    + "       pddescribe, pddateupdate, pdstatus, pdimg\n"
                    + "       from ProductDetails\n"
                    + "where pdid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                ProductDetail productDetail = new ProductDetail();
                productDetail.setId(rs.getInt("pdid"));
                productDetail.setName(rs.getString("pdname"));
                productDetail.setProduct(new ProductDBContext().getProductById(rs.getInt("pid")));
                productDetail.setColor(rs.getString("pdcolor"));
                productDetail.setSepcifications(rs.getString("pdspecification"));
                productDetail.setOriginalPrice(rs.getFloat("pdprice"));
                productDetail.setQuantity(rs.getInt("pdquantity"));
                productDetail.setDescribe(rs.getString("pddescribe"));
                productDetail.setDateUpdate(rs.getDate("pddateupdate"));
                productDetail.setStatus(rs.getBoolean("pdstatus"));
                // Parse the comma-separated image string into an array
                String imageString = rs.getString("pdimg");
                if (imageString != null && !imageString.isEmpty()) {
                    productDetail.setImage(imageString.split(","));
                } else {
                    productDetail.setImage(new String[]{});
                }
                return productDetail;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertProductDetail(ProductDetail entity) {
        try {
            String sql = "INSERT INTO [dbo].[ProductDetails] "
                    + "([pdname], [pdcolor], [pdspecification], [pdprice], [pdquantity], "
                    + "[pddescribe], [pddateupdate], [pdstatus], [pdimg], [pid]) "
                    + "VALUES (?, ?, ?, ?, ?, ?, GETDATE(), ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);

            // Convert String[] to a single String
            String imageString = String.join(",", entity.getImage());

            // Set parameters
            stm.setString(1, entity.getName());
            stm.setString(2, entity.getColor());
            stm.setString(3, entity.getSepcifications());
            stm.setFloat(4, entity.getOriginalPrice());
            stm.setInt(5, entity.getQuantity());
            stm.setString(6, entity.getDescribe());
            stm.setBoolean(7, entity.getStatus());
            stm.setString(8, imageString); // Set the joined image String or null if entity.getImage() is null
//            stm.setString(9, entity.getCriteria());
            stm.setInt(9, entity.getProduct().getId());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateProductDetail(ProductDetail entity) {
        try {
            String sql = "UPDATE [dbo].[ProductDetails]\n"
                    + "   SET [pdname] = ?,\n"
                    + "       [pdcolor] = ?,\n"
                    + "       [pdspecification] = ?,\n"
                    + "       [pdprice] = ?,\n"
                    + "       [pdquantity] = ?,\n"
                    + "       [pddescribe] = ?,\n"
                    + "       [pddateupdate] = GETDATE(),\n"
                    + "       [pdstatus] = ?,\n"
                    + "       [pdimg] = ?,\n"
                    + "       [pdcriteria] = ?\n"
                    + " WHERE [pdid] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            // Convert String[] to a single String
            String imageString = String.join(",", entity.getImage());

            // Set parameters
            stm.setString(1, entity.getName());
            stm.setString(2, entity.getColor());
            stm.setString(3, entity.getSepcifications());
            stm.setFloat(4, entity.getOriginalPrice());
            stm.setInt(5, entity.getQuantity());
            stm.setString(6, entity.getDescribe());
            stm.setBoolean(7, entity.getStatus());
            stm.setString(8, imageString); // Set the joined image String
            stm.setString(9, entity.getCriteria());
            stm.setInt(10, entity.getId()); // Set the id
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<ProductDetail> getProductsWithoutDiscount() {
        List<ProductDetail> products = new ArrayList<>();
        try {
            String sql = "SELECT pd.* FROM ProductDetails pd LEFT JOIN Discount d ON pd.pdid = d.pdid WHERE d.pdid IS NULL";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDetail pd = new ProductDetail();
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
                products.add(pd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public List<ProductDetail> getAppleProductDetail() {
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
                    + "SELECT C.[pdid],C.[pid], C.[pdcolor], C.[pdspecification], \n"
                    + "C.[pdprice], C.[pdquantity], C.[pddescribe], C.[pdimg], \n"
                    + "P.[pname], C.[pdcriteria],\n"
                    + "P.[pimg]\n"
                    + "FROM CTE C\n"
                    + "JOIN [dbo].[Product] P ON C.[pid] = P.[pid]\n"
                    + "WHERE C.RowNum = 1 AND P.bid = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
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

    public List<ProductDetail> getSamSungProductDetail() {
        List<ProductDetail> list = new ArrayList<>();
        try {
            String sql = "WITH CTE AS (\n"
                    + "SELECT [pdid], [pid], [pdcolor], \n"
                    + "[pdspecification], [pdprice], \n"
                    + "[pdquantity], [pddescribe], \n"
                    + "[pdimg],[pdcriteria],\n"
                    + "ROW_NUMBER() OVER(PARTITION BY [pid] ORDER BY [pdid]) AS RowNum\n"
                    + "FROM [dbo].[ProductDetails]\n"
                    + ")\n"
                    + "SELECT C.[pdid],C.[pid], C.[pdcolor], C.[pdspecification], \n"
                    + "C.[pdprice], C.[pdquantity], C.[pddescribe], C.[pdimg], \n"
                    + "P.[pname], C.[pdcriteria],\n"
                    + "P.[pimg]\n"
                    + "FROM CTE C\n"
                    + "JOIN [dbo].[Product] P ON C.[pid] = P.[pid]\n"
                    + "WHERE C.RowNum = 1 AND P.bid = 2";
            PreparedStatement stm = connection.prepareStatement(sql);
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

    public List<ProductDetail> getXiaomiProductDetail() {
        List<ProductDetail> list = new ArrayList<>();
        try {
            String sql = "WITH CTE AS (\n"
                    + "SELECT [pdid], [pid], [pdcolor], \n"
                    + "[pdspecification], [pdprice], \n"
                    + "[pdquantity], [pddescribe], \n"
                    + "[pdimg],[pdcriteria],\n"
                    + "ROW_NUMBER() OVER(PARTITION BY [pid] ORDER BY [pdid]) AS RowNum\n"
                    + "FROM [dbo].[ProductDetails]\n"
                    + ")\n"
                    + "SELECT C.[pdid],C.[pid], C.[pdcolor], C.[pdspecification], \n"
                    + "C.[pdprice], C.[pdquantity], C.[pddescribe], C.[pdimg], \n"
                    + "P.[pname], C.[pdcriteria],\n"
                    + "P.[pimg]\n"
                    + "FROM CTE C\n"
                    + "JOIN [dbo].[Product] P ON C.[pid] = P.[pid]\n"
                    + "WHERE C.RowNum = 1 AND P.bid = 3";
            PreparedStatement stm = connection.prepareStatement(sql);
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

    public List<ProductDetail> getOppoProductDetail() {
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
                    + "SELECT C.[pdid],C.[pid], C.[pdcolor], C.[pdspecification], \n"
                    + "C.[pdprice], C.[pdquantity], C.[pddescribe], C.[pdimg], \n"
                    + "P.[pname], C.[pdcriteria],\n"
                    + "P.[pimg]\n"
                    + "FROM CTE C\n"
                    + "JOIN [dbo].[Product] P ON C.[pid] = P.[pid]\n"
                    + "WHERE C.RowNum = 1 AND P.bid = 4";
            PreparedStatement stm = connection.prepareStatement(sql);
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
    
    public List<ProductDetail> getMacbookProductDetail() {
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
                    + "SELECT C.[pdid],C.[pid], C.[pdcolor], C.[pdspecification], \n"
                    + "C.[pdprice], C.[pdquantity], C.[pddescribe], C.[pdimg], \n"
                    + "P.[pname], C.[pdcriteria],\n"
                    + "P.[pimg]\n"
                    + "FROM CTE C\n"
                    + "JOIN [dbo].[Product] P ON C.[pid] = P.[pid]\n"
                    + "WHERE C.RowNum = 1 AND P.bid = 19";
            PreparedStatement stm = connection.prepareStatement(sql);
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
    
    public ProductDetail getProductDetailsByPid(String pid) {
        try {
            String sql = "WITH CTE AS (\n"
                    + "    SELECT \n"
                    + "        [pdid], \n"
                    + "        [pid], \n"
                    + "        [pdcolor], \n"
                    + "        [pdspecification], \n"
                    + "        [pdprice], \n"
                    + "        [pdquantity], \n"
                    + "        [pddescribe], \n"
                    + "        [pdimg], \n"
                    + "        [pddateupdate],\n"
                    + "        ROW_NUMBER() OVER(PARTITION BY [pid] ORDER BY [pdid]) AS RowNum\n"
                    + "    FROM \n"
                    + "        [dbo].[ProductDetails]\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    C.[pdid], \n"
                    + "    C.[pid], \n"
                    + "    C.[pdcolor], \n"
                    + "    C.[pdspecification], \n"
                    + "    C.[pdprice], \n"
                    + "    C.[pdquantity], \n"
                    + "    C.[pddescribe], \n"
                    + "    C.[pdimg], \n"
                    + "    C.[pddateupdate],\n"
                    + "    P.[pname],\n"
                    + "    P.[cid],\n"
                    + "    P.[bid],\n"
                    + "    P.[pimg] AS ProductImg,\n"
                    + "    P.[pdateupdate] AS ProductDateUpdate,\n"
                    + "    Cat.[cname],\n"
                    + "    B.bid,\n"
                    + "    B.bname\n"
                    + "FROM \n"
                    + "    CTE C\n"
                    + "JOIN \n"
                    + "    [dbo].[Product] P ON C.[pid] = P.[pid]\n"
                    + "JOIN \n"
                    + "    [dbo].[Category] Cat ON P.[cid] = Cat.[cid]\n"
                    + "join \n"
                    + "    [dbo].[Brand] B ON Cat.[cid] = b.[bid]\n"
                    + "WHERE \n"
                    + "    C.RowNum = 1\n"
                    + "    AND P.[pid] = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pid);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                // Category
                int categoryId = rs.getInt("cid");
                String categoryName = rs.getString("cname");
                Category category = new Category(categoryId, categoryName);

                // Product
                int productId = rs.getInt("pid");
                String productName = rs.getString("pname");
                String productImage = rs.getString("ProductImg");

                // ProductDetail
                int productDetailId = rs.getInt("pdid");
                String productColor = rs.getString("pdcolor");
                String productSpecification = rs.getString("pdspecification");
                float originalPrice = rs.getFloat("pdprice");
                int productQuantity = rs.getInt("pdquantity");
                String productDescribe = rs.getString("pddescribe");
                String productDetailImage = rs.getString("pdimg");
                String[] detailImages = productDetailImage.split(",");
                // Brand
                int brandId = rs.getInt("bid");
                String brandName = rs.getString("bname");
                Brand brand = new Brand(brandId, brandName, null);

                // ...
                Product product = new Product(productId, productName, category, brand, productImage, null);
                ProductDetail productDetail = new ProductDetail(productDetailId, null, product, productColor, productSpecification, originalPrice, productQuantity, productDescribe, detailImages, null, null, null);

                return productDetail;
            }

            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return null;
    }

    public List<ProductDetail> top3ProductNewByDate() {
        List<ProductDetail> list = new ArrayList<>();
        try {
            String sql = "WITH CTE AS (\n"
                    + "SELECT[pdid], [pid], [pdcolor], [pdprice], [pdimg],[pddateupdate], [pdcriteria],\n"
                    + "ROW_NUMBER() OVER(PARTITION BY [pid] ORDER BY [pdid]) AS RowNum\n"
                    + "FROM [dbo].[ProductDetails])\n"
                    + "SELECT TOP 3\n"
                    + "C.[pdid], C.[pid], C.[pdcolor], C.[pdprice],P.[pname],\n"
                    + "P.[cid],P.[bid],P.[pimg], C.[pddateupdate], C.[pdcriteria]\n"
                    + "FROM CTE C\n"
                    + "JOIN [dbo].[Product] P ON C.[pid] = P.[pid]\n"
                    + "WHERE C.RowNum = 1\n"
                    + "ORDER BY C.[pddateupdate] DESC;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                // Product
                int productId = rs.getInt("pid");
                String productName = rs.getString("pname");
                String productImage = rs.getString("pdimg");
                String[] images = productImage.split(",");

                // ProductDetail attributes
                int productDetailId = rs.getInt("pdid");
                float originalPrice = rs.getFloat("pdprice");
                String pdCriteria = rs.getString("pdcriteria");

                // Create Product object
                Product product = new Product(productId, productName, null, null, productImage, null);

                // Create ProductDetail object
                ProductDetail productDetail = new ProductDetail(productDetailId, null, product, null, null, originalPrice, 0, null, images, pdCriteria, null, null);
                // Add to list
                list.add(productDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ProductDetail getProductById(String id) {
        try {
            String sql = "SELECT p.pid, p.pname, p.pimg, pd.pdcriteria, pd.pdcolor, pd.pdquantity, pd.pdprice, pd.pdid, pd.pdname "
                    + "FROM Product p "
                    + "JOIN ProductDetails pd ON p.pid = pd.pid "
                    + "WHERE p.pid = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                // Product
                int productId = rs.getInt("pid");
                String productName = rs.getString("pname");
                String productImage = rs.getString("pimg");
                String[] images = productImage.split(",");

                // ProductDetail specific fields
                int productDetailId = rs.getInt("pdid");
                String productColor = rs.getString("pdcolor");
                float originalPrice = rs.getFloat("pdprice");
                int productQuantity = rs.getInt("pdquantity");
                String pdName = rs.getString("pdname");
                String pdCriteria = rs.getString("pdcriteria");

                // Construct Product and ProductDetail objects
                Product product = new Product(productId, productName, null, null, productImage, null);
                ProductDetail productDetail = new ProductDetail(productDetailId, pdName, product, productColor, null, originalPrice, productQuantity, null, images, pdCriteria, null, null);

                return productDetail;
            }

            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return null;
    }

    public ProductDetail getProductDetailById(int productDetailId) {
        ProductDetail productDetail = null;
        String sql = "SELECT pd.pdid, pd.pdname, pd.pdimg, pd.pdcriteria, "
                + "pd.pdcolor, pd.pdspecification, pd.pdquantity, pd.pdprice, "
                + "pd.pddescribe, p.pid, p.pname, p.pimg "
                + "FROM ProductDetails pd "
                + "JOIN Product p ON pd.pid = p.pid "
                + "WHERE pd.pdid = ?";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, productDetailId);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                int productId = rs.getInt("pid");
                String productName = rs.getString("pname");
                String productImage = rs.getString("pimg");
                String productDetailName = rs.getString("pdname");
                String productImageDetail = rs.getString("pdimg");
                String productCriteria = rs.getString("pdcriteria");
                String productColor = rs.getString("pdcolor");
                String productSpecification = rs.getString("pdspecification");
                int productQuantity = rs.getInt("pdquantity");
                float originalPrice = rs.getFloat("pdprice");
                String productDescribe = rs.getString("pddescribe");

                String[] images = productImageDetail.split(",");

                Product product = new Product(productId, productName, null, null, productImage, null);

                productDetail = new ProductDetail(productDetailId, productDetailName, product, productColor, productSpecification, originalPrice, productQuantity, productDescribe, images, productCriteria, null, null);
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return productDetail;
    }

    public List<ProductDetail> getProductsByStorage(String storageOption, String brandID, String cateID, String searchP) {
        List<ProductDetail> products = new ArrayList<>();
        String sql = "WITH CTE AS (\n"
                + "    SELECT pdid, pid, pdcolor, pdspecification, pdprice, pdquantity, \n"
                + "           pddescribe, pdimg, pddateupdate, pdcriteria, pdname,\n"
                + "           ROW_NUMBER() OVER(PARTITION BY pid ORDER BY pdid) AS RowNum\n"
                + "    FROM dbo.ProductDetails\n"
                + ")\n"
                + "SELECT C.pdid, C.pid, C.pdcolor, C.pdspecification, C.pdprice, C.pdquantity, \n"
                + "       C.pddescribe, C.pdimg, C.pddateupdate, P.pname, P.cid, P.bid, \n"
                + "       P.pimg, C.pdname, C.pdcriteria\n"
                + "FROM CTE C\n"
                + "JOIN dbo.Product P ON C.pid = P.pid\n";

        // Thêm điều kiện lọc theo brandID
        if (brandID != null && !brandID.isEmpty()) {
            sql += "JOIN dbo.Brand B ON P.bid = B.bid AND B.bid = ?\n";
        }

        // Thêm điều kiện lọc theo cateID
        if (cateID != null && !cateID.isEmpty()) {
            sql += "JOIN dbo.Category Cat ON P.cid = Cat.cid AND Cat.cid = ?\n";
        }

        sql += "WHERE C.RowNum = 1\n";

        switch (storageOption) {
            case "above512":
                sql += "AND (C.pdcriteria LIKE '%GB%' OR C.pdcriteria LIKE '%TB%')\n"
                        + "    AND (\n"
                        + "        C.pdcriteria LIKE '%512GB%'\n"
                        + "        OR C.pdcriteria LIKE '1TB%'\n"
                        + "    );";
                break;
            case "128to256":
                sql += "AND pdcriteria LIKE '%GB%'\n"
                        + "    AND (\n"
                        + "    C.pdcriteria LIKE '%128GB%' OR\n"
                        + "    C.pdcriteria LIKE '%256GB%'\n"
                        + ")";
                break;
            case "32and64":
                sql += "AND pdcriteria LIKE '%GB%'\n"
                        + "    AND (\n"
                        + "    C.pdcriteria LIKE '%32GB%' OR\n"
                        + "    C.pdcriteria LIKE '%64GB%'\n"
                        + ")";
                break;
            default:
                return products;
        }
        // Thêm điều kiện lọc theo từ khóa tìm kiếm (searchP)
        if (searchP != null && !searchP.isEmpty()) {
            sql += "    AND (P.pname LIKE ? OR C.pdname LIKE ?)\n";
        }
        try (PreparedStatement statement = connection.prepareStatement(sql)) {

            int parameterIndex = 1;

            // Đặt các tham số cho brandID, cateID và searchP nếu chúng được sử dụng
            if (brandID != null && !brandID.isEmpty()) {
                statement.setString(parameterIndex++, brandID);
            }

            if (cateID != null && !cateID.isEmpty()) {
                statement.setString(parameterIndex++, cateID);
            }

            if (searchP != null && !searchP.isEmpty()) {
                String likePattern = "%" + searchP + "%";
                statement.setString(parameterIndex++, likePattern);
                statement.setString(parameterIndex++, likePattern);
            }

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int pdid = rs.getInt("pdid");
                String pdcolor = rs.getString("pdcolor");
                String pdspecification = rs.getString("pdspecification");
                float pdprice = rs.getFloat("pdprice");
                int pdquantity = rs.getInt("pdquantity");
                String pddescribe = rs.getString("pddescribe");

                int pid = rs.getInt("pid");
                String pname = rs.getString("pname");
                String pimg = rs.getString("pimg");
                String[] images = pimg.split(",");
                String pdname = rs.getString("pdname");
                String pdcriteria = rs.getString("pdcriteria");

                Product product = new Product(pid, pname, null, null, pimg, null);
                ProductDetail productDetail = new ProductDetail(pdid, pdname, product, pdcolor, pdspecification, pdprice, pdquantity, pddescribe, images, pdcriteria, null, null);

                products.add(productDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    public ProductDetailDTO getProductDetailByColorAndCriteria(String pid, String color, String criteria) {
        ProductDetailDTO productDetailDTO = null;
        String sql = "SELECT pd.pdid, pd.pdname, pd.pdimg, pd.pdcriteria, "
                + "pd.pdcolor, pd.pdspecification, pd.pdquantity, pd.pdprice, "
                + "pd.pddescribe, p.pname, d.dprice "
                + "FROM ProductDetails pd "
                + "JOIN Product p ON pd.pid = p.pid "
                + "LEFT JOIN Discount d ON pd.pdid = d.pdid "
                + "WHERE pd.pid =? AND pd.pdcolor LIKE N'%' +? + '%' AND pd.pdcriteria =?";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, pid);
            stm.setString(2, color.trim());
            stm.setString(3, criteria.trim());
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                int productDetailId = rs.getInt("pdid");
                String productDetailName = rs.getString("pdname");
                String productImage = rs.getString("pdimg");
                String productCriteria = rs.getString("pdcriteria");
                String productColor = rs.getString("pdcolor");
                String productSpecification = rs.getString("pdspecification");
                int productQuantity = rs.getInt("pdquantity");
                float originalPrice = rs.getFloat("pdprice");
                String productDescribe = rs.getString("pddescribe");
                String productName = rs.getString("pname");
                float discountPrice = rs.getFloat("dprice");

                String[] images = productImage.split(",");

                Product product = new Product(Integer.parseInt(pid), productName, null, null, productImage, null);

                productDetailDTO = new ProductDetailDTO(
                        new ProductDetail(productDetailId, productDetailName, product, productColor, productSpecification, originalPrice, productQuantity, productDescribe, images, productCriteria, null, null),
                        discountPrice
                );
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return productDetailDTO;
    }

    public List<ProductDetailDTO> getProductDetailsByPidAndCriteria(String pid, String criteria) {
        List<ProductDetailDTO> list = new ArrayList<>();
        String sql = "SELECT pd.pdid, pd.pdname, pd.pdimg, pd.pdcriteria, "
                + "pd.pdcolor, pd.pdspecification, pd.pdquantity, pd.pdprice, "
                + "pd.pddescribe, p.pname, d.dprice "
                + "FROM ProductDetails pd "
                + "JOIN Product p ON pd.pid = p.pid "
                + "LEFT JOIN Discount d ON pd.pdid = d.pdid "
                + "WHERE pd.pid = ? AND pd.pdcriteria = ?";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, pid);

            // Kiểm tra và xử lý criteria nếu nó là null
            if (criteria != null) {
                stm.setString(2, criteria.trim());
            } else {
                stm.setString(2, "");
            }

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int productDetailId = rs.getInt("pdid");
                String productDetailName = rs.getString("pdname");
                String productImage = rs.getString("pdimg");
                String productCriteria = rs.getString("pdcriteria");
                String productColor = rs.getString("pdcolor");
                String productSpecification = rs.getString("pdspecification");
                int productQuantity = rs.getInt("pdquantity");
                float originalPrice = rs.getFloat("pdprice");
                String productDescribe = rs.getString("pddescribe");
                String productName = rs.getString("pname");
                float discountPrice = rs.getFloat("dprice");

                String[] images = productImage.split(",");

                Product product = new Product(Integer.parseInt(pid), productName, null, null, productImage, null);

                ProductDetail productDetail = new ProductDetail(productDetailId, productDetailName, product, productColor, productSpecification, originalPrice, productQuantity, productDescribe, images, productCriteria, null, null);

                ProductDetailDTO productDetailDTO = new ProductDetailDTO(productDetail, discountPrice);
                list.add(productDetailDTO);
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return list;
    }

    public Set<String> getAllCriteriaByPid(String pid) {
        Set<String> criteriaSet = new HashSet<>();
        String sql = "SELECT DISTINCT pdcriteria FROM ProductDetails WHERE pid = ?";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, pid);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                String criteria = rs.getString("pdcriteria");
                criteriaSet.add(criteria);
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return criteriaSet;
    }

    public int getTotalProductDetail() {
        try {
            String sql = "select count(*) from ProductDetails";
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

    public List<ProductDetail> top10ProductDetails() {
        List<ProductDetail> productDetails = new ArrayList<>();
        try {
            String sql = "SELECT TOP 10 pdid, pdimg, pdname, pdcolor, pdprice FROM ProductDetails\n"
                    + "WHERE pdstatus = 1\n"
                    + "ORDER BY pddateupdate DESC ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ProductDetail pd = new ProductDetail();
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
                pd.setOriginalPrice(rs.getFloat("pdprice"));
                productDetails.add(pd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }
        return productDetails;
    }

    public static void main(String[] args) {
        ProductDetailDBContext p = new ProductDetailDBContext();
        List<ProductDetailDTO> list = p.getProductDetailsByPidAndCriteria("1", "128GB");
        for (ProductDetailDTO o : list) {
            System.out.println(o);

        }

    }
}
