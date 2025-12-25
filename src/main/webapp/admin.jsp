<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <title>Trang Quản Trị</title>
</head>
<body>
<c:if test="${sessionScope.acc == null || sessionScope.acc.isAdmin != 1}">
  <% response.sendRedirect("login.jsp"); %>
</c:if>

<h1>Xin chào Admin: ${sessionScope.acc.user}</h1>

<ul>
  <li><a href="#">Quản lý sản phẩm</a></li>
  <li><a href="#">Quản lý tài khoản</a></li>
  <li><a href="#">Xem thống kê</a></li>
  <li><a href="index.jsp">Về trang chủ xem như khách</a></li>
  <li><a href="logout">Đăng xuất</a></li>
</ul>
</body>
</html>