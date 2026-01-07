package com.colami.ltw2025.context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    public static Connection getConnection() throws Exception {
        Connection c = null;
        try {
            // Cấu hình cho SQL Server
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShopDB;encrypt=true;trustServerCertificate=true";
            String user = "student";
            String pass = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            c = DriverManager.getConnection(url, user, pass);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return c;
    }

    // Test kết nối
    public static void main(String[] args) {
        try {
            System.out.println(getConnection());
            System.out.println("Kết nối thành công!");
        } catch (Exception e) {
            System.out.println("Lỗi kết nối: " + e.getMessage());
        }
    }

    public static void closeConnection(Connection c) {
        try {
            if(c!=null) {
                c.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}