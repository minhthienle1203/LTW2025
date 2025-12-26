package com.colami.ltw2025.control;

import com.colami.ltw2025.dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DeleteControl", urlPatterns = {"/delete"})
public class DeleteControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1. Lấy id sản phẩm từ đường dẫn
        String pid = request.getParameter("pid");

        // 2. Gọi DAO để xóa
        ProductDAO dao = new ProductDAO();
        dao.deleteProduct(pid);

        // 3. Xóa xong thì load lại trang quản lý
        response.sendRedirect("manager");
    }
}