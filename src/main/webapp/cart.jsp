<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Colami shop - Cart</title>

    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/style.css">
</head>

<body>
<div class="site-branding-area">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="logo">
                    <h1><a href="home">Colami <span>shop</span></a></h1>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="shopping-item">
                    <%-- SỬA 1: Tổng tiền trên góc phải --%>
                    <a href="cart.jsp">Cart - <span class="cart-amunt">
                            <fmt:formatNumber value="${sessionScope.totalMoney}" type="number" maxFractionDigits="0"/> đ
                        </span> <i class="fa fa-shopping-cart"></i>
                        <span class="product-count">${sessionScope.cart != null ? sessionScope.cart.size() : 0}</span></a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="mainmenu-area">
    <div class="container">
        <div class="row">
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="home">Home</a></li>
                    <li><a href="shop">Shop page</a></li>
                    <li class="active"><a href="cart.jsp">Cart</a></li>
                    <li><a href="checkout.jsp">Check out</a></li>
                    <c:if test="${sessionScope.acc == null}">
                        <li><a href="login">Log in</a></li>
                    </c:if>
                    <c:if test="${sessionScope.acc != null}">
                        <li><a href="#">Hello: ${sessionScope.acc.user}</a></li>
                        <li><a href="logout">Logout</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="single-product-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-content-right">
                    <div class="woocommerce">
                        <table cellspacing="0" class="shop_table cart">
                            <thead>
                            <tr>
                                <th class="product-remove">&nbsp;</th>
                                <th class="product-thumbnail">&nbsp;</th>
                                <th class="product-name">Product</th>
                                <th class="product-price">Price</th>
                                <th class="product-quantity">Quantity</th>
                                <th class="product-subtotal">Total</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${sessionScope.cart}" var="item">
                                <tr class="cart_item">
                                    <td class="product-remove">
                                        <a title="Remove this item" class="remove" href="cart-process?action=delete&id=${item.product.id}">×</a>
                                    </td>
                                    <td class="product-thumbnail">
                                        <a href="detail?pid=${item.product.id}"><img width="145" height="145" class="shop_thumbnail" src="${item.product.image}"></a>
                                    </td>
                                    <td class="product-name">
                                        <a href="detail?pid=${item.product.id}">${item.product.name}</a>
                                    </td>
                                    <td class="product-price">
                                            <%-- SỬA 2: Giá từng sản phẩm --%>
                                        <span class="amount"><fmt:formatNumber value="${item.price}" type="number" maxFractionDigits="0"/> đ</span>
                                    </td>
                                    <td class="product-quantity">
                                        <div class="quantity buttons_added">
                                            <a href="cart-process?action=update&id=${item.product.id}&num=${item.quantity - 1}" class="minus" style="padding: 5px 10px; background: #eee; text-decoration: none; color: #000;">-</a>
                                            <input type="number" size="4" class="input-text qty text" value="${item.quantity}" readonly>
                                            <a href="cart-process?action=update&id=${item.product.id}&num=${item.quantity + 1}" class="plus" style="padding: 5px 10px; background: #eee; text-decoration: none; color: #000;">+</a>
                                        </div>
                                    </td>
                                    <td class="product-subtotal">
                                            <%-- SỬA 3: Tổng tiền con (Subtotal) --%>
                                        <span class="amount"><fmt:formatNumber value="${item.price * item.quantity}" type="number" maxFractionDigits="0"/> đ</span>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td class="actions" colspan="6">
                                    <div class="coupon">
                                        <form action="apply-voucher" method="post" style="display: inline-block;">
                                            <input type="text" placeholder="Coupon code (COLAMI)" id="coupon_code" class="input-text" name="coupon_code">
                                            <input type="submit" value="Apply" class="button">
                                        </form>
                                        <span style="color: red; margin-left: 10px;">${sessionScope.voucherMsg}</span>
                                    </div>
                                    <a href="shop" class="button" style="padding: 15px 20px; background: #5a88ca; color: #fff; text-decoration: none;">Continue Shopping</a>
                                    <a href="checkout.jsp" class="checkout-button button alt wc-forward" style="padding: 15px 20px; background: #222; color: #fff; text-decoration: none;">Check out</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <div class="cart-collaterals">
                            <div class="cart_totals ">
                                <h2>Cart Totals</h2>
                                <table cellspacing="0">
                                    <tbody>
                                    <tr class="order-total">
                                        <th>Order total</th>
                                        <td><strong><span class="amount">
                                            <%-- SỬA 4: Tổng tiền cuối cùng --%>
                                            <fmt:formatNumber value="${sessionScope.totalMoney}" type="number" maxFractionDigits="0"/> đ
                                        </span></strong> </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>