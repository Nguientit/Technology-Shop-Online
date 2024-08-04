/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.time.LocalDate;

/**
 *
 * @author PC
 */
public class Feedback {

    private int id;
    private Product Product;
    private String content;
    private int rate;
    private LocalDate rateTime;
    private String[] img;
    private Account account;

    public Feedback() {
    }

    public Feedback(int id, Product Product, String content, int rate, LocalDate rateTime, String[] img, Account account) {
        this.id = id;
        this.Product = Product;
        this.content = content;
        this.rate = rate;
        this.rateTime = rateTime;
        this.img = img;
        this.account = account;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return Product;
    }

    public void setProduct(Product Product) {
        this.Product = Product;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public LocalDate getRateTime() {
        return rateTime;
    }

    public void setRateTime(LocalDate rateTime) {
        this.rateTime = rateTime;
    }

    public String[] getImg() {
        return img;
    }

    public void setImg(String[] img) {
        this.img = img;
    }

    public void setImg(String img) {
        this.img = new String[]{img};
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", Product=" + Product + ", content=" + content + ", rate=" + rate + ", rateTime=" + rateTime + ", img=" + img + ", account=" + account + '}';
    }

    
}
