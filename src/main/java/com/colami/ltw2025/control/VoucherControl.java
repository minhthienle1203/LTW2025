package com.colami.ltw2025.control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "VoucherControl", urlPatterns = {"/apply-voucher"})
public class VoucherControl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("coupon_code");
        HttpSession session = request.getSession();
        Double total = (Double) session.getAttribute("totalMoney");

        if (total == null || total == 0) {
            response.sendRedirect("cart.jsp");
            return;
        }

        // Ví dụ: Mã "COLAMI" giảm 10%
        if ("COLAMI".equalsIgnoreCase(code)) {
            double discount = total * 0.1;
            session.setAttribute("totalMoney", total - discount);
            session.setAttribute("voucherMsg", "Áp dụng mã COLAMI thành công! Giảm 10%.");
        } else {
            session.setAttribute("voucherMsg", "Mã giảm giá không hợp lệ.");
        }

        response.sendRedirect("cart.jsp");
    }
}