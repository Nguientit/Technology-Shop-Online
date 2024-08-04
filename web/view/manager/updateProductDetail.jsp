<%-- 
    Document   : updateProductDetail_1
    Created on : Jul 4, 2024, 9:52:46 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cập nhật sản phẩm</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
        <style>
            .Choicefile {
                display: block;
                background: #14142B;
                border: 1px solid #fff;
                color: #fff;
                width: 150px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                padding: 10px 0;
                border-radius: 5px;
                font-weight: 500;
                margin: 10px 0;
                align-self: center;
            }

            .Choicefile:hover {
                text-decoration: none;
                color: white;
                background-color: #282846;
            }

            #productPicture {
                display: none;
            }

            .image-container {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
            }

            .image-container img {
                height: 90px;
                width: 90px;
                border-radius: 8px;
                margin: 5px;
                object-fit: cover;
            }
        </style>
    </head>
    <body class="app sidebar-mini rtl">
        <jsp:include page="Menu.jsp"/>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item">Danh sách sản phẩm</li>
                    <li class="breadcrumb-item"><a href="#">Chỉnh sửa sản phẩm</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Chỉnh sửa sản phẩm</h3>
                        <div class="tile-body">
                            <form class="row" name="productForm" action="updateproductdetail" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
                                <div class="form-group col-md-3">
                                    <label class="control-label">Mã sản phẩm </label>
                                    <input class="form-control" readonly type="text" name="pdid" value="${requestScope.productdetail.id}">
                                </div>

                                <input type="hidden" name="pid" value="${requestScope.productdetail.product.id}">

                                <div class="form-group col-md-3">
                                    <label class="control-label">Tên sản phẩm</label>
                                    <input class="form-control" type="text" name="name" id="productName" value="${requestScope.productdetail.name}">
                                </div>

                                <div class="form-group col-md-3">
                                    <label class="control-label">Màu sản phẩm</label>
                                    <input class="form-control" type="text" name="color" id="productColor" value="${requestScope.productdetail.color}">
                                </div>

                                <div class="form-group col-md-3">
                                    <label class="control-label">Số lượng</label>
                                    <input class="form-control" type="number" name="quantity" id="productQuantity" value="${requestScope.productdetail.quantity}">
                                </div>

                                <div class="form-group col-md-3">
                                    <label class="control-label">Giá niêm yết</label>
                                    <input class="form-control" type="text" name="price" id="productPrice" value="<fmt:formatNumber value="${requestScope.productdetail.originalPrice}" type="number" minFractionDigits="0" maxFractionDigits="0"/>">
                                </div>

                                <div class="form-group col-md-3">
                                    <label class="control-label">Trạng thái</label>
                                    <div class="row-cols-md-3">
                                        <div class="form-check-inline">
                                            <input class="form-check-input" type="radio" name="status" id="statusVisible" value="true" <c:if test="${requestScope.productdetail.status}"> checked="checked"</c:if>>
                                                <label class="form-check-label" for="statusVisible">Hiện</label>
                                            </div>
                                            <div class="form-check-inline">
                                                <input class="form-check-input" type="radio" name="status" id="statusHidden" value="false" <c:if test="${!requestScope.productdetail.status}"> checked="checked"</c:if>>
                                                <label class="form-check-label" for="statusHidden">Ẩn</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-12">
                                        <label class="control-label">Ảnh sản phẩm</label>
                                        <div id="myfileupload">
                                            <div class="image-container" id="imageContainer">
                                            <c:forEach var="image" items="${requestScope.productdetail.image}">
                                                <img src="../images/${image}" alt="${image}">
                                            </c:forEach>
                                        </div>
                                        <label for="productPicture" class="Choicefile">Chọn ảnh</label>
                                        <input id="productPicture" type="file" name="images" multiple class="form-control" accept=".png, .jpg, .jpeg" onchange="displaySelectedImages(this)">
                                        <input type="hidden" name="currentImages" value="<c:forEach var='image' items='${requestScope.productdetail.image}'>${image},</c:forEach>">
                                        </div>
                                    </div>

                                    <div class="form-group col-md-12">
                                        <label class="control-label">Thông số kỹ thuật</label>
                                        <textarea class="form-control" name="specification" id="productSpecifications">${requestScope.productdetail.sepcifications}</textarea>
                                    <script>CKEDITOR.replace('specification');</script>
                                </div>

                                <div class="form-group col-md-12">
                                    <label class="control-label">Mô tả sản phẩm</label>
                                    <textarea class="form-control" name="describe" id="productDescription">${requestScope.productdetail.describe}</textarea>
                                    <script>CKEDITOR.replace('describe');</script>
                                </div>

                                <div class="form-group col-md-3 mb-2">
                                    <button class="btn btn-save" type="submit">Lưu lại</button>
                                    <button class="btn btn-cancel" type="button" onclick="window.location.href = '/Technology_Store_SWP/manager/listproductdetails?id=${requestScope.productdetail.product.id}'">Hủy bỏ</button>
                                </div>    
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>

        <script>
                                        function validateForm() {
                                            var productName = document.forms["productForm"]["name"].value.trim().replace(/\s+/g, ' ');
                                            var price = document.forms["productForm"]["price"].value.replace(/\./g, '');
                                            var quantity = document.forms["productForm"]["quantity"].value;
                                            var images = document.forms["productForm"]["images"].files;
                                            var color = document.forms["productForm"]["color"].value.trim().toLowerCase();

                                            var validColors = ["đỏ", "xanh", "xanh lá", "xanh dương", "vàng", "đen", "trắng", "tím", "cam", "hồng", "xám", "nâu", "lam", "xanh lục"];

                                            if (color === "") {
                                                alert("Màu không được để trống");
                                                return false;
                                            }

                                            if (!validColors.includes(color)) {
                                                var userConfirmed = confirm("Màu sản phẩm không nằm trong danh sách các màu hợp lệ. Bạn có chắc chắn muốn tiếp tục?");
                                                if (!userConfirmed) {
                                                    return false;
                                                }
                                            }
                                            if (productName === "") {
                                                alert("Tên Sản Phẩm không được để trống.");
                                                return false;
                                            }

                                            if (isNaN(price) || parseFloat(price) <= 0 || /^0/.test(price) || price === "") {
                                                alert("Giá sản phẩm không hợp lệ và phải lớn hơn 0, không được bắt đầu bằng số 0.");
                                                return false;
                                            }

                                            if (isNaN(quantity) || parseInt(quantity) <= 0 || quantity === "") {
                                                alert("Số lượng sản phẩm không hợp lệ, không được để trống và phải lớn hơn 0.");
                                                return false;
                                            }

                                            // Ensure at least one image is selected if no current images
                                            if (images.length === 0 && document.forms["productForm"]["currentImages"].value === "") {
                                                alert("Hình ảnh không được để trống.");
                                                return false;
                                            }

                                            document.forms["productForm"]["price"].value = price;
                                            document.forms["productForm"]["name"].value = productName;

                                            return true;
                                        }

