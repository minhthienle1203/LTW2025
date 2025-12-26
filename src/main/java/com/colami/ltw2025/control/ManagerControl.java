package com.colami.ltw2025.control;

import com.colami.ltw2025.dao.ProductDAO;
import com.colami.ltw2025.entity.Account;
import com.colami.ltw2025.entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManagerControl", urlPatterns = {"/manager"})
public class ManagerControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // 1. Kiểm tra quyền Admin
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if (acc == null || acc.getIsAdmin() != 1) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2. Lấy dữ liệu từ DAO
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getAllProduct();

        // 3. Đẩy dữ liệu sang JSP
        request.setAttribute("listP", list);
        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
    }
}