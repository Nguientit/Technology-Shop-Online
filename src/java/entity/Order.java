/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;
import java.util.List;

/**
 *
 * @author PC
 */
public class Order {
    private int id;
    private Status status;
    private Account account;
    private String deliveryAddress;
    private String deliveryPhone;
    private String recipientName;
    private String payment;
    private float amount;
    private Date ordertime;
    private List<OrderDetail> orderDetails;
    
    public Order() {
    }

    public Order(int id, Status status, Account account, String deliveryAddress, String deliveryPhone, String recipientName, String payment, float amount, Date ordertime, List<OrderDetail> orderDetails) {
        this.id = id;
        this.status = status;
        this.account = account;
        this.deliveryAddress = deliveryAddress;
        this.deliveryPhone = deliveryPhone;
        this.recipientName = recipientName;
        this.payment = payment;
        this.amount = amount;
        this.ordertime = ordertime;
        this.orderDetails = orderDetails;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public String getDeliveryPhone() {
        return deliveryPhone;
    }

    public void setDeliveryPhone(String deliveryPhone) {
        this.deliveryPhone = deliveryPhone;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", status=" + status + ", account=" + account + ", deliveryAddress=" + deliveryAddress + ", deliveryPhone=" + deliveryPhone + ", recipientName=" + recipientName + ", payment=" + payment + ", amount=" + amount + ", ordertime=" + ordertime + ", orderDetails=" + orderDetails + '}';
    }

    
}
