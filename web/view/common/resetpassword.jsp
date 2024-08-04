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
                        <div class="col-lg-10 col-md-2 col-12">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="home"><img src="${pageContext.request.contextPath}/images/logo.png" alt="logo"></a>
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
                                    <li class="active"><a href="${pageContext.request.contextPath}/reset">Quên mật khẩu</a></li>
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
                            <h3>Đổi mật khẩu</h3>
                            <form class="form" method="POST" action="reset" id="resetForm">
                                <c:if test="${notificationSuccessful ne null}">
                                    <script>
                                        alert("${notificationSuccessful}");
                                        window.location.href = "home";
                                    </script>
                                </c:if>
                                <c:if test="${checkOTP ne null}">
                                    <input type="hidden" name="checkOTP" value="${checkOTP}"/>
                                    <input type="hidden" name="isSubmitForm" value="isSubmitForm"/>
                                </c:if>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>Nhập email/ số điện thoại:</label>
                                            <input name="checkInfo" id="checkInfo" value="${checkInfo}" type="text" class="form-control" maxlength="30" placeholder="Nhập email/ số điện thoại" required <c:if test="${infoTrue ne null}">readonly</c:if>>
                                                <span id="checkInfoError" class="error-message"></span>    
                                            <c:if test="${infoFalse ne null}">
                                                <span class="error-message" >${infoFalse}</span>
                                            </c:if>    
                                        </div>
                                    </div>
                                    <c:if test="${infoTrue ne null}">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>Mật khẩu mới<span style="color: red">*</span></label>
                                                <input name="newPassword" id="newPassword" type="password" class="form-control" maxlength="16" placeholder="Nhập mật khẩu mới" maxlength="15" required>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>Nhập lại mật khẩu mới<span style="color: red">*</span></label>
                                                <input name="cfnewPassword" id="cfnewPassword" type="password" class="form-control" maxlength="16" placeholder="Nhập lại mật khẩu mới" maxlength="15" required>
                                                <span id="errorPassword" class="error-message"></span>
                                                <span style="color: red">*Bắt buộc</span>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="col-12">
                                        <div class="form-group login-btn">
                                            <button class="btn" type="submit">Kiểm tra</button>
                                            <a href="${pageContext.request.contextPath}/register" class="btn">Đăng ký</a>
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
                                            var form = document.getElementById('resetForm');
                                            var checkInfo = document.getElementById('checkInfo');
                                            var checkInfoError = document.getElementById('checkInfoError');
                                            var newPassword = document.getElementById('newPassword');
                                            var cfnewPassword = document.getElementById('cfnewPassword');
                                            var errorPassword = document.getElementById('errorPassword');

                                            function validatePasswordMatch() {
                                                if (newPassword && cfnewPassword && errorPassword) {
                                                    if (newPassword.value === "" || cfnewPassword.value === "") {
                                                        errorPassword.textContent = "Mật khẩu không được để trống!";
                                                        return false;
                                                    }
                                                    if (newPassword.value !== cfnewPassword.value) {
                                                        errorPassword.textContent = "Mật khẩu không trùng nhau!";
                                                        return false;
                                                    } else {
                                                        errorPassword.textContent = "";
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

                                            //Add events to check space for checkInfo
                                            checkInfo.addEventListener('input', function () {
                                                validateNoSpaces(checkInfo, checkInfoError);
                                            });

                                            //Add events if fields exist
                                            if (newPassword && cfnewPassword) {
                                                newPassword.addEventListener('input', function () {
                                                    validateNoSpacesAndPasswordMatch(newPassword, errorPassword);
                                                });

                                                cfnewPassword.addEventListener('input', function () {
                                                    validateNoSpacesAndPasswordMatch(cfnewPassword, errorPassword);
                                                });
                                            }

                                            //Check if the fields in the form are not error will can submit the form
                                            function validateForm() {
                                                var isCheckInfoValid = validateNoSpaces(checkInfo, checkInfoError);
                                                var isNewPasswordValid = validateNoSpacesAndPasswordMatch(newPassword, errorPassword);
                                                var isCfNewPasswordValid = validateNoSpacesAndPasswordMatch(cfnewPassword, errorPassword);
                                                return isCheckInfoValid && isNewPasswordValid
                                                        && isCfNewPasswordValid;
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
