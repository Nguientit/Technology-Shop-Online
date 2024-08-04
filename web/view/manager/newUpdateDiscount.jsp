<%-- 
    Document   : newUpdateDiscount
    Created on : Jul 26, 2024, 4:07:39 PM
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
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
</head>

<body onload="time()" class="app sidebar-mini rtl">
    <jsp:include page="Menu.jsp"/>
    <main class="app-content">
        <div class="app-title">
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item">Danh sách sản phẩm khuyến mại</li>
                <li class="breadcrumb-item"><a href="#">Chỉnh sửa giá khuyến mại</a></li>
            </ul>
        </div>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <h3 class="tile-title">Thêm giá khuyến mãi cho sản phẩm</h3>
                    <div class="tile-body">
                        <form name="productForm" method="post" action="updatediscount" onsubmit="return validateForm()">
                            <input type="hidden" name="action" value="savediscount"/>
                            <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                                <thead>
                                    <tr role="row">
                                        <th class="sorting" style="width: 0.2px;">Mã</th>
                                        <th class="sorting" style="width: 40.2px;">Ảnh</th>
                                        <th class="sorting" style="width: 120.2px;">Tên sản phẩm</th>
                                        <th class="sorting" style="width: 70.2px;">Màu sản phẩm</th>
                                        <th class="sorting" style="width: 70.2px;">Số lượng</th>
                                        <th class="sorting" style="width: 120.2px;">Giá niêm yết</th>
                                        <th class="sorting" style="width: 120.2px;">Giá bán</th>
                                    </tr>
                                </thead>
                                <tbody>   
                                    <c:forEach items="${selectedDiscounts}" var="p">
                                        <tr role="row" class="even">
                                            <td>
                                                ${p.pd.id}
                                                <input type="hidden" name="discountId" value="${p.id}"/>
                                                <!-- Lưu giá niêm yết trong thẻ ẩn -->
                                                <input type="hidden" id="originalPrice" value="${p.pd.originalPrice}"/>
                                            </td>
                                            <td><img src="../images/${p.pd.image[0]}" style="height: 50px; width: 50px; border-radius: 10px; margin: 0px 0;"></td>
                                            <td>${p.pd.name}</td>
                                            <td>${p.pd.color}</td>
                                            <td>${p.pd.quantity}</td>
                                            <td><currency:formatCurrency value="${p.pd.originalPrice}"/>đ</td>
                                            <td><currency:formatCurrency value="${p.priceDiscount}"/>đ</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="row mt-3">
                                <div class="form-group col-md-4">
                                    <label for="discountType">Loại giảm giá:</label>
                                    <select id="discountType" name="discountType" class="form-control" required>
                                        <option value="fixed">Giảm giá cố định (VND)</option>
                                        <option value="percentage">Giảm giá theo phần trăm (%)</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="discountValue">Giá trị giảm giá:</label>
                                    <input id="discountValue" type="number" name="discountValue" class="form-control" required/>
                                </div>
                            </div>
                            <button class="btn btn-success " type="submit">Lưu</button>
                            <button class="btn btn-primary  " type="button" onclick="window.location.href = '/Technology_Store_SWP/manager/listdiscount'">Hủy bỏ</button>
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
        function validateForm() {
            var discountType = document.getElementById('discountType').value;
            var discountValue = parseFloat(document.getElementById('discountValue').value);
            var originalPrice = parseFloat(document.getElementById('originalPrice').value);

            if (isNaN(discountValue) || discountValue <= 0) {
                alert("Giá trị giảm giá phải là số dương lớn hơn 0.");
                return false;
            }

            if (discountType === "fixed") {
                if (discountValue >= originalPrice) {
                    alert("Số tiền giảm giá phải nhỏ hơn giá hiện tại.");
                    return false;
                }
            } else if (discountType === "percentage") {
                if (discountValue < 1 || discountValue > 100) {
                    alert("Giá trị giảm giá theo phần trăm phải từ 1 đến 100.");
                    return false;
                }
            }

            return true;
        }
    </script>
</body>

</html>



