<%-- 
    Document   : checkout
    Created on : Jun 4, 2024, 3:19:25 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <!-- Meta Tag -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name='copyright' content=''>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Title Tag  -->
        <title>Tech Haven</title>
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
        <!-- Web Font -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

        <!-- StyleSheet -->

        <!-- Bootstrap -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
        <!-- Magnific Popup -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
        <!-- Fancybox -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.fancybox.min.css">
        <!-- Themify Icons -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themify-icons.css">
        <!-- Nice Select CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/niceselect.css">
        <!-- Animate CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <!-- Flex Slider CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flex-slider.min.css">
        <!-- Owl Carousel -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl-carousel.css">
        <!-- Slicknav -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css">

        <!-- Eshop StyleSheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">




        <style>
            .payment-method {
                display: flex;
                flex-wrap: wrap;
                list-style: none;
                padding: 0;
                margin: 0;
                gap: 10px;
            }

            .payment-method .form-group {
                flex: 1 1 calc(50% - 10px);
                position: relative;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .payment-method input[type="radio"] {
                position: absolute;
                opacity: 0;
                cursor: pointer;
            }

            .payment-method label {
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 15px;
                border: 1px solid #ddd;
                border-radius: 8px;
                cursor: pointer;
                text-align: center;
                background-color: #fff;
                transition: border-color 0.3s, box-shadow 0.3s;
                width: 100%;
            }

            .payment-method input[type="radio"]:checked + label {
                border-color: #cc0c1b;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .payment-method label img {
                display: block;
                margin-bottom: 10px;
                height: 30px;
            }

            .sticky-order-details {
                position: -webkit-sticky;
                position: sticky;
                top: 130px;
            }
            .information-form {
                border: 1px solid #ddd;
                padding: 20px;
                background-color: #fff;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body class="js">
        <!-- Header -->
        <header class="header shop">
            <div class="middle-inner">
                <div class="container" >
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-12">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/images/logo.png" alt="logo"></a>
                            </div>
                            <!--/ End Logo -->
                            <!-- Search Form -->
                            <div class="search-top">
                                <div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
                                <!-- Search Form -->
                                <div class="search-top">
                                    <form class="search-form">
                                        <input type="text" placeholder="Search here..." name="search">
                                        <button value="search" type="submit"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                                <!--/ End Search Form -->
                            </div>
                            <!--/ End Search Form -->
                            <div class="mobile-nav"></div>
                        </div>
                        <div class="col-lg-8 col-md-7 col-12">
                            <div class="search-bar-top">
                                <div class="search-bar">
                                    <select id="categorySelect" onchange="redirectToCategory()">
                                        <option selected="selected">Danh mục</option>
                                        <c:forEach items="${listC}" var="o">
                                            <option value="${o.id}">${o.name}</option>
                                        </c:forEach>
                                    </select>
                                    <form id="main-search-form" onsubmit="redirectToProduct(event)">
                                        <input name="search" placeholder="Bạn cần tìm gì?" type="search">
                                        <button type="submit" class="btnn"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-3 col-12">
                            <div class="right-bar">
                                <!-- Search Form -->
                                <div class="sinlge-bar">
                                    <a href="#" class="single-icon"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
                                </div>
                                <div class="sinlge-bar">
                                    <div class="sinlge-bar dropdown">
                                        <a href="#" class="single-icon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                            <c:if test="${user eq null}">
                                                <a class="dropdown-item" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                                                <a class="dropdown-item" href="${pageContext.request.contextPath}/register">Đăng ký</a>
                                            </c:if>
                                            <c:if test="${user ne null}">
                                                <a class="dropdown-item" href="${pageContext.request.contextPath}/viewprofile">Hồ sơ</a>
                                                <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="sinlge-bar shopping">
                                    <c:if test="${sessionScope.cart != null && sessionScope.cartSize != 0}">
                                        <a href="cart" class="single-icon"><i class="ti-bag"></i> <span class="total-count">${sessionScope.cartSize}</span></a>
                                        </c:if>
                                        <c:if test="${sessionScope.cart == null || sessionScope.cartSize == 0}">
                                        <a href="cart" class="single-icon"><i class="ti-bag"></i> <span class="total-count">0</span></a>
                                    </c:if>
                                    <!-- Shopping Item -->
                                    <div class="shopping-item">
                                        <div class="dropdown-cart-header">
                                            <c:if test="${sessionScope.cartSize != null && sessionScope.cartSize != 0}">
                                                <span>${sessionScope.cartSize} Items</span>
                                            </c:if>
                                            <c:if test="${sessionScope.cartSize == null || sessionScope.cartSize == 0}">
                                                <span>0 Items</span>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/cart">Xem giỏ hàng</a>
                                        </div>
                                        <ul class="shopping-list">
                                            <c:if test="${sessionScope.cart != null && sessionScope.cartSize != 0}">
                                                <c:forEach items="${sessionScope.listItemsInCart}" var="item">
                                                    <li>
                                                        <a href="#" class="remove-from-cart" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                        <a class="cart-img" href="#"><img src="${pageContext.request.contextPath}/images/${item.pd.image[0]}" alt="#"></a>
                                                        <h4><a href="#">${item.pd.name}</a></h4>
                                                        <p class="product-details">Màu sắc: ${item.pd.color}</p>
                                                        <p class="product-details">Dung lượng: ${item.pd.criteria}</p>
                                                        <div class="cart-price">
                                                            <p class="quantity">${item.quantity}x - </p>
                                                            <p class="product-price"><currency:formatCurrency value="${cart.getPriceDiscount(discounts, item.pd.id)}" /></p>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${sessionScope.cart == null || sessionScope.cartSize == 0}">
                                                <span class="header__cart-list--no-cart-msg">Không có sản phẩm nào trong giỏ!</span>
                                                <img src="images/emptycart.png" alt="Emptycart" style="width: 60%;">
                                            </c:if>
                                        </ul>
                                        <div class="bottom">
                                            <c:if test="${sessionScope.cart != null && sessionScope.cartSize != 0}">
                                                <div class="total">
                                                    <span>Tạm tính</span>
                                                    <span class="total-amount"><currency:formatCurrency value="${sessionScope.cart.getTotalMoney(listDC)}"/></span>
                                                </div>
                                            </c:if>
                                        </div>  
                                    </div>
                                </div>
                                <!--/ End Shopping Item -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header Inner -->
            <!--/ End Header Inner -->
        </header>
        <!-- Breadcrumbs -->
        <div class="breadcrumbs">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="bread-inner">
                            <ul class="bread-list">
                                <li><a href="index.jsp">Trang chủ<i class="ti-arrow-right"></i></a></li>
                                <li class="active"><a href="checkout.html">Thanh toán</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- Start Checkout -->
        <section class="shop checkout section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-12">
                        <div class="checkout-form">
                            <div class="information-form">
                                <h2>THÔNG TIN GIỎ HÀNG</h2>
                                <br/>
                                <form name="f" action="order" method="post" id="orderForm">
                                    <table class="table shopping-summery">
                                        <c:if test="${sessionScope.cartSize != 0}">
                                            <thead>
                                                <tr class="main-hading">
                                                    <th>SẢN PHẨM</th>
                                                    <th>TÊN SẢN PHẨM</th>
                                                    <th class="text-center">ĐƠN GIÁ</th>
                                                    <th class="text-center">SỐ LƯỢNG</th>
                                                    <th class="text-center">THÀNH TIỀN</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${sessionScope.listItemsInCart}" var="item">
                                                    <tr>
                                                        <td class="image" data-title="No"><img src="${pageContext.request.contextPath}/images/${item.pd.image[0]}" alt="${item.pd.color}"></td>
                                                        <td class="product-des" data-title="Description">
                                                            <p class="product-name"><a href="#">${item.pd.name}</a></p>
                                                            <p class="product-color">Màu sắc: ${item.pd.color}</p>
                                                            <p class="product-criteria">Dung lượng: ${item.pd.criteria}</p>
                                                        </td>
                                                        <td class="price" data-title="Price"><span><currency:formatCurrency value="${cart.getPriceDiscount(discounts, item.pd.id)}"/></span></td>
                                                        <td class="qty" data-title="Qty">
                                                            <div class="input-group">
                                                                <a type="text" name="quant[${item.pd.id}]" id="quantity-${item.pd.id}" class="input-number" data-min="1" data-max="${item.pd.quantity}" readonly>${cart.getQuantityById(item.pd.id)}</a>
                                                            </div>
                                                        </td>
                                                        <td class="price" data-title="Price"><currency:formatCurrency value="${cart.getTotalPriceById(discounts, item.pd.id)}"/></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </c:if>
                                    </table>
                                </form>
                            </div>
                            <div class="information-form">
                                <h2>THÔNG TIN ĐẶT HÀNG</h2>
                                <br/>
                                <form class="form" method="post" action="order" id="orderForm">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="form-group">
                                                <label>Họ và Tên<span>*</span></label>
                                                <input type="text" name="recipientName" id="recipientName" placeholder="" required="required">
                                                <span id="recipientNameError" class="error-message"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="form-group">
                                                <label>Địa chỉ Email<span>*</span></label>
                                                <input type="email" name="email" id="email" placeholder="Gmail: Chưa cập nhật" value="${user.email}" disabled>
                                                <span id="emailError" class="error-message"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="form-group">
                                                <label>Số điện thoại<span>*</span></label>
                                                <input type="number" name="deliveryPhone" id="deliveryPhone" placeholder="" required="required">
                                                <span id="deliveryPhoneError" class="error-message"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="form-group">
                                                <label>Địa chỉ giao hàng<span>*</span></label>
                                                <input type="text" name="deliveryAddress" id="deliveryAddress" placeholder="Nhập địa chỉ chi tiết bao gồm số nhà, khu, phố" required="required">
                                                <span id="deliveryAddressError" class="error-message"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <span style="color: red">*Bắt buộc</span>
                                        </div> 
                                    </div>
                                    <div class="information-form">
                                        <h2>THÔNG TIN THANH TOÁN</h2>
                                        <div>Quý khách vui lòng lựa chọn các hình thức thanh toán dưới đây:</div>
                                        <br/>
                                        <div class="content">
                                            <ul class="payment-method">
                                                <li class="form-group">
                                                    <input type="radio" id="cod" name="paymentMethod" value="COD" required>
                                                    <label for="cod">
                                                        <img src="https://shopdunk.com/Plugins/Payments.VietQr/logo.jpg" alt="COD">
                                                        Thanh toán khi nhận hàng
                                                    </label>
                                                </li>
                                                <li class="form-group">
                                                    <input type="radio" id="vnpay" name="paymentMethod" value="VNPAY" required>
                                                    <label for="vnpay">
                                                        <img src="https://shopdunk.com/Plugins/Payments.VNPay/logo.jpg" alt="VNPAY">
                                                        Thanh toán VNPAY
                                                    </label>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <input type="hidden" name="totalAmount" value="${sessionScope.cart.getTotalMoney(listDC)}"/>
                                    <div class="single-widget get-button">
                                        <div class="content">
                                            <div class="button">
                                                <button type="submit" class="btn">Xác nhận thanh toán</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-12">
                        <div class="order-details sticky-order-details">
                            <div class="single-widget">
                                <h2>Thanh toán</h2>
                                <div class="content">
                                    <ul>
                                        <li>Tạm tính<span><currency:formatCurrency value="${sessionScope.cart.getTotalMoney(listDC)}"/></span></li>
                                        <li>(+) Phí vận chuyển<span>00.00</span></li>
                                        <li class="last">Tổng tiền<span><currency:formatCurrency value="${sessionScope.cart.getTotalMoney(listDC)}"/></span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <!--/ End Checkout -->

        <!--Shop service area-->
        <section class="shop-services section home">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Service -->
                        <div class="single-service">
                            <i class="ti-rocket"></i>
                            <h4>Miễn phí vận chuyển</h4>
                            <p>cho đơn trên 1.000.000đ</p>
                        </div>
                        <!-- End Single Service -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Service -->
                        <div class="single-service">
                            <i class="ti-reload"></i>
                            <h4>Miễn phí hoàn trả</h4>
                            <p>Trong vòng 30 ngày nếu xảy ra lỗi</p>
                        </div>
                        <!-- End Single Service -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Service -->
                        <div class="single-service">
                            <i class="ti-tag"></i>
                            <h4>Giá tốt nhất</h4>
                            <p>Giá đảm bảo</p>
                        </div>
                        <!-- End Single Service -->
                    </div>
                </div>
            </div>
        </section>
        <!--End shop service area-->


        <!-- Start Footer Area -->
        <footer class="footer">
            <!-- Footer Top -->
            <div class="footer-top section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer about">
                                <div class="logo">
                                    <a href="index.jsp"><img src="images/logo2.png" alt="#"></a>
                                </div>
                                <p class="text">Chào mừng đến với Tech Haven - Nơi cung cấp những sản phẩm công nghệ tốt nhất cho bạn!</p>
                                <p class="call">Mua hàng<span><a href="tel:123456789">+0123 456 789</a></span></p>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-2 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer links">
                                <h4>Thông tin</h4>
                                <!--								<ul>
                                                                                                        <li><a href="#">Tin tức</a></li>
                                                                                                        <li><a href="#">Giới thiệu</a></li>
                                                                                                        <li><a href="#">Điều khoản và điều kiện</a></li>
                                                                                                        <li><a href="#">Contact Us</a></li>
                                                                                                        <li><a href="#">Help</a></li>
                                                                                                </ul>-->
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-2 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer links">
                                <h4>Chính sách</h4>
                                <!--								<ul>
                                                                                                        <li><a href="#">Payment Methods</a></li>
                                                                                                        <li><a href="#">Money-back</a></li>
                                                                                                        <li><a href="#">Returns</a></li>
                                                                                                        <li><a href="#">Shipping</a></li>
                                                                                                        <li><a href="#">Privacy Policy</a></li>
                                                                                                </ul>-->
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-3 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer social">
                                <h4>Kết nối với Tech Haven</h4>
                                <!-- Single Widget -->
                                <div class="contact">
                                    <!--									<ul>
                                                                                                                    <li>NO. 342 - London Oxford Street.</li>
                                                                                                                    <li>012 United Kingdom.</li>
                                                                                                                    <li>info@eshop.com</li>
                                                                                                                    <li>+032 3456 7890</li>
                                                                                                            </ul>-->
                                </div>
                                <!-- End Single Widget -->
                                <ul>
                                    <li><a href="#"><i class="ti-facebook"></i></a></li>
                                    <li><a href="#"><i class="ti-twitter"></i></a></li>
                                    <li><a href="#"><i class="ti-flickr"></i></a></li>
                                    <li><a href="#"><i class="ti-instagram"></i></a></li>
                                </ul>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Footer Top -->
            <div class="copyright">
                <div class="container">
                    <div class="inner">
                        <div class="row">
                            <div class="col-lg-6 col-12">
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="right">
                                    <img src="images/payments.png" alt="#">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- /End Footer Area -->
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                            var form = document.getElementById('orderForm');
                                            var recipientName = document.getElementById('recipientName');
                                            var recipientNameError = document.getElementById('recipientNameError');
                                            var deliveryPhone = document.getElementById('deliveryPhone');
                                            var deliveryPhoneError = document.getElementById('deliveryPhoneError');
                                            var deliveryAddress = document.getElementById('deliveryAddress');
                                            var deliveryAddressError = document.getElementById('deliveryAddressError');

                                            function validateNoSpacesStartEnd(input, errorElement) {
                                                if (input && errorElement) {
                                                    if (input.value.startsWith(' ') || input.value.endsWith(' ')) {
                                                        errorElement.textContent = "Không được chứa khoảng trắng ở đầu hoặc cuối!";
                                                        return false;
                                                    } else {
                                                        errorElement.textContent = "";
                                                        return true;
                                                    }
                                                }
                                                return true;
                                            }

                                            function isValidPhoneNumber(input, errorElement) {
                                                if (input && errorElement) {
                                                    const phoneRegex = /^0\d{9}$/;
                                                    if (!phoneRegex.test(input.value)) {
                                                        errorElement.textContent = "Số điện thoại phải bắt đầu bằng số 0 và có đúng 10 chữ số!";
                                                        return false;
                                                    } else {
                                                        errorElement.textContent = "";
                                                        return true;
                                                    }
                                                }
                                                return true;
                                            }

                                            function isValidAddress(input, errorElement) {
                                                if (input && errorElement) {
                                                    const addressRegex = /^[^,]+(,[^,]+)*$/;
                                                    if (!addressRegex.test(input.value)) {
                                                        errorElement.textContent = "Địa chỉ phải bao gồm số nhà, khu, phố!";
                                                        return false;
                                                    } else {
                                                        errorElement.textContent = "";
                                                        return true;
                                                    }
                                                }
                                                return true;
                                            }

                                            recipientName.addEventListener('input', function () {
                                                validateNoSpacesStartEnd(recipientName, recipientNameError);
                                            });

                                            deliveryPhone.addEventListener('input', function () {
                                                isValidPhoneNumber(deliveryPhone, deliveryPhoneError);
                                            });

                                            deliveryAddress.addEventListener('input', function () {
                                                isValidAddress(deliveryAddress, deliveryAddressError);
                                            });

                                            form.addEventListener('submit', function (event) {
                                                var isRecipientNameValid = validateNoSpacesStartEnd(recipientName, recipientNameError);
                                                var isDeliveryPhoneValid = isValidPhoneNumber(deliveryPhone, deliveryPhoneError);
                                                var isDeliveryAddressValid = isValidAddress(deliveryAddress, deliveryAddressError);

                                                if (!isRecipientNameValid || !isDeliveryPhoneValid || !isDeliveryAddressValid) {
                                                    event.preventDefault();
                                                } else {
                                                    event.preventDefault(); // Ngăn chặn form gửi đi ngay lập tức
                                                    var formData = $(this).serialize();
                                                    $.ajax({
                                                        type: "POST",
                                                        url: form.action,
                                                        data: formData,
                                                        dataType: "json",
                                                        success: function (response) {
                                                            if (response.code === '00') {
                                                                if (window.vnpay) {
                                                                    vnpay.open({width: 768, height: 600, url: response.data});
                                                                } else {
                                                                    location.href = response.data;
                                                                }
                                                            } else {
                                                                alert(response.message);
                                                            }
                                                        },
                                                        error: function (error) {
                                                            console.error(error);
                                                            alert("Đã có lỗi xảy ra, vui lòng thử lại.");
                                                        }
                                                    });
                                                }
                                            });
                                        });

                                        $(document).ready(function () {
                                            var totalAmountInput = $("input[name='totalAmount']");
                                            var totalAmountValue = parseFloat(totalAmountInput.val()).toFixed(0); // Chuyển đổi về số nguyên không có định dạng khoa học
                                            totalAmountInput.val(totalAmountValue);
                                        });

                                        function redirectToProduct(event) {
                                            event.preventDefault();
                                            var searchValue = event.target.querySelector('input[name="search"]').value;
                                            if (searchValue) {
                                                var newURL = "product?search=" + encodeURIComponent(searchValue);
                                                window.location.href = newURL;
                                            } else {
                                                alert('Vui lòng nhập từ khóa tìm kiếm.');
                                            }
                                        }

                                        function redirectToCategory() {
                                            var categoryId = document.getElementById('categorySelect').value;
                                            if (categoryId) {
                                                window.location.href = "product?cid=" + categoryId;
                                            }
                                        }
        </script>

        <!-- Jquery -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.0.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
        <!-- Popper JS -->
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <!-- Color JS -->
        <script src="${pageContext.request.contextPath}/js/colors.js"></script>
        <!-- Slicknav JS -->
        <script src="${pageContext.request.contextPath}/js/slicknav.min.js"></script>
        <!-- Owl Carousel JS -->
        <script src="${pageContext.request.contextPath}/js/owl-carousel.js"></script>
        <!-- Magnific Popup JS -->
        <script src="${pageContext.request.contextPath}/js/magnific-popup.js"></script>
        <!-- Fancybox JS -->
        <script src="${pageContext.request.contextPath}/js/facnybox.min.js"></script>
        <!-- Waypoints JS -->
        <script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
        <!-- Countdown JS -->
        <script src="${pageContext.request.contextPath}/js/finalcountdown.min.js"></script>
        <!-- Nice Select JS -->
        <script src="${pageContext.request.contextPath}/js/nicesellect.js"></script>
        <!-- Ytplayer JS -->
        <script src="${pageContext.request.contextPath}/js/ytplayer.min.js"></script>
        <!-- Flex Slider JS -->
        <script src="${pageContext.request.contextPath}/js/flex-slider.js"></script>
        <!-- ScrollUp JS -->
        <script src="${pageContext.request.contextPath}/js/scrollup.js"></script>
        <!-- Onepage Nav JS -->
        <script src="${pageContext.request.contextPath}/js/onepage-nav.min.js"></script>
        <!-- Easing JS -->
        <script src="${pageContext.request.contextPath}/js/easing.js"></script>
        <!-- Active JS -->
        <script src="${pageContext.request.contextPath}/js/active.js"></script>
    </body>
</html>
