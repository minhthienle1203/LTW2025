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

    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
</head>
<body>

<%-- 1. Thanh Menu (Copy từ Home để khách không bị "kẹt" ở trang checkout) --%>
<div class="mainmenu-area">
    <div class="container">
        <div class="row">
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="home">Home</a></li>
                    <li><a href="shop">Shop page</a></li>
                    <li><a href="cart.jsp">Cart</a></li>
                    <li class="active"><a href="checkout.jsp">Check out</a></li>
                    <c:if test="${sessionScope.acc != null}">
                        <li><a href="#">Chào: ${sessionScope.acc.user}</a></li>
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
                    <h2>Thanh Toán Đơn Hàng</h2>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-content-right">
                    <div class="woocommerce">

                        <%-- Thông báo đăng nhập --%>
                        <c:if test="${sessionScope.acc == null}">
                            <div class="woocommerce-info">Bợn chưa đăng nhập? <a href="login.jsp" style="color: red; font-weight: bold;">Nhấn vào đây để đăng nhập</a> trước khi đặt hàng.</div>
                        </c:if>

                        <%-- FORM CHÍNH --%>
                            <form action="place-order" method="post">
                            <div id="customer_details" class="col2-set">
                                <div class="col-1">
                                    <div class="woocommerce-billing-fields">
                                        <h3>Thông tin nhận hàng</h3>
                                        <p class="form-row form-row-first validate-required">
                                            <label>Họ và tên người nhận <abbr title="required" class="required">*</abbr></label>
                                            <%-- Lấy tên User nếu đã đăng nhập --%>
                                            <input type="text" value="${sessionScope.acc.user}" name="name" class="input-text" placeholder="Nhập tên đầy đủ" required>
                                        </p>
                                        <p class="form-row form-row-last validate-required">
                                            <label>Địa chỉ nhận hàng <abbr title="required" class="required">*</abbr></label>
                                            <input type="text" placeholder="Ví dụ: 123 Đường ABC, Quận X, TP. Y" name="address" class="input-text" required>
                                        </p>
                                        <p class="form-row form-row-wide validate-required">
                                            <label>Số điện thoại <abbr title="required" class="required">*</abbr></label>
                                            <input type="text" name="phone" placeholder="Nhập số điện thoại liên lạc" class="input-text" required>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <h3 id="order_review_heading" style="margin-top: 30px;">Tóm tắt đơn hàng</h3>
                            <div id="order_review" style="position: relative;">
                                <table class="shop_table">
                                    <thead>
                                    <tr>
                                        <th class="product-name">Sản phẩm</th>
                                        <th class="product-total" style="text-align: right;">Thành tiền</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${sessionScope.cart}" var="item">
                                        <tr class="cart_item">
                                            <td class="product-name">
                                                    ${item.product.name} <strong class="product-quantity">× ${item.quantity}</strong>
                                            </td>
                                            <td class="product-total" style="text-align: right;">
                                                <span class="amount"><fmt:formatNumber value="${item.price * item.quantity}" type="number"/> đ</span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr class="order-total">
                                        <th><strong>TỔNG TIỀN CẦN THANH TOÁN</strong></th>
                                        <td style="text-align: right;">
                                            <strong>
                                                <span class="amount" style="color: #5a88ca; font-size: 20px;">
                                                    <fmt:formatNumber value="${sessionScope.totalMoney}" type="number"/> đ
                                                </span>
                                            </strong>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>

                                <div id="payment" style="background: #fbfbfb; padding: 20px; border: 1px solid #eee;">
                                    <div class="form-row place-order">
                                        <c:choose>
                                            <c:when test="${not empty sessionScope.cart && sessionScope.acc != null}">
                                                <p><i class="fa fa-info-circle"></i> Phương thức thanh toán: Thanh toán khi nhận hàng (COD)</p>
                                                <input type="submit" value="XÁC NHẬN ĐẶT HÀNG NGAY" class="button alt" style="width: 100%; padding: 15px; font-size: 18px;">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="alert alert-warning">
                                                    Vui lòng đăng nhập và đảm bảo giỏ hàng không trống để đặt hàng.
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>