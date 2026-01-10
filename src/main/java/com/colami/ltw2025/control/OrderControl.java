package com.colami.ltw2025.control;

import com.colami.ltw2025.dao.ProductDAO;
import com.colami.ltw2025.entity.Account;
import com.colami.ltw2025.entity.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderControl", urlPatterns = {"/place-order"})
public class OrderControl extends HttpServlet {

    // Luôn thêm hàm doGet này để nếu ai đó truy cập trực tiếp bằng link nó không báo lỗi 405
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("checkout.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println(">>> Đã nhận yêu cầu POST tại /place-order"); // Để debug

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        List<Item> cart = (List<Item>) session.getAttribute("cart");
        Account acc = (Account) session.getAttribute("acc");

        // Xử lý ép kiểu an toàn
        Object totalObj = session.getAttribute("totalMoney");
        double total = (totalObj != null) ? Double.parseDouble(totalObj.toString()) : 0;

        if (acc == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("shop");
            return;
        }

        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String emailReceive = request.getParameter("email");

        ProductDAO dao = new ProductDAO();
        dao.insertOrder(acc, cart, name, address, phone, total);

        //Gửi mail xác nhận đơn
        if (emailReceive != null && !emailReceive.trim().isEmpty()) {
            // nội dung email (HTML)
            String subject = "Xác nhận đơn hàng từ Colami Shop";
            StringBuilder content = new StringBuilder();

            content.append("<h3>Cảm ơn bạn đã đặt hàng tại Colami Shop!</h3>");
            content.append("<p>Xin chào <b>").append(name).append("</b>,</p>");
            content.append("<p>Đơn hàng của bạn đang được chúng tôi xử lý.</p>");
            content.append("<br>");
            content.append("<h4>Thông tin giao hàng:</h4>");
            content.append("<ul>");
            content.append("<li><b>Địa chỉ:</b> ").append(address).append("</li>");
            content.append("<li><b>Số điện thoại:</b> ").append(phone).append("</li>");
            content.append("<li><b>Tổng thanh toán:</b> ").append(String.format("%,.0f", total)).append(" VNĐ</li>");
            content.append("</ul>");
            content.append("<p>Cảm ơn bạn đã tin tưởng mua sắm!</p>");

            // Gửi email (Chạy luồng riêng để không làm user phải chờ lâu)
            new Thread(() -> {
                EmailUtil.sendEmail(emailReceive, subject, content.toString());
            }).start();
        }
        session.removeAttribute("cart");
        session.setAttribute("totalMoney", 0);


        session.setAttribute("msg", "Đặt hàng thành công! Cảm ơn bợn đã ủng hộ Colami.");
        response.sendRedirect("home");
    }
}