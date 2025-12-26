<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng nhập - Colami shop</title>

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
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="shop.jsp">Shop page</a></li>
                    <li class="active"><a href="login">Log in</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="box">
    <div class="inner-box">
        <form action="login" method="post">
            <h2>Log in</h2>

            <p style="color: red; text-align: center;">${mess}</p>

            <input style="font-size: 17px;" type="text" name="user" placeholder="User name" required/>

            <input style="font-size: 17px;" type="password" name="pass" placeholder="Password" required/>

            <p>
                <input type="checkbox" name="remember" /><span> Keep me Signed in</span>
                <span class="forgot"><a href="forgot.html">Forgot password?</a></span>
            </p>

            <input type="submit" value="Log in" />

            <p style="text-align:center;">
                <span>Or Sign in with</span>
            </p>

            <div class="flex-c-m">
                <a href="#" class="login100-social-item bg1"><i class="fa fa-facebook"></i></a>
                <a href="#" class="login100-social-item bg2"><i class="fa fa-twitter"></i></a>
                <a href="#" class="login100-social-item bg3"><i class="fa fa-google"></i></a>
            </div>

            <p style="text-align:right;">
                <span>Not a member? </span><a class="link" href="register.html">Sign up</a>
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