<%-- 
    Document   : checkOTPreset
    Created on : Jun 11, 2024, 11:24:40 PM
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


        <style>
            html {
                height: 100%;
            }
            body {
                margin:0;
                padding:0;
                font-family: sans-serif;
            }

            .login-box {
                position: absolute;
                top: 50%;
                left: 50%;
                width: 400px;
                padding: 40px;
                transform: translate(-50%, 0%);
                background: #F6F7FB;
                box-sizing: border-box;
                box-shadow: 0 15px 25px rgba(0,0,0,.6);
                border-radius: 10px;
            }

            .login-box h2 {
                margin: 0 0 30px;
                padding: 0;
                color: #fff;
                text-align: center;
            }

            .login-box .user-box {
                position: relative;
            }

            .login-box .user-box input {
                width: 100%;
                padding: 10px 0;
                font-size: 16px;
                color: #fff;
                margin-bottom: 30px;
                border: none;
                border-bottom: 1px solid #fff;
                outline: none;
                background: transparent;
            }

            .login-box .user-box label {
                position: absolute;
                top:0;
                left: 0;
                padding: 10px 0;
                font-size: 16px;
                color: #fff;
                pointer-events: none;
                transition: .5s;
            }

            .login-box .user-box input:focus ~ label,
            .login-box .user-box input:valid ~ label {
                top: -20px;
                left: 0;
                color: #448bf6;
                font-size: 12px;
            }

            .login-box form a {
                position: relative;
                display: inline-block;
                padding: 10px 20px;
                color: #26a6b7;
                font-size: 16px;
                text-decoration: none;
                text-transform: uppercase;
                overflow: hidden;
                transition: .5s;
                margin-top: 40px;
                letter-spacing: 4px
            }

            .login-box a:hover {
                background: #03a8f4;
                color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 5px #0327f4,
                    0 0 25px #0b26bd,
                    0 0 50px #0343f4,
                    0 0 100px #1e58d5;
            }

            .login-box a span:nth-child(1) {
                top: 0;
                left: -100%;
                width: 100%;
                height: 2px;
                background: linear-gradient(90deg, transparent, #0388f4);
                animation: btn-anim1 1s linear infinite;
            }

            @keyframes btn-anim1 {
                0% {
                    left: -100%;
                }
                50%,100% {
                    left: 100%;
                }
            }

            .login-box a span:nth-child(2) {
                top: -100%;
                right: 0;
                width: 2px;
                height: 100%;
                background: linear-gradient(180deg, transparent, #0394f4);
                animation: btn-anim2 1s linear infinite;
                animation-delay: .25s
            }

            @keyframes btn-anim2 {
                0% {
                    top: -100%;
                }
                50%,100% {
                    top: 100%;
                }
            }

            .login-box a span:nth-child(3) {
                bottom: 0;
                right: -100%;
                width: 100%;
                height: 2px;
                background: linear-gradient(270deg, transparent, #039cf4);
                animation: btn-anim3 1s linear infinite;
                animation-delay: .5s
            }

            @keyframes btn-anim3 {
                0% {
                    right: -100%;
                }
                50%,100% {
                    right: 100%;
                }
            }

            .login-box a span:nth-child(4) {
                bottom: -100%;
                left: 0;
                width: 2px;
                height: 100%;
                background: linear-gradient(360deg, transparent, #036bf4);
                animation: btn-anim4 1s linear infinite;
                animation-delay: .75s
            }

            @keyframes btn-anim4 {
                0% {
                    bottom: -100%;
                }
                50%,100% {
                    bottom: 100%;
                }
            }
            .form {
                display: flex;
                align-items: center;
                flex-direction: column;
                justify-content: space-around;

                border-radius: 12px;
                padding: 20px;
            }

            .title {
                font-size: 30px;
                font-weight: bold;
                color: black;
            }

            .message {
                color: black;
                font-size: 14px;
                margin-top: 4px;
                text-align: center
            }

            .inputs {
                margin-top: 30px;
            }

            .inputs input {
                width: 32px;
                height: 32px;
                text-align: center;
                border: none;
                border-bottom: 1.5px solid #d2d2d2;
                margin: 0 10px;
            }

            .inputs input:focus {
                border-bottom: 1.5px solid royalblue;
                outline: none;
            }

            .btn{
                margin-top: 50px
            }

        </style>
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
                        <div class="login-box">
                            <form class="form" action="checkotp" method="GET">
                                <div class="title">Mã xác minh OTP</div>
                                <p class="message">Vui lòng nhập mã xác minh đã được gửi tới email của bạn</p>
                                <div class="inputs"> 
                                    <c:if test="${falseOTP ne null}">
                                        <script>
                                            alert("${falseOTP}");
                                            window.location.href = "home";
                                        </script>
                                    </c:if>
                                    <input type="hidden" name="checkInfo" value="${checkInfo}"/>
                                    <input type="hidden" name="randomNumbers" value="${randomNumbers}"/>
                                    <input type="hidden" name="countFalse" value="${countFalse}"/>
                                    <input id="input1" name="input1" type="text" maxlength="1" oninput="checkNumberAndFocusNext(this, 'input2')"> 
                                    <input id="input2" name="input2" type="text" maxlength="1" oninput="checkNumberAndFocusNext(this, 'input3')">
                                    <input id="input3" name="input3" type="text" maxlength="1" oninput="checkNumberAndFocusNext(this, 'input4')"> 
                                    <input id="input4" name="input4" type="text" maxlength="1" oninput="checkNumberAndFocusNext(this, 'input5')"> 
                                    <input id="input5" name="input5" type="text" maxlength="1" oninput="checkNumberAndFocusNext(this, 'input6')"> 
                                </div> 
                                <button class="btn" type="submit">Submit</button>
                                </a>
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
                                            function checkNumberAndFocusNext(currentInput, nextInputId) {
                                                const value = currentInput.value;
                                                if (!isNaN(value) && value.trim() !== "") {
                                                    document.getElementById(nextInputId).focus();
                                                }
                                            }
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

                                                function validateNoSpacesAndPassword(input, errorElement) {
                                                    if (input && errorElement) {
                                                        if (!validateNoSpaces(input, errorElement)) {
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
                                                        validateNoSpacesAndPassword(newPassword, errorPassword);
                                                    });

                                                    cfnewPassword.addEventListener('input', function () {
                                                        validateNoSpacesAndPassword(cfnewPassword, errorPassword);
                                                    });
                                                }

                                                //Check if the fields in the form are not error will can submit the form
                                                function validateForm() {
                                                    var isCheckInfoValid = validateNoSpaces(checkInfo, checkInfoError);
                                                    var isNewPasswordValid = validateNoSpacesAndPassword(newPassword, errorPassword);
                                                    var isCfNewPasswordValid = validateNoSpacesAndPassword(cfnewPassword, errorPassword);
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
