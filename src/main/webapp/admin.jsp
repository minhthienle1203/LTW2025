<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Colami Shop - Quản Trị Hệ Thống</title>
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/font-awesome.min.css">
  <style>
    body { background-color: #f4f7f6; }
    .admin-card { border: none; border-radius: 10px; transition: 0.3s; margin-bottom: 20px;}
    .admin-card:hover { transform: translateY(-5px); box-shadow: 0 10px 20px rgba(0,0,0,0.1); }
    .card-icon { font-size: 3rem; color: #5a88ca; margin-bottom: 10px; }
  </style>
</head>
<body>

<%-- Kiểm tra quyền Admin ngay đầu trang --%>
<c:if test="${sessionScope.acc == null || sessionScope.acc.isAdmin != 1}">
  <c:redirect url="login.jsp"/>
</c:if>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">COLAMI ADMIN PANEL</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><i class="fa fa-user"></i> Chào Admin: ${sessionScope.acc.user}</a></li>
      <li><a href="logout"><i class="fa fa-sign-out"></i> Đăng xuất</a></li>
    </ul>
  </div>
</nav>

<div class="container text-center">
  <div class="row" style="margin-top: 50px;">
    <div class="col-md-4">
      <div class="card admin-card p-4 bg-white shadow-sm">
        <div class="card-body">
          <i class="fa fa-shopping-cart card-icon"></i>
          <h3>Quản lý Đơn hàng</h3>
          <p>Xem danh sách khách mua, địa chỉ và doanh thu.</p>
          <a href="manager-order" class="btn btn-primary">Truy cập ngay</a>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card admin-card p-4 bg-white shadow-sm">
        <div class="card-body">
          <i class="fa fa-laptop card-icon"></i>
          <h3>Quản lý Sản phẩm</h3>
          <p>Thêm, sửa, xóa 100 sản phẩm trong hệ thống.</p>
          <a href="manager" class="btn btn-primary">Truy cập ngay</a>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card admin-card p-4 bg-white shadow-sm">
        <div class="card-body">
          <i class="fa fa-home card-icon"></i>
          <h3>Xem Trang Chủ</h3>
          <p>Quay lại giao diện mua hàng dành cho khách.</p>
          <a href="home" class="btn btn-info">Về trang chủ</a>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>