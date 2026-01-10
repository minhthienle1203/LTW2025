package com.colami.ltw2025.control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.colami.ltw2025.entity.Account;

import java.io.IOException;
import java.util.Random;

import com.colami.ltw2025.dao.UserDAO;


@WebServlet(name = "RegisterControl", urlPatterns = {"/register"})
public class RegisterControl extends HttpServlet {

    public RegisterControl() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        String username = request.getParameter("user");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");

        request.setAttribute("user", username);

        String url = "";
        String baoLoi = "";
        UserDAO userDAO = new UserDAO();

        try {
            if(userDAO.kiemTraTenDangNhap(username)) {
                baoLoi +="Tên đăng nhập đã tồn tại, vui lòng chọn tên đăng nhập khác.<br/>";
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if(!pass.equals(repass)) {
            baoLoi += "Mat khau khong khop. <br/>";
        }else {
            username = username;
            pass = DataEncryptionControl.toSHA1(pass);
        }
        request.setAttribute("baoLoi", baoLoi);


        if(baoLoi.length()>0) {
            url = "/register.jsp";
        }else {
            Random rd = new Random();
            Account account = new Account(username, pass, 0, 0);
            try {
                UserDAO.getIn().insert(account);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            url = "/index.jsp";
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);


//		response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
