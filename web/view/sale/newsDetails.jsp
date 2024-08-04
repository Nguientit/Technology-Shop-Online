
<%-- 
    Document   : homeSale
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
        <!-- Title Tag  -->
        <title>Tech Haven</title>
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
        <!-- Eshop StyleSheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />


    </head>
    <body class="js">
        <header class="header shop">
            <!-- End Topbar -->
            <div class="middle-inner">
                <div class="container" >
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-12">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="home"><img src="${pageContext.request.contextPath}/images/logo.png" alt="logo"></a>
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

                        <div class="col-lg-10 col-md-10 col-12">
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

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Laptop product-->
            <div class="product-area section">
                <div class="container">
                    <div class="row" >
                        <%@include file="menuSale.jsp" %>
                        <div class="col-9" style="margin-top: 70px">
                            <div class="product-info" style="padding: 0">
                                <div class="tab-content" id="myTabContent">
                                    <!-- Start Single Tab -->
                                    <div class="tab-pane fade show active" id="apple" role="tabpanel">
                                        <div class="tab-single">
                                            <div class="row" >
                                                <c:if test="${not empty blogId}">
                                                    <div>${blogId.title}</div>
                                                    <img src="./images/${blogId.image}" alt="${blogId.title}" style="width: 100%; height: 315px; border-radius: 10px;">
                                                    <div style="border: 1px solid cadetblue ; border-radius: 10px; padding: 10px; margin-top: 20px">
                                                        <h3>${blogId.title}</h3>
                                                        <p style="margin-bottom: 25px">${blogId.createdDate}</p>
                                                        <div>
                                                            <div>${blogId.content}</div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/ End Single Tab -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>


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
                                    <a href="index.jsp"><img src="${pageContext.request.contextPath}/images/logo2.png" alt="#"></a>
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
                                    <img src="${pageContext.request.contextPath}/images/payments.png" alt="#">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>


    </body>
</html>