package com.colami.ltw2025.control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ContactControl", urlPatterns = {"/send-contact"})
public class ContactControl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy dữ liệu từ form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // In ra console để test
        System.out.println("New Contact from: " + name + " (" + email + ")");
        System.out.println("Subject: " + subject);
        System.out.println("Message: " + message);

        // Gửi thông báo thành công về trang JSP
        request.setAttribute("message_success", "Cảm ơn bợn đã liên hệ! Chúng mình sẽ phản hồi sớm.");
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }
}