<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lịch sử mua hàng</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

        <style>
            body {
                font-family: 'Poppins', sans-serif;
            }
            .sidebar {
                height: 200px;
            }
            .sidebar a {
                text-decoration: none;
                color: #333;
                display: flex;
                align-items: center;
                padding: 10px 15px;
                border-radius: 5px;
                transition: background-color 0.3s, color 0.3s;
                margin-bottom: 10px;
            }
            .sidebar a.active {
                background-color: #fff5f5;
                border: 1px solid #cc0c1b;
                color: #cc0c1b;
            }
            .sidebar a.active i, .sidebar a:hover i {
                color: #cc0c1b;
            }
            .sidebar i {
                margin-right: 10px;
                font-size: 1.2em;
                transition: color 0.3s;
            }
            .content {
                padding: 20px;
            }
            .order-history-container {
                padding: 20px;
                background-color: #f8f9fa;
                border-radius: 10px;
            }
            .order-history-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }
            .order-history-header .user-info {
                display: flex;
                align-items: center;
            }
            .order-history-header .user-info img {
                border-radius: 50%;
                margin-right: 10px;
            }
            .order-history-stats {
                display: flex;
                justify-content: space-around;
                padding: 20px;
                background-color: #fff;
                border-radius: 10px;
                margin-bottom: 20px;
            }
            .order-history-stats .stat {
                text-align: center;
            }
            .order-history-filter {
                margin-bottom: 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .order-history-filter button {
                margin-right: 10px;
            }
            .order-history-empty {
                text-align: center;
                padding: 50px 0;
            }
            .order-history-empty img {
                width: 150px;
            }
            .hidden-row {
                display: none;
            }
            .details-container {
                background-color: #f9f9f9;
                padding: 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                margin-top: 10px;
            }
            .details-container p {
                margin: 5px 0;
            }
            .details-container .product-name {
                font-weight: bold;
            }
            .details-container .product-quantity,
            .details-container .product-price {
                color: #555;
            }
            .details-row td {
                padding: 0 !important;
            }
        </style>
    </head>
    <body onload="time()" class="app sidebar-mini rtl">
        <br/>
        <header class="header shop">
            <div class="middle-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-10 col-md-2 col-12">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/images/logo.png" alt="logo"></a>
                            </div>
                            <!--/ End Logo -->
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <br/>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-2 sidebar">
                    <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
                    <a href="${pageContext.request.contextPath}/orderhistory" class="active">Lịch sử mua hàng</a>
                    <!-- Add more links as needed -->
                </div>
                <!-- Main Content -->
                <div class="col-md-10 content">
                    <div class="container-fluid order-history-container">
                        <div class="order-history-header">
                            <div class="user-info">
                                <img src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg" alt="User Avatar" width="50">
                                <div>
                                    <span class="badge bg-danger">TECHMEMBER</span>
                                    <h5>${user.name}</h5>
                                    <p>${user.phone}</p>
                                </div>
                            </div>
                            <div id="clock"></div>
                        </div>
                        <div class="order-history-stats">
                            <div class="stat">
                                <h3>${orders.size()}</h3>
                                <p>đơn hàng</p>
                            </div>
                            <div class="stat">
                                <h3>
                                    <c:set var="totalAmount" value="0" scope="page"/>
                                    <c:forEach var="order" items="${orders}">
                                        <c:set var="totalAmount" value="${totalAmount + order.amount}" scope="page"/>
                                    </c:forEach>
                                    <currency:formatCurrency value="${totalAmount}"/>
                                </h3>
                                <p>Tổng tiền tích luỹ</p>
                            </div>
                        </div>
                        <div class="order-history-filter">
                            <input type="date" class="form-control" style="width: 200px;">
                            <div>
                                <button class="btn btn-outline-primary">Tất cả</button>
                                <button class="btn btn-outline-secondary">Chờ xác nhận</button>
                                <button class="btn btn-outline-secondary">Đã xác nhận</button>
                                <button class="btn btn-outline-secondary">Đang vận chuyển</button>
                                <button class="btn btn-outline-secondary">Đã giao hàng</button>
                                <button class="btn btn-outline-secondary">Đã huỷ</button>
                            </div>
                        </div>
                        <c:if test="${empty orders}">
                            <div class="order-history-empty">
                                <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:150:150/q:90/plain/https://cellphones.com.vn/media/wysiwyg/cps-ant.png" alt="Empty">
                                <p>Không có đơn hàng nào thoả mãn!</p>
                            </div>
                        </c:if>
                        <c:if test="${not empty orders}">
                            <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                                <thead>
                                    <tr>
                                        <th style="width: 50px">Mã đơn hàng</th>
                                        <th style="width: 100px">Tên người nhận</th>
                                        <th style="width: 100px">Địa chỉ nhận hàng</th>
                                        <th style="width: 100px">Số điện thoại nhận hàng</th>
                                        <th style="width: 40px">Phương thức</th>
                                        <th style="width: 100px">Thành tiền</th>
                                        <th style="width: 100px">Trạng thái</th>
                                        <th style="width: 100px">Thời gian đặt hàng</th>
                                        <th style="width: 120px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <td>${order.id}</td>
                                            <td>${order.recipientName}</td>
                                            <td>${order.deliveryAddress}</td>
                                            <td>${order.deliveryPhone}</td>
                                            <td>${order.payment}</td>
                                            <td><currency:formatCurrency value="${order.amount}"/></td>
                                            <td>${order.status.name}</td>
                                            <td>
                                                <fmt:formatDate value="${order.ordertime}" pattern="dd/MM/yyyy"/>
                                            </td>
                                            <td>
                                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" 
                                                        onclick="showUpdateModal(${order.id}, '${order.recipientName}', '${order.deliveryAddress}', '${order.deliveryPhone}')">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="btn btn-danger btn-sm trash" type="button" title="Xóa" onclick="deleteOrder(${order.id})">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                                <button class="btn btn-info btn-sm eye" type="button" title="Chi tiết" id="show-emp" onclick="toggleDetails(${order.id})">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr id="details-${order.id}" class="hidden-row details-row">
                                            <td colspan="9">
                                                <div class="details-container">
                                                    <c:forEach var="detail" items="${order.orderDetails}">
                                                        <p class="product-name">Sản phẩm: ${detail.pname}</p>
                                                        <p class="product-quantity">Số lượng: ${detail.quantity}</p>
                                                        <p class="product-price">Giá: <currency:formatCurrency value="${detail.price}"/></p>
                                                    </c:forEach>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <!-- Update Order Modal -->
        <div class="modal fade" id="updateOrderModal" tabindex="-1" aria-labelledby="updateOrderModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateOrderModalLabel">Cập nhật đơn hàng</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="updateOrderForm">
                            <input type="hidden" id="updateOrderId" name="orderId">
                            <input type="hidden" name="action" value="update">
                            <div class="mb-3">
                                <label for="updateRecipientName" class="form-label">Tên người nhận</label>
                                <input type="text" class="form-control" id="updateRecipientName" name="recipientName" required>
                                <span style="color:red" id="updateRecipientNameError" class="error-message"></span>
                            </div>
                            <div class="mb-3">
                                <label for="updateDeliveryAddress" class="form-label">Địa chỉ nhận hàng</label>
                                <input type="text" class="form-control" id="updateDeliveryAddress" name="deliveryAddress" required>
                                <span style="color:red" id="updateDeliveryAddressError" class="error-message"></span>
                            </div>
                            <div class="mb-3">
                                <label for="updateDeliveryPhone" class="form-label">Số điện thoại nhận hàng</label>
                                <input type="text" class="form-control" id="updateDeliveryPhone" name="deliveryPhone" required>
                                <span style="color:red" id="updateDeliveryPhoneError" class="error-message"></span>
                            </div>
                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>



        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <script>
                                                    document.addEventListener('DOMContentLoaded', function () {
                                                        var updateForm = document.getElementById('updateOrderForm');
                                                        var updateRecipientName = document.getElementById('updateRecipientName');
                                                        var updateRecipientNameError = document.getElementById('updateRecipientNameError');
                                                        var updateDeliveryPhone = document.getElementById('updateDeliveryPhone');
                                                        var updateDeliveryPhoneError = document.getElementById('updateDeliveryPhoneError');
                                                        var updateDeliveryAddress = document.getElementById('updateDeliveryAddress');
                                                        var updateDeliveryAddressError = document.getElementById('updateDeliveryAddressError');

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

                                                        function isValidAddress(input, errorElement) {
                                                            if (input && errorElement) {
                                                                const addressRegex = /^[^,]+(,[^,]+)*$/;
                                                                if (!addressRegex.test(input.value)) {
                                                                    errorElement.textContent = "Địa chỉ phải bao gồm số nhà, khu, phố và cách nhau bởi dấu phẩy!";
                                                                    return false;
                                                                } else {
                                                                    errorElement.textContent = "";
                                                                    return true;
                                                                }
                                                            }
                                                            return true;
                                                        }

                                                        updateRecipientName.addEventListener('input', function () {
                                                            validateNoSpacesStartEnd(updateRecipientName, updateRecipientNameError);
                                                        });

                                                        updateDeliveryPhone.addEventListener('input', function () {
                                                            isValidPhoneNumber(updateDeliveryPhone, updateDeliveryPhoneError);
                                                        });

                                                        updateDeliveryAddress.addEventListener('input', function () {
                                                            isValidAddress(updateDeliveryAddress, updateDeliveryAddressError);
                                                        });

                                                        updateForm.addEventListener('submit', function (event) {
                                                            var isRecipientNameValid = validateNoSpacesStartEnd(updateRecipientName, updateRecipientNameError);
                                                            var isDeliveryPhoneValid = isValidPhoneNumber(updateDeliveryPhone, updateDeliveryPhoneError);
                                                            var isDeliveryAddressValid = isValidAddress(updateDeliveryAddress, updateDeliveryAddressError);

                                                            if (!isRecipientNameValid || !isDeliveryPhoneValid || !isDeliveryAddressValid) {
                                                                event.preventDefault();
                                                            }
                                                        });
                                                    });
        </script>
        <script>
            document.getElementById('updateOrderForm').addEventListener('submit', function (event) {
                event.preventDefault(); // Ngăn chặn form gửi đi ngay lập tức

                var recipientName = document.getElementById('updateRecipientName').value.trim();
                var deliveryAddress = document.getElementById('updateDeliveryAddress').value.trim();
                var deliveryPhone = document.getElementById('updateDeliveryPhone').value.trim();

                var isValid = true;

                // Kiểm tra tên người nhận
                if (!validateNoSpacesStartEnd(recipientName)) {
                    document.getElementById('updateRecipientNameError').textContent = 'Tên người nhận không được để trống hoặc chứa khoảng trắng ở đầu hoặc cuối.';
                    isValid = false;
                } else {
                    document.getElementById('updateRecipientNameError').textContent = '';
                }

                // Kiểm tra địa chỉ giao hàng
                if (!validateAddress(deliveryAddress)) {
                    document.getElementById('updateDeliveryAddressError').textContent = 'Địa chỉ giao hàng phải đầy đủ bao gồm số nhà, khu, phố.';
                    isValid = false;
                } else {
                    document.getElementById('updateDeliveryAddressError').textContent = '';
                }

                // Kiểm tra số điện thoại
                if (!validatePhone(deliveryPhone)) {
                    document.getElementById('updateDeliveryPhoneError').textContent = 'Số điện thoại phải bắt đầu bằng số 0 và có đúng 10 kí tự.';
                    isValid = false;
                } else {
                    document.getElementById('updateDeliveryPhoneError').textContent = '';
                }

                // Nếu tất cả các kiểm tra đều qua, gửi form đi
                if (isValid) {
                    var formData = $(this).serialize();
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/orderhistory',
                        data: formData,
                        success: function (response) {
                            $('#updateOrderModal').modal('hide');
                            swal('Thành công', 'Đơn hàng đã được cập nhật', 'success').then(() => {
                                location.reload();
                            });
                        },
                        error: function (error) {
                            console.error(error);
                            swal('Lỗi', 'Có lỗi xảy ra khi cập nhật đơn hàng', 'error');
                        }
                    });
                }
            });

            function validateNoSpacesStartEnd(value) {
                return value !== '' && !value.startsWith(' ') && !value.endsWith(' ');
            }

            function validateAddress(address) {
                // Kiểm tra xem địa chỉ có chứa số nhà, khu, phố không
                var addressParts = address.split(',');
                return addressParts.length >= 3;
            }

            function validatePhone(phone) {
                // Kiểm tra số điện thoại có đủ 10 kí tự và bắt đầu bằng số 0 không
                const phoneRegex = /^0\d{9}$/;
                return phoneRegex.test(phone);
            }

            function showUpdateModal(orderId, recipientName, deliveryAddress, deliveryPhone) {
                $('#updateOrderId').val(orderId);
                $('#updateRecipientName').val(recipientName);
                $('#updateDeliveryAddress').val(deliveryAddress);
                $('#updateDeliveryPhone').val(deliveryPhone);
                $('#updateOrderModal').modal('show');
            }

            function deleteOrder(orderId) {
                swal({
                    title: "Cảnh báo",
                    text: "Bạn có chắc chắn là muốn hủy đơn hàng này?",
                    buttons: ["Hủy bỏ", "Đồng ý"]
                }).then((willDelete) => {
                    if (willDelete) {
                        $.ajax({
                            type: 'POST',
                            url: '${pageContext.request.contextPath}/orderupdate',
                            data: {orderId: orderId, action: 'delete'},
                            success: function (response) {
                                swal('Thành công', 'Đơn hàng đã được xóa', 'success').then(() => {
                                    location.reload();
                                });
                            },
                            error: function (error) {
                                swal('Lỗi', 'Có lỗi xảy ra khi xóa đơn hàng', 'error');
                            }
                        });
                    }
                });
            }

            function toggleDetails(orderId) {
                var detailsRow = document.getElementById('details-' + orderId);
                if (detailsRow.style.display === 'none' || detailsRow.style.display === '') {
                    detailsRow.style.display = 'table-row';
                } else {
                    detailsRow.style.display = 'none';
                }
            }

            $('#sampleTable').DataTable();

            function time() {
                var today = new Date();
                var weekday = new Array(7);
                weekday[0] = "Chủ Nhật";
                weekday[1] = "Thứ Hai";
                weekday[2] = "Thứ Ba";
                weekday[3] = "Thứ Tư";
                weekday[4] = "Thứ Năm";
                weekday[5] = "Thứ Sáu";
                weekday[6] = "Thứ Bảy";
                var day = weekday[today.getDay()];
                var dd = today.getDate();
                var mm = today.getMonth() + 1;
                var yyyy = today.getFullYear();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                nowTime = h + " giờ " + m + " phút " + s + " giây";
                if (dd < 10) {
                    dd = '0' + dd;
                }
                if (mm < 10) {
                    mm = '0' + mm;
                }
                today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                tmp = '<span class="date"> ' + today + ' - ' + nowTime + '</span>';
                document.getElementById("clock").innerHTML = tmp;
                clocktime = setTimeout("time()", "1000", "Javascript");

                function checkTime(i) {
                    if (i < 10) {
                        i = "0" + i;
                    }
                    return i;
                }
            }
        </script>
    </body>
</html>
