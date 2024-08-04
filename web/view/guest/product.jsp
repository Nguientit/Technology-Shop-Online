<%-- 
    Document   : product-detail
    Created on : May 21, 2024, 8:00:00 AM
    Author     : Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
            .category-button {
                border: none;
                background: none;
                align-items: center;
                background: white;
                border: 1px solid #e5e7eb;
                border-radius: 10px;
                color: #444;
                cursor: pointer;
                display: flex;
                font-size: 12px;
                height: 37px;
                margin: 0 10px 10px 0;
                padding: 5px 10px;
                white-space: nowrap;
            }
            .category-button.active {
                background-color: #cc0c1b;
                color: white;
            }
            .categor-list {
                display: flex;
                flex-wrap: wrap;
            }
            .category-button {
                align-items: center;
                border: 1px solid #e5e7eb;
                border-radius: 4px;
                display: flex;
                height: 34px;
                justify-content: center;
                margin: 0 10px 10px 0;
                padding: 2px 4px;
            }

            .category-button.active {
                border: 2px solid #000; /* Hoặc màu sắc bạn muốn để hiển thị khi được chọn */
            }

            .brand-logo {
                height: 20px;
                max-width: none;
                min-width: 98px;
            }
            .carousel-inner img {
                width: 100%;
                height: auto;
            }
            .banner-row {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
            }
            .search-empty {
                align-items: center;
                display: flex;
                flex-flow: column;
                font-size: 16px;
                font-weight: 600;
                gap: 5px;
                justify-content: center;
                margin-top: 50px;
                margin-left: 350px;
                text-align: center;
            }
            .flex-banner{
                margin-top: -135px;
            }
            .container{
                max-width: 1250px;
            }
            .current-filters .btn-filter.active {
                background: #fef2f2;
                border: 1px solid #d70018;
                color: #d70018;
            }
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
            .rating {
                display: flex;
                align-items: center;
            }
            .rating-detail {
                margin-left: 10px;
            }
        </style>
    </head>
    <body class="js">
        <!-- Header -->
        <header class="header shop">
            <div class="middle-inner">
                <div class="container">
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
                                    <form id="main-search-form" onsubmit="redirectToProduct(event)">
                                        <input name="search" placeholder="Bạn cần tìm gì?" type="search">
                                        <button type="submit" class="btnn"><i class="ti-search"></i></button>
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
        </header>
        <!--/ End Header -->
        <!-- Breadcrumbs -->
        <div class="breadcrumbs">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="bread-inner">
                            <ul class="bread-list">
                                <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
                                        <c:if test="${not empty categoryName}">
                                    <li class="active"><a href="${pageContext.request.contextPath}/product?cid=${param.cid}"><i class="ti-arrow-right"></i>Sản phẩm</a></li>
                                    </c:if>
                                    <c:if test="${not empty brandName}">
                                    <li class="active"><a href="${pageContext.request.contextPath}/product?cid=${param.cid}&bid=${param.bid}"><i class="ti-arrow-right"></i>${brandName.name}</a></li>
                                        </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- Product Detail -->
        <section class="product-area shop-sidebar shop section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="banner-row">
                            <div class="flex-banner">
                                <div id="bannerCarousel1" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:595:100/q:80/plain/https://dashboard.cellphones.com.vn/storage/nang-cap-iphone-compatibility-cate.jpg" class="d-block w-100" alt="Vivo Banner">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:595:100/q:80/plain/https://dashboard.cellphones.com.vn/storage/galaxy-m34-cate-21-5-2024.png" class="d-block w-100" alt="Samsung Banner">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:595:100/q:80/plain/https://dashboard.cellphones.com.vn/storage/mo-ban-galaxyz6-series-cate.png" class="d-block w-100" alt="Samsung Banner">
                                        </div>
                                    </div>
                                    <a class="carousel-control-prev" href="#bannerCarousel1" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#bannerCarousel1" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>
                            <div class="flex-banner">
                                <div id="bannerCarousel2" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:595:100/q:80/plain/https://dashboard.cellphones.com.vn/storage/vivo-v30e-cate-moi-22-7.png" class="d-block w-100" alt="Vivo Banner">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:595:100/q:80/plain/https://dashboard.cellphones.com.vn/storage/Realme-C61-cate-26-7-2024.png" class="d-block w-100" alt="Realme Banner">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:595:100/q:80/plain/https://dashboard.cellphones.com.vn/storage/poco-m6-cate-27-6-2024.jpg " class="d-block w-100" alt="Realme Banner">
                                        </div>
                                    </div>
                                    <a class="carousel-control-prev" href="#bannerCarousel2" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#bannerCarousel2" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="categor-list">
                            <c:forEach items="${listB}" var="o">
                                <button class="category-button <c:if test='${selectedBrand eq o.id}'>active</c:if>" onclick="window.location.href = 'product?bid=${o.id}'">
                                    <img src="${o.image}" alt="${o.name}" class="brand-logo">
                                </button>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-md-12 col-12">
                        <div class="row">
                            <div class="col-12">
                                <!-- Shop Top -->
                                <div class="current-filters" style="display: ${not empty storageOption ? 'block' : 'none'};">
                                    <div class="filter-short">
                                        Đang lọc theo
                                    </div>
                                    <div id="filter-tags">
                                        <c:if test="${not empty storageOption}">
                                            <button type="button" class="btn-filter active" onclick="removeFilter('storage')">
                                                <div class="icon"><svg width="40" height="40" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256zM175 208.1L222.1 255.1L175 303C165.7 312.4 165.7 327.6 175 336.1C184.4 346.3 199.6 346.3 208.1 336.1L255.1 289.9L303 336.1C312.4 346.3 327.6 346.3 336.1 336.1C346.3 327.6 346.3 312.4 336.1 303L289.9 255.1L336.1 208.1C346.3 199.6 346.3 184.4 336.1 175C327.6 165.7 312.4 165.7 303 175L255.1 222.1L208.1 175C199.6 165.7 184.4 165.7 175 175C165.7 184.4 165.7 199.6 175 208.1V208.1z"></path></svg></div>
                                                Bộ nhớ trong: ${storageOption}
                                            </button>
                                        </c:if>
                                        <button type="button" class="btn-filter active" onclick="removeAllFilters()">
                                            Bỏ chọn tất cả
                                        </button>
                                    </div>
                                </div>
                                <div class="filter-short">
                                    SẮP XẾP THEO
                                </div>
                                <div class="shop-top">
                                    <div class="shop-shorter">
                                        <button type="button" class="btn-filter ${param.sort eq 'desc' ? 'active' : ''}" onclick="setSortOrder('desc')">
                                            <span class="oi oi-sort-ascending"></span> 
                                            <div class="icon">
                                                <svg height="15" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                                <path d="M416 288h-95.1c-17.67 0-32 14.33-32 32s14.33 32 32 32H416c17.67 0 32-14.33 32-32S433.7 288 416 288zM544 32h-223.1c-17.67 0-32 14.33-32 32s14.33 32 32 32H544c17.67 0 32-14.33 32-32S561.7 32 544 32zM352 416h-32c-17.67 0-32 14.33-32 32s14.33 32 32 32h32c17.67 0 31.1-14.33 31.1-32S369.7 416 352 416zM480 160h-159.1c-17.67 0-32 14.33-32 32s14.33 32 32 32H480c17.67 0 32-14.33 32-32S497.7 160 480 160zM192.4 330.7L160 366.1V64.03C160 46.33 145.7 32 128 32S96 46.33 96 64.03v302L63.6 330.7c-6.312-6.883-14.94-10.38-23.61-10.38c-7.719 0-15.47 2.781-21.61 8.414c-13.03 11.95-13.9 32.22-1.969 45.27l87.1 96.09c12.12 13.26 35.06 13.26 47.19 0l87.1-96.09c11.94-13.05 11.06-33.31-1.969-45.27C224.6 316.8 204.4 317.7 192.4 330.7z"></path>
                                                </svg>
                                            </div>
                                            Giá Cao - Thấp
                                        </button>
                                        <button type="button" class="btn-filter ${param.sort eq 'asc' ? 'active' : ''}" onclick="setSortOrder('asc')">
                                            <span class="oi oi-sort-descending"></span> 
                                            <div class="icon">
                                                <svg height="15" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                                <path d="M320 224H416c17.67 0 32-14.33 32-32s-14.33-32-32-32h-95.1c-17.67 0-32 14.33-32 32S302.3 224 320 224zM320 352H480c17.67 0 32-14.33 32-32s-14.33-32-32-32h-159.1c-17.67 0-32 14.33-32 32S302.3 352 320 352zM320 96h32c17.67 0 31.1-14.33 31.1-32s-14.33-32-31.1-32h-32c-17.67 0-32 14.33-32 32S302.3 96 320 96zM544 416h-223.1c-17.67 0-32 14.33-32 32s14.33 32 32 32H544c17.67 0 32-14.33 32-32S561.7 416 544 416zM192.4 330.7L160 366.1V64.03C160 46.33 145.7 32 128 32S96 46.33 96 64.03v302L63.6 330.7c-6.312-6.883-14.94-10.38-23.61-10.38c-7.719 0-15.47 2.781-21.61 8.414c-13.03 11.95-13.9 32.22-1.969 45.27l87.1 96.09c12.12 13.26 35.06 13.26 47.19 0l87.1-96.09c11.94-13.05 11.06-33.31-1.969-45.27C224.6 316.8 204.4 317.7 192.4 330.7z"></path>
                                                </svg>
                                            </div>
                                            Giá Thấp - Cao
                                        </button>
                                        <button type="button" class="btn-filter ${param.discount eq '20' ? 'active' : ''}" onclick="setSortOrder('promo')">
                                            <div class="icon">
                                                <svg height="15" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                                <path d="M112 224c61.9 0 112-50.1 112-112S173.9 0 112 0 0 50.1 0 112s50.1 112 112 112zm0-160c26.5 0 48 21.5 48 48s-21.5 48-48 48-48-21.5-48-48 21.5-48 48-48zm224 224c-61.9 0-112 50.1-112 112s50.1 112 112 112 112-50.1 112-112-50.1-112-112-112zm0 160c-26.5 0-48-21.5-48-48s21.5-48 48-48 48 21.5 48 48-21.5 48-48 48zM392.3.2l31.6-.1c19.4-.1 30.9 21.8 19.7 37.8L77.4 501.6a23.95 23.95 0 0 1-19.6 10.2l-33.4.1c-19.5 0-30.9-21.9-19.7-37.8l368-463.7C377.2 4 384.5.2 392.3.2z"></path>
                                                </svg>
                                            </div>
                                            Khuyến Mãi Hot
                                        </button>
                                    </div>
                                    <!--/ End Shop Top -->
                                </div>
                            </div>
                            <div class="row">
                                <c:if test="${empty listP}">
                                    <div class="col-12">
                                        <div class="search-empty">
                                            <c:if test="${!empty searchP}">
                                                <div class="empty-message">
                                                    Tìm thấy 0 sản phẩm cho từ khoá <strong>'<c:out value="${searchP}" />'</strong>
                                                </div>
                                            </c:if>
                                            <img src="images/Search-Empty.png" width="400px" alt="Emptycart"/>
                                            <div>Không có sản phẩm nào được tìm thấy
                                            </div>
                                        </div> 
                                    </div>

                                </c:if>
                                <c:if test="${!empty listP}">
                                    <c:forEach items="${listP}" var="o">
                                        <c:forEach items="${listDC}" var="discount">
                                            <c:if test="${o.id eq discount.pd.id}">
                                                <c:set var="discountPercentage" value="${(o.originalPrice - discount.priceDiscount) / o.originalPrice * 100}" />
                                                <fmt:formatNumber value="${discountPercentage}" type="number" maxFractionDigits="0" var="formattedDiscountPercentage" />
                                                <c:if test="${param.discount eq '20' ? formattedDiscountPercentage >= 20 : true}">
                                                    <div class="">
                                                        <div class="single-product">
                                                            <div class="product-img">
                                                                <a href="${pageContext.request.contextPath}/productdetails?pid=${o.product.id}&pdid=${o.id}&pdcriteria=${o.criteria}">
                                                                    <img class="default-img" src="${pageContext.request.contextPath}/images/${o.product.image}" alt="#">
                                                                    <img class="hover-img" src="${pageContext.request.contextPath}/images/${o.product.image}" alt="#">
                                                                    <span class="price-dec">Giảm ${formattedDiscountPercentage}%</span>
                                                                </a>
                                                            </div>
                                                            <div class="product-content">
                                                                <h3><a href="productdetails?pid=${o.product.id}">${o.product.name}</a></h3>
                                                                <div class="product-price">
                                                                    <p class="product-price-show"><currency:formatCurrency value="${discount.priceDiscount}" /></p>
                                                                    <p class="product-price-through"><currency:formatCurrency value="${o.originalPrice}" /></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
        </section>


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
        <!--/ End Product Detail -->
        <footer class="footer">
            <!-- Footer Top -->
            <div class="footer-top section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer about">
                                <div class="logo">
                                    <a href="home"><img src="images/logo2.png" alt="#"></a>
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
            function setSortOrder(order) {
                var url = new URL(window.location.href);
                if (order === 'promo') {
                    url.searchParams.set('discount', '20'); // Set the discount parameter for "Khuyến Mãi Hot"
                } else {
                    url.searchParams.set('sort', order); // Set the sort parameter
                }
                window.location.href = url.toString();
            }

            function setBrandFilter(brand) {
                var url = new URL(window.location.href);
                url.searchParams.set('brand', brand); // Set the brand parameter
                window.location.href = url.toString();
            }

            document.addEventListener('DOMContentLoaded', (event) => {
                const buttons = document.querySelectorAll('.btn-filter');

                buttons.forEach(button => {
                    button.addEventListener('click', () => {
                        // Remove 'active' class from all buttons
                        buttons.forEach(btn => btn.classList.remove('active'));
                        // Add 'active' class to the clicked button
                        button.classList.add('active');
                    });
                });
            });

            function removeFilter(filterType) {
                var url = new URL(window.location.href);
                if (filterType === 'storage') {
                    url.searchParams.delete('storage');
                }
                window.location.href = url.toString();
            }

            function removeAllFilters() {
                var url = new URL(window.location.href);
                url.searchParams.delete('storage');
                window.location.href = url.toString();
            }
            //chuyen huong nguoi dung toi danh muc nguoi dung da chon
            function redirectToCategory() {
                var categoryId = document.getElementById('categorySelect').value;
                if (categoryId) {
                    window.location.href = "product?cid=" + categoryId;
                }
            }
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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.0.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/colors.js"></script>
        <script src="${pageContext.request.contextPath}/js/slicknav.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/owl-carousel.js"></script>
        <script src="${pageContext.request.contextPath}/js/magnific-popup.js"></script>
        <script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/finalcountdown.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/nicesellect.js"></script>
        <script src="${pageContext.request.contextPath}/js/flex-slider.js"></script>
        <script src="${pageContext.request.contextPath}/js/scrollup.js"></script>
        <script src="${pageContext.request.contextPath}/js/onepage-nav.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/easing.js"></script>
        <script src="${pageContext.request.contextPath}/js/active.js"></script>
    </body>
</html>