<%--
  Created by IntelliJ IDEA.
  User: Tro
  Date: 12/26/2025
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Quản lý đơn hàng - Colami Shop</title>
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/style.css">
</head>
<body>
<div class="container">
  <div class="table-wrapper">
    <div class="table-title">
      <div class="row">
        <div class="col-sm-6">
          <h2>Quản lý <b>Đơn hàng</b></h2>
        </div>
      </div>
    </div>
    <table class="table table-striped table-hover">
      <thead>
      <tr>
        <th>ID</th>
        <th>Khách hàng</th>
        <th>Địa chỉ</th>
        <th>Số điện thoại</th>
        <th>Ngày đặt</th>
        <th>Tổng tiền</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${listO}" var="o">
        <tr>
          <td>${o.id}</td>
          <td>${o.name}</td>
          <td>${o.address}</td>
          <td>${o.phone}</td>
          <td>${o.date}</td>
          <td><fmt:formatNumber value="${o.totalPrice}" type="number"/> đ</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
    <a href="home" class="btn btn-primary">Quay về trang chủ</a>
  </div>
</div>
</body>
</html>
