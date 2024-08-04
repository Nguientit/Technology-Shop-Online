<%-- 
    Document   : addproduct1
    Created on : Jul 2, 2024, 2:45:18 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Chỉnh sửa sản phẩm</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <style>
        .form-control{
                background-color: white;
            }
        </style>
    </head>
    <body class="app sidebar-mini rtl">
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
            #uploadfile, .removeimg {
                display: none;
            }
            .form-control{
                background-color: white;
            }
        </style>
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
                            <form class="row" name="productForm" action="updateproduct" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
                                <div class="form-group col-md-3">
                                    <label class="control-label">Mã sản phẩm</label>
                                    <input class="form-control" name="id" value="${requestScope.product.id}" readonly>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Tên sản phẩm</label>
                                    <input class="form-control" type="text" name="name" value="${requestScope.product.name}">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="exampleSelect1" class="control-label">Loại sản phẩm</label>
                                    <select class="form-control" id="exampleSelect1" name="cid">
                                        <c:forEach items="${requestScope.cats}" var="c">
                                            <option <c:if test="${c.id eq requestScope.product.category.id}">selected="selected"</c:if> value="${c.id}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="exampleSelect1" class="control-label">Thương hiệu sản phẩm</label>
                                    <select class="form-control" id="exampleSelect1" name="bid">
                                        <c:forEach items="${requestScope.brands}" var="b">
                                            <option <c:if test="${b.id eq requestScope.product.brand.id}">selected="selected"</c:if> value="${b.id}">${b.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-12">
                                    <label class="control-label">Ảnh sản phẩm</label>
                                    <div id="myfileupload">
                                        <input type="file" id="uploadfile" name="currentImage" accept=".png, .jpg, .jpeg" onchange="chooseFile(this)"/>
                                    </div>
                                    <div id="thumbbox">
                                        <img src="${pageContext.request.contextPath}/images/${requestScope.product.image}" alt="${requestScope.product.image}" id="image1" style="display: block; height: 90px; width: 90px; border-radius: 8px; margin: 10px 0px;" />
                                    </div>
                                    <div id="boxchoice">
                                        <a href="javascript:" class="Choicefile" onclick="document.getElementById('uploadfile').click();"><i class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
                                    </div>
                                    <!-- Thêm trường ẩn để giữ thông tin về ảnh hiện tại -->
                                    <input type="hidden" name="currentImageHidden" value="${requestScope.product.image}" />
                                </div>
                                <div class="form-group col-md-12">
                                    <button class="btn btn-save" type="submit" name="action" value="save">Lưu lại</button>
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
        <script>
            function chooseFile(fileInput) {
                const file = fileInput.files[0];
                const allowedExtensions = ['png', 'jpg', 'jpeg'];
                const fileExtension = file.name.split('.').pop().toLowerCase();

                if (!allowedExtensions.includes(fileExtension)) {
                  alert('Chỉ cho phép các tệp .png, .jpg, .jpeg');
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

                                            function normalizeProductName(name) {
                                                return name.trim().toLowerCase().replace(/\s+/g, '');
                                            }

                                            var checkProductNameExist = [];
            <c:forEach items="${requestScope.products}" var="product">
                                            var productNameNormalized = normalizeProductName("${product.name}");
                                            checkProductNameExist.push(productNameNormalized);
            </c:forEach>;

                                            function checkDuplicateProductName(productName) {
                                                var normalizedProductName = normalizeProductName(productName);
                                                return checkProductNameExist.includes(normalizedProductName);
                                            }

                                            function validateForm() {
                                                var productName = document.forms["productForm"]["name"].value.trim();
                                                var currentProductName = "${requestScope.product.name}".trim();

                                                if (productName === "") {
                                                    alert("Tên sản phẩm không được để trống.");
                                                    return false;
                                                }

                                                if (productName !== currentProductName) {
                                                    if (checkDuplicateProductName(productName)) {
                                                        alert("Tên sản phẩm đã tồn tại.");
                                                        return false;
                                                    }
                                                }


                                                document.forms["productForm"]["name"].value = productName;

                                                return true;
                                            }
        </script>
    </body>
</html>
