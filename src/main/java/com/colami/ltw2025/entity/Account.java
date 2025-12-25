package com.colami.ltw2025.entity;

public class Account {
    private int id;
    private String user;
    private String pass;
    private int isSell;  // 1: Người bán, 0: Người mua
    private int isAdmin; // 1: Admin, 0: User thường

    // 1. Constructor rỗng
    public Account() {
    }

    // 2. Constructor đầy đủ (Khớp 100% với thứ tự cột trong SQL)
    public Account(int id, String user, String pass, int isSell, int isAdmin) {
        this.id = id;
        this.user = user;
        this.pass = pass;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
    }

    // --- Getter & Setter ---
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUser() { return user; }
    public void setUser(String user) { this.user = user; }

    public String getPass() { return pass; }
    public void setPass(String pass) { this.pass = pass; }

    public int getIsSell() { return isSell; }
    public void setIsSell(int isSell) { this.isSell = isSell; }

    public int getIsAdmin() { return isAdmin; }
    public void setIsAdmin(int isAdmin) { this.isAdmin = isAdmin; }

    @Override
    public String toString() {
        return "Account{" + "user=" + user + ", isAdmin=" + isAdmin + '}';
    }
}