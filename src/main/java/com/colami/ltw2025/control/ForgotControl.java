package com.colami.ltw2025.control;

import com.colami.ltw2025.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Random;

@WebServlet(name = "ForgotControl", urlPatterns = {"/forgot"})
public class ForgotControl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");

        UserDAO dao = new UserDAO();

        try {
            // Kiểm tra username có tồn tại trong DB kh
            boolean isExist = dao.checkUserForReset(username);

            if (!isExist) {
                request.setAttribute("mess", "Tên đăng nhập không tồn tại hoặc bạn không có quyền khôi phục!");
                request.getRequestDispatcher("forgot.jsp").forward(request, response);
            } else {
                // Username tồn tại -> cấp lại mật khẩu

                // Tạo mật khẩu ngẫu nhiên 6 số
                Random rand = new Random();
                int number = rand.nextInt(999999);
                String newPass = String.format("%06d", number);

                // Mã hóa mật khẩu trước khi lưu vào DB
                String encryptedPass = DataEncryptionControl.toSHA1(newPass);

                // Cập nhật mật khẩu mới vào Database
                dao.updatePassword(username, encryptedPass);

                // Gửi email mật khẩu MỚI (chưa mã hóa) cho người dùng
                String subject = "Colami Shop - Mật khẩu mới";
                String content = "<p>Xin chào <b>" + username + "</b>,</p>"
                        + "<p>Mật khẩu mới của bạn là: <b style='color:red; font-size:20px;'>" + newPass + "</b></p>"
                        + "<p>Vui lòng đăng nhập và đổi lại mật khẩu ngay.</p>";

                // Gọi hàm gửi mail từ EmailUtil
                boolean isSent = EmailUtil.sendEmail(email, subject, content);

                if (isSent) {
                    request.setAttribute("success", "Mật khẩu mới đã được gửi đến email: " + email);
                } else {
                    request.setAttribute("mess", "Lỗi gửi mail! Vui lòng kiểm tra lại kết nối mạng.");
                }

                request.getRequestDispatcher("forgot.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "Lỗi Server: " + e.getMessage());
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("forgot.jsp").forward(request, response);
    }
}