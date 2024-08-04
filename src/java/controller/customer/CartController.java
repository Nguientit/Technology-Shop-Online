package controller.customer;

import dal.BrandDBContext;
import dal.CartDBContext;
import dal.CategoryDBContext;
import dal.DiscountDBContext;
import dal.ProductDBContext;
import dal.ProductDetailDBContext;
import entity.Account;
import entity.Cart;
import entity.CartDetail;
import entity.Category;
import entity.Discount;
import entity.ProductDetail;
import entity.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Initialize database contexts
        ProductDBContext productDB = new ProductDBContext();
        CategoryDBContext cateDB = new CategoryDBContext();
        DiscountDBContext disDB = new DiscountDBContext();
        ProductDetailDBContext pdDB = new ProductDetailDBContext();
        CartDBContext cartDB = new CartDBContext();

        // Get search parameter
        String searchP = request.getParameter("search");
        
        // Retrieve search results, categories, and discounts
        List<ProductDetail> productList = productDB.searchByName(searchP);
        List<Category> categoryList = cateDB.getAllCategory();
        List<Discount> discountList = disDB.getDiscounts();

        // Set attributes for request
        request.setAttribute("listP", productList);
        request.setAttribute("listC", categoryList);
        request.setAttribute("listDC", discountList);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart = getCartForUser(user, session, cartDB);

        // Handle add item to cart
        String productIdParam = request.getParameter("productDetailId");
        if (productIdParam != null) {
            try {
                int productDetailId = Integer.parseInt(productIdParam);
                ProductDetail productDetail = pdDB.getProductDetailById(productDetailId);
                if (productDetail != null) {
                    CartDetail existingItem = cart.getItemByProductDetailId(productDetailId);
                    if (existingItem != null) {
                        existingItem.setQuantity(existingItem.getQuantity() + 1);
                        cartDB.updateCartDetail(existingItem, cart.getId());
                    } else {
                        CartDetail newItem = new CartDetail(0, existingItem.getQuantity() + 1, productDetail);
                        cart.addItem(newItem);
                        cartDB.insertCartDetail(newItem, cart.getId());
                    }
                }
            } catch (NumberFormatException e) {
                // Handle error
            }
        }

        // Handle remove item from cart
        handleRemoveItemFromCart(request, cart, user, cartDB);

        // Get items in cart and total money
        List<CartDetail> listItemsInCart = cart.getItems();
        double totalMoney = cart.getTotalMoney(discountList);

        // Update session attributes
        updateSessionAttributes(session, cart, listItemsInCart, discountList, totalMoney);

        // Set request attributes
        updateRequestAttributes(request, cart, listItemsInCart, discountList, totalMoney);

        // Forward to cart.jsp
        request.getRequestDispatcher("/view/customer/cart.jsp").forward(request, response);
    }

    private Cart getCartForUser(User user, HttpSession session, CartDBContext cartDB) {
        Cart cart = null;
        if (user != null) {
            Account account = user.getAccount();
            cart = cartDB.getCartByUserId(account.getId());
            if (cart == null) {
                cart = new Cart();
                cart.setAccount(account);
                cartDB.insertCart(cart);
            } else {
                session.setAttribute("cart", cart);
            }
        } else {
            cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        }
        return cart;
    }

    private void handleRemoveItemFromCart(HttpServletRequest request, Cart cart, User user, CartDBContext cartDB) {
        String tRid = request.getParameter("rid");
        if (tRid != null) {
            try {
                int rid = Integer.parseInt(tRid);
                cart.removeItem(rid);
                if (user != null) {
                    cartDB.deleteCartDetail(rid, cart.getId());
                }
            } catch (NumberFormatException e) {
                // Handle error
            }
        }
    }

    private void updateSessionAttributes(HttpSession session, Cart cart, List<CartDetail> listItemsInCart, List<Discount> discountList, double totalMoney) {
        session.setAttribute("cart", cart);
        session.setAttribute("listItemsInCart", listItemsInCart);
        session.setAttribute("cartSize", listItemsInCart.size());
        session.setAttribute("discounts", discountList);
        session.setAttribute("totalMoney", totalMoney);
    }

    private void updateRequestAttributes(HttpServletRequest request, Cart cart, List<CartDetail> listItemsInCart, List<Discount> discountList, double totalMoney) {
        request.setAttribute("cart", cart);
        request.setAttribute("listItemsInCart", listItemsInCart);
        request.setAttribute("cartSize", listItemsInCart.size());
        request.setAttribute("discounts", discountList);
        request.setAttribute("totalMoney", totalMoney);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "CartController handles displaying and updating the shopping cart";
    }
}
