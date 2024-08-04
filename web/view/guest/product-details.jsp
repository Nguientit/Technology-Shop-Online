<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <!-- Meta Tag -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name='copyright' content=''>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Title Tag  -->
        <title>Tech Haven</title>
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
        <!-- Web Font -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

        <!-- StyleSheet -->
        <!-- Bootstrap Icons -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.fancybox.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themify-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/niceselect.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flex-slider.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl-carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

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
            .rating {
                display: flex;
                align-items: center;
            }
            .rating-detail {
                margin-left: 10px;
            }
        </style>
    </head>
    <body class="js" onload="initializePage()">
        <!-- Header -->
        <header class="header shop">
            <div class="middle-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-12">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/images/logo.png" alt="logo"></a>
                            </div>
                            <!--/ End Logo -->
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

                                </div>

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
                                            <li><a href="${pageContext.request.contextPath}/home">Trang chủ<i class="ti-arrow-right"></i></a></li>
                                            <li><a href="${pageContext.request.contextPath}/product">Sản phẩm<i class="ti-arrow-right"></i></a></li>
                                            <li class="active"><a href="#">${productDetail.product.name}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Breadcrumbs -->
                    <!-- Start Item Details -->
                    <section class="item-details section">
                        <div class="container">
                            <div class="top-area">
                                <div class="row align-items-center">
                                    <div class="col-lg-6 col-md-12 col-12">
                                        <div class="product-images">
                                            <main id="gallery">
                                                <div class="main-img">
                                                    <img src="${pageContext.request.contextPath}/images/${productDetails[0].productDetail.image[0]}" id="current" alt="#">
                                                </div>
                                                <div class="images">
                                                    <c:forEach items="${productDetails[0].productDetail.image}" var="image">
                                                        <img src="${pageContext.request.contextPath}/images/${image}" class="img" alt="#" onclick="changeMainImage('${pageContext.request.contextPath}/images/${image}')">
                                                    </c:forEach>
                                                </div>
                                            </main>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-12 col-12">
                                        <div class="product-info">
                                            <h2 class="title" id="product-name">${productDetails[0].productDetail.name}</h2>
                                            <div class="rating">
                                                <c:forEach var="i" begin="1" end="5">
                                                    <c:choose>
                                                        <c:when test="${i <= averageRating}">
                                                            <i class="bi bi-star-fill" style="color: rgb(255, 191, 0);;"></i>
                                                        </c:when>
                                                        <c:when test="${i - 0.5 <= averageRating}">
                                                            <i class="bi bi-star-half" style="color: rgb(255, 191, 0);;"></i>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="bi bi-star" style="color: rgb(255, 191, 0);;"></i>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                                <div class="rating-detail">
                                                    <a href="#">${totalRatings} đánh giá</a>
                                                </div>
                                            </div>
                                            <br/>
                                            <div class="product-price" id="product-price">
                                                <p class="product-price-show" id="product-price-show">
                                                    <currency:formatCurrency value="${productDetails[0].discountPrice}" />
                                                </p>
                                                <p class="product-price-through" id="product-price-through">
                                                    <currency:formatCurrency value="${productDetails[0].productDetail.originalPrice}" />
                                                </p>
                                            </div>
                                            <div class="product-options">
                                                <div class="product-storage-options">
                                                    <h3>Dung lượng</h3>
                                                    <div class="storage-options">
                                                        <c:forEach items="${allCriteria}" var="criteria">
                                                            <button class="storage-option" data-criteria="${criteria}" onclick="selectCriteria('${criteria}', '${productDetail.product.id}')">
                                                                ${criteria}
                                                            </button>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <div class="product-color-options">
                                                    <h3>Chọn màu để xem giá</h3>
                                                    <div class="color-options">
                                                        <c:forEach items="${productDetails}" var="detailDTO">
                                                            <div class="color-option" data-color="${detailDTO.productDetail.color}" data-pdid="${detailDTO.productDetail.id}" data-criteria="${detailDTO.productDetail.criteria}" onclick="selectColor('${detailDTO.productDetail.color}', '${detailDTO.productDetail.product.id}', '${detailDTO.productDetail.criteria}', '${detailDTO.productDetail.id}')">
                                                                <div class="color-option-content">
                                                                    <img src="${pageContext.request.contextPath}/images/${detailDTO.productDetail.image[0]}" alt="${detailDTO.productDetail.color}" />
                                                                    <div class="color-option-info">
                                                                        <p>${detailDTO.productDetail.color}</p>
                                                                        <p class="price">
                                                                            <currency:formatCurrency value="${detailDTO.discountPrice}" />
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="product-actions">
                                                <div class="button cart-button">
                                                    <c:choose>
                                                        <c:when test="${param.isUpdate == 'true'}">
                                                            <input type="hidden" id="newProductDetailId" value="${productDetails[0].productDetail.id}" />
                                                            <input type="hidden" id="newColor" value="${productDetails[0].productDetail.color}" />
                                                            <input type="hidden" id="newCriteria" value="${productDetails[0].productDetail.criteria}" />
                                                            <input type="hidden" id="oldProductDetailId" value="${param.oldProductDetailId}" />
                                                            <input type="hidden" id="oldProductCriteria" value="${param.pdcriteria}" />
                                                            <input type="hidden" id="isUpdate" value="${param.isUpdate}" />
                                                            <button class="btn" style="width: 100%;" onclick="updateCart(${productDetails[0].productDetail.product.id}, ${param.updatecartitemid})">
                                                                Cập nhật
                                                            </button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${user eq null}">
                                                                <a style="width: 100%;">
                                                                    <button class="btn" id="loginModalbutton">Thêm vào giỏ hàng</button>
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${user ne null}">
                                                                <a class="add-to-cart"  style="width: 100%;"onclick="addToCart(${productDetails[0].productDetail.product.id}, ${productDetails[0].productDetail.id}, 1)">
                                                                    <button class="btn" >Thêm vào giỏ hàng</button>
                                                                </a>
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="product-details-info">
                                <div class="single-block">
                                    <div class="row">
                                        <div class="col-lg-6 col-12">
                                            <div class="info-body custom-responsive-margin">
                                                <h4>Chi tiết</h4>
                                                <p>iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.</p>
                                                <h4>Đặc điểm nổi bật</h4>
                                                <ul class="features">
                                                    <li>Thiết kế khung viền từ titan chuẩn hàng không vũ trụ - Cực nhẹ, bền cùng viền cạnh mỏng cầm nắm thoải mái</li>
                                                    <li>Hiệu năng Pro chiến game thả ga - Chip A17 Pro mang lại hiệu năng đồ họa vô cùng sống động và chân thực</li>
                                                    <li>Thoả sức sáng tạo và quay phim chuyên nghiệp - Cụm 3 camera sau đến 48MP và nhiều chế độ tiên tiến</li>
                                                    <li>Nút tác vụ mới giúp nhanh chóng kích hoạt tính năng yêu thích của bạn</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="info-body">
                                                <h4>Thông số kỹ thuật</h4>
                                                <ul class="features">
                                                    <li><span>Kích thước màn hình: </span> 6.7 inches</li>
                                                    <li><span>Công nghệ màn hình:</span> Super Retina XDR OLED</li>
                                                    <li><span>Camera sau: </span> Camera chính: 48MP, 24 mm, ƒ/1.78
                                                                                    Camera góc siêu rộng: 12 MP, 13 mm, ƒ/2.2
                                                                                    SCamera Tele: 12 MP</li>
                                                    <li><span>Camera trước: </span> 12MP, ƒ/1.9</li>
                                                    <li><span>Chipset: </span> Apple A17 Pro 6 nhân</li>
                                                    <li><span>Công nghệ NFC: </span> Có</li>
                                                    <li><span>Dung lượng RAM: </span> 8GB</li>
                                                    <li><span>Bộ nhớ trong: </span> 256 GB</li>
                                                    <li><span>Dung lượng RAM: </span> 8GB</li>
                                                    <li><span>Pin: </span> 4422 mAh</li>
                                                    <li><span>Thẻ SIM: </span> 2 SIM (nano‑SIM và eSIM)</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="product-details-info">
                                <div class="single-block">
                                    <div class="row">
                                        <div class="rating-header">
                                            <h5>Đánh giá & nhận xét ${productDetails[0].productDetail.name}</h5>
                                        </div>
                                        <div class="col-lg-5 col-12" style="border-right: 1px solid #e5e7eb;">
                                            <div class="rating-container">
                                                <div class="rating-score">
                                                    <fmt:formatNumber value="${averageRating}" type="number" maxFractionDigits="1" />/5
                                                </div>                                                
                                                <div class="rating-stars">
                                                    <c:forEach var="i" begin="1" end="5">
                                                        <c:choose>
                                                            <c:when test="${i <= averageRating}">
                                                                <i class="bi bi-star-fill" style="color: rgb(255, 191, 0);;"></i>
                                                            </c:when>
                                                            <c:when test="${i - 0.5 <= averageRating}">
                                                                <i class="bi bi-star-half" style="color: rgb(255, 191, 0);;"></i>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <i class="bi bi-star" style="color: rgb(255, 191, 0);;"></i>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </div>
                                                <div class="rating-details">
                                                    <a href="#">${totalRatings} đánh giá</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-7 col-12">
                                            <div class="rating-bar-container">
                                                <div class="rating-bar">
                                                    <div>5 <i class="bi bi-star-fill"></i></div>
                                                    <div class="progress">
                                                        <div style="width: ${starPercentages[4]}%"></div>
                                                    </div>
                                                    <span>${starCounts[4]} đánh giá</span>
                                                </div>
                                                <div class="rating-bar">
                                                    <div>4 <i class="bi bi-star-fill"></i></div>
                                                    <div class="progress">
                                                        <div style="width: ${starPercentages[3]}%"></div>
                                                    </div>
                                                    <span>${starCounts[3]} đánh giá</span>
                                                </div>
                                                <div class="rating-bar">
                                                    <div>3 <i class="bi bi-star-fill"></i></div>
                                                    <div class="progress">
                                                        <div style="width: ${starPercentages[2]}%"></div>
                                                    </div>
                                                    <span>${starCounts[2]} đánh giá</span>
                                                </div>
                                                <div class="rating-bar">
                                                    <div>2 <i class="bi bi-star-fill"></i></div>
                                                    <div class="progress">
                                                        <div style="width: ${starPercentages[1]}%"></div>
                                                    </div>
                                                    <span>${starCounts[1]} đánh giá</span>
                                                </div>
                                                <div class="rating-bar">
                                                    <div>1 <i class="bi bi-star-fill"></i></div>
                                                    <div class="progress">
                                                        <div style="width: ${starPercentages[0]}%"></div>
                                                    </div>
                                                    <span>${starCounts[0]} đánh giá</span>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="review-container">
                                        <hr/>
                                        <div class="review-button">
                                            <p>Bạn đánh giá sao về sản phẩm này?</p>
                                            <div class="has-text-centered">
                                                <c:if test="${user eq null}">
                                                    <button id="loginModalBtn">Đánh giá ngay</button>
                                                </c:if>
                                                <c:if test="${user ne null}">
                                                    <button id="reviewBtn" >Đánh giá ngay</button>
                                                </c:if>
                                            </div>
                                        </div>
                                        <hr/>
                                        <h5>Lọc theo</h5>
                                        <div class="filter-container">
                                            <div class="filter-buttons">
                                                <button class="filter-button active" id="filter-all" onclick="setFilter('all')">Tất cả</button>
                                            </div>
                                            <div class="filter-stars">
                                                <button class="filter-star-button" data-rating="5" onclick="setStarFilter(5)">5 <i class="bi bi-star-fill"></i></button>
                                                <button class="filter-star-button" data-rating="4" onclick="setStarFilter(4)">4 <i class="bi bi-star-fill"></i></button>
                                                <button class="filter-star-button" data-rating="3" onclick="setStarFilter(3)">3 <i class="bi bi-star-fill"></i></button>
                                                <button class="filter-star-button" data-rating="2" onclick="setStarFilter(2)">2 <i class="bi bi-star-fill"></i></button>
                                                <button class="filter-star-button" data-rating="1" onclick="setStarFilter(1)">1 <i class="bi bi-star-fill"></i></button>
                                            </div>
                                        </div>
                                        <div>
                                            <br/>
                                            <ul class="review-list" id="review-list">
                                                <!-- Feedback items will be rendered here by JSP -->
                                                <c:forEach var="feedback" items="${feedbacks}">
                                                    <li class="review-item" data-rate="${feedback.rate}" data-has-image="${not empty feedback.img}">
                                                        <div class="review-header">
                                                            <img src="images/user.webp" alt="User Avatar" class="user-avatar">
                                                            <div class="user-info">
                                                                <strong>${feedback.account.user.name}</strong> 
                                                                <span><i class="bi bi-clock"></i> ${feedback.rateTime}</span>
                                                            </div>
                                                        </div>
                                                        <div class="review-box">
                                                            <div class="review-rating">
                                                                <span class="rating-stars">
                                                                    <c:forEach var="i" begin="1" end="${feedback.rate}">
                                                                        <i class="bi bi-star-fill" style="color: rgb(255, 191, 0);;"></i>
                                                                    </c:forEach>
                                                                </span>
                                                            </div>
                                                            <div class="review-content">${feedback.content}</div>
                                                            <c:if test="${not empty feedback.img}">
                                                                <div class="feedback-images">
                                                                    <c:forEach var="img" items="${feedback.img}">
                                                                        <a href="images/${img}" class="spotlight"><img src="images/${img}" alt="feedback image" class="feedback-image"></a>
                                                                        </c:forEach>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
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

                            <div id="loginModall" class="modal" style="display: none;">
                                <div class="modal-login">
                                    <div class="title is-flex is-justify-content-center is-align-items-center">
                                        <span>TechHaven</span>
                                        <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:80/q:90/plain/https://cellphones.com.vn/media/wysiwyg/chibi2.png" height="80" alt="cps-smember-icon">
                                    </div>
                                    <div class="text">
                                        <p>Vui lòng đăng nhập tài khoản TechHaven để thêm những sản phẩm yêu thích vào giỏ hàng.</p>
                                    </div>
                                    <div class="group-login-btn">
                                        <a href="${pageContext.request.contextPath}/register" class="register-btn">Đăng ký</a>
                                        <a href="${pageContext.request.contextPath}/login" class="login-btn">Đăng nhập</a>
                                    </div>
                                </div>
                            </div>

                            <div id="loginModal" class="modal" style="display: none;">
                                <div class="modal-login">
                                    <div class="title is-flex is-justify-content-center is-align-items-center">
                                        <span>TechHaven</span>
                                        <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:80/q:90/plain/https://cellphones.com.vn/media/wysiwyg/chibi2.png" height="80" alt="cps-smember-icon">
                                    </div>
                                    <div class="text">
                                        <p>Vui lòng đăng nhập tài khoản TechHaven để đánh giá.</p>
                                    </div>
                                    <div class="group-login-btn">
                                        <a href="${pageContext.request.contextPath}/register" class="register-btn">Đăng ký</a>
                                        <a href="${pageContext.request.contextPath}/login" class="login-btn">Đăng nhập</a>
                                    </div>
                                </div>
                            </div>



                            <!--modal đánh giá-->
                            <div id="reviewModal" class="modal">
                                <!-- Modal content -->
                                <div class="modal-content">
                                    <span class="close">&times;</span>
                                    <div class="title is-6 mb-0 px-4">Đánh giá &amp; nhận xét</div>
                                    <div class="modal-review-title is-flex is-align-items-center px-4">
                                        <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:100:100/q:90/plain/https://cellphones.com.vn/media/wysiwyg/cps-ant.png" width="100" height="100"> 
                                        <p class="title-logged">${productDetails[0].productDetail.name}</p>
                                    </div>
                                    <form id="feedbackForm" enctype="multipart/form-data" method="POST" action="/feedback" class="modal-review-content p-4">
                                        <input type="hidden" name="pid" value="${productDetail.product.id}">
                                        <input type="hidden" name="aid" value="${sessionScope.user.account.id}">
                                        <input type="hidden" name="rate" id="rate" value="">                                        
                                        <div class="title-review-star-items">Đánh giá chung</div>
                                        <div class="modal-review-star is-flex is-justify-content-space-between my-3 review-all">
                                            <div class="star-all is-flex is-justify-content-space-evenly">
                                                <div class="modal__button has-text-centered star" data-value="1">
                                                    <div class="icon" style="cursor: pointer;">
                                                        <i class="bi bi-star-fill"></i>
                                                    </div>
                                                    <p>Rất Tệ</p>
                                                </div>
                                                <div class="modal__button has-text-centered star" data-value="2">
                                                    <div class="icon" style="cursor: pointer;">
                                                        <i class="bi bi-star-fill"></i>
                                                    </div>
                                                    <p>Tệ</p>
                                                </div>
                                                <div class="modal__button has-text-centered star" data-value="3">
                                                    <div class="icon" style="cursor: pointer;">
                                                        <i class="bi bi-star-fill"></i>
                                                    </div>
                                                    <p>Bình thường</p>
                                                </div>
                                                <div class="modal__button has-text-centered star" data-value="4">
                                                    <div class="icon" style="cursor: pointer;">
                                                        <i class="bi bi-star-fill"></i>
                                                    </div>
                                                    <p>Tốt</p>
                                                </div>
                                                <div class="modal__button has-text-centered star" data-value="5">
                                                    <div class="icon" style="cursor: pointer;">
                                                        <i class="bi bi-star-fill"></i>
                                                    </div>
                                                    <p>Tuyệt vời</p>
                                                </div>
                                            </div>
                                        </div>
                                        <textarea id="content" name="content" placeholder="Xin mời chia sẻ một số cảm nhận về sản phẩm (nhập tối thiểu 15 kí tự)" class="textarea" required></textarea>
                                        <div class="group-input is-flex">
                                            <input multiple id="img" name="currentImages" accept="image/x-png,image/gif,image/jpeg" type="file" class="is-hidden modal__button">
                                            <label for="img" class="btn-add modal__button my-2 is-flex is-flex-direction-column is-align-items-center add-image-label">
                                                <div class="input-icon">
                                                    <i class="bi bi-upload"></i>
                                                </div>
                                                Thêm hình ảnh
                                            </label>
                                            <div id="previewContainer" style="display: flex; gap: 10px; flex-wrap: wrap; margin-top: 10px;"></div>
                                        </div>
                                        <div class="clear__review"></div>
                                        <div class="button-container">
                                            <button type="submit" class="button modal__button has-text-white">GỬI ĐÁNH GIÁ</button>
                                        </div>
                                    </form>

                                </div>
                            </div>

                    </section>       
                </div>
                </section>
                <!-- End Item Details -->
                <footer class="footer">
                    <!-- Footer Top -->
                    <div class="footer-top section">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-5 col-md-6 col-12">
                                    <!-- Single Widget -->
                                    <div class="single-footer about">
                                        <div class="logo">
                                            <a href="home"><img src="${pageContext.request.contextPath}/images/logo2.png" alt="#"></a>
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
                                            <img src="${pageContext.request.contextPath}/images/payments.png" alt="#">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>

                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

                <script>
                                                    var filterParams = {
                                                        hasImage: false,
                                                        minRating: null
                                                    };
                                                    function setFilter(filter) {
                                                        var url = new URL(window.location.href);
                                                        if (filter === 'all') {
                                                            url.searchParams.delete('hasImage');
                                                        } else if (filter === 'hasImage') {
                                                            url.searchParams.set('hasImage', 'true');
                                                        }
                                                        window.location.href = url.toString();
                                                    }

                                                    function setStarFilter(rating) {
                                                        filterParams.minRating = rating;
                                                        document.querySelectorAll('.filter-star-button').forEach(btn => btn.classList.remove('active'));
                                                        var starButton = document.querySelector('.filter-star-button[data-rating="' + rating + '"]');
                                                        if (starButton) {
                                                            starButton.classList.add('active');
                                                        }
                                                        applyFilters();
                                                    }

                                                    function applyFilters() {
                                                        var reviewItems = document.querySelectorAll('.review-item');
                                                        console.log('Applying filters with params:', filterParams);
                                                        reviewItems.forEach(function (item) {
                                                            var itemRating = parseInt(item.getAttribute('data-rate'));
                                                            var itemHasImage = item.getAttribute('data-has-image') === 'true';
                                                            console.log('Item rating:', itemRating, 'Item has image:', itemHasImage);
                                                            var showItem = true;
                                                            if (filterParams.hasImage && !itemHasImage) {
                                                                showItem = false;
                                                            }

                                                            if (filterParams.minRating !== null && itemRating !== filterParams.minRating) {
                                                                showItem = false;
                                                            }

                                                            if (showItem) {
                                                                item.style.display = 'block';
                                                            } else {
                                                                item.style.display = 'none';
                                                            }
                                                        });
                                                    }

                                                    document.addEventListener('DOMContentLoaded', function () {
                                                        // Initialize the filters to apply any default settings
                                                        applyFilters();
                                                    });
                                                    document.addEventListener('DOMContentLoaded', function () {
                                                        const stars = document.querySelectorAll('.modal__button.star');
                                                        let rating = 0;
                                                        stars.forEach(star => {
                                                            star.addEventListener('mouseover', function () {
                                                                resetStars();
                                                                const value = this.getAttribute('data-value');
                                                                highlightStars(value);
                                                            });
                                                            star.addEventListener('mouseout', function () {
                                                                resetStars();
                                                                if (rating > 0) {
                                                                    highlightStars(rating);
                                                                }
                                                            });
                                                            star.addEventListener('click', function () {
                                                                rating = this.getAttribute('data-value');
                                                                document.getElementById('rate').value = rating; // Assumes there's an input with id="rate" to store the rating
                                                            });
                                                        });
                                                        function highlightStars(value) {
                                                            stars.forEach(star => {
                                                                if (star.getAttribute('data-value') <= value) {
                                                                    star.querySelector('i').style.color = '#ffbf00';
                                                                }
                                                            });
                                                        }

                                                        function resetStars() {
                                                            stars.forEach(star => {
                                                                star.querySelector('i').style.color = '';
                                                            });
                                                        }

                                                        // Preview multiple images when selected
                                                        document.getElementById('img').addEventListener('change', function (event) {
                                                            var input = event.target;
                                                            var previewContainer = document.getElementById('previewContainer');
                                                            previewContainer.innerHTML = ""; // Clear existing previews

                                                            Array.from(input.files).forEach(file => {
                                                                var reader = new FileReader();
                                                                reader.onload = function () {
                                                                    var dataURL = reader.result;
                                                                    var previewDiv = document.createElement('div');
                                                                    previewDiv.style.position = 'relative';
                                                                    previewDiv.style.maxWidth = '100px';
                                                                    var img = document.createElement('img');
                                                                    img.src = dataURL;
                                                                    img.style.maxWidth = '100%';
                                                                    previewDiv.appendChild(img);
                                                                    var removeButton = document.createElement('button');
                                                                    removeButton.type = 'button';
                                                                    removeButton.innerHTML = '<i class="bi bi-x-circle"></i>';
                                                                    removeButton.style.position = 'absolute';
                                                                    removeButton.style.top = '0';
                                                                    removeButton.style.right = '0';
                                                                    removeButton.style.background = 'transparent';
                                                                    removeButton.style.border = 'none';
                                                                    removeButton.addEventListener('click', function () {
                                                                        previewDiv.remove();
                                                                    });
                                                                    previewDiv.appendChild(removeButton);
                                                                    previewContainer.appendChild(previewDiv);
                                                                };
                                                                reader.readAsDataURL(file);
                                                            });
                                                        });
                                                    });
                                                    document.addEventListener('DOMContentLoaded', function () {
                                                        var loginModal = document.getElementById('loginModal');
                                                        var loginModall = document.getElementById('loginModall');
                                                        var reviewModalElement = document.getElementById("reviewModal");
                                                        var reviewBtn = document.getElementById("reviewBtn");
                                                        var loginModalBtn = document.getElementById("loginModalBtn");
                                                        var loginModalbutton = document.getElementById("loginModalbutton");
                                                        var loginModalCart = document.getElementById('loginModal-cart');
                                                        var loginModalbuttoncart = document.getElementById('loginModalbuttoncart');
                                                        var closeButtons = document.getElementsByClassName("close");

                                                        if (loginModalbuttoncart) {
                                                            loginModalbuttoncart.onclick = function () {
                                                                loginModalCart.style.display = "block";
                                                            };
                                                        }

                                                        if (loginModalbutton) {
                                                            loginModalbutton.onclick = function () {
                                                                loginModall.style.display = "block";
                                                            };
                                                        }

                                                        if (loginModalBtn) {
                                                            loginModalBtn.onclick = function () {
                                                                loginModal.style.display = "block";
                                                            };
                                                        }

                                                        if (reviewBtn) {
                                                            reviewBtn.onclick = function () {
                                                                reviewModalElement.style.display = "block";
                                                            };
                                                        }

                                                        for (var i = 0; i < closeButtons.length; i++) {
                                                            closeButtons[i].onclick = function () {
                                                                this.closest('.modal').style.display = 'none';
                                                            };
                                                        }

                                                        window.onclick = function (event) {
                                                            if (event.target == reviewModalElement) {
                                                                reviewModalElement.style.display = "none";
                                                            } else if (event.target == loginModal) {
                                                                loginModal.style.display = "none";
                                                            } else if (event.target == loginModall) {
                                                                loginModall.style.display = "none";
                                                            } else if (event.target == loginModalCart) {
                                                                loginModalCart.style.display = "none";
                                                            }
                                                        };
                                                    });
                                                    function addFeedback(pid, aid, content, rate, imgs, fratetime) {
                                                        var formData = new FormData();
                                                        formData.append('pid', pid);
                                                        formData.append('aid', aid);
                                                        formData.append('content', content);
                                                        formData.append('rate', rate);
                                                        formData.append('fratetime', fratetime);
                                                        if (imgs) {
                                                            for (var i = 0; i < imgs.length; i++) {
                                                                formData.append('img', imgs[i]);
                                                            }
                                                        }

                                                        $.ajax({
                                                            type: "POST",
                                                            url: "${pageContext.request.contextPath}/feedback",
                                                            data: formData,
                                                            processData: false,
                                                            contentType: false,
                                                            error: function (response) {
                                                                Swal.fire({
                                                                    icon: 'success',
                                                                    title: 'Thành công!',
                                                                    text: 'Đánh giá của bạn đã được gửi!',
                                                                    showConfirmButton: false,
                                                                    timer: 1500
                                                                }).then(() => {
                                                                    location.reload();
                                                                });
                                                            },
                                                            success: function (xhr, status, error) {
                                                                Swal.fire({
                                                                    icon: 'error',
                                                                    title: 'Lỗi!',
                                                                    text: 'Đã xảy ra lỗi khi gửi đánh giá!',
                                                                    showConfirmButton: false,
                                                                    timer: 1500
                                                                });
                                                                console.error(xhr.responseText);
                                                            }
                                                        });
                                                    }

                                                    // Handle form submission
                                                    document.getElementById('feedbackForm').addEventListener('submit', function (event) {
                                                        event.preventDefault();
                                                        const pid = document.querySelector('input[name="pid"]').value;
                                                        const aid = document.querySelector('input[name="aid"]').value;
                                                        const content = document.getElementById('content').value;
                                                        const rate = document.getElementById('rate').value;
                                                        const imgs = document.getElementById('img').files; // Chọn nhiều tệp
                                                        const fratetime = new Date().toISOString(); // Lấy thời gian hiện tại

                                                        // Log the values to the console
                                                        console.log('pid:', pid);
                                                        console.log('aid:', aid);
                                                        console.log('content:', content);
                                                        console.log('rate:', rate);
                                                        console.log('imgs:', imgs);
                                                        console.log('fratetime:', fratetime);
                                                        if (pid && aid && content && rate) {
                                                            addFeedback(pid, aid, content, rate, imgs, fratetime);
                                                        } else {
                                                            Swal.fire({
                                                                icon: 'error',
                                                                title: 'Lỗi!',
                                                                text: 'Vui lòng điền đầy đủ thông tin.',
                                                                showConfirmButton: false,
                                                                timer: 1500
                                                            });
                                                        }
                                                    });
                                                    document.addEventListener("DOMContentLoaded", function () {
                                                        var progressBars = document.querySelectorAll('.progress div');
                                                        progressBars.forEach(function (bar) {
                                                            var value = bar.getAttribute('data-value');
                                                            bar.style.width = value + '%';
                                                        });
                                                    });
                                                    function initializePage() {
                                                        // Select the first criteria and color on page load
                                                        const firstCriteria = $('.storage-option').first().data('criteria');
                                                        const productId = '${productDetail.product.id}';
                                                        if (firstCriteria) {
                                                            selectCriteria(firstCriteria, productId);
                                                        }
                                                    }
                                                    function selectCriteria(criteria, pid) {
                                                        $.getJSON('${pageContext.request.contextPath}/productdetails', {pid: pid, criteria: criteria}, function (data) {
                                                            if (data && data.length > 0) {
                                                                var colors = new Set();
                                                                data.forEach(function (detail) {
                                                                    colors.add(detail.productDetail.color);
                                                                });
                                                                $('.color-options').html('');
                                                                colors.forEach(function (color) {
                                                                    var detail = data.find(d => d.productDetail.color === color);
                                                                    var pdid = detail.productDetail.id;
                                                                    var price = detail.discountPrice;
                                                                    var image = detail.productDetail.image[0];
                                                                    $('.color-options').append(
                                                                            '<div class="color-option" data-color="' + color + '" data-pdid="' + pdid + '" data-criteria="' + criteria + '" onclick="selectColor(\'' + color + '\', \'' + pid + '\', \'' + criteria + '\', \'' + pdid + '\')">' +
                                                                            '<div class="color-option-content">' +
                                                                            '<img src="${pageContext.request.contextPath}/images/' + image + '" alt="' + color + '" />' +
                                                                            '<div class="color-option-info">' +
                                                                            '<p>' + color + '</p>' +
                                                                            '<p class="price">' + formatCurrency(price) + '</p>' +
                                                                            '</div>' +
                                                                            '</div>' +
                                                                            '</div>'
                                                                            );
                                                                });
                                                                // Check if there's an existing product detail to select
                                                                var oldProductDetailId = $('#oldProductDetailId').val();
                                                                var selectedDetail = data.find(d => d.productDetail.id == oldProductDetailId);
                                                                if (selectedDetail) {
                                                                    selectColor(selectedDetail.productDetail.color, pid, criteria, selectedDetail.productDetail.id);
                                                                } else if (data[0]) {
                                                                    selectColor(data[0].productDetail.color, pid, criteria, data[0].productDetail.id);
                                                                }

                                                                $('.storage-option').removeClass('selected');
                                                                $('.storage-option').filter(function () {
                                                                    return $(this).text().trim() === criteria;
                                                                }).addClass('selected');
                                                                // Update URL
                                                                var isUpdate = $('#isUpdate').val();
                                                                var newUrl = `${pageContext.request.contextPath}/productdetails?pid=${pid}&oldProductDetailId=${oldProductDetailId}&pdcriteria=${criteria}&isUpdate=${isUpdate}`;
                                                                                history.replaceState({}, '', newUrl);
                                                                            }
                                                                        });
                                                                    }

                                                                    function selectColor(color, pid, criteria, pdid) {
                                                                        $.getJSON('${pageContext.request.contextPath}/productdetails', {pid: pid, pdid: pdid, color: color, criteria: criteria}, function (data) {
                                                                            if (data) {
                                                                                $('#product-name').text(data.productDetail.name);
                                                                                $('#product-price-show').text(formatCurrency(data.discountPrice));
                                                                                $('#product-price-through').text(formatCurrency(data.productDetail.originalPrice));
                                                                                $('#current').attr('src', '${pageContext.request.contextPath}/images/' + data.productDetail.image[0]);
                                                                                var imagesHtml = '';
                                                                                data.productDetail.image.forEach(function (image) {
                                                                                    imagesHtml += '<img src="${pageContext.request.contextPath}/images/' + image + '" class="img" alt="#" onclick="changeMainImage(\'${pageContext.request.contextPath}/images/' + image + '\')">';
                                                                                });
                                                                                $('.images').html(imagesHtml);
                                                                                // Update URL with pdid and criteria
                                                                                var newUrl = '${pageContext.request.contextPath}/productdetails?pid=' + pid + '&pdid=' + pdid + '&pdcriteria=' + criteria;
                                                                                history.replaceState({}, '', newUrl);
                                                                                // Update the "Add to Cart" button with pdid
                                                                                $('.add-to-cart').attr('onclick', 'addToCart(' + pid + ', ' + pdid + ', 1)');
                                                                            }
                                                                        });
                                                                        $('.color-option').removeClass('selected');
                                                                        $('.color-option[data-color="' + color + '"]').addClass('selected');
                                                                    }

                                                                    function formatCurrency(value) {
                                                                        return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(value);
                                                                    }

                                                                    function changeMainImage(imageSrc) {
                                                                        $('#current').attr('src', imageSrc);
                                                                    }

                                                                    function addToCart(productId, productDetailId, productCriteria, quantity = 1) {
                                                                        $.ajax({
                                                                            type: "POST",
                                                                            url: "${pageContext.request.contextPath}/addtocart",
                                                                            data: {
                                                                                productId: productId,
                                                                                productDetailId: productDetailId,
                                                                                productCriteria: productCriteria,
                                                                                quantity: quantity
                                                                            },
                                                                            success: function (response) {
                                                                                Swal.fire({
                                                                                    icon: 'success',
                                                                                    title: 'Thành công!',
                                                                                    text: 'Sản phẩm đã được thêm vào giỏ hàng!',
                                                                                    showConfirmButton: false,
                                                                                    timer: 1500
                                                                                }).then(() => {
                                                                                    location.reload();
                                                                                });
                                                                            },
                                                                            error: function (xhr, status, error) {
                                                                                Swal.fire({
                                                                                    icon: 'error',
                                                                                    title: 'Lỗi!',
                                                                                    text: 'Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng!',
                                                                                    showConfirmButton: false,
                                                                                    timer: 1500
                                                                                });
                                                                                console.error(xhr.responseText);
                                                                            }
                                                                        });
                                                                    }

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

                                                                    function updateCart(pid, pdid) {
                                                                        var newColor = $('.color-option.selected').data('color');
                                                                        var newCriteria = $('.storage-option.selected').data('criteria');
                                                                        var newProductDetailId = $('.color-option.selected').data('pdid');
                                                                        var oldProductDetailId = $('#oldProductDetailId').val();
                                                                        $.ajax({
                                                                            url: '${pageContext.request.contextPath}/updatecart',
                                                                            type: 'POST',
                                                                            data: {
                                                                                productId: pid,
                                                                                oldProductDetailId: oldProductDetailId,
                                                                                newProductDetailId: newProductDetailId,
                                                                                newColor: newColor,
                                                                                newCriteria: newCriteria
                                                                            },
                                                                            success: function (response) {
                                                                                Swal.fire({
                                                                                    icon: 'success',
                                                                                    title: 'Thành công!',
                                                                                    text: 'Cập nhật giỏ hàng thành công!',
                                                                                    showConfirmButton: false,
                                                                                    timer: 1500
                                                                                }).then(() => {
                                                                                    window.location.href = '${pageContext.request.contextPath}/cart';
                                                                                });
                                                                            },
                                                                            error: function () {
                                                                                Swal.fire({
                                                                                    icon: 'error',
                                                                                    title: 'Lỗi!',
                                                                                    text: 'Có lỗi xảy ra, vui lòng thử lại.',
                                                                                    showConfirmButton: false,
                                                                                    timer: 1500
                                                                                });
                                                                            }
                                                                        });
                                                                    }
                </script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
                <script src="${pageContext.request.contextPath}/js/main.js"></script>
                <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                </body>
                </html>