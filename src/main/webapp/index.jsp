<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Colami shop</title>

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
                    <a href="./"><img src="assets/img/logo.png"></a>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="shopping-item">
                    <a href="cart.html">Cart <span class="cart-amunt"></span> <i class="fa fa-shopping-cart"></i> <span class="product-count">5</span></a>
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
                    <li class="active"><a href="home">Home</a></li> <li><a href="shop.html">Shop page</a></li>
                    <li><a href="cart.html">Cart</a></li>
                    <li><a href="checkout.html">Check out</a></li>
                    <li><a href="contact.html">Contact</a></li>

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

<div class="slider-area">
    <div class="block-slider block-slider4">
        <ul class="" id="bxslider-home4">
            <li><img src="assets/img/h4-slide.png" alt="Slide"></li>
            <li><img src="assets/img/h4-slide2.png" alt="Slide"></li>
            <li><img src="assets/img/h4-slide3.png" alt="Slide"></li>
            <li><img src="assets/img/h4-slide4.png" alt="Slide"></li>
        </ul>
    </div>
</div>

<div class="promo-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="single-promo promo1"><i class="fa fa-refresh"></i><p>30 Days return</p></div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="single-promo promo2"><i class="fa fa-truck"></i><p>Free shipping</p></div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="single-promo promo3"><i class="fa fa-lock"></i><p>Secure payments</p></div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="single-promo promo4"><i class="fa fa-gift"></i><p>New products</p></div>
            </div>
        </div>
    </div>
</div>

<div class="maincontent-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="latest-product">
                    <h2 class="section-title">Sản Phẩm Mới Nhất</h2>
                    <div class="product-carousel">

                        <c:forEach items="${listP}" var="o">
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="${o.image}" alt="${o.name}" style="height: 250px; object-fit: cover;">

                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                        <a href="detail?pid=${o.id}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>

                                <h2><a href="detail?pid=${o.id}">${o.name}</a></h2>

                                <div class="product-carousel-price">
                                    <ins>$${o.price}</ins>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
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
<script type="text/javascript" src="assets/js/bxslider.min.js"></script>
<script type="text/javascript" src="assets/js/script.slider.js"></script>
</body>
</html>