package com.colami.ltw2025.control;

import com.colami.ltw2025.dao.ProductDAO;
import com.colami.ltw2025.entity.Item;
import com.colami.ltw2025.entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartControl", urlPatterns = {"/cart-process"})
public class CartControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if (cart == null) cart = new ArrayList<>();

        ProductDAO dao = new ProductDAO();

        // --- HÀNH ĐỘNG: THÊM SẢN PHẨM (ADD) ---
        if (action == null || action.equals("add")) {
            String id = request.getParameter("pid");
            Product p = dao.getProductByID(id);
            boolean isExist = false;
            for (Item item : cart) {
                if (item.getProduct().getId() == p.getId()) {
                    item.setQuantity(item.getQuantity() + 1);
                    isExist = true;
                    break;
                }
            }
            if (!isExist) cart.add(new Item(p, 1, p.getPrice()));

            updateTotal(session, cart);
            response.sendRedirect("shop");
            return;
        }

        // --- HÀNH ĐỘNG: CẬP NHẬT SỐ LƯỢNG (UPDATE) ---
        if (action.equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            int num = Integer.parseInt(request.getParameter("num"));
            for (Item item : cart) {
                if (item.getProduct().getId() == id) {
                    if (num <= 0) {
                        cart.remove(item);
                    } else {
                        item.setQuantity(num);
                    }
                    break;
                }
            }
        }

        // --- HÀNH ĐỘNG: XÓA SẢN PHẨM (DELETE) ---
        if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            cart.removeIf(item -> item.getProduct().getId() == id);
        }

        updateTotal(session, cart);
        response.sendRedirect("cart.jsp");
    }

    // Hàm phụ tính lại tổng tiền
    private void updateTotal(HttpSession session, List<Item> cart) {
        double total = 0;
        for (Item i : cart) {
            total += i.getQuantity() * i.getPrice();
        }
        session.setAttribute("cart", cart);
        session.setAttribute("totalMoney", total);
    }
}