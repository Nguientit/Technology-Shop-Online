<%-- 
    Document   : addproduct1
    Created on : Jul 2, 2024, 2:45:18 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Quản trị Manager</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
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
        #productPicture {
            display: none; /* Hide the actual file input */
        }
        .label-picture {
            background-color: black;
            cursor: pointer;
            color: white;
            border: 1px solid #14142B;
            padding: 5px 10px;
            border-radius: 5px;
            display: inline-block;
            margin-top: 10px;
        }
        .label-picture:hover {
            background-color: #14142B;
            color: #fff;
        }
    </style>
</head>
<body class="app sidebar-mini rtl">
    <jsp:include page="Menu.jsp"/>
    <main class="app-content">
        <div class="app-title">
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item">Danh sách sản phẩm</li>
                <li class="breadcrumb-item"><a href="#">Thêm sản phẩm</a></li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <h3 class="tile-title">Tạo mới sản phẩm</h3>
                    <div class="tile-body">
                        <form class="row" name="productForm" action="addproduct" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="productName">Tên sản phẩm<span style="color: red">*</span></label>
                                <input id="productName" class="form-control" type="text" name="name">
                                <span style="color: red">${errorProductName}</span>
                            </div>
                            
                            <div class="form-group col-md-3">
                                <label for="productCategory" class="control-label">Loại sản phẩm<span style="color: red">*</span></label>
                                <select id="productCategory" class="form-control" name="cid" onchange="handleCategoryChange(this)">
                                    <option value="0">-- Chọn loại --</option>
                                    <c:forEach items="${requestScope.categorys}" var="c">
                                        <option value="${c.id}">${c.name}</option>
                                    </c:forEach>
                                    <!--<option value="other">Other...</option>-->
                                </select>
                            </div>
                            <input type="hidden" id="newCategoryName" name="newCategoryName">
                            <div class="form-group col-md-3">
                                <label for="productBrand" class="control-label">Thương hiệu sản phẩm<span style="color: red">*</span></label>
                                <select id="productBrand" class="form-control" name="bid" onchange="handleBrandChange(this)">
                                    <option value="0">-- Chọn thương hiệu --</option>
                                    <c:forEach items="${requestScope.brands}" var="b">
                                        <option value="${b.id}">${b.name}</option>
                                    </c:forEach>
                                    <!--<option value="other">Other...</option>-->
                                </select>
                                
                            </div>
                            <input type="hidden" id="newBrandName" name="newBrandName">
                            <div class="form-group col-md-12">
                                <label class="control-label" for="productPicture">Ảnh sản phẩm<span style="color: red">*</span></label>
                                <div id="myfileupload">
                                    <div class="image-container" id="imageContainer">
                                        <img id="image1" style="display: none;">
                                    </div>
                                    <label for="productPicture" class="label-picture">Chọn ảnh</label>
                                    <input type="file" id="productPicture" name="image" accept=".png, .jpg, .jpeg" onchange="chooseFile(this)">
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <button class="btn btn-save" type="submit">Lưu lại</button>
                                <a class="btn btn-cancel" href="${pageContext.request.contextPath}/manager/listproduct">Hủy bỏ</a>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <script>
        function validateForm() {
            var name = document.forms["productForm"]["name"].value;
            if (name === "") {
                swal("Lỗi", "Tên sản phẩm không được để trống", "error");
                return false;
            }
            var cid = document.forms["productForm"]["cid"].value;
            if (cid === "0") {
                swal("Lỗi", "Bạn phải chọn loại sản phẩm", "error");
                return false;
            }
            var bid = document.forms["productForm"]["bid"].value;
            if (bid === "0") {
                swal("Lỗi", "Bạn phải chọn thương hiệu sản phẩm", "error");
                return false;
            }
            var image = document.forms["productForm"]["image"].value;
            if (image === "") {
                swal("Lỗi", "Bạn phải chọn ảnh sản phẩm", "error");
                return false;
            }
            return true;
        }

        function handleCategoryChange(selectElement) {
            if (selectElement.value === "other") {
                var newCategoryName = prompt("Nhập tên loại sản phẩm mới:");
                if (newCategoryName) {
                    document.getElementById("newCategoryName").value = newCategoryName;
                    var select = document.getElementById("productCategory");
                    var option = document.createElement("option");
                    option.value = "new";
                    option.text = newCategoryName;
                    option.selected = true;
                    select.appendChild(option);
                } else {
                    selectElement.value = "0";
                }
            }
        }

        function handleBrandChange(selectElement) {
            if (selectElement.value === "other") {
                var newBrandName = prompt("Nhập tên thương hiệu sản phẩm mới:");
                if (newBrandName) {
                    document.getElementById("newBrandName").value = newBrandName;
                    var select = document.getElementById("productBrand");
                    var option = document.createElement("option");
                    option.value = "new";
                    option.text = newBrandName;
                    option.selected = true;
                    select.appendChild(option);
                } else {
                    selectElement.value = "0";
                }
            }
        }

        function chooseFile(fileInput) {
            const file = fileInput.files[0];
            const allowedExtensions = ['png', 'jpg', 'jpeg'];
            const fileExtension = file.name.split('.').pop().toLowerCase();

            if (!allowedExtensions.includes(fileExtension)) {
                alert('Chỉ cho phép các tệp .png, .jpg, và .jpeg');
                fileInput.value = ''; // reset the input value
                return;
            }

            const reader = new FileReader();
            const output = document.getElementById('image1');

            reader.onload = function () {
                output.src = reader.result;
                output.style.display = 'block';
            };

            if (file) {
                reader.readAsDataURL(file);
            }
        }
    </script>
</body>
</html>
