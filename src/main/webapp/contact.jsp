<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Colami shop - Contact</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
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
                            <fmt:formatNumber value="${sessionScope.totalMoney}" type="number"/> đ
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
                    <li><a href="shop">Shop page</a></li>
                    <li><a href="cart">Cart</a></li>
                    <li><a href="checkout.jsp">Check out</a></li>
                    <li class="active"><a href="contact.jsp">Contact</a></li>
                    <c:if test="${sessionScope.acc == null}">
                        <li><a href="login.jsp">Log in</a></li>
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

<main id="main">
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Contact</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section id="contact" class="contact">
        <div class="container">
            <div class="row mt-5">
                <div class="col-lg-4">
                    <div class="info">
                        <div class="address">
                            <h4>Location:</h4>
                            <p>Thu Duc, TP Ho Chi Minh, Viet Nam</p>
                        </div>
                        <div class="email">
                            <h4>Email:</h4>
                            <p>shop@gmail.com</p>
                        </div>
                        <div class="phone">
                            <h4>Call:</h4>
                            <p>098 765 4321</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-8">
                    <form action="send-contact" method="post" role="form" class="php-email-form">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <input type="text" name="name" class="form-control" placeholder="Your name" required>
                            </div>
                            <div class="col-md-6 form-group">
                                <input type="email" class="form-control" name="email" placeholder="Your email" required>
                            </div>
                        </div>
                        <div class="form-group mt-3">
                            <input type="text" class="form-control" name="subject" placeholder="Subject" required>
                        </div>
                        <div class="form-group mt-3">
                            <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
                        </div>
                        <br>
                        <p class="text-success">${message_success}</p>
                        <div class="form-row">
                            <input type="submit" value="Send message" class="button alt" style="border-radius: 0%;">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</main>

</body>
</html>