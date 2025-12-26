<%--
  Created by IntelliJ IDEA.
  User: Tro
  Date: 12/26/2025
  Time: 5:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản Lý Sản Phẩm</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body { color: #566787; background: #f5f5f5; font-family: 'Varela Round', sans-serif; }
        .table-wrapper { background: #fff; padding: 20px 25px; margin: 30px 0; border-radius: 3px; box-shadow: 0 1px 1px rgba(0,0,0,.05); }
        .table-title { padding-bottom: 15px; background: #435d7d; color: #fff; padding: 16px 30px; margin: -20px -25px 10px; border-radius: 3px 3px 0 0; }
        .table-title h2 { margin: 5px 0 0; font-size: 24px; }
        .table-title .btn { color: #fff; float: right; font-size: 13px; border: none; min-width: 50px; border-radius: 2px; border: none; outline: none !important; margin-left: 10px; }
        .table-title .btn i { float: left; font-size: 21px; margin-right: 5px; }
        .table-title .btn span { float: left; margin-top: 2px; }
        table.table tr th, table.table tr td { border-color: #e9e9e9; padding: 12px 15px; vertical-align: middle; }
        table.table tr th:first-child { width: 60px; }
        table.table tr th:last-child { width: 100px; }
        table.table-striped tbody tr:nth-of-type(odd) { background-color: #fcfcfc; }
        table.table-striped.table-hover tbody tr:hover { background: #f5f5f5; }
        img { width: 100px; height: 100px; object-fit: cover; border-radius: 5px; }
        .delete { color: #F44336; }
        .edit { color: #FFC107; }
        .pagination { float: right; margin: 0 0 5px; }
        .hint-text { float: left; margin-top: 10px; font-size: 13px; }
    </style>
</head>
<body>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Quản Lý <b>Sản Phẩm</b></h2>
                </div>
                <div class="col-sm-6">
                    <%-- Nút thêm sản phẩm mới --%>
                    <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm Sản Phẩm Mới</span></a>
                    <a href="admin.jsp" class="btn btn-info"><i class="material-icons">&#xE5C4;</i> <span>Quay Lại</span></a>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên Sản Phẩm</th>
                <th>Hình Ảnh</th>
                <th>Giá Tiền</th>
                <th>Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listP}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.name}</td>
                    <td>
                        <img src="${p.image}" alt="img">
                    </td>
                    <td>
                        <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="đ"/>
                    </td>
                    <td>
                            <%-- Nút Sửa (Edit) --%>
                        <a href="loadProduct?pid=${p.id}" class="edit" data-toggle="tooltip" title="Edit">
                            <i class="material-icons">&#xE254;</i>
                        </a>
                            <%-- Nút Xóa (Delete) --%>
                        <a href="delete?pid=${p.id}" class="delete" data-toggle="tooltip" title="Delete" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');">
                            <i class="material-icons">&#xE872;</i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%-- Hiển thị tổng số lượng --%>
        <div class="clearfix">
            <div class="hint-text">Đang hiển thị <b>${listP.size()}</b> sản phẩm</div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
