<%-- 
    Document   : viewprofile
    Created on : May 29, 2024, 11:06:51 PM
    Author     : Hoang
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="util.DateFormat" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <style>

            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8
            }

            .profile-button {
                color: #fff;
                background: #000;
                box-shadow: none;
                border: none
            }

            .profile-button:hover {
                background: #682773
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none
            }

            .back:hover {
                color: #682773;
                cursor: pointer
            }

            .labels {
                font-size: 15px
            }

            .add-experience:hover {
                background: #BA68C8;
                color: #fff;
                cursor: pointer;
                border: solid 1px #BA68C8
            }
        </style>
    </head>
    <header class="header shop">
        <div class="middle-inner">
            <div class="container" >
                <div class="row">
                    <div class="col-lg-10 col-md-2 col-12">
                        <!-- Logo -->
                        <div class="logo">
                            <a href="${pageContext.request.contextPath}/home">
                                <img src="${pageContext.request.contextPath}/images/logo.png" alt="logo">
                            </a>
                        </div>
                        <!--/ End Logo -->
                    </div>
                    <div class="col-lg-2 col-md-3 col-12">
                        <div class="right-bar">
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
        <!-- Breadcrumbs -->
        <div class="breadcrumbs">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="bread-inner">
                            <ul class="bread-list">
                                <li><a href="${pageContext.request.contextPath}/home">Trang chủ<i class="ti-arrow-right"></i></a></li>
                                <li class="active"><a href="${pageContext.request.contextPath}/viewprofile">Hồ sơ</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->
    </header>
    <body class="body">
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                        <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                        <span class="font-weight-bold">${user.name}</span>
                        <span class="text-black-50">${user.email}</span>
                        <span> </span>
                        <a class="btn  mt-3" href="orderhistory">Lịch sử mua hàng</a>

                    </div>
                </div>
                <div class="col-md-5 border-right">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <h4 class="text-right">Tài khoản của bạn</h4>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label class="labels">Họ và tên</label>
                                <input type="text" class="form-control" placeholder="Họ và tên: Chưa cập nhật" 
                                       value="${user.name}" disabled></div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label class="labels">Ngày sinh</label>
                                <input type="text" class="form-control" placeholder="Ngày sinh: Chưa cập nhật" 
                                       value="<fmt:formatDate pattern="d-M-y" value="${user.dob}"/>" disabled>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label class="labels">Giới tính</label>
                                <input type="text" class="form-control" placeholder="Giới tính: Chưa cập nhật" 
                                       value="<c:if test="${user.gender eq 'Other'}">Khác</c:if><c:if test="${user.gender eq 'Male'}">Nam</c:if><c:if test="${user.gender eq 'Female'}">Nữ</c:if>" 
                                       disabled>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Gmail</label>
                                    <input type="text" class="form-control" placeholder="Gmail: Chưa cập nhật" 
                                           value="${user.email}" disabled>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label class="labels">Địa chỉ</label>
                                <input type="text" class="form-control" placeholder="Địa chỉ: Chưa cập nhật" 
                                       value="${user.address}" disabled>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label class="labels">Số điện thoại</label>
                                <input type="text" class="form-control" placeholder="Số điện thoại: Chưa cập nhật" 
                                       value="${user.phone}" disabled>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 mt-5 text-center">
                        <a href="updateprofile" class="btn btn-primary profile-button" style="color: white;" >Chỉnh sửa thông tin</a>
                        <a href="change" class="btn btn-primary profile-button" style="color: white;" >Đổi mật khẩu</a>
                    </div>
                </div>
            </div>
            <!--                <div class="col-md-4">
                                <div class="p-3 py-5">
                                    <div class="d-flex justify-content-between align-items-center experience"><span>Edit Experience</span><span class="border px-3 p-1 add-experience"><i class="fa fa-plus"></i>&nbsp;Experience</span></div><br>
                                    <div class="col-md-12"><label class="labels">Experience in Designing</label><input type="text" class="form-control" placeholder="experience" value=""></div> <br>
                                    <div class="col-md-12"><label class="labels">Additional Details</label><input type="text" class="form-control" placeholder="additional details" value=""></div>
                                </div>
                            </div>-->
        </div>
    </div>
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
