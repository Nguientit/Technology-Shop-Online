<%-- 
    Document   : updateprofile
    Created on : Jun 9, 2024, 8:33:45 PM
    Author     : Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech Haven</title>
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
                            <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/images/logo.png" alt="logo"></a>
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
                                <li class="active"><a href="${pageContext.request.contextPath}/viewprofile">Hồ sơ<i class="ti-arrow-right"></i></a></li>
                                <li class="active"><a href="${pageContext.request.contextPath}/updateprofile">Cập nhật hồ sơ</a></li>
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
                    </div>
                </div>
                <div class="col-md-5 border-right">
                    <form action="updateprofile" method="POST" id="updateProfileForm">


                        <div class="p-3 py-4">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Cập nhật tài khoản</h4>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Họ và tên<span style="color: red">*</span></label>
                                    <input name="name" id="name" type="text" class="form-control" placeholder="Nhập họ và tên" 
                                           value="${user.name}" required>
                                    <span id="nameError" class="error-message"></span> 
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Ngày sinh</label>
                                    <input name="dob" id="dob" type="date" class="form-control" placeholder="Nhập ngày sinh" 
                                           value="${user.dob}">
                                    <span id="dobError" class="error-message"></span> 
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Giới tính</label>
                                    <div>
                                        <select name="gender">
                                            <option value="Male" <c:if test="${user.gender eq 'Male'}">selected</c:if>>Nam</option>
                                            <option value="Female" <c:if test="${user.gender eq 'Female'}">selected</c:if>>Nữ</option>
                                            <option value="Other" <c:if test="${user.gender eq 'Other'}">selected</c:if>>Khác</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Gmail<span style="color: red">*</span></label>
                                        <input name="gmail" id="email" type="text" class="form-control" placeholder="Nhập gmail" 
                                               value="${user.email}" required>
                                    <span id="emailError" class="error-message">${errorEmail}</span> 
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Địa chỉ</label>
                                    <input name="address" id="address" type="text" class="form-control" placeholder="Nhập địa chỉ" 
                                           value="${user.address}">
                                    <span id="addressError" class="error-message"></span> 
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Số điện thoại<span style="color: red">*</span></label>
                                    <input name="phone" id="phone" type="tel" maxlength="10" class="form-control" placeholder="Nhập số điện thoại" 
                                           value="${user.phone}" required>
                                    <span id="phoneError" class="error-message">${errorPhone}</span> 
                                </div>
                            </div>
                            <div>
                                <span style="color: red">*Bắt buộc</span>
                            </div>
                        </div>
                        <div class="col-md-12 mt-3 text-center">
                            <button class="btn" type="submit">Cập nhật thông tin</button>
                        </div>
                </div>
                </form>
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
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var form = document.getElementById('updateProfileForm');
            var name = document.getElementById('name');
            var nameError = document.getElementById('nameError');
            var dob = document.getElementById('dob');
            var dobError = document.getElementById('dobError');
            var email = document.getElementById('email');
            var emailError = document.getElementById('emailError');
            var address = document.getElementById('address');
            var addressError = document.getElementById('addressError');
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

            function isAtLeast6YearsOld(input, errorElement) {
                if (input && errorElement) {
                    var inputDate = new Date(input.value);
                    var today = new Date();

                    // Tính tuổi dựa trên năm hiện tại và năm nhập vào
                    var age = today.getFullYear() - inputDate.getFullYear();
                    var monthDifference = today.getMonth() - inputDate.getMonth();
                    var dayDifference = today.getDate() - inputDate.getDate();

                    // Nếu tháng hiện tại nhỏ hơn tháng sinh, hoặc cùng tháng nhưng ngày hiện tại nhỏ hơn ngày sinh
                    if (monthDifference < 0 || (monthDifference === 0 && dayDifference < 0)) {
                        age--;
                    }

                    if (age < 6) {
                        errorElement.textContent = "Chưa đủ 6 tuổi!";
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
                    const phoneRegex = /^0(3|5|7|8|9)\d{8}$/;
                    if (!phoneRegex.test(input.value)) {
                        errorElement.textContent = "Số điện thoại phải là số Việt Nam và có đúng 10 chữ số!";
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

            dob.addEventListener('change', function () {
                isAtLeast6YearsOld(dob, dobError);
            });

            email.addEventListener('input', function () {
                validateEmailAndNoSpaces(email, emailError);
            });

            address.addEventListener('input', function () {
                validateNoSpacesStartEnd(address, addressError);
            });

            phone.addEventListener('input', function () {
                validatePhoneAndNoSpaces(phone, phoneError);
            });


            //Check if the fields in the form are not error will can submit the form
            function validateForm() {
                var isNameValid = validateNoSpacesStartEnd(name, nameError);
                var isEmailValid = validateEmailAndNoSpaces(email, emailError);
                var isPhoneValid = validatePhoneAndNoSpaces(phone, phoneError);
                return isNameValid && isEmailValid && isPhoneValid;
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
