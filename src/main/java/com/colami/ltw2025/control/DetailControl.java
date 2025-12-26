package com.colami.ltw2025.control;

import com.colami.ltw2025.dao.ProductDAO;
import com.colami.ltw2025.entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DetailControl", urlPatterns = {"/detail"})
public class DetailControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Lấy ID sản phẩm từ URL (ví dụ: detail?pid=1)
        String id = request.getParameter("pid");

        // 2. Gọi DAO để lấy đối tượng Product
        ProductDAO dao = new ProductDAO();
        Product p = dao.getProductByID(id);

        // 3. Đẩy đối tượng sản phẩm sang trang JSP
        request.setAttribute("detail", p);

        // 4. Mở trang detail.jsp
        request.getRequestDispatcher("detail.jsp").forward(request, response);
    }
}