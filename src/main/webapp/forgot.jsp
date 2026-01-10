<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quên mật khẩu - Colami shop</title>

    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <link rel="stylesheet" href="assets/style1.css"> <link rel="stylesheet" href="assets/css/responsive.css">
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
        </div>
    </div>
</div>

<div class="mainmenu-area">
    <div class="container">
        <div class="row">
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="home">Home</a></li>
                    <li><a href="shop.jsp">Shop page</a></li>
                    <li><a href="login">Log in</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="box">
    <div class="inner-box">
        <form action="forgot" method="post">
            <h2>Recovery</h2>

            <%-- Thông báo lỗi --%>
            <p style="color: red; text-align: center;">${mess}</p>

            <%-- Thông báo thành công--%>
            <p style="color: green; text-align: center;">${success}</p>

            <input style="font-size: 17px;" type="text" name="username" placeholder="User name" required/>
            <input style="font-size: 17px;" type="email" name="email" placeholder="Your Email Address" required/>
            <input type="submit" value="Get Password" />

            <%-- Link quay lại Login --%>
            <p style="text-align:right; margin-top: 20px;">
                <span>Remember password? </span><a class="link" href="login.jsp">Log in now</a>
            </p>
        </form>
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