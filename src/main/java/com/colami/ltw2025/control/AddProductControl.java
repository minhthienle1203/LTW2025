package com.colami.ltw2025.control;

import com.colami.ltw2025.dao.ProductDAO;
import com.colami.ltw2025.entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet(name = "AddProduct", urlPatterns = {"/add"})
public class AddProductControl  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 1. Kiểm tra quyền Admin
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if (acc == null || acc.getIsAdmin() != 1) {
            response.sendRedirect("login.jsp");
            return;
        }

        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String price = request.getParameter("price");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String category = request.getParameter("category");

        //2. insert vao DB
        ProductDAO dao = new ProductDAO();
        dao.insertProduct(name, image, price, title, description, category);

        response.sendRedirect("manager");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
