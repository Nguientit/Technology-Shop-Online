<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản trị Manager</title>
        <!-- Main CSS-->
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
                padding: 5px 0px;
                border-radius: 5px;
                font-weight: 500;
                align-items: center;
                justify-content: center;
            }

            .Choicefile:hover {
                text-decoration: none;
                color: white;
            }

            #productPicture {
                display: none; /* Hide the actual file input */
            }
            .form-control {
                background-color: white;
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
                    <li class="breadcrumb-item"><a href="">Chi tiết sản phẩm</a></li>
                    <li class="breadcrumb-item"><a href="#">Thêm sản phẩm chi tiết</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Tạo mới sản phẩm chi tiết</h3>
                        <div class="tile-body">
                            <form class="row" name="productForm" action="addproductdetail" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="pid" value="${productId}">
                                <div class="form-group col-md-3">
                                    <label class="control-label">Tên sản phẩm<span style="color: red">*</span></label>
                                    <input class="form-control" type="text" name="name" value="${sessionScope.pd.name}">
                                </div>

                                <div class="form-group col-md-3">
                                    <label class="control-label">Màu sắc<span style="color: red">*</span></label>
                                    <input class="form-control" type="text" name="color" value="${sessionScope.pd.color}">
                                </div>

                                <div class="form-group col-md-3">
                                    <label class="control-label">Số lượng<span style="color: red">*</span></label>
                                    <input class="form-control" type="text" name="quantity" value="${sessionScope.pd.quantity}">
                                </div>

                                <div class="form-group col-md-3">
                                    <label class="control-label">Giá niêm yết<span style="color: red">*</span></label>
                                    <input class="form-control" type="text" name="price" value="${sessionScope.pd.originalPrice}">
                                </div>

                                <div class="form-group col-md-3">
                                    <label class="control-label">Trạng thái</label>
                                    <div>
                                        <div class="form-check-inline">
                                            <input style="margin-right: 5px" type="radio" name="status" value="true" <c:if test="${sessionScope.pd.status}">checked</c:if>/> Hiện
                                            </div>
                                            <div class="form-check-inline">
                                                <input style="margin-right: 5px" type="radio" name="status" value="false" <c:if test="${!sessionScope.pd.status}">checked</c:if>/> Ẩn
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-12">
                                        <label class="control-label">Ảnh sản phẩm</label>
                                        <div id="myfileupload">
                                            <div class="image-container" id="imageContainer">
                                            <c:forEach var="image" items="${sessionScope.pd.image}">
                                                <img src="${pageContext.request.contextPath}/images/${image}" alt="${image}">
                                            </c:forEach>
                                        </div>
                                        <label for="productPicture" class="Choicefile">Chọn ảnh</label>
                                        <input id="productPicture" type="file" name="images" multiple class="form-control" accept=".png, .jpg, .jpeg" onchange="displaySelectedImages(this)">
                                        <input type="hidden" name="currentImagesValue" value="<c:forEach var='image' items='${sessionScope.pd.image}'>${image},</c:forEach>">
                                        </div>
                                    </div>

                                    <div class="form-group col-md-12">
                                        <label class="control-label">Thông số kỹ thuật<span style="color: red">*</span></label>
                                        <textarea class="form-control" type="text" name="specification">${sessionScope.pd.sepcifications}</textarea>
                                    <script>CKEDITOR.replace('specification');</script>
                                </div>

                                <div class="form-group col-md-12">
                                    <label class="control-label">Mô tả sản phẩm<span style="color: red">*</span></label>
                                    <textarea class="form-control" type="text" name="describe">${sessionScope.pd.describe}</textarea>
                                    <script>CKEDITOR.replace('describe');</script>
                                </div>

                                <div class="form-group col-md-3">
                                    <button class="btn btn-primary" style="background-color: blue; color: white" type="submit">Thêm vào danh sách</button>
                                </div>
                            </form>
                        </div>
                        <form action="addproductdetail" enctype="multipart/form-data" method="post" onsubmit="return validateSave()">
                            <div id="sampleTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                                            <thead>
                                                <tr role="row">
                                                    <th class="sorting" style="width: 50.2px;">Ảnh</th>
                                                    <th class="sorting" style="width: 100.2px;">Tên sản phẩm</th>
                                                    <th class="sorting" style="width: 50.2px;">Màu</th>
                                                    <th class="sorting" style="width: 50.2px;">Số lượng</th>
                                                    <th class="sorting" style="width: 80.2px;">Giá niêm yết</th>
                                                    <th class="sorting" style="width: 50.2px;">Trạng thái</th>
                                                    <th class="sorting" style="width: 120.2px;">Thông số kỹ thuật</th>
                                                    <th class="sorting" style="width: 120.2px;">Mô tả sản phẩm</th>
                                                    <th class="sorting" style="width: 50px;">Chức năng</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="p" items="${sessionScope.tempProductDetails}" varStatus="status">
                                                    <tr role="row" class="even">
                                                        <td>
                                                            <c:forEach var="image" items="${p.image}">
                                                                <img src="${pageContext.request.contextPath}/images/${image}" style="height: 50px; width: 50px; border-radius: 10px; margin: 0px 0;">
                                                            </c:forEach>
                                                        </td>
                                                        <td>${p.name}</td>
                                                        <td>${p.color}</td>
                                                        <td>${p.quantity}</td>
                                                        <td><currency:formatCurrency value="${p.originalPrice}" />đ</td>
                                                        <td>
                                                            <c:if test="${p.status}">
                                                                <p class="badge bg-success">Hiện</p>
                                                            </c:if>
                                                            <c:if test="${!p.status}">
                                                                <p class="badge bg-danger">Ẩn</p>
                                                            </c:if>
                                                        </td>
                                                        <td class="truncate-text">${p.sepcifications}</td>
                                                        <td class="truncate-text">${p.describe}</td>
                                                        <td>
                                                            <button class="btn btn-danger btn-sm delete" type="button" title="Xóa" onclick="deleteTempProduct(${status.index})">
                                                                <i class="fas fa-trash-alt"></i></button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <input type="hidden" name="action" value="save">
                                        <input type="hidden" name="pid" value="${productId}">
                                        <input type="hidden" id="tempProductCount" value="${fn:length(sessionScope.tempProductDetails)}">
                                        <div class="form-group">
                                            <button class="btn btn-save " type="submit">Lưu tất cả</button>
                                            <button class="btn btn-cancel" type="button" onclick="window.location.href = '/Technology_Store_SWP/manager/listproductdetails?id=${requestScope.pd.product.id}'">Hủy bỏ</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
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

            // Prepare an array to store existing colors
            var tempColors = [];

            <c:forEach items="${sessionScope.tempProductDetails}" var="tempProduct">
            tempColors.push("${tempProduct.color}".toLowerCase().trim());
            </c:forEach>;

            // Function to check for duplicate color
            function checkDuplicateColor(color) {
                return tempColors.includes(color.toLowerCase().trim());
            }

            function validateForm() {
                var productName = document.forms["productForm"]["name"].value.trim();
                var productColor = document.forms["productForm"]["color"].value.trim();
                var productQuantity = document.forms["productForm"]["quantity"].value.trim();
                var productPrice = document.forms["productForm"]["price"].value.trim();
                var productSpecification = CKEDITOR.instances['specification'].getData().trim();
                var productDescription = CKEDITOR.instances['describe'].getData().trim();
                var images = document.forms["productForm"]["images"].files;

                if (productName === "") {
                    alert("Tên sản phẩm không được để trống.");
                    return false;
                }
                if (productColor === "") {
                    alert("Màu sắc không được để trống.");
                    return false;
                }
                if (checkDuplicateColor(productColor)) {
                    alert("Màu sắc đã tồn tại trong danh sách tạm.");
                    return false;
                }
                if (productQuantity === "" || isNaN(productQuantity) || parseInt(productQuantity) <= 0) {
                    alert("Số lượng phải là số nguyên dương.");
                    return false;
                }
                if (productPrice === "" || isNaN(productPrice) || parseFloat(productPrice) <= 0) {
                    alert("Giá niêm yết phải là số lớn hơn 0.");
                    return false;
                }
                if (images.length === 0 && document.forms["productForm"]["currentImagesValue"].value === "") {
                    alert("Phải chọn ít nhất một hình ảnh.");
                    return false;
                }
                for (var i = 0; i < images.length; i++) {
                    var fileSize = images[i].size / 1024 / 1024; // in MB
                    if (fileSize > 2) {
                        alert("Kích thước ảnh không được vượt quá 2MB.");
                        return false;
                    }
                }
                if (productSpecification === "") {
                    alert("Thông số kỹ thuật không được để trống.");
                    return false;
                }
                if (productDescription === "") {
                    alert("Mô tả sản phẩm không được để trống.");
                    return false;
                }

                return true;
            }

            function validateSave() {
                var tempProductCount = document.getElementById('tempProductCount').value;
                if (parseInt(tempProductCount) === 0) {
                    alert("Bạn phải thêm ít nhất một sản phẩm vào danh sách trước khi lưu.");
                    return false;
                }
                return true;
            }

            function deleteTempProduct(index) {
                // Xác nhận việc xóa sản phẩm
                if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?')) {
                    $.ajax({
                        type: 'POST',
                        url: 'addproductdetail', // URL của servlet xử lý xóa sản phẩm
                        data: {
                            action: 'delete',
                            index: index
                        },
                        success: function (response) {
                            location.reload(); // Reload lại trang sau khi xóa thành công
                        },
                        error: function (xhr, status, error) {
                            alert('Đã xảy ra lỗi khi xóa sản phẩm.');
                        }
                    });
                }
            }

            // Function to truncate text
            function truncateText(selector, maxLength) {
                var elements = document.querySelectorAll(selector);
                elements.forEach(function(element) {
                    var text = element.innerText;
                    if (text.length > maxLength) {
                        element.innerText = text.substring(0, maxLength) + '...';
                    }
                });
            }

            // Call the truncate function on page load
            document.addEventListener('DOMContentLoaded', function() {
                truncateText('.truncate-text', 50);
            });
        </script>
    </body>
</html>
