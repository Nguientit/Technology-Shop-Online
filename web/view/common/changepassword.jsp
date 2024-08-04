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
                                    <li class="active"><a href="${pageContext.request.contextPath}/register">Đăng ký</a></li>
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
                            <h3>Đổi mật khẩu</h3>
                            <form id="changePasswordForm" class="form" method="POST" action="change">
                                <c:if test="${notificationSuccessful ne null}">
                                    <script>
                                        alert("${notificationSuccessful}");
                                    </script>
                                </c:if>
                                <div class="row">

                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>Nhập mật khẩu cũ</label>
                                            <input name="oldPassword" id="oldPassword" type="password" class="form-control" placeholder="Nhập mật khẩu cũ" maxlength="15" required>
                                            <span id="oldPasswordError" class="error-message"></span> 
                                            <c:if test="${oldPasswordFalse ne null}">
                                                <span class="error-message" >${oldPasswordFalse}</span>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>Mật khẩu mới</label>
                                            <input name="newPassword" id="newPassword" type="password" class="form-control" placeholder="Nhập mật khẩu mới" maxlength="15" required>
                                            <span id="newPasswordError" class="error-message"></span> 
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>Nhập lại mật khẩu mới</label>
                                            <input name="cfnewPassword" id="cfnewPassword" type="password" class="form-control" placeholder="Nhập lại mật khẩu mới" maxlength="15" required>
                                            <span id="cfnewPasswordError" class="error-message"></span> 
                                        </div>
                                        <c:if test="${newPasswordFalse ne null}">
                                            <span class="error-message" >${newPasswordFalse}</span>
                                        </c:if>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group login-btn text-center">
                                            <button class="btn" type="submit">Đổi mật khẩu</button>
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
                                            var form = document.getElementById('changePasswordForm');
                                            var oldPassword = document.getElementById('oldPassword');
                                            var oldPasswordError = document.getElementById('oldPasswordError');
                                            var newPassword = document.getElementById('newPassword');
                                            var newPasswordError = document.getElementById('newPasswordError');
                                            var cfnewPassword = document.getElementById('cfnewPassword');
                                            var cfnewPasswordError = document.getElementById('cfnewPasswordError');

                                            function validatePasswordMatch() {
                                                if (newPassword && cfnewPassword && cfnewPasswordError) {
                                                    if (newPassword.value === "" || cfnewPassword.value === "") {
                                                        cfnewPasswordError.textContent = "Mật khẩu không được để trống!";
                                                        return false;
                                                    }
                                                    if (newPassword.value !== cfnewPassword.value) {
                                                        cfnewPasswordError.textContent = "Mật khẩu không trùng nhau!";
                                                        return false;
                                                    } else {
                                                        cfnewPasswordError.textContent = "";
                                                        return true;
                                                    }
                                                }
                                                return true;
                                            }

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

                                            function isValidPassword(input, errorElement) {
                                                const hasLowerCase = /[a-z]/.test(input.value);
                                                const hasUpperCase = /[A-Z]/.test(input.value);
                                                const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(input.value);
                                                const hasDigit = /\d/.test(input.value);

                                                if (hasLowerCase && hasUpperCase && hasSpecialChar && hasDigit) {
                                                    errorElement.textContent = "";
                                                    return true;
                                                } else {
                                                    errorElement.textContent = "Mật khẩu phải bao gồm ít nhất một ký tự đặc biệt, một ký tự thường, một ký tự in hoa và một chữ số!";
                                                    return false;
                                                }
                                            }

                                            function validateNoSpacesAndPasswordIsValid(input, errorElement) {
                                                if (input && errorElement) {
                                                    if (!validateNoSpaces(input, errorElement)) {
                                                        return false;
                                                    }
                                                    return isValidPassword(input, errorElement);
                                                }
                                                return true;
                                            }

                                            function validateNoSpacesAndPasswordMatch(input, errorElement) {
                                                if (input && errorElement) {
                                                    if (!validateNoSpaces(input, errorElement)) {
                                                        return false;
                                                    }
                                                    if (!isValidPassword(input, errorElement)) {
                                                        return false;
                                                    }
                                                    return validatePasswordMatch();
                                                }
                                                return true;
                                            }

                                            oldPassword.addEventListener('input', function () {
                                                validateNoSpacesAndPasswordIsValid(oldPassword, oldPasswordError);
                                            });

                                            newPassword.addEventListener('input', function () {
                                                validateNoSpacesAndPasswordMatch(newPassword, cfnewPasswordError);
                                            });

                                            cfnewPassword.addEventListener('input', function () {
                                                validateNoSpacesAndPasswordMatch(cfnewPassword, cfnewPasswordError);
                                            });


                                            //Check if the fields in the form are not error will can submit the form
                                            function validateForm() {
                                                var isOldPasswordValid = validateNoSpacesAndPasswordIsValid(oldPassword, oldPasswordError);
                                                var isNewPasswordValid = validateNoSpacesAndPasswordMatch(newPassword, cfnewPasswordError);
                                                var isCfNewPasswordValid = validateNoSpacesAndPasswordMatch(cfnewPassword, cfnewPasswordError);
                                                return isOldPasswordValid && isNewPasswordValid && isCfNewPasswordValid;
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
