package com.colami.ltw2025.entity;

import java.util.Date;

public class Order {
    private int id;
    private int accountID;
    private double totalPrice;
    private Date date;
    private String name;
    private String address;
    private String phone;

    public Order() {
    }

    public Order(int id, int accountID, double totalPrice, Date date, String name, String address, String phone) {
        this.id = id;
        this.accountID = accountID;
        this.totalPrice = totalPrice;
        this.date = date;
        this.name = name;
        this.address = address;
        this.phone = phone;
    }

    // --- Getter và Setter ---
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getAccountID() { return accountID; }
    public void setAccountID(int accountID) { this.accountID = accountID; }

    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", name=" + name + ", total=" + totalPrice + '}';
    }
}