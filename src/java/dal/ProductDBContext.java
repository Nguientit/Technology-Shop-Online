package dal;

import dal.DBContext;
import entity.ProductDetail;
import dal.DiscountDBContext;
import entity.Discount;
import entity.Brand;
import entity.Category;
import entity.Product;
import entity.ProductDetail;
import java.sql.*;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDBContext extends DBContext {

    public ArrayList<Product> listProduct() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select a.pid,a.pname, a.pdateupdate, a.pimg, a.cid, a.bid from Product as a";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("pid"));
                product.setName(rs.getString("pname"));
                product.setImage(rs.getString("pimg"));
                product.setDateUpdate(rs.getDate("pdateupdate"));
                product.setCategory(new CategoryDBContext().getCategoryById(rs.getInt("cid")));
                product.setBrand(new BrandDBContext().getBrandById(rs.getInt("bid")));
                products.add(product);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public void insertProduct(Product entity) {
        try {
            String sql = "INSERT INTO [dbo].[Product]\n"
                    + "      ([pname]\n"
                    + "      ,[cid]\n"
                    + "      ,[bid]\n"
                    + "      ,[pimg]\n"
                    + "      ,[pdateupdate]) VALUES(?,?,?,?,GETDATE())";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, entity.getName());
            stm.setInt(2, entity.getCategory().getId());
            stm.setInt(3, entity.getBrand().getId());
            stm.setString(4, entity.getImage());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateProduct(Product entity) {
        try {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "         SET [pname] = ?,\n"
                    + "         [cid] = ?,\n"
                    + "         [bid] = ?,\n"
                    + "         [pimg] = ?,\n"
                    + "         [pdateupdate] = GETDATE()\n"
                    + "         WHERE [pid] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(5, entity.getId());
            stm.setString(1, entity.getName());
            stm.setInt(2, entity.getCategory().getId());
            stm.setInt(3, entity.getBrand().getId());
            stm.setString(4, entity.getImage());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteProduct(Product entity) {
        try {
            // Bắt đầu giao dịch
            connection.setAutoCommit(false);

            // Xóa các hàng trong bảng ProductDetails có pid tương ứng
            String sql1 = "DELETE FROM [dbo].[ProductDetails] WHERE pid = ?;";
            PreparedStatement stm1 = connection.prepareStatement(sql1);
            stm1.setInt(1, entity.getId());
            stm1.executeUpdate();

            // Xóa hàng trong bảng Product
            String sql2 = "DELETE FROM [dbo].[Product] WHERE pid = ?;";
            PreparedStatement stm2 = connection.prepareStatement(sql2);
            stm2.setInt(1, entity.getId());
            stm2.executeUpdate();

            // Hoàn tất giao dịch
            connection.commit();

        } catch (SQLException ex) {
            try {
                // Nếu có lỗi, quay lại giao dịch
                connection.rollback();
            } catch (SQLException rollbackEx) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, rollbackEx);
            }
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                // Đặt lại chế độ tự động commit
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, e);
            }
        }
    }

    public Product getProductById(int id) {
        try {
            String sql = "select p.pid, p.pimg, p.pname, p.pdateupdate, c.cid, c.cname, b.bid, b.bname  from Product p \n"
                    + "      INNER JOIN Category c on p.cid = c.cid\n"
                    + "      INNER JOIN Brand b on p.bid = b.bid\n"
                    + "      where p.pid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
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

                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
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
                    + "    P.[pimg],\n"
                    + "    P.[pdateupdate],\n"
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
                String productImage = rs.getString("pimg");

                // ProductDetail specific fields
                int productDetailId = rs.getInt("pdid");
                String productColor = rs.getString("pdcolor");
                String productSpecification = rs.getString("pdspecification");
                float originalPrice = rs.getFloat("pdprice");
                int productQuantity = rs.getInt("pdquantity");
                String productDescribe = rs.getString("pddescribe");
                String productDetailImage = rs.getString("pdimg");
                String[] images = productDetailImage.split(",");

                // Brand
                int brandId = rs.getInt("bid");
                String brandName = rs.getString("bname");
                Brand brand = new Brand(brandId, brandName,null);

                // Construct Product and ProductDetail objects
                Product product = new Product(productId, productName, category, brand, productImage, null);
                ProductDetail productDetail = new ProductDetail(productDetailId, null, product, productColor, productSpecification, originalPrice, productQuantity, productDescribe, images, null, null, null);

                return productDetail;

            }

            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return null;
    }

    public ArrayList<Product> list() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select a.pid,a.pname, a.pdateupdate, a.pimg, a.cid, a.bid from Product as a";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("pid"));
                product.setName(rs.getString("pname"));
                product.setImage(rs.getString("pimg"));
                product.setDateUpdate(rs.getDate("pdateupdate"));
                product.setCategory(new CategoryDBContext().getCategoryById(rs.getInt("cid")));
                product.setBrand(new BrandDBContext().getBrandById(rs.getInt("bid")));
                products.add(product);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public List<ProductDetail> getFilteredProducts(String search, String brand, String category) {
        List<ProductDetail> list = new ArrayList<>();
        try {
            StringBuilder sql = new StringBuilder("SELECT ... FROM ProductDetails pd ");
            sql.append("JOIN Product p ON pd.pid = p.pid ");
            sql.append("JOIN Category c ON p.cid = c.cid ");
            sql.append("JOIN Brand b ON p.bid = b.bid ");
            sql.append("WHERE 1=1 ");

            if (search != null && !search.isEmpty()) {
                sql.append("AND LOWER(REPLACE(p.pname, ' ', '')) LIKE LOWER(REPLACE(?, ' ', '')) ");
            }
            if (brand != null && !brand.isEmpty()) {
                sql.append("AND b.bname = ? ");
            }
            if (category != null && !category.isEmpty()) {
                sql.append("AND c.cname = ? ");
            }

            PreparedStatement stm = connection.prepareStatement(sql.toString());
            int paramIndex = 1;
            if (search != null && !search.isEmpty()) {
                stm.setString(paramIndex++, "%" + search + "%");
            }
            if (brand != null && !brand.isEmpty()) {
                stm.setString(paramIndex++, brand);
            }
            if (category != null && !category.isEmpty()) {
                stm.setString(paramIndex++, category);
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                // Xử lý kết quả từ ResultSet và thêm vào danh sách sản phẩm
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

                int cid = rs.getInt("cid");
                String categoryName = rs.getString("cname");
                Category categoryObj = new Category(cid, categoryName);

                int bid = rs.getInt("bid");
                String brandName = rs.getString("bname");
                Brand brandObj = new Brand(bid, brandName, null);
                String pdCriteria = rs.getString("pdcriteria");

                Product product = new Product(pid, pname, categoryObj, brandObj, pimg, null);
                ProductDetail productDetail = new ProductDetail(pdid, null, product, pdcolor, pdspecification, pdprice, pdquantity, pddescribe, images, pdCriteria, null, null);

                list.add(productDetail);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ProductDetail> sortByPrice(List<ProductDetail> products, String sort) {
        if (sort.equals("desc")) {
            products.sort(Comparator.comparing(ProductDetail::getOriginalPrice).reversed());
        } else {
            products.sort(Comparator.comparing(ProductDetail::getOriginalPrice));
        }
        return products;
    }

    public List<ProductDetail> searchByName(String name) {
        List<ProductDetail> list = new ArrayList<>();
        try {
            String sql = "WITH CTE AS (\n"
                    + "    SELECT pdid, pid, pdcolor, pdspecification, pdprice, pdquantity, \n"
                    + "           pddescribe, pdimg, pddateupdate,pdcriteria,\n"
                    + "           ROW_NUMBER() OVER(PARTITION BY pid ORDER BY pdid) AS RowNum\n"
                    + "    FROM dbo.ProductDetails\n"
                    + ")\n"
                    + "SELECT C.pdid, C.pid, C.pdcolor, C.pdspecification, C.pdprice, C.pdquantity, \n"
                    + "       C.pddescribe, C.pdimg, P.pname, P.cid, P.bid, \n"
                    + "       P.pimg , Cat.cname, b.bid, b.bname, C.pdcriteria\n"
                    + "FROM CTE C\n"
                    + "JOIN dbo.Product P ON C.pid = P.pid\n"
                    + "JOIN dbo.Category Cat ON P.cid = Cat.cid\n"
                    + "JOIN dbo.Brand B ON P.bid = B.bid\n"
                    + "WHERE C.RowNum = 1\n"
                    + "  AND LOWER(REPLACE(p.pname, ' ', '')) LIKE LOWER(REPLACE(?, ' ', ''))";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + name + "%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                // ProductDetail fields
                int pdid = rs.getInt("pdid");
                String pdcolor = rs.getString("pdcolor");
                String pdspecification = rs.getString("pdspecification");
                float pdprice = rs.getFloat("pdprice");
                int pdquantity = rs.getInt("pdquantity");
                String pddescribe = rs.getString("pddescribe");
                String pdCriteria = rs.getString("pdcriteria");

                // Product fields
                int pid = rs.getInt("pid");
                String pname = rs.getString("pname");
                String pimg = rs.getString("pimg");
                String[] images = pimg.split(",");

                // Category fields
                int cid = rs.getInt("cid");
                String categoryName = rs.getString("cname");
                Category category = new Category(cid, categoryName);

                // Brand fields
                int bid = rs.getInt("bid");
                String brandName = rs.getString("bname");
                Brand brand = new Brand(bid, brandName, null);

                // Create Product object
                Product product = new Product(pid, pname, category, brand, pimg, null);

                // Create ProductDetail object
                ProductDetail productDetail = new ProductDetail(pdid, null, product, pdcolor, pdspecification, pdprice, pdquantity, pddescribe, images, pdCriteria, null, null);

                list.add(productDetail);
            }

            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void insert(Product entity) {
        try {
            String sql = "INSERT INTO [dbo].[Product]\n"
                    + "      ([pname]\n"
                    + "      ,[cid]\n"
                    + "      ,[bid]\n"
                    + "      ,[pimg]\n"
                    + "      ,[pdateupdate]) VALUES(?,?,?,?,GETDATE())";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, entity.getName());
            stm.setInt(2, entity.getCategory().getId());
            stm.setInt(3, entity.getBrand().getId());
            stm.setString(4, entity.getImage());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void update(Product entity) {
        try {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "         SET [pname] = ?,\n"
                    + "         [cid] = ?,\n"
                    + "         [bid] = ?,\n"
                    + "         [pimg] = ?,\n"
                    + "         [pdateupdate] = ?\n"
                    + "         WHERE [pid] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(6, entity.getId());
            stm.setString(1, entity.getName());
            stm.setInt(2, entity.getCategory().getId());
            stm.setInt(3, entity.getBrand().getId());
            stm.setString(4, entity.getImage());
            stm.setDate(5, (Date) entity.getDateUpdate());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delete(Product entity) {
        try {
            String sql = "DELETE FROM [dbo].[Product]\n"
                    + "      WHERE pid =?";
            PreparedStatement stm = connection.prepareCall(sql);
            stm.setInt(1, entity.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Product get(int id) {
        try {
            String sql = "select p.pid, p.pimg, p.pname, p.pdateupdate, c.cid, c.cname, b.bid, b.bname  from Product p \n"
                    + "      INNER JOIN Category c on p.cid = c.cid\n"
                    + "      INNER JOIN Brand b on p.bid = b.bid\n"
                    + "      where p.pid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
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

                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getsearchByName(String name) {
        List<Product> products = new ArrayList<>();
        try {
            String sql = "select pid, pname, c.cid, c.cname, b.bid, b.bname,\n"
                    + "pimg, pdateupdate from Product p\n"
                    + "join Category c on c.cid = p.cid\n"
                    + "join Brand b on b.bid = p.bid\n";
            if (name != null && !name.isEmpty()) {
                sql += "where p.pname LIKE ?";
            }

            PreparedStatement stm = connection.prepareStatement(sql);
            if (name != null && !name.isEmpty()) {
                stm.setString(1, "%" + name + "%");
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
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public List<Product> getCategoryWithBrandAndProducts() {
        List<Product> list = new ArrayList<>();

        try {
            String sql = "SELECT "
                    + "    c.cid AS category_id, "
                    + "    c.cname AS category_name, "
                    + "    b.bid AS brand_id, "
                    + "    b.bname AS brand_name, "
                    + "    p.pid AS product_id, "
                    + "    p.pname AS product_name "
                    + "FROM "
                    + "    Category c "
                    + "INNER JOIN "
                    + "    Product p ON c.cid = p.cid "
                    + "LEFT JOIN "
                    + "    Brand b ON p.bid = b.bid "
                    + "ORDER BY "
                    + "    c.cid, b.bid, p.pid;";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                // Category
                int categoryId = rs.getInt("category_id");
                String categoryName = rs.getString("category_name");
                Category category = new Category(categoryId, categoryName);

                // Brand
                int brandId = rs.getInt("brand_id");
                String brandName = rs.getString("brand_name");
                Brand brand = new Brand(brandId, brandName, null);

                // Product
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");

                // Create Product object
                Product product = new Product(productId, productName, category, brand, productName, null);

                list.add(product);
            }

            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public boolean productExists(String productId) {
        try {
            // Kiểm tra nếu productId có phải là một số hợp lệ hay không
            if (!productId.matches("\\d+")) {
                return false; // Trả về false nếu không phải là số hợp lệ
            }

            String sql = "SELECT COUNT(*) FROM ProductDetails WHERE pdid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Integer.parseInt(productId));
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }
        return false;
    }

    public List<ProductDetail> getAllProduct() {
        List<ProductDetail> list = new ArrayList<>();
        try {
            String sql = "WITH CTE AS (\n"
                    + "SELECT [pdid], [pid], [pdcolor],[pdprice], \n"
                    + "[pdquantity],[pdimg],[pdcriteria],\n"
                    + "ROW_NUMBER() OVER(PARTITION BY [pid] ORDER BY [pdid]) AS RowNum\n"
                    + "FROM [dbo].[ProductDetails]\n"
                    + ")\n"
                    + "SELECT C.[pdid], C.[pid], P.[pname], C.[pdcolor], \n"
                    + "C.[pdprice], C.[pdquantity], P.[pimg], C.[pdcriteria]\n"
                    + "FROM CTE C\n"
                    + "JOIN [dbo].[Product] P ON C.[pid] = P.[pid]\n"
                    + "WHERE C.RowNum = 1";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("pid");
                String productName = rs.getString("pname");
                String productImage = rs.getString("pimg");
                String[] images = productImage.split(",");
                // ProductDetail attributes
                int productDetailId = rs.getInt("pdid");
                String productColor = rs.getString("pdcolor");
                int productQuantity = rs.getInt("pdquantity");
                float originalPrice = rs.getFloat("pdprice");
                String pdCriteria = rs.getString("pdcriteria");
                // Create Product object
                Product product = new Product(productId, productName, null, null, productImage, null);

                // Create ProductDetail object
                ProductDetail productDetail = new ProductDetail(productDetailId, null, product, productColor, null, originalPrice, productQuantity, null, images, null, null, null);
                // Add to list
                list.add(productDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }
        return list;
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
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }
        return 0;
    }

    public int getTotalProduct() {
        try {
            String sql = "select count(*) from Product";
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

    public List<Product> pagingProducts(int index) {
        List<Product> listproList = new ArrayList<>();
        try {
            String sql = "select * from Product\n"
                    + "order by pid\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH FIRST 10 ROW ONLY;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 10);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("pid"));
                product.setName(rs.getString("pname"));
                product.setImage(rs.getString("pimg"));
                product.setDateUpdate(rs.getDate("pdateupdate"));
                product.setCategory(new CategoryDBContext().getCategoryById(rs.getInt("cid")));
                product.setBrand(new BrandDBContext().getBrandById(rs.getInt("bid")));
                listproList.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return listproList;
    }

    public static void main(String[] args) {
        ProductDBContext pd = new ProductDBContext();
        List<Product> l = pd.getsearchByName("o");
        for (Product o : l) {
            System.out.println(o);
        }
    }

//    public static void main(String[] args) {
//        ProductDBContext db = new ProductDBContext();
//        Product list = db.getProductById(3);
//        System.out.println(list);
//    }
}
