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

        ProductDAO dao = new ProductDAO();
        dao.insertOrder(acc, cart, name, address, phone, total);

        session.removeAttribute("cart");
        session.setAttribute("totalMoney", 0);

        request.setAttribute("msg", "Đặt hàng thành công! Cảm ơn bợn đã ủng hộ Colami.");
        request.getRequestDispatcher("home").forward(request, response);
    }
}