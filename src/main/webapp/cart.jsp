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
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <link rel="stylesheet" href="assets/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
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
                    <a href="cart.jsp">Cart - <span class="cart-amunt">
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
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="shop">Shop page</a></li>
                    <li class="active"><a href="cart.jsp">Cart</a></li>
                    <li><a href="checkout.jsp">Check out</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
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

<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-bit-title text-center">
                    <h2>Shopping Cart</h2>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="single-sidebar">
                    <h2 class="sidebar-title">Search products</h2>
                    <form action="search" method="get">
                        <input type="text" name="txt" placeholder="Search products...">
                        <input type="submit" value="Search">
                    </form>
                </div>
            </div>

            <div class="col-md-8">
                <div class="product-content-right">
                    <div class="woocommerce">
                        <form method="post" action="update-cart">
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
                                            <a title="Remove this item" class="remove" href="remove-cart?pid=${item.product.id}">×</a>
                                        </td>

                                        <td class="product-thumbnail">
                                            <a href="detail?pid=${item.product.id}"><img width="145" height="145" class="shop_thumbnail" src="${item.product.image}"></a>
                                        </td>

                                        <td class="product-name">
                                            <a href="detail?pid=${item.product.id}">${item.product.name}</a>
                                        </td>

                                        <td class="product-price">
                                            <span class="amount"><fmt:formatNumber value="${item.price}" type="number"/> đ</span>
                                        </td>

                                        <td class="product-quantity">
                                            <div class="quantity buttons_added">
                                                <a href="update-cart?pid=${item.product.id}&mode=sub" class="minus" style="padding: 5px 10px; background: #eee;">-</a>
                                                <input type="number" size="4" class="input-text qty text" value="${item.quantity}" readonly>
                                                <a href="update-cart?pid=${item.product.id}&mode=add" class="plus" style="padding: 5px 10px; background: #eee;">+</a>
                                            </div>
                                        </td>

                                        <td class="product-subtotal">
                                            <span class="amount"><fmt:formatNumber value="${item.price * item.quantity}" type="number"/> đ</span>
                                        </td>
                                    </tr>
                                </c:forEach>

                                <tr>
                                    <td class="actions" colspan="6">
                                        <div class="coupon">
                                            <input style="width: auto;" type="text" placeholder="Coupon code" id="coupon_code" class="input-text" name="coupon_code">
                                            <input type="submit" value="Apply" class="button">
                                        </div>
                                        <a href="shop" class="button" style="padding: 15px 20px; background: #5a88ca; color: #fff; text-decoration: none;">Continue Shopping</a>
                                        <input type="submit" value="Check out" name="proceed" class="checkout-button button alt wc-forward">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>

                        <div class="cart-collaterals">
                            <div class="cart_totals ">
                                <h2>Cart Totals</h2>
                                <table cellspacing="0">
                                    <tbody>
                                    <tr class="order-total">
                                        <th>Order total</th>
                                        <td><strong><span class="amount"><fmt:formatNumber value="${totalMoney}" type="number"/> đ</span></strong> </td>
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
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/jquery.easing.1.3.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>