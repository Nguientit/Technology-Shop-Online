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
            <%@include file="Header.jsp" %>
            <!-- Breadcrumbs -->
            <div class="breadcrumbs">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="bread-inner">
                                <ul class="bread-list">
                                    <li><a href="${pageContext.request.contextPath}/home">Trang chủ<i class="ti-arrow-right"></i></a></li>
                                    <li class="active"><a href="${pageContext.request.contextPath}/login">Đăng nhập</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Breadcrumbs -->
        </header>

        <!--/ End Header -->
        <section class="shop login section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3 col-12">
                        <div class="login-form">
                            <p>Vui lòng đăng nhập tài khoản Tech Haven để xem ưu đãi và thanh toán dễ dàng hơn.</p>
                            <h3>Đăng nhập với</h3>
                            <div class="button-login-google">
                                <img src="${pageContext.request.contextPath}/images/image45.png" width="24px" height="24px" alt="google"/>
                                <a class="btn-login-google" href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/Technology_Store_SWP/login&response_type=code&client_id=1014134470039-nqvls0p7vuvvqc9hps4k3mblp440qcmq.apps.googleusercontent.com&approval_prompt=force">
                                    Google
                                </a>
                            </div>
                            <div class="line-through is-flex is-align-items-center">
                                <hr>
                                <p>HOẶC</p>
                                <hr>
                            </div>
                            <form class="form" method="POST" action="${pageContext.request.contextPath}/login" id="loginForm">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="text" name="credential" id="credential" placeholder="Nhập số điện thoại/email/tên tài khoản" maxlength="30" required="required" autocomplete="off">
                                            <span id="credentialError" class="error-message"></span>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="password" name="password" id="password" placeholder="Nhập mật khẩu" maxlength="16" required="required" autocomplete="off">
                                            <span id="passwordError" class="error-message"></span>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <a href="${pageContext.request.contextPath}/reset" ">Quên mật khẩu?</a>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group login-btn">
                                            <button class="btn" type="submit">Đăng nhập</button>
                                            <a href="${pageContext.request.contextPath}/register" class="btn">Đăng ký</a>
                                        </div>
                                        <span class="error-message" >${requestScope.errorMessage}</span>
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
                var form = document.getElementById('loginForm');
                var credential = document.getElementById('credential');
                var password = document.getElementById('password');
                var credentialError = document.getElementById('credentialError');
                var passwordError = document.getElementById('passwordError');

                function validateNoSpaces(input, errorElement) {
                    if (/\s/.test(input.value)) {
                        errorElement.textContent = "Không được chứa khoảng trắng.";
                        return false;
                    } else {
                        errorElement.textContent = "";
                        return true;
                    }
                }

                function validateAlphanumeric(input, errorElement) {
                    const hasLetter = /[a-zA-Z]/.test(input.value);
                    const hasNumber = /\d/.test(input.value);

                    if (!hasLetter || !hasNumber) {
                        errorElement.textContent = "Tài khoản phải chứa cả chữ và số.";
                        return false;
                    } else {
                        errorElement.textContent = "";
                        return true;
                    }
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

                function validateCredentialAndNoSpaces(input, errorElement) {
                    if (!validateNoSpaces(input, errorElement)) {
                        return false;
                    }
                    return validateAlphanumeric(input, errorElement);
                }
                
                function validatePasswordAndNoSpaces(input, errorElement) {
                    if (!validateNoSpaces(input, errorElement)) {
                        return false;
                    }
                    return isValidPassword(input, errorElement);
                }

                //Check if the fields in the form are not error will can submit the form
                function validateForm() {
                    var isCredentialValid = validateCredentialAndNoSpaces(credential, credentialError);
                    var isPasswordValid = validatePasswordAndNoSpaces(password, passwordError);
                    return isCredentialValid && isPasswordValid;
                }

                credential.addEventListener('input', function () {
                    validateCredentialAndNoSpaces(credential, credentialError);
                });

                password.addEventListener('input', function () {
                    validatePasswordAndNoSpaces(password, passwordError);
                });

                form.addEventListener('submit', function (event) {
                    if (!validateForm()) {
                        event.preventDefault();
                    }
                });
            });
        </script>
    </body>
</html>
