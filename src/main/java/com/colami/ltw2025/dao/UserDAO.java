package com.colami.ltw2025.dao;

import com.colami.ltw2025.context.DBContext;
import com.colami.ltw2025.entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Account login(String user, String pass) {
        // 1. Chú ý tên bảng và tên cột (phải có ngoặc vuông nếu tên cột trùng từ khóa SQL)
        String query = "SELECT * FROM Account WHERE [user] = ? AND [pass] = ?";

        // Khai báo try-with-resources (Tự động đóng kết nối khi xong)
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, user);
            ps.setString(2, pass);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    return new Account(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4),
                            rs.getInt(5)
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}