<%-- 
    Document   : addDiscount_1
    Created on : Jul 3, 2024, 10:06:41 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Thêm giá khuyến mãi</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
</head>
<body class="app sidebar-mini rtl">
    <jsp:include page="Menu.jsp"/>
    <main class="app-content">
        <div class="app-title">
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item">Danh sách sản phẩm khuyến mại</li>
                <li class="breadcrumb-item"><a href="">Thêm giá khuyến mại</a></li>
                <li class="breadcrumb-item"><a href="#">Chọn loại khuyến mại</a></li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <h3 class="tile-title">Thêm giá khuyến mãi cho sản phẩm</h3>
                    <div class="tile-body">
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger">${errorMessage}</div>
                        </c:if>
                        <form name="productForm" action="adddiscount?action=savediscount" method="post" onsubmit="return validateForm()">
                            <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                                <thead>
                                    <tr role="row">
                                        <th class="sorting" style="width: 40.2px;">Ảnh</th>
                                        <th class="sorting" style="width: 120.2px;">Tên sản phẩm</th>
                                        <th class="sorting" style="width: 70.2px;">Màu sản phẩm</th>
                                        <th class="sorting" style="width: 70.2px;">Số lượng</th>
                                        <th class="sorting" style="width: 120.2px;">Giá niêm yết</th>
                                        <th class="sorting" style="width: 120.2px;">Giá bán</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${selectedProducts}" var="product">
                                        <tr>
                                            <td>
                                                <img src="../images/${product.image[0]}" style="height: 80px; width: 80px; border-radius: 10px; margin: 10px 0;">
                                            </td>
                                            <td>${product.name}</td>
                                            <td>${product.color}</td>
                                            <td>${product.quantity}</td>
                                            <td><currency:formatCurrency value="${product.originalPrice}"/>đ</td>
                                            <td>
                                                <input type="hidden" name="productId" value="${product.id}"/>
                                                <span class="discount-price" data-original-price="${product.originalPrice}"> đ</span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="row mt-3">
                                <div class="form-group col-md-4">
                                    <label for="discountType"><strong>Loại giảm giá:</strong></label>
                                    <select class="form-control" id="discountType" name="discountType">
                                        <option value="0">--Chọn loại--</option>
                                        <option value="fixed">Giảm giá cố định (VND)</option>
                                        <option value="percentage">Giảm giá theo phần trăm (%)</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="discountValue"><strong>Giá trị giảm giá:</strong></label>
                                    <input type="number" class="form-control" style="background-color: white" id="discountValue" name="discountValue" min="0" step="0.01">
                                </div>
                            </div>
                            <button class="btn btn-success" type="submit">Lưu</button>
                            <button class="btn btn-primary" type="button" onclick="window.location.href = '/Technology_Store_SWP/manager/adddiscount'">Hủy bỏ</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#discountValue').on('input', updateDiscountPrices);
            $('#discountType').on('change', toggleDiscountValueInput);
        });

        function validateForm() {
            var discountType = document.getElementById('discountType').value;
            var discountValue = parseFloat(document.getElementById('discountValue').value);

            if (discountType === "percentage" && (discountValue <= 0 || discountValue >= 99.99 || isNaN(discountValue))) {
                alert("Vui lòng nhập số hợp lệ, phần trăm giảm giá phải lớn hơn 0 và nhỏ hơn 100");
                return false;
            }

            if (discountType === "fixed" && (discountValue <= 0 || isNaN(discountValue))) {
                alert("Vui lòng nhập số tiền hợp lệ, nhỏ hơn giá niêm yết và phải lớn hơn 0");
                return false;
            }

            if (discountType === "" || discountType === "0") {
                alert("Vui lòng chọn loại giảm giá cho sản phẩm.");
                return false;
            }

            return true;
        }

        function toggleDiscountValueInput(select) {
            var discountValue = document.getElementById('discountValue');
            discountValue.value = "";
            updateDiscountPrices();
        }

        function updateDiscountPrices() {
            var discountType = document.getElementById('discountType').value;
            var discountValue = parseFloat(document.getElementById('discountValue').value);
            var discountPrices = document.getElementsByClassName('discount-price');

            for (var i = 0; i < discountPrices.length; i++) {
                var originalPrice = parseFloat(discountPrices[i].getAttribute('data-original-price'));
                var finalDiscountPrice = 0;

                if (isNaN(discountValue) || discountValue < 0) {
                    discountPrices[i].textContent = "Không hợp lệ!";
                } else {
                    if (discountType === "percentage") {
                        finalDiscountPrice = originalPrice - (originalPrice * discountValue / 100);
                    } else if (discountType === "fixed") {
                        finalDiscountPrice = originalPrice - discountValue;
                    }

                    discountPrices[i].textContent = finalDiscountPrice > 0 ? finalDiscountPrice.toFixed(2) + " đ" : "Không hợp lệ!";
                }
            }
        }
    </script>
</body>
</html>
