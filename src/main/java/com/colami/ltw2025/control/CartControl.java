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

@WebServlet(name = "CartControl", urlPatterns = {"/add-to-cart"})
public class CartControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("pid");
        ProductDAO dao = new ProductDAO();
        Product p = dao.getProductByID(id); // Lấy sản phẩm từ DB

        HttpSession session = request.getSession();
        List<Item> cart = (List<Item>) session.getAttribute("cart");

        if (cart == null) {
            // Nếu chưa có giỏ hàng -> Tạo mới
            cart = new ArrayList<>();
            cart.add(new Item(p, 1, p.getPrice()));
        } else {
            // Nếu có rồi -> Kiểm tra sản phẩm đã tồn tại chưa
            boolean isExist = false;
            for (Item item : cart) {
                if (item.getProduct().getId() == p.getId()) {
                    item.setQuantity(item.getQuantity() + 1); // Tăng số lượng
                    isExist = true;
                    break;
                }
            }
            if (!isExist) {
                cart.add(new Item(p, 1, p.getPrice())); // Thêm sản phẩm mới vào list
            }
        }

        session.setAttribute("cart", cart);
        // Quay lại trang shop hoặc trang giỏ hàng
        response.sendRedirect("shop");
    }
}