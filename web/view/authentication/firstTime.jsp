<%-- 
    Document   : login
    Created on : May 20, 2024, 7:28:04 AM
    Author     : Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                    <select>
                                        <option selected="selected">Danh mục</option>
                                        <c:forEach items="${listC}" var="o">
                                            <option>${o.name}</option>
                                        </c:forEach>
                                    </select>
                                    <form>
                                        <input name="search" placeholder="Bạn cần tìm gì?" type="search">
                                        <button class="btnn"><i class="ti-search"></i></button>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header Inner -->
            <!-- Breadcrumbs -->
            <div class="breadcrumbs">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="bread-inner">
                                <ul class="bread-list">
                                    <li><a href="${pageContext.request.contextPath}/home">Trang chủ<i class="ti-arrow-right"></i></a></li>
                                    <li class="active"><a href="${pageContext.request.contextPath}/register">Cập nhật tài khoản</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Breadcrumbs -->
            <!--/ End Header Inner -->
        </header>
        <!--/ End Header -->
        <section class="shop login section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3 col-12">
                        <div class="login-form">
                            <h3>Cập nhật tài khoản</h3>
                            <form class="form" method="POST" action="firsttime" id="updateForm">
                                <c:if test="${notificationSuccessful ne null}">
                                    <script>
                                        alert("${notificationSuccessful}");
                                        window.location.href = "home";
                                    </script>
                                </c:if>
                                    <input name="accountID" type="text" value="${account.id}" >
                                <div class="row">
                                    <div class="col-12">
                                        <label>Họ và Tên<span style="color: red">*</span></label>
                                        <div class="form-group">
                                            <input name="name" id="name" value="${name}" type="text" class="form-control" placeholder="Nhập họ và tên của bạn" required>
                                            <span id="nameError" class="error-message"></span> 
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label>E-mail<span style="color: red">*</span></label>
                                        <div class="form-group">
                                            <input name="email" id="email" value="${email}" type="text" class="form-control" placeholder="Nhập email" required <c:if test="${registerGoogle ne null}">readonly</c:if>>
                                                <span id="emailError" class="error-message"></span>     
                                            </div>
                                        <c:if test="${errorEmail ne null}">
                                            <span class="error-message" >${errorEmail}</span>
                                        </c:if>
                                    </div>
                                    <div class="col-12">
                                        <label>Số điện thoại<span style="color: red">*</span></label>
                                        <div class="form-group">
                                            <input name="phone" id="phone" value="${phone}" type="tel" class="form-control" placeholder="Nhập số điện thoại" maxlength="10" required>
                                            <span id="phoneError" class="error-message"></span> 
                                        </div>
                                        <c:if test="${errorPhone ne null}">
                                            <span class="error-message" >${errorPhone}</span>
                                        </c:if>
                                    </div>
                                    
                                    <div class="col-12">
                                        <label>
                                            <span style="color: red">* Bắt buộc</span>
                                        </label>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group login-btn">
                                            <button class="btn" type="submit">Cập nhật tài khoản</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>



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
        <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                            var form = document.getElementById('updateForm');
                                            var name = document.getElementById('name');
                                            var nameError = document.getElementById('nameError');
                                            var email = document.getElementById('email');
                                            var emailError = document.getElementById('emailError');
                                            var phone = document.getElementById('phone');
                                            var phoneError = document.getElementById('phoneError');

                                            function validateNoSpaces(input, errorElement) {
                                                if (input && errorElement) {
                                                    if (/\s/.test(input.value)) {
                                                        errorElement.textContent = "Không được chứa khoảng trắng.";
                                                        return false;
                                                    } else {
                                                        errorElement.textContent = "";
                                                        return true;
                                                    }
                                                }
                                                return true;
                                            }


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

                                            function isValidEmail(input, errorElement) {
                                                if (input && errorElement) {
                                                    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                                                    if (!emailRegex.test(input.value)) {
                                                        errorElement.textContent = "Email không hợp lệ. Email phải chứa ký tự @ và tên miền hợp lệ!";
                                                        return false;
                                                    } else {
                                                        errorElement.textContent = "";
                                                        return true;
                                                    }
                                                }
                                                return true;
                                            }

                                            function validateEmailAndNoSpaces(input, errorElement) {
                                                if (input && errorElement) {
                                                    if (!validateNoSpaces(input, errorElement)) {
                                                        return false;
                                                    }
                                                    return isValidEmail(input, errorElement);
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

                                            function validatePhoneAndNoSpaces(input, errorElement) {
                                                if (input && errorElement) {
                                                    if (!validateNoSpaces(input, errorElement)) {
                                                        return false;
                                                    }
                                                    return isValidPhoneNumber(input, errorElement);
                                                }
                                                return true;
                                            }



                                            name.addEventListener('input', function () {
                                                validateNoSpacesStartEnd(name, nameError);
                                            });

                                            email.addEventListener('input', function () {
                                                validateEmailAndNoSpaces(email, emailError);
                                            });

                                            phone.addEventListener('input', function () {
                                                validatePhoneAndNoSpaces(phone, phoneError);
                                            });

                                            //Check if the fields in the form are not error will can submit the form
                                            function validateForm() {
                                                var isNameValid = validateNoSpacesStartEnd(name, nameError);
                                                var isEmailValid = validateEmailAndNoSpaces(email, emailError);
                                                var isPhoneValid = validatePhoneAndNoSpaces(phone, phoneError);
                                                return isNameValid  && isEmailValid && isPhoneValid;
                                            }

                                            form.addEventListener('submit', function (event) {
                                                if (!validateForm()) {
                                                    event.preventDefault();
                                                }
                                            });
                                        });
        </script>
    </body>
</html>
