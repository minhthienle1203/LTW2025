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

@WebServlet(name = "SearchControl", urlPatterns = {"/search"})
public class SearchControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); // Xử lý tiếng Việt

        String txtSearch = request.getParameter("txt"); // Lấy từ khóa từ ô input
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.searchByName(txtSearch);

        // Đẩy danh sách tìm được lên trang shop.jsp để hiển thị
        request.setAttribute("listP", list);
        request.setAttribute("txtS", txtSearch); // Gửi lại từ khóa để hiển thị trong ô search
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }
}