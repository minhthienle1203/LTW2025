package com.colami.ltw2025.dao;

import com.colami.ltw2025.context.DBContext;
import com.colami.ltw2025.entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // 1. Lấy tất cả sản phẩm (Dùng cho trang Shop)
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 2. Lấy sản phẩm theo mã danh mục (Dùng để lọc Laptop/Điện thoại)
    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE cateID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 3. Lấy chi tiết một sản phẩm theo ID (Dùng cho trang Detail)
    public Product getProductByID(String id) {
        String query = "SELECT * FROM Product WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 4. Tìm kiếm sản phẩm theo tên (Dùng cho ô Search)
    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE [name] LIKE ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();

        // Test 1: Lấy tất cả sản phẩm
        List<Product> list = dao.getAllProduct();
        System.out.println("--- DANH SÁCH TẤT CẢ SẢN PHẨM ---");
        for (Product o : list) {
            System.out.println(o);
        }

        // Test 2: Lấy sản phẩm theo ID (Ví dụ ID = 1)
        System.out.println("\n--- CHI TIẾT SẢN PHẨM ID = 1 ---");
        Product p = dao.getProductByID("1");
        if (p != null) {
            System.out.println(p.getName() + " - Giá: " + p.getPrice());
        } else {
            System.out.println("Không tìm thấy sản phẩm!");
        }
    }
}
