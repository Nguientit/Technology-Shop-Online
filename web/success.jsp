<%-- 
    Document   : home
    Created on : May 20, 2024, 7:25:24 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zxx">   
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Meta Tag -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name='copyright' content=''>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Title Tag  -->
        <title>Tech Haven</title>
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="images/favicon.png">
        <!-- Web Font -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

        <!-- StyleSheet -->

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">
        <!-- Magnific Popup -->
        <link rel="stylesheet" href="css/magnific-popup.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.css">
        <!-- Fancybox -->
        <link rel="stylesheet" href="css/jquery.fancybox.min.css">
        <!-- Themify Icons -->
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- Nice Select CSS -->
        <link rel="stylesheet" href="css/niceselect.css">
        <!-- Animate CSS -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Flex Slider CSS -->
        <link rel="stylesheet" href="css/flex-slider.min.css">
        <!-- Owl Carousel -->
        <link rel="stylesheet" href="css/owl-carousel.css">
        <!-- Slicknav -->
        <link rel="stylesheet" href="css/slicknav.min.css">

        <!-- Eshop StyleSheet -->
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/responsive.css">


        <style>
            .success-message {
                text-align: center;
                background: #fff;
                padding: 40px;
                border: 1px solid #ddd;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                margin: 150px auto;
            }

            .success-message h1 {
                margin-bottom: 20px;
            }

            .success-message .order-details {
                margin-bottom: 20px;
                font-size: 16px;
                color: #333;
            }

            .success-message .order-details p {
                margin: 10px 0;
            }

            .success-message .order-details span {
                font-weight: bold;
            }

            .success-message .actions {
                display: flex;
                justify-content: space-around;
                margin-top: 20px;
            }

            .success-message .actions .btn {
                color: white;
                text-decoration: none;
                transition: background-color 0.3s;
            }

            .success-message .actions .btn:hover {
                background-color: #cc0c1b;
            }


            .success-message .actions .btn-secondary:hover {
                background-color: #cc0c1b;
            }
            .breadcrumb a {
                font-weight: bold; /* Make the text bold */
            }
            .success-icon {
                margin-bottom: 20px;
                font-size: 70px;
                color: #49ce66;
            }
        </style>
    </head>
    <body class="js">
        <!-- Header -->
        <header class="header shop">
            <!-- End Topbar -->
            <div class="middle-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-12">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="home"><img src="images/logo.png" alt="logo"></a>
                            </div>
                            <!--/ End Logo -->
                            <!-- Search Form -->
                            <div class="search-top">
                                <div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
                                <!-- Search Form -->
                                <div class="search-top">
                                    <form id="header-search-form" class="search-form" onsubmit="redirectToProduct(event)">
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
                                    <a href="#" class="single-icon"><i class="fa fa-heart-o" aria-hidden="true"></i>
                                    </a>
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
                                                        <a href="${pageContext.request.contextPath}/cart?rid=${item.pd.id}"><i class="fa fa-remove"></i></a>
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
                                    <!--/ End Shopping Item -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <body class="js">
                <div class="container">
                    <div class="success-message">
                        <div class="success-icon">
                            <i class="bi bi-check-circle-fill"></i>
                        </div>
                        <h1>ĐẶT HÀNG THÀNH CÔNG</h1>
                        <div class="order-details">
                            <p>Bạn đã đặt thành công đơn hàng mã <span>${orderId}</span> trị giá <span><currency:formatCurrency value="${totalAmount}"/></span>, thanh toán <span>${paymentMethod}</span>.</p>
                            <p>Sau khi Tech Haven xác nhận đơn hàng, sản phẩm sẽ được giao đến địa chỉ <span>${deliveryAddress}</span> trong thời gian sớm nhất.</p>
                            <p class="breadcrumb">
                                Bạn có thể theo dõi đơn hàng tại:<br/>
                                <a href="${pageContext.request.contextPath}/viewprofile">Hồ sơ<i class="ti-arrow-right"></i></a> 
                                <a href="${pageContext.request.contextPath}/orderhistory"> Lịch sử mua hàng</a>
                            </p>                    
                        </div>
                        <div class="actions">
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/home">Tiếp tục mua sắm</a>
                            <a href="${pageContext.request.contextPath}/orderhistory" class="btn btn-secondary">Lịch sử mua hàng</a>
                        </div>
                    </div>
                </div>
            </body>                 

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
                                </div>
                                <!-- End Single Widget -->
                            </div>
                            <div class="col-lg-2 col-md-6 col-12">
                                <!-- Single Widget -->
                                <div class="single-footer links">
                                    <h4>Chính sách</h4>
                                </div>
                                <!-- End Single Widget -->
                            </div>
                            <div class="col-lg-3 col-md-6 col-12">
                                <!-- Single Widget -->
                                <div class="single-footer social">
                                    <h4>Địa chỉ liên hệ</h4>
                                    <!-- Single Widget -->
                                    <div class="contact">
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

            <script src="js/jquery.min.js"></script>
            <script src="js/jquery-migrate-3.0.0.js"></script>
            <script src="js/jquery-ui.min.js"></script>
            <script src="js/popper.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/colors.js"></script>
            <script src="js/slicknav.min.js"></script>
            <script src="js/owl-carousel.js"></script>
            <script src="js/magnific-popup.js"></script>
            <script src="js/waypoints.min.js"></script>
            <script src="js/finalcountdown.min.js"></script>
            <script src="js/nicesellect.js"></script>
            <script src="js/flex-slider.js"></script>
            <script src="js/scrollup.js"></script>
            <script src="js/onepage-nav.min.js"></script>
            <script src="js/easing.js"></script>
            <script src="js/active.js"></script>
    </body>
</html>
