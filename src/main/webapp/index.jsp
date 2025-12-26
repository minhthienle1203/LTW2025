<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Colami shop - Trang chủ</title>

    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <link rel="stylesheet" href="assets/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
</head>
<body>

<%-- Branding & Giỏ hàng --%>
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

<%-- Menu điều hướng --%>
<div class="mainmenu-area">
    <div class="container">
        <div class="row">
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="home">Home</a></li>
                    <li><a href="shop">Shop page</a></li>
                    <li><a href="cart.jsp">Cart</a></li>
                    <li><a href="checkout.jsp">Check out</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <c:if test="${sessionScope.acc == null}">
                        <li><a href="login">Log in</a></li>
                    </c:if>
                    <c:if test="${sessionScope.acc != null}">
                        <li><a href="#">Chào ${sessionScope.acc.user}</a></li>
                        <li><a href="logout">Logout</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>

<c:if test="${not empty msg}">
    <div class="alert alert-success text-center">
        <strong>${msg}</strong>
    </div>
</c:if>

<%-- Slider Banner --%>
<div class="slider-area">
    <div class="block-slider block-slider4">
        <ul id="bxslider-home4">
            <li><img src="assets/img/h4-slide.png" alt="Slide"></li>
            <li><img src="assets/img/h4-slide2.png" alt="Slide"></li>
            <li><img src="assets/img/h4-slide3.png" alt="Slide"></li>
            <li><img src="assets/img/h4-slide4.png" alt="Slide"></li>
        </ul>
    </div>
</div>

<%-- Promo Area --%>
<div class="promo-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6"><div class="single-promo promo1"><i class="fa fa-refresh"></i><p>30 Days return</p></div></div>
            <div class="col-md-3 col-sm-6"><div class="single-promo promo2"><i class="fa fa-truck"></i><p>Free shipping</p></div></div>
            <div class="col-md-3 col-sm-6"><div class="single-promo promo3"><i class="fa fa-lock"></i><p>Secure payments</p></div></div>
            <div class="col-md-3 col-sm-6"><div class="single-promo promo4"><i class="fa fa-gift"></i><p>New products</p></div></div>
        </div>
    </div>
</div>

<%-- Vùng hiển thị sản phẩm chính --%>
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
                                    <img src="${o.image}" alt="${o.name}" style="height: 250px; width: 100%; object-fit: contain;">
                                    <div class="product-hover">
                                            <%-- SỬA LINK Ở ĐÂY: Dùng cart-process thay vì add-to-cart --%>
                                        <a href="cart-process?action=add&pid=${o.id}" class="add-to-cart-link">
                                            <i class="fa fa-shopping-cart"></i> Add to cart
                                        </a>
                                        <a href="detail?pid=${o.id}" class="view-details-link">
                                            <i class="fa fa-link"></i> See details
                                        </a>
                                    </div>
                                </div>
                                <h2><a href="detail?pid=${o.id}">${o.name}</a></h2>
                                <div class="product-carousel-price">
                                    <ins><fmt:formatNumber value="${o.price}" type="number"/> đ</ins>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- Scripts --%>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/jquery.sticky.js"></script>
<script src="assets/js/jquery.easing.1.3.min.js"></script>
<script src="assets/js/main.js"></script>
<script type="text/javascript" src="assets/js/bxslider.min.js"></script>
<script type="text/javascript" src="assets/js/script.slider.js"></script>

<script>
    // Tự động ẩn thông báo sau 4 giây
    window.setTimeout(function() {
        $(".alert").fadeTo(500, 0).slideUp(500, function(){
            $(this).remove();
        });
    }, 4000);
</script>
</body>
</html>