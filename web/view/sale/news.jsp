<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ tin tức</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
        <!-- Eshop StyleSheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <style>
            /* Existing styles */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }
            .category-section {
                margin-bottom: 40px;
            }
            .category-section h2 {
                margin-bottom: 20px;
                font-size: 1.5rem;
                color: #333;
            }
            .news-grid {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
            }
            .news-item {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
                display: flex;
            }
            .news-item:hover {
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            }
            .news-img {
                flex: 1;
            }
            .news-img img {
                width: 100%;
                height: 190px;
                border-radius: 10px 0 0 10px;
            }
            .news-content {
                flex: 1;
                padding: 10px;
                margin-top: 10px
            }
            .news-content p {
                font-size: 1.2rem;
                margin: 0 0 10px 0;
                color: #333;
                transition: color 0.3s;
            }
            .news-content p:hover {
                color: red;
            }
            .news-date {
                color: #888;
                font-size: 0.9rem;
            }
            .view-all-link {
                display: inline-block;
                margin-top: 10px;
                color: #007bff;
                text-decoration: none;
                font-weight: bold;
            }
            .view-all-link:hover {
                text-decoration: underline;
            }
        </style>

    </head>
    <body>
        <header class="header shop">
            <!-- End Topbar -->
            <div class="middle-inner" style="padding: 0">
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
        </header>

        <div class="container" style="margin-top: 120px">
            <h2 style="text-align: center; font-weight: normal">Tin tức</h2>
            <div class="tab-content" id="myTabContent" style="margin-top: 30px">
                
                <!-- Start Single Tab -->
                <div class="tab-pane fade show active" id="apple" role="tabpanel">
                    <div class="tab-single">
                        <c:forEach var="category" items="${requestScope.type}">
                            <div class="category-section">
                                <h2 style="font-weight: normal">${category.type}</h2>
                                <div class="news-grid">
                                    <c:forEach var="blog" items="${category.news}" varStatus="status">
                                        <c:if test="${status.index < 4}">
                                            <div class="news-item">
                                                <div class="news-img">
                                                    <a href="${pageContext.request.contextPath}/homenews?blogId=${blog.id}">
                                                        <img class="default-img" src="./images/${blog.image}" alt="${blog.image}">
                                                    </a>
                                                </div>
                                                <div class="news-content">
                                                    <a href="${pageContext.request.contextPath}/homenews?blogId=${blog.id}">
                                                        <p>${blog.title}</p>
                                                    </a>
                                                    <div class="news-date">
                                                        <span style="margin: 0">
                                                            <i class="fas fa-calendar-alt" style="margin-right: 8px;"></i> 
                                                            ${blog.createdDate}
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <div style="color: blue; text-align: center">
                                    <a href="${pageContext.request.contextPath}/homenews?categoryId=${category.id}" class="view-all-link">
                                        <span style="font-weight: normal">Xem tất cả ${category.type}</span>
                                    </a>
                                </div>

                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!--/ End Single Tab -->
            </div>
        </div>

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
