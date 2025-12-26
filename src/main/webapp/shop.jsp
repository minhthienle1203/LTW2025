<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Colami shop - Shop Page</title>

    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
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
                    <a href="cart.jsp">
                        Cart - <span class="cart-amunt">
                            <fmt:formatNumber value="${sessionScope.totalMoney != null ? sessionScope.totalMoney : 0}" type="number"/> đ
                        </span>
                        <i class="fa fa-shopping-cart"></i>
                        <span class="product-count">${sessionScope.cart != null ? sessionScope.cart.size() : 0}</span>
                    </a>
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
                    <li class="active"><a href="shop">Shop page</a></li>
                    <li><a href="cart.jsp">Cart</a></li>
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
                    <h2>Tất cả sản phẩm</h2>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="single-product-area">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="single-sidebar">
                    <h2 class="sidebar-title">Tìm kiếm</h2>
                    <form action="search" method="get">
                        <input type="text" name="txt" value="${txtS}" placeholder="Nhập tên máy...">
                        <input type="submit" value="Search">
                    </form>
                </div>
            </div>

            <div class="col-md-9">
                <div class="row">
                    <c:forEach items="${listP}" var="o">
                        <div class="col-md-4 col-sm-6">
                            <div class="single-shop-product" style="margin-bottom: 40px; border: 1px solid #f1f1f1; padding: 15px; border-radius: 5px;">
                                <div class="product-upper">
                                    <img src="${o.image}" alt="${o.name}" style="height: 200px; width: 100%; object-fit: contain;">
                                </div>
                                <h2 style="height: 45px; overflow: hidden; font-size: 16px; margin-top: 15px;">
                                    <a href="detail?pid=${o.id}">${o.name}</a>
                                </h2>
                                <div class="product-carousel-price">
                                    <ins style="color: #5a88ca; font-weight: bold;">
                                        <fmt:formatNumber value="${o.price}" type="number"/> VNĐ
                                    </ins>
                                </div>

                                <div class="product-option-shop" style="margin-top: 15px;">
                                    <a class="add_to_cart_button" href="cart-process?action=add&pid=${o.id}">
                                        <i class="fa fa-shopping-cart"></i> Add to cart
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <c:if test="${listP == null || listP.size() == 0}">
                        <div class="col-md-12 text-center">
                            <h3>Rất tiếc, không tìm thấy sản phẩm nào!</h3>
                        </div>
                    </c:if>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="product-pagination text-center">
                            <nav>
                                <ul class="pagination">
                                    <li><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>