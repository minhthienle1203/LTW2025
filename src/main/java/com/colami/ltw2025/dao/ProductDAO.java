package com.colami.ltw2025.dao;

import com.colami.ltw2025.context.DBContext;
import com.colami.ltw2025.entity.Account;
import com.colami.ltw2025.entity.Item;
import com.colami.ltw2025.entity.Order;
import com.colami.ltw2025.entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // 1. Lấy tất cả sản phẩm (Sắp xếp mới nhất lên đầu để Admin dễ nhìn)
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        // Sắp xếp giảm dần theo ID
        String query = "SELECT * FROM Product ORDER BY id DESC";
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
                        rs.getInt(7) // Đảm bảo constructor này khớp với Product Entity
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 2. Lấy sản phẩm theo mã danh mục
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

    // 3. Lấy chi tiết sản phẩm theo ID
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

    // 4. Tìm kiếm sản phẩm
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

    // 5. Đặt hàng (Transaction)
    public void insertOrder(Account acc, List<Item> cart, String name, String address, String phone, double totalMoney) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            conn = new DBContext().getConnection();

            // Insert Orders
            String query = "INSERT INTO [dbo].[Orders] ([accountID], [totalPrice], [date], [name], [address], [phone]) VALUES (?,?,?,?,?,?)";
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, acc.getuID());
            ps.setDouble(2, totalMoney);
            ps.setString(3, date);
            ps.setNString(4, name);
            ps.setNString(5, address);
            ps.setNString(6, phone);
            ps.executeUpdate();

            rs = ps.getGeneratedKeys();
            int oid = 0;
            if (rs.next()) {
                oid = rs.getInt(1);
            }

            // Insert OrderDetail
            String query2 = "INSERT INTO [dbo].[OrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (?,?,?,?)";
            ps = conn.prepareStatement(query2);
            for (Item i : cart) {
                ps.setInt(1, oid);
                ps.setInt(2, i.getProduct().getId());
                ps.setInt(3, i.getQuantity());
                ps.setDouble(4, i.getPrice());
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if(conn != null) conn.close(); } catch (Exception e) {}
        }
    }

    // 6. Lấy danh sách đơn hàng (Admin)
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String query = "SELECT * FROM Orders ORDER BY id DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getDouble(3),
                        rs.getDate(4), rs.getNString(5),
                        rs.getNString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // --- CÁC HÀM MỚI DÀNH CHO ADMIN MANAGER ---

    // 7. Xóa sản phẩm theo ID
    public void deleteProduct(String pid) {
        String query = "DELETE FROM Product WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 8. Thêm sản phẩm mới
    public void insertProduct(String name, String image, String price, String title, String description, String category) {
        String query = "INSERT INTO [dbo].[Product] \n" +
                "([name],[image],[price],[title],[description],[cateID])\n" +
                "VALUES(?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 9. Chỉnh sửa sản phẩm
    public void updateProduct(String id, String name, String image, String price, String title, String description, String category) {
        String query = "UPDATE [dbo].[Product]\n" +
                "SET [name] = ?,\n" +
                "[image] = ?,\n" +
                "[price] = ?,\n" +
                "[title] = ?,\n" +
                "[description] = ?,\n" +
                "[cateID] = ?\n" +
                "WHERE [id] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setString(7, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}