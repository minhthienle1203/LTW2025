package com.colami.ltw2025.control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LogoutControl", urlPatterns = {"/logout"})
public class LogoutControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1. Lấy session hiện tại
        HttpSession session = request.getSession();

        // 2. Xóa đối tượng "acc" (thông tin đăng nhập) khỏi session
        session.removeAttribute("acc");

        // Hoặc dùng lệnh dưới đây để hủy toàn bộ session (an toàn hơn)
        // session.invalidate();

        // 3. Chuyển hướng về trang chủ hoặc trang Login
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
