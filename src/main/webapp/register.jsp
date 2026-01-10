<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng ký - Colami shop</title>

    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <link rel="stylesheet" href="assets/style1.css">
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
                    <li><a href="login.jsp">Log in</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="box">
    <div class="inner-box">
        <%
            String baoLoi = request.getAttribute("baoLoi") + "";
            baoLoi = (baoLoi.equals("null"))? "": baoLoi;

            String username = request.getAttribute("user")+ "";
            username = (username.equals("null"))? "": username;
        %>

        <form action="register" method="post">
            <h2>Sign up</h2>

            <div style="color: red; text-align: center; margin-bottom: 10px;" id="baoLoi">
                <%=baoLoi %>
            </div>

            <div style="color: red; text-align: center; margin-bottom: 10px;" id="msg"></div>

            <input style="font-size: 17px;" type="text" name="user" placeholder="User name" required="required" value="<%=username%>"/>

            <input style="font-size: 17px;" type="password" id="matkhau" name="pass" placeholder="Password" required onkeyup="kiemTraMatKhau()"/>

            <input style="font-size: 17px;" type="password" id="matKhauNhapLai" name="repass" placeholder="Confirm password" required onkeyup="kiemTraMatKhau()"/>

            <input type="submit" id="submit" value="Sign up" />

            <p style="text-align:center;">
                <span>Or Sign up with</span>
            </p>

            <div class="flex-c-m">
                <a href="https://www.facebook.com/" target="_blank" class="login100-social-item bg1"><i class="fa fa-facebook"></i></a>
                <a href="https://twitter.com/" target="_blank" class="login100-social-item bg2"><i class="fa fa-twitter"></i></a>
                <a href="https://www.google.com.vn/" target="_blank" class="login100-social-item bg3"><i class="fa fa-google"></i></a>
            </div>

            <p style="text-align:right;">
                <span>Already registered? </span><a class="link" href="login.jsp">Sign in</a>
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

<script>
    function kiemTraMatKhau(){
        var matkhau = document.getElementById("matkhau").value;
        var matKhauNhapLai = document.getElementById("matKhauNhapLai").value;
        var msgDiv = document.getElementById("msg");
        var submitBtn = document.getElementById("submit");

        if(matkhau != matKhauNhapLai){
            msgDiv.innerHTML = "Mật khẩu không khớp!";
            // Tùy chọn: Có thể ẩn nút submit nếu sai pass
            // submitBtn.disabled = true;
            return false;
        } else {
            msgDiv.innerHTML = "";
            // submitBtn.disabled = false;
            return true;
        }
    }
</script>
</body>
</html>