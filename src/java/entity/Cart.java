/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class Cart {

    private int id;
    private Account account;
    private List<CartDetail> items = new ArrayList<>();

    public Cart() {
        items = new ArrayList<>();
    }

    public List<CartDetail> getItems() {
        return items;
    }

    public void setItems(List<CartDetail> items) {
        this.items = items;
    }

    public Cart(int id, Account account, List<CartDetail> items) {
        this.id = id;
        this.account = account;
        this.items = items;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @Override
    public String toString() {
        return "Cart{" + "id=" + id + ", account=" + account + ", items=" + items + '}';
    }

    public CartDetail getItemByProductDetailId(int productDetailId) {
        for (CartDetail i : items) {
            if (i.getPd().getId() == productDetailId) {
                return i;
            }
        }
        return null;
    }

    public void addItem(CartDetail t) {
        CartDetail existingItem = getItemByProductDetailId(t.getPd().getId());
        if (existingItem != null) {
            existingItem.setQuantity(existingItem.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void removeItem(int productDetailId) {
        CartDetail item = getItemByProductDetailId(productDetailId);
        if (item != null) {
            items.remove(item);
        }
    }

    private ProductDetail getProductById(int id, List<ProductDetail> list) {
        for (ProductDetail i : list) {
            if (i.getId() == id) {
                return i;
            }
        }
        return null;
    }

    public Cart(String txt, List<ProductDetail> productList) {
        this();
        if (txt != null && !txt.isEmpty()) {
            String[] parts = txt.split(",");
            for (String part : parts) {
                String[] idAndQuantity = part.split(":");
                try {
                    int id = Integer.parseInt(idAndQuantity[0]);
                    int quantity = Integer.parseInt(idAndQuantity[1]);
                    ProductDetail pd = getProductById(id, productList);
                    items.add(new CartDetail(id, quantity, pd));
                } catch (NumberFormatException e) {
                }
            }
        }
    }

    public int getCartSize() {
        return items.size();
    }

    public double getTotalMoney(List<Discount> listDC) {
        double total = 0;
        for (CartDetail item : items) {
            int quantity = item.getQuantity();
            float priceDiscount = findPriceDiscount(listDC, item.getPd().getId());
            if (priceDiscount > 0) {
                total += quantity * priceDiscount;
            } else {
                total += quantity * item.getPd().getOriginalPrice();
            }
        }
        return total;
    }

    // Phương thức để tìm giá giảm của sản phẩm trong danh sách listDC
    private float findPriceDiscount(List<Discount> listDC, int productId) {
        for (Discount discount : listDC) {
            if (discount.getPd().getId() == productId) {
                return discount.getPriceDiscount();
            }
        }
        return 0;
    }

    public float getPriceDiscount(List<Discount> listDC, int productId) {
        return findPriceDiscount(listDC, productId);
    }

    public String[] getProductImage(int productId) {
        for (CartDetail item : items) {
            if (item.getPd().getProduct().getId() == productId) {
                return item.getPd().getImage();
            }
        }
        return null;
    }

    public int getQuantityById(int id) {
        for (CartDetail item : items) {
            if (item.getPd().getId() == id) {
                return item.getQuantity();
            }
        }
        return 0;
    }

    public double getTotalPriceById(List<Discount> listDC, int id) {
        double totalPrice = 0;
        for (CartDetail item : items) {
            if (item.getPd().getId() == id) {
                int quantity = item.getQuantity();
                float priceDiscount = findPriceDiscount(listDC, item.getPd().getId());
                if (priceDiscount > 0) {
                    totalPrice += quantity * priceDiscount;
                } else {
                    totalPrice += quantity * item.getPd().getOriginalPrice();
                }
            }
        }
        return totalPrice;
    }

    public void updateQuantity(int productDetailId, int quantity) {
        for (CartDetail item : items) {
            if (item.getPd().getId() == productDetailId) {
                int newQuantity = item.getQuantity() + quantity;
                if (newQuantity <= 0) {
                    items.remove(item);
                } else {
                    item.setQuantity(newQuantity);
                }
                return;
            }
        }
    }

    public void updateItem(int oldProductDetailId, int newProductDetailId, String newColor, String newCriteria, ProductDetail newPd) {
        for (CartDetail item : items) {
            if (item.getPd().getId() == oldProductDetailId) {
                item.setPd(newPd);
                item.getPd().setId(newProductDetailId);
                item.getPd().setColor(newColor);
                item.getPd().setCriteria(newCriteria);
                return;
            }
        }
    }

    public void clear() {
        items.clear();
    }

    public void replaceItem(int oldProductDetailId, CartDetail newItem) {
        removeItem(oldProductDetailId);
        addItem(newItem);
    }

}
