package com.colami.ltw2025.control;

import com.colami.ltw2025.entity.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowCartControl", urlPatterns = {"/cart"})
public class ShowCartControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        double totalMoney = 0;

        if (cart != null) {
            for (Item item : cart) {
                totalMoney += item.getQuantity() * item.getPrice();
            }
        }

        // Đẩy tổng tiền vào request hoặc session để hiển thị
        request.setAttribute("totalMoney", totalMoney);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }
}