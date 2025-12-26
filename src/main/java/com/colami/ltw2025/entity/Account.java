package com.colami.ltw2025.entity;

public class Account {
    private int uID;    // Khớp với tên cột [uID] trong SQL bợn đã gửi
    private String user;
    private String pass;
    private int isSell;
    private int isAdmin;

    public Account() {
    }

    public Account(int uID, String user, String pass, int isSell, int isAdmin) {
        this.uID = uID;
        this.user = user;
        this.pass = pass;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
    }

    // Getter và Setter
    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getIsSell() {
        return isSell;
    }

    public void setIsSell(int isSell) {
        this.isSell = isSell;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Account{" +
                "uID=" + uID +
                ", user='" + user + '\'' +
                ", isSell=" + isSell +
                ", isAdmin=" + isAdmin +
                '}';
    }
}