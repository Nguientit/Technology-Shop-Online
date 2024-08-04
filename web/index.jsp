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
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
                padding-top: 60px;
            }

            /* Modal Content */
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 60%;
            }
            .modal-login {
                background-color: #fff;
                border-radius: 15px;
                display: flex;
                flex-direction: column;
                gap: 16px;
                max-width: 450px;
                padding: 15px;
                text-align: center;
                margin: 5% auto;
            }
            .modal-login .title {
                align-items: center;
                display: flex;
                flex-direction: column;
                margin: 0;
            }
            .modal-login .title img {
                margin-left: 10px;
            }
            .modal-login .text p {
                font-size: 1rem;
                margin-bottom: 20px;
            }
            .modal-login .group-login-btn {
                display: flex;
                justify-content: space-around;
            }
            .modal-login .group-login-btn .register-btn,
            .modal-login .group-login-btn .login-btn {
                width: 45%;
                padding: 10px;
                border-radius: 25px;
                text-align: center;
                cursor: pointer;
                font-size: 1rem;
                font-weight: bold;
            }
            .modal-login .group-login-btn .register-btn {
                border: 2px solid #cc0c1b;
                color: #cc0c1b;
                background-color: #fff;
            }
            .modal-login .group-login-btn .login-btn {
                background-color: #cc0c1b;
                color: #fff;
            }
            .modal-close {
                position: absolute;
                top: 10px;
                right: 10px;
                background: none;
                border: none;
                font-size: 1.5rem;
                cursor: pointer;
            }
            .modal-review-star {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .star-all {
                display: flex;
                justify-content: space-evenly;
                width: 100%;
            }

            .star {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .star .icon {
                font-size: 2rem; /* Adjust size as needed */
                color: gray;
                transition: color 0.3s;
            }

            .star .icon.active {
                color: rgb(255, 191, 0);
                ;
            }

            .star p {
                margin-top: 0.5rem;
                font-size: 0.875rem; /* Adjust size as needed */
                text-align: center;
            }
            .filter-container {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .filter-buttons, .filter-stars {
                display: flex;
                gap: 10px;
                flex-wrap: wrap;
            }

            .filter-button, .filter-star-button {
                padding: 5px 10px;
                border: 1px solid #ccc;
                border-radius: 20px;
                background-color: white;
                cursor: pointer;
                display: flex;
                align-items: center;
                gap: 5px;
                transition: all 0.3s;
            }

            .filter-button.active, .filter-star-button.active, .filter-button:hover, .filter-star-button:hover {
                background-color: #cc0c1b;
                color: white;
                border-color: #cc0c1b;
            }

            .filter-star-button i {
                color: rgb(255, 191, 0);
                ;
            }
            .user-avatar {
                width: 52px;
                border-radius: 50%;
            }

            .user-info {
                display: inline-block;
                vertical-align: top;
            }

            .review-header {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }

            .feedback-image {
                border-radius: 10px;
                height: 90px;
                max-height: 90px;
                -o-object-fit: cover;
                object-fit: cover;
                width: 90px;
            }

            .review-item {
                border-bottom: 1px solid #ccc;
                padding-bottom: 15px;
                margin-bottom: 15px;
            }
            .review-box{
                margin-left: 52px;
            }
            .review-button {
                text-align: center;
                margin: 20px 0;
            }

            .review-button p {
                font-size: 16px;
                color: #333;
                margin-bottom: 10px;
            }

            .review-button button {
                background-color: #d0021b;
                color: white;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .review-button button:hover {
                background-color: #b00018;
            }
            .modal .modal-content .button-container button {
                background-color: #d0021b;
                color: white;
                border: none;
                padding: 15px 0;
                font-size: 16px;
                width: 100%;
                cursor: pointer;
                transition: background-color 0.3s ease;
                border-radius: 5px;
            }

            .modal .modal-content .button-container button:hover {
                background-color: #b00018;
            }

            .modal .modal-content .button-container {
                margin-top: 20px;
                text-align: center;
            }
        </style>

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
                        <div class="col-lg-7 col-md-6 col-12">
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
                        <div class="col-lg-3 col-md-4 col-12">
                            <div class="right-bar">
                                <!-- Search Form -->
                                <div class="sinlge-bar"><a href="${pageContext.request.contextPath}/news">Tin tức</a></div>
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
                                    <c:if test="${user eq null}">
                                        <a id="loginModalbuttoncart" href="#" class="single-icon"><i class="ti-bag"></i> <span class="total-count">0</span></a>
                                    </c:if>
                                    <c:if test="${user ne null}">
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
                                    </c:if>
                                    <!--/ End Shopping Item -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Header Inner -->
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                    <li data-target="#myCarousel" data-slide-to="4"></li>
                    <li data-target="#myCarousel" data-slide-to="5"></li>
                    <li data-target="#myCarousel" data-slide-to="6"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item">
                        <img class="d-block w-100" src="images/banner iPad Pro M4_PC.png" alt="Fourth slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="images/tong1.png" alt="Firth slide">
                    </div>               
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="images/banner iPad Air M2_Danh mục.png" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="images/banner iPad Air 5 T6_PC.png" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="images/banner MacBook Air M1 T6_PC.png" alt="Third slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="images/banner iPhone 15 Pro Max T6_PC.png" alt="Sixth slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="images/banner iPhone 15 T6_Danh mục.png" alt="Seventh slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="images/banner MacBook Air M2 T6_Danh mục.png" alt="Eighth slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!--/ End Header Inner -->
        </header>
        <!--/ End Header -->

        <!-- Start Product Area -->
        <div class="product-area section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h2>ĐIỆN THOẠI NỔI BẬT NHẤT</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="product-info">
                            <div class="nav-main">
                                <!-- Tab Nav -->
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#iphone" role="tab">Iphone</a></li>
                                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#samsung" role="tab">Samsung</a></li>
                                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#xiaomi" role="tab">Xiaomi</a></li>
                                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#oppo" role="tab">Oppo</a></li>
                                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#realme" role="tab">Realme</a></li>
                                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#vivo" role="tab">Vivo</a></li>
                                </ul>
                                <!--/ End Tab Nav -->
                            </div>
                            <div class="tab-content" id="myTabContent">
                                <!-- Start Single Tab -->
                                <div class="tab-pane fade show active" id="iphone" role="tabpanel">
                                    <div class="tab-single">
                                        <div class="row">
                                            <c:forEach items="${listA}" var="o">
                                                <div class="col-xl-3 col-lg-4 col-md-5 col-12">
                                                    <div class="single-product">
                                                        <div class="product-img">
                                                            <a href="${pageContext.request.contextPath}/productdetails?pid=${o.product.id}&pdid=${o.id}&pdcriteria=${o.criteria}">
                                                                <img class="default-img" src="${pageContext.request.contextPath}/images/${o.product.image}" alt="#">
                                                                <img class="hover-img" src="${pageContext.request.contextPath}/images/${o.product.image}" alt="#">
                                                                <c:forEach items="${listDC}" var="discount">
                                                                    <c:if test="${o.id eq discount.pd.id}">
                                                                        <c:set var="discountPercentage" value="${(o.originalPrice - discount.priceDiscount) / o.originalPrice * 100}" />
                                                                        <fmt:formatNumber value="${discountPercentage}" type="number" maxFractionDigits="0" var="formattedDiscountPercentage" />
                                                                        <span class="price-dec">Giảm ${formattedDiscountPercentage}%</span>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </a>
                                                        </div>
                                                        <div class="product-content">
                                                            <h3><a href="productdetails?pid=${o.product.id}">${o.product.name}</a></h3>
                                                            <div class="product-price">
                                                                <c:forEach items="${listDC}" var="discount">
                                                                    <c:if test="${o.id eq discount.pd.id}" >
                                                                        <p class="product-price-show"><currency:formatCurrency value="${discount.priceDiscount}" /></p>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <p class="product-price-through"><currency:formatCurrency value="${o.originalPrice}" /></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <!--/ End Single Tab -->
                                <!-- Start Single Tab -->
                                <div class="tab-pane fade" id="samsung" role="tabpanel">
                                    <div class="tab-single">
                                        <div class="row">
                                            <c:forEach items="${listS}" var="o">
                                                <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                    <div class="single-product">
                                                        <div class="product-img">
                                                            <a href="${pageContext.request.contextPath}/productdetails?pid=${o.product.id}&pdid=${o.id}&pdcriteria=${o.criteria}">
                                                                <img class="default-img" src="images/${o.product.image}" alt="#">
                                                                <img class="hover-img" src="images/${o.product.image}" alt="#">
                                                                <c:forEach items="${listDC}" var="discount">
                                                                    <c:if test="${o.id eq discount.pd.id}" >
                                                                        <c:set var="discountPercentage" value="${(o.originalPrice - discount.priceDiscount) / o.originalPrice * 100}" />
                                                                        <fmt:formatNumber value="${discountPercentage}" type="number" maxFractionDigits="0" var="formattedDiscountPercentage" />
                                                                        <span class="price-dec">Giảm ${formattedDiscountPercentage}%</span>
                                                                    </c:if>
                                                                </c:forEach>  
                                                            </a>
                                                        </div>
                                                        <div class="product-content">
                                                            <h3><a href="${pageContext.request.contextPath}/productdetails?pid=${o.product.id}&pdid=${o.id}&pdcriteria=${o.criteria}"></h3>
                                                            <div class="product-price">
                                                                <c:forEach items="${listDC}" var="discount">
                                                                    <c:if test="${o.id eq discount.pd.id}" >
                                                                        <p class="product-price-show"><currency:formatCurrency value="${discount.priceDiscount}" /></p>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <p class="product-price-through"><currency:formatCurrency value="${o.originalPrice}" /></p>                                                            
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <!--/ End Single Tab -->
                                <!-- Start Single Tab -->
                                <div class="tab-pane fade" id="xiaomi" role="tabpanel">
                                    <div class="tab-single">
                                        <div class="row">
                                            <c:forEach items="${listX}" var="o">
                                                <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                    <div class="single-product">
                                                        <div class="product-img">
                                                            <a href="${pageContext.request.contextPath}/productdetails?pid=${o.product.id}&pdid=${o.id}&pdcriteria=${o.criteria}">
                                                                <img class="default-img" src="images/${o.product.image}" alt="#">
                                                                <img class="hover-img" src="images/${o.product.image}" alt="#">
                                                                <c:forEach items="${listDC}" var="discount">
                                                                    <c:if test="${o.id eq discount.pd.id}" >
                                                                        <c:set var="discountPercentage" value="${(o.originalPrice - discount.priceDiscount) / o.originalPrice * 100}" />
                                                                        <fmt:formatNumber value="${discountPercentage}" type="number" maxFractionDigits="0" var="formattedDiscountPercentage" />
                                                                        <span class="price-dec">Giảm ${formattedDiscountPercentage}%</span>
                                                                    </c:if>
                                                                </c:forEach>  
                                                            </a>
                                                        </div>
                                                        <div class="product-content">
                                                            <h3><a href="${pageContext.request.contextPath}/productdetails?pid=${o.product.id}">${o.product.name}</a></h3>
                                                            <div class="product-price">
                                                                <c:forEach items="${listDC}" var="discount">
                                                                    <c:if test="${o.id eq discount.pd.id}" >
                                                                        <p class="product-price-show"><currency:formatCurrency value="${discount.priceDiscount}" /></p>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <p class="product-price-through"><currency:formatCurrency value="${o.originalPrice}" /></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <!-- Start Single Tab -->
                                <div class="tab-pane fade" id="oppo" role="tabpanel">
                                    <div class="tab-single">
                                        <div class="row">
                                            <c:forEach items="${listO}" var="o">
                                                <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                    <div class="single-product">
                                                        <div class="product-img">
                                                            <a href="${pageContext.request.contextPath}/productdetails?pid=${o.product.id}&pdid=${o.id}&pdcriteria=${o.criteria}">
                                                                <img class="default-img" src="images/${o.product.image}" alt="#">
                                                                <img class="hover-img" src="images/${o.product.image}" alt="#">
                                                                <c:forEach items="${listDC}" var="discount">
                                                                    <c:if test="${o.id eq discount.pd.id}" >
                                                                        <c:set var="discountPercentage" value="${(o.originalPrice - discount.priceDiscount) / o.originalPrice * 100}" />
                                                                        <fmt:formatNumber value="${discountPercentage}" type="number" maxFractionDigits="0" var="formattedDiscountPercentage" />
                                                                        <span class="price-dec">Giảm ${formattedDiscountPercentage}%</span>
                                                                    </c:if>
                                                                </c:forEach>  
                                                            </a>
                                                        </div>
                                                        <div class="product-content">
                                                            <h3><a href="${pageContext.request.contextPath}/productdetails?pid=${o.product.id}">${o.product.name}</a></h3>
                                                            <div class="product-price">
                                                                <c:forEach items="${listDC}" var="discount">
                                                                    <c:if test="${o.id eq discount.pd.id}" >
                                                                        <p class="product-price-show"><currency:formatCurrency value="${discount.priceDiscount}" /></p>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <p class="product-price-through"><currency:formatCurrency value="${o.originalPrice}" /></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Product Area -->

        <div id="loginModal-cart" class="modal" style="display: none;">
            <div class="modal-login">
                <div class="title is-flex is-justify-content-center is-align-items-center">
                    <span>TechHaven</span>
                    <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:80/q:90/plain/https://cellphones.com.vn/media/wysiwyg/chibi2.png" height="80" alt="cps-smember-icon">
                </div>
                <div class="text">
                    <p>Vui lòng đăng nhập tài khoản TechHaven để xem giỏ hàng.</p>
                </div>
                <div class="group-login-btn">
                    <a href="${pageContext.request.contextPath}/register" class="register-btn">Đăng ký</a>
                    <a href="${pageContext.request.contextPath}/login" class="login-btn">Đăng nhập</a>
                </div>
            </div>
        </div>
        <!-- Laptop product-->
        <div class="product-area section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h2>LAPTOP</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="product-info">
                            <div class="nav-main">
                                <!-- Tab Nav -->
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#apple" role="tab">Apple</a></li>
                                    <!--                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#samsung" role="tab">Samsung</a></li>-->
                                </ul>
                                <!--/ End Tab Nav -->
                            </div>
                            <!-- Start Single Tab -->
                            <div class="tab-pane fade show active" id="apple" role="tabpanel">
                                <div class="tab-single">
                                    <div class="row">
                                        <c:forEach items="${listM}" var="o">
                                            <div class="col-xl-3 col-lg-4 col-md-5 col-12">
                                                <div class="single-product">
                                                    <div class="product-img">
                                                        <a href="${pageContext.request.contextPath}/productdetails?pid=${o.product.id}&pdid=${o.id}&pdcriteria=${o.criteria}">
                                                            <img class="default-img" src="${pageContext.request.contextPath}/images/${o.product.image}" alt="#">
                                                            <img class="hover-img" src="${pageContext.request.contextPath}/images/${o.product.image}" alt="#">
                                                            <c:forEach items="${listDC}" var="discount">
                                                                <c:if test="${o.id eq discount.pd.id}">
                                                                    <c:set var="discountPercentage" value="${(o.originalPrice - discount.priceDiscount) / o.originalPrice * 100}" />
                                                                    <fmt:formatNumber value="${discountPercentage}" type="number" maxFractionDigits="0" var="formattedDiscountPercentage" />
                                                                    <span class="price-dec">Giảm ${formattedDiscountPercentage}%</span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </a>
                                                    </div>
                                                    <div class="product-content">
                                                        <h3><a href="productdetails?pid=${o.product.id}">${o.product.name}</a></h3>
                                                        <div class="product-price">
                                                            <c:forEach items="${listDC}" var="discount">
                                                                <c:if test="${o.id eq discount.pd.id}" >
                                                                    <p class="product-price-show"><currency:formatCurrency value="${discount.priceDiscount}" /></p>
                                                                </c:if>
                                                            </c:forEach>
                                                            <p class="product-price-through"><currency:formatCurrency value="${o.originalPrice}" /></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <!--/ End Single Tab -->
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Start Most Popular -->        
        <div class="product-area most-popular section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h2>Hot Item</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="owl-carousel popular-slider">
                            <!--Start Single Product--> 
                            <c:forEach items="${listA}" var="o">
                                <div class="single-product">
                                    <div class="product-img">
                                        <a href="${pageContext.request.contextPath}/productdetails?pid=${o.product.id}&pdid=${o.id}&pdcriteria=${o.criteria}">
                                            <img class="default-img" src="${pageContext.request.contextPath}/images/${o.product.image}" alt="#">
                                            <img class="hover-img" src="${pageContext.request.contextPath}/images/${o.product.image}" alt="#">
                                            <c:forEach items="${listDC}" var="discount">
                                                <c:if test="${o.id eq discount.pd.id}">
                                                    <c:set var="discountPercentage" value="${(o.originalPrice - discount.priceDiscount) / o.originalPrice * 100}" />
                                                    <fmt:formatNumber value="${discountPercentage}" type="number" maxFractionDigits="0" var="formattedDiscountPercentage" />
                                                    <span class="price-dec">Giảm ${formattedDiscountPercentage}%</span>
                                                </c:if>
                                            </c:forEach>
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <h3><a href="productdetails?pid=${o.product.id}">${o.product.name}</a></h3>
                                        <div class="product-price">
                                            <c:forEach items="${listDC}" var="discount">
                                                <c:if test="${o.id eq discount.pd.id}" >
                                                    <p class="product-price-show"><currency:formatCurrency value="${discount.priceDiscount}" /></p>
                                                </c:if>
                                            </c:forEach>
                                            <p class="product-price-through"><currency:formatCurrency value="${o.originalPrice}" /></p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!--End Single Product--> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                                <h4>Địa chỉ liên hệ</h4>
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

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var loginModalCart = document.getElementById('loginModal-cart');
                var loginModalbuttoncart = document.getElementById('loginModalbuttoncart');
                var closeButtons = document.getElementsByClassName("close");

                if (loginModalbuttoncart) {
                    loginModalbuttoncart.onclick = function () {
                        loginModalCart.style.display = "block";
                    };
                }

                for (var i = 0; i < closeButtons.length; i++) {
                    closeButtons[i].onclick = function () {
                        this.closest('.modal').style.display = 'none';
                    };
                }

                window.onclick = function (event) {
                    if (event.target == loginModalCart) {
                        loginModalCart.style.display = "none";
                    }
                };
            });
            //chuyen hướng nguoi dung toi ket qua tim kiem san pham
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
            //chuyen huong nguoi dung toi danh muc nguoi dung da chon
            function redirectToCategory() {
                var categoryId = document.getElementById('categorySelect').value;
                if (categoryId) {
                    window.location.href = "product?cid=" + categoryId;
                }
            }

            function addToCart(productId, quantity) {
                // Gửi yêu cầu AJAX hoặc gửi dữ liệu đến Servlet/JSP để xử lý thêm sản phẩm vào giỏ hàng
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/addtocart",
                    data: {
                        productId: productId,
                        quantity: quantity
                    },
                    success: function (response) {
                        alert("Sản phẩm đã được thêm vào giỏ hàng!");
                        location.reload();
                    },
                    error: function (xhr, status, error) {
                        alert("Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng!");
                        console.error(xhr.responseText);
                    }
                });
            }
            function updateCart(productId, quantity) {
                var xhr = new XMLHttpRequest();
                xhr.open('GET', 'cart?role=update&id=' + productId + '&quantity=' + quantity, true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        location.reload();
                    }
                };
                xhr.send();
            }
        </script>
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


