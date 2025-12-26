package com.colami.ltw2025.control;

import com.colami.ltw2025.dao.ProductDAO;
import com.colami.ltw2025.entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShopControl", urlPatterns = {"/shop"})
public class ShopControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Lấy dữ liệu từ DAO
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getAllProduct();

        // 2. Thiết lập dữ liệu vào request với tên "listP"
        request.setAttribute("listP", list);

        // 3. Chuyển hướng đến trang shop.jsp
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }
}