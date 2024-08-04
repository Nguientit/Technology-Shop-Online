/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;

/**
 *
 * @author PC
 */
public class ProductDetail {

    private int id;
    private String name;
    private Product product;
    private String color;
    private String sepcifications;
    private float originalPrice;
    private int quantity;
    private String describe;
    private String[] image;
    private String criteria;
    private Boolean status;
    private Date dateUpdate;
    
    public ProductDetail() {
    }

    public ProductDetail(int id, String name, Product product, String color, String sepcifications, float originalPrice, int quantity, String describe, String[] image, String criteria, Boolean status, Date dateUpdate) {
        this.id = id;
        this.name = name;
        this.product = product;
        this.color = color;
        this.sepcifications = sepcifications;
        this.originalPrice = originalPrice;
        this.quantity = quantity;
        this.describe = describe;
        this.image = image;
        this.criteria = criteria;
        this.status = status;
        this.dateUpdate = dateUpdate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSepcifications() {
        return sepcifications;
    }

    public void setSepcifications(String sepcifications) {
        this.sepcifications = sepcifications;
    }

    public float getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(float originalPrice) {
        this.originalPrice = originalPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String[] getImage() {
        return image;
    }

    public void setImage(String[] image) {
        this.image = image;
    }
    
    public void setImage(String image) {
        this.image = new String[]{image};
    }

    public String getCriteria() {
        return criteria;
    }

    public void setCriteria(String criteria) {
        this.criteria = criteria;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Date getDateUpdate() {
        return dateUpdate;
    }

    public void setDateUpdate(Date dateUpdate) {
        this.dateUpdate = dateUpdate;
    }

    @Override
    public String toString() {
        return "ProductDetail{" + "id=" + id + ", name=" + name + ", product=" + product + ", color=" + color + ", sepcifications=" + sepcifications + ", originalPrice=" + originalPrice + ", quantity=" + quantity + ", describe=" + describe + ", image=" + Arrays.toString(image) +", criteria=" + criteria + ", status=" + status + ", dateUpdate=" + dateUpdate + '}';
    }
}
