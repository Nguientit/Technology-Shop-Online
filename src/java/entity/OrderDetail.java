/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class OrderDetail {
    private int id;
    private int oid;
    private int pdid;
    private String pname;
    private int quantity;
    private float price;
    
    public OrderDetail() {
    }

    public OrderDetail(int id, int oid, int pdid, String pname, int quantity, float price) {
        this.id = id;
        this.oid = oid;
        this.pdid = pdid;
        this.pname = pname;
        this.quantity = quantity;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getPdid() {
        return pdid;
    }

    public void setPdid(int pdid) {
        this.pdid = pdid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "id=" + id + ", oid=" + oid + ", pdid=" + pdid + ", pname=" + pname + ", quantity=" + quantity + ", price=" + price + '}';
    }

    
    
}
