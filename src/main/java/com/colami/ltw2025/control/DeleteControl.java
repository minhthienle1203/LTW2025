package com.colami.ltw2025.control;

import com.colami.ltw2025.dao.ProductDAO;
import com.colami.ltw2025.entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "DeleteControl", urlPatterns = {"/delete"})
public class DeleteControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Kiểm tra quyền Admin trước khi xóa
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");

        if (acc == null || acc.getIsAdmin() != 1) {
            // Nếu không phải admin, đá về trang login ngay
            response.sendRedirect("login.jsp");
            return; // Dừng lại, không cho chạy lệnh xóa bên dưới
        }
        // 1. Lấy id sản phẩm từ đường dẫn
        String pid = request.getParameter("pid");

        // 2. Gọi DAO để xóa
        ProductDAO dao = new ProductDAO();
        dao.deleteProduct(pid);

        // 3. Xóa xong thì load lại trang quản lý
        response.sendRedirect("manager");
    }
}