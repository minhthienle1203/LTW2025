<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Colami shop - Checkout</title>

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
                    <a href="cart">Cart - <span class="cart-amunt">
                            <fmt:formatNumber value="${totalMoney}" type="number"/> đ
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
                    <li><a href="cart">Cart</a></li>
                    <li class="active"><a href="checkout.jsp">Check out</a></li>
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
            <div class="col-md-8">
                <div class="product-content-right">
                    <div class="woocommerce">

                        <h3 id="order_review_heading">Your order</h3>
                        <div id="order_review" style="position: relative;">
                            <table class="shop_table">
                                <thead>
                                <tr>
                                    <th class="product-name">Product</th>
                                    <th class="product-total">Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${sessionScope.cart}" var="item">
                                    <tr class="cart_item">
                                        <td class="product-name">
                                                ${item.product.name} <strong class="product-quantity">× ${item.quantity}</strong>
                                        </td>
                                        <td class="product-total">
                                            <span class="amount"><fmt:formatNumber value="${item.price * item.quantity}" type="number"/> đ</span>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr class="cart-subtotal">
                                    <th>Cart subtotal</th>
                                    <td><span class="amount"><fmt:formatNumber value="${totalMoney}" type="number"/> đ</span></td>
                                </tr>
                                <tr class="shipping">
                                    <th>Shipping</th>
                                    <td>Free shipping</td>
                                </tr>
                                <tr class="order-total">
                                    <th>Order total</th>
                                    <td><strong><span class="amount"><fmt:formatNumber value="${totalMoney}" type="number"/> đ</span></strong> </td>
                                </tr>
                                </tfoot>
                            </table>

                            <form action="place-order" method="post" class="checkout">
                                <div id="customer_details" class="col2-set">
                                    <div class="woocommerce-billing-fields">
                                        <h3>Billing Details</h3>
                                        <p class="form-row form-row-first">
                                            <label>Full Name <abbr class="required">*</abbr></label>
                                            <input type="text" name="name" class="input-text" value="${sessionScope.acc != null ? sessionScope.acc.user : ''}" required>
                                        </p>
                                        <p class="form-row form-row-wide">
                                            <label>Address <abbr class="required">*</abbr></label>
                                            <input type="text" name="address" class="input-text" required>
                                        </p>
                                        <p class="form-row form-row-last">
                                            <label>Phone <abbr class="required">*</abbr></label>
                                            <input type="text" name="phone" class="input-text" required>
                                        </p>
                                    </div>
                                </div>

                                <div id="payment">
                                    <div class="form-row place-order">
                                        <input type="submit" value="Place order" class="button alt">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>