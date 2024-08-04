<%-- 
    Document   : cart
    Created on : Jun 4, 2024, 3:18:41 PM
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





    </head>
    <body class="js">
        <!-- Header -->
        <header class="header shop">
            <!-- End Topbar -->
            <div class="middle-inner">
                <div class="container" >
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-12">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/home"><img src="images/logo.png" alt="logo"></a>
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
                                                <a href="${sessionScope.account == null ? 'login' : 'checkout'}" class="btn animate">Mua ngay</a>
                                            </c:if>
                                        </div>  
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Breadcrumbs -->
            <div class="breadcrumbs">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="bread-inner">
                                <ul class="bread-list">
                                    <li><a href="${pageContext.request.contextPath}/home">Trang chủ<i class="ti-arrow-right"></i></a></li>
                                    <li class="active"><a href="cart">Giỏ hàng</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Breadcrumbs -->

            <!-- Shopping Cart -->
            <div class="shopping-cart">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <!-- Shopping Summery -->
                            <form name="f" action="" method="post">
                                <table class="table shopping-summery">
                                    <c:if test="${sessionScope.listItemsInCart == null || sessionScope.cartSize == 0}">
                                        <div class="nothing-in-cart">
                                            <img src="images/emptycart2.png" width="400px" alt="Emptycart"/>
                                            <span>Giỏ hàng của bạn đang trống.
                                                <br>
                                                Hãy chọn thêm sản phẩm để mua sắm nhé
                                            </span>
                                        </div>
                                        <div id="stickyBottomBar"><a href="${pageContext.request.contextPath}/home" class="go-back">Quay lại trang chủ</a></div>
                                    </c:if>
                                    <c:if test="${sessionScope.cartSize != 0}">
                                        <thead>
                                            <tr class="main-hading">
                                                <th>SẢN PHẨM</th>
                                                <th>TÊN SẢN PHẨM</th>
                                                <th class="text-center">ĐƠN GIÁ</th>
                                                <th class="text-center">SỐ LƯỢNG</th>
                                                <th class="text-center">THÀNH TIỀN</th>
                                                <th class="text-center"></th>
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
                                                        <a class="edit-item" href="${pageContext.request.contextPath}/productdetails?pid=${item.pd.product.id}&oldProductDetailId=${item.pd.id}&pdcriteria=${item.pd.criteria}&isUpdate=true" style="color: #0066cc; text-align: center; text-decoration: none; display: inline-block; font-size: 14px; margin: 4px 2px; cursor: pointer; border-radius: 4px;">Sửa</a>
                                                    </td>                                                    
                                                    <td class="price" data-title="Price"><span><currency:formatCurrency value="${cart.getPriceDiscount(discounts, item.pd.id)}"/></span></td>
                                                    <td class="qty" data-title="Qty">
                                                        <div class="input-group">
                                                            <div class="button minus">
                                                                <button type="button" class="btn btn-primary btn-number" data-min="1"  data-type="minus" data-field="quant[${item.pd.id}]" data-id="${item.pd.id}" data-product-id="${item.pd.product.id}" data-product-criteria="${item.pd.criteria}" onclick="removeFromCart(${item.pd.product.id}, ${item.pd.id}, '${item.pd.criteria}', -1)">
                                                                    <i class="ti-minus"></i>
                                                                </button>
                                                            </div>
                                                            <input type="text" name="quant[${item.pd.id}]" id="quantity-${item.pd.id}" class="input-number" data-min="1" data-max="${item.pd.quantity}" value="${cart.getQuantityById(item.pd.id)}" readonly>
                                                            <div class="button plus">
                                                                <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[${item.pd.id}]" data-id="${item.pd.id}" data-product-id="${item.pd.product.id}" data-product-criteria="${item.pd.criteria}" onclick="addToCart(${item.pd.product.id}, ${item.pd.id}, '${item.pd.criteria}', 1)">
                                                                    <i class="ti-plus"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="price" data-title="Price"><currency:formatCurrency value="${cart.getTotalPriceById(discounts, item.pd.id)}"/></td>
                                                    <td class="action" data-title="Remove"><a href="${pageContext.request.contextPath}/cart?rid=${item.pd.id}"><i class="ti-trash remove-icon"></i></a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </c:if>
                                </table>
                            </form>

                            <!--/ End Shopping Summery -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <!-- Total Amount -->
                            <c:if test="${sessionScope.cartSize != 0}">
                                <div class="total-amount">
                                    <div class="row">
                                        <div class="col-lg-8 col-md-5 col-12">

                                        </div>
                                        <div class="col-lg-4 col-md-7 col-12">
                                            <div class="right">
                                                <ul>
                                                    <li>Tổng số tiền<span><currency:formatCurrency value="${sessionScope.cart.getTotalMoney(listDC)}"/></span></li>
                                                    <li>Tiền ship<span>Free</span></li>
                                                    <!--<li>You Save<span>$20.00</span></li>-->
                                                    <li class="last">Phải trả<span><currency:formatCurrency value="${sessionScope.cart.getTotalMoney(listDC)}"/></span></li>
                                                </ul>
                                                <div class="button5">
                                                    <a href="${pageContext.request.contextPath}/checkout" class="btn" onclick="checkout('id')">Thanh toán</a>
                                                    <a href="${pageContext.request.contextPath}/home" class="btn">Tiếp tục mua sắm</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <!--/ End Total Amount -->
                        </div>
                    </div>
                </div>
            </div>
            <!--/ End Shopping Cart -->
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
            <script>
                function addToCart(productId, productDetailId, productCriteria, quantity = 1) {
                    const inputField = document.getElementById(`quantity-${productDetailId}`);
                    if (inputField) {
                        const currentQuantity = parseInt(inputField.value);
                        const maxQuantity = parseInt(inputField.getAttribute("data-max"));

                        if (currentQuantity + quantity > maxQuantity) {
                            alert("Đã đạt giới hạn số lượng sản phẩm.");
                            return;
                        }
                    }

                    $.ajax({
                        type: "POST",
                        url: `${pageContext.request.contextPath}/addtocart`,
                        data: {
                            productId: productId,
                            productDetailId: productDetailId,
                            productCriteria: productCriteria,
                            quantity: quantity,
                        },
                        success: function (response) {
                            try {
                                const jsonResponse = JSON.parse(response);
                                if (jsonResponse.status === "error") {
                                    alert(jsonResponse.message);
                                } else {
                                    location.reload(); // Tải lại trang để cập nhật giỏ hàng
                                }
                            } catch (e) {
                                location.reload();
                            }
                        },
                        error: function (xhr, status, error) {
                            alert("Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng!");
                            console.error(xhr.responseText);
                        }
                    });
                }

                function removeFromCart(productId, productDetailId, productCriteria, quantity = - 1) {
                    const inputField = document.getElementById(`quantity-${productDetailId}`);
                    if (inputField) {
                        const currentQuantity = parseInt(inputField.value);
                        const minQuantity = parseInt(inputField.getAttribute("data-min"));

                        if (currentQuantity + quantity < minQuantity) {
                            alert("Số lượng không thể giảm xuống dưới 1.");
                            return;
                        }
                    }

                    $.ajax({
                        type: "POST",
                        url: `${pageContext.request.contextPath}/addtocart`,
                        data: {
                            productId: productId,
                            productDetailId: productDetailId,
                            productCriteria: productCriteria,
                            quantity: quantity,
                        },
                        success: function (response) {
                            try {
                                const jsonResponse = JSON.parse(response);
                                if (jsonResponse.status === "error") {
                                    alert(jsonResponse.message);
                                } else {
                                    location.reload(); // Tải lại trang để cập nhật giỏ hàng
                                }
                            } catch (e) {
                                location.reload();
                            }
                        },
                        error: function (xhr, status, error) {
                            alert("Đã xảy ra lỗi khi xóa sản phẩm khỏi giỏ hàng!");
                            console.error(xhr.responseText);
                        }
                    });
                }
                function updateCart(pid, pdid) {
                    var criteria = $('.storage-option.selected').data('criteria');
                    var color = $('.color-option.selected').data('color');

                    $.ajax({
                        url: '${pageContext.request.contextPath}/cart',
                        type: 'POST',
                        data: {
                            action: 'update',
                            pid: pid,
                            pdid: pdid,
                            criteria: criteria,
                            color: color
                        },
                        success: function (response) {
                            alert('Cập nhật giỏ hàng thành công!');
                            // Bạn có thể cập nhật lại giỏ hàng ở đây nếu cần
                        },
                        error: function () {
                            alert('Có lỗi xảy ra, vui lòng thử lại.');
                        }
                    });
                }
                function updateCart(productId, quantity) {
                    var xhr = new XMLHttpRequest();
                    xhr.open('GET', 'cart?role=update&id=' + productId + '&quantity=' + quantity, true);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            // Cập nhật giao diện sau khi server xử lý thành công
                            location.reload();
                        }
                    };
                    xhr.send();
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