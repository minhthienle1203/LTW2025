package com.colami.ltw2025.control;

import com.colami.ltw2025.dao.UserDAO;
import com.colami.ltw2025.entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

    // Xử lý khi user bấm nút Login (Gửi method POST)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String u = request.getParameter("user");
        String p = request.getParameter("pass");

        UserDAO dao = new UserDAO();
        Account a = dao.login(u, p);

        if (a == null) {
            // Đăng nhập thất bại
            request.setAttribute("mess", "Sai tài khoản hoặc mật khẩu!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // Đăng nhập thành công -> Lưu vào Session
            HttpSession session = request.getSession();
            session.setAttribute("acc", a);

            // --- PHÂN QUYỀN Ở ĐÂY ---
            if (a.getIsAdmin() == 1) {
                // Nếu là Admin -> Vào trang quản trị
                response.sendRedirect("admin.jsp");
            } else {
                // Nếu là User thường -> Vào trang chủ
                response.sendRedirect("index.jsp");
            }
        }
    }
    //chuển trang khi ấn login tại index.jsp
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xóa hoặc comment dòng super.doGet(request, response); nếu có
        // Chuyển hướng người dùng đến file login.jsp
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}