//                                        function displaySelectedImages(input) {
//                                            var imageContainer = document.getElementById('imageContainer');
//                                            imageContainer.innerHTML = "";  // Clear existing images
//                                            for (var i = 0; i < input.files.length; i++) {
//                                                var reader = new FileReader();
//                                                reader.onload = function (e) {
//                                                    var img = document.createElement('img');
//                                                    img.src = e.target.result;
//                                                    imageContainer.appendChild(img);
//                                                };
//                                                reader.readAsDataURL(input.files[i]);
//                                            }
//                                        }
                                        function displaySelectedImages(input) {
            var imageContainer = document.getElementById('imageContainer');
            imageContainer.innerHTML = "";  // Clear existing images
            const allowedExtensions = ['png', 'jpg', 'jpeg'];

            for (var i = 0; i < input.files.length; i++) {
                var file = input.files[i];
                var fileExtension = file.name.split('.').pop().toLowerCase();

                if (!allowedExtensions.includes(fileExtension)) {
                    alert('Chỉ cho phép các tệp .png, .jpg và .jpeg');
                    input.value = '';  // reset the input value
                    imageContainer.innerHTML = "";  // Clear existing images if any invalid file
                    return;
                }

                var reader = new FileReader();
                reader.onload = function (e) {
                    var img = document.createElement('img');
                    img.src = e.target.result;
                    imageContainer.appendChild(img);
                };
                reader.readAsDataURL(file);
            }
        }
        </script>
    </body>
</html>
