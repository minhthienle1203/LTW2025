<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
                    <a href="home"><img src="assets/img/logo.png"></a>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="shopping-item">
                    <a href="cart.jsp">
                        Cart - <span class="cart-amunt">$${sessionScope.totalMoney}</span>
                        <i class="fa fa-shopping-cart"></i>
                        <span class="product-count">${sessionScope.cart.size()}</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="mainmenu-area">
    <div class="container">
        <div class="row">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
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
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">

            <c:forEach items="${listP}" var="o">
                <div class="col-md-3 col-sm-6">
                    <div class="single-shop-product" style="margin-bottom: 30px;">
                        <div class="product-upper">
                            <img src="${o.image}" alt="${o.name}" style="height: 250px; width: 100%; object-fit: contain; padding: 10px;">
                        </div>
                        <h2 style="height: 50px; overflow: hidden; font-size: 18px;">
                            <a href="detail?pid=${o.id}">${o.name}</a>
                        </h2>
                        <div class="product-carousel-price">
                            <ins>${o.price} VNĐ</ins>
                        </div>

                        <div class="product-option-shop">
                            <a class="add_to_cart_button" href="add-to-cart?pid=${o.id}">Add to cart</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="product-pagination text-center">
                    <nav>
                        <ul class="pagination">
                            <li><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/jquery.sticky.js"></script>
<script src="assets/js/jquery.easing.1.3.min.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>