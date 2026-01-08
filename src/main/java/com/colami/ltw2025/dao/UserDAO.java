package com.colami.ltw2025.dao;

import com.colami.ltw2025.context.DBContext;
import com.colami.ltw2025.entity.Account;

import java.sql.*;

public class UserDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Account login(String user, String pass) {
        // 1. Chú ý tên bảng và tên cột (phải có ngoặc vuông nếu tên cột trùng từ khóa SQL)
        String query = "SELECT * FROM Account WHERE [user] = ? AND [pass] = ?";

        // Khai báo try-with-resources (Tự động đóng kết nối khi xong)
        try (Connection conn = DBContext.getConnection();
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
    public static UserDAO getIn() {
        return new UserDAO();
    }

    public void insert(Account account) throws Exception {
        String query = "INSERT INTO Account([user], [pass], [isSell], [isAdmin]) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, account.getUser());
            ps.setString(2, account.getPass());
            ps.setInt(3, account.getIsSell());
            ps.setInt(4, account.getIsAdmin());

            ps.executeUpdate(); // Thực thi lệnh Insert
            System.out.println("Đã insert thành công user: " + account.getUser());

        } catch (SQLException e) {
            e.printStackTrace();
            throw e; // Ném lỗi ra để Controller biết
        }
    }
    public boolean kiemTraTenDangNhap(String username) throws Exception {
        boolean ketQua = false;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = DBContext.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT * FROM Account WHERE tendangnhap=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                ketQua = true;
            }

            // Bước 5:
            DBContext.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }
    // Thêm vào UserDAO.java
    public boolean checkUserForReset(String username) {
        // Chỉ chọn tài khoản có user trùng khớp VÀ isAdmin = 0
        String query = "SELECT * FROM Account WHERE [user] = ? AND isAdmin = 0";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, username);

            try (ResultSet rs = ps.executeQuery()) {
                // Nếu có kết quả trả về -> Là User thường và Tồn tại
                if (rs.next()) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public void updatePassword(String username, String newPass) {
        String query = "UPDATE Account SET pass = ? WHERE [user] = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, newPass);
            ps.setString(2, username);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}