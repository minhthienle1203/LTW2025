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

@WebServlet(name = "HomeControl", urlPatterns = {"/home"})
public class HomeControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO dao = new ProductDAO();

        // 1. Lấy tất cả sản phẩm (hoặc lấy top 8 sản phẩm mới nhất)
        List<Product> list = dao.getAllProduct();

        // 2. Đẩy dữ liệu lên request
        request.setAttribute("listP", list);

        // 3. Mở trang index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}