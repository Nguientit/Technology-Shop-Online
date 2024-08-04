/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class Discount {

    private int id;
    private ProductDetail pd;
    private float priceDiscount;

    public Discount() {
    }

    public Discount(int id, ProductDetail pd, float priceDiscount) {
        this.id = id;
        this.pd = pd;
        this.priceDiscount = priceDiscount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ProductDetail getPd() {
        return pd;
    }

    public void setPd(ProductDetail pd) {
        this.pd = pd;
    }

    public float getPriceDiscount() {
        return priceDiscount;
    }

    public void setPriceDiscount(float priceDiscount) {
        this.priceDiscount = priceDiscount;
    }

    @Override
    public String toString() {
        return "Discount{" + "id=" + id + ", pd=" + pd + ", priceDiscount=" + priceDiscount + '}';
    }

    
}
