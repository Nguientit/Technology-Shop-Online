<%-- 
    Document   : addBlog
    Created on : Jul 16, 2024, 9:17:06 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản trị Sale</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
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

            #blogPicture {
                display: none; /* Hide the actual file input */
            }
            .form-control{
                background-color: white;
            }
        </style>
    </head>

    <body class="app sidebar-mini rtl">

        <jsp:include page="Menu.jsp"/>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item">Danh sách tin tức</li>
                    <li class="breadcrumb-item"><a href="#">Thêm tin tức mới</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Thêm tin tức mới</h3>
                        <div class="tile-body">
                            <form class="row" name="blogForm" action="addblog" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
                                <div class="form-group col-md-3">
                                    <label class="control-label">Tiêu đề<strong style="color: red">*</strong></label>
                                    <input class="form-control" type="text" name="title" id="title"/>
                                </div>

                                <div class="form-group col-md-3">
                                    <label class="control-label">Loại tin tức</label>
                                    <select class="form-control" name="btid">
                                        <option value="0">-- Chọn loại --</option>
                                        <c:forEach items="${requestScope.blogType}" var="c">
                                            <option value="${c.id}" <c:if test="${c.id == param.btid}">selected</c:if>>${c.type}</option>
                                        </c:forEach>

                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label class="control-label">Trạng thái</label><br> 
                                    <div class="d-flex align-items-center">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="status" value="1" id="statusShow" checked>
                                            <label class="form-check-label" for="statusShow">Hiện</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="status" value="0" id="statusHide">
                                            <label class="form-check-label" for="statusHide">Ẩn</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-md-12">
                                    <label class="control-label">Hình ảnh</label>
                                    <div id="myfileupload">
                                        <img id="image1" style="display: none; height: 90px; width: 90px; border-radius: 8px; margin: 10px 0px;">
                                        <label for="blogPicture" class="Choicefile">Chọn ảnh</label>
                                        <input type="file" id="blogPicture" name="image" accept=".png, .jpg, .jpeg" onchange="chooseFile(this)">
                                    </div>
                                </div>
                                
                                <div class="form-group col-md-12">
                                    <label class="control-label">Nội dung tin tức<strong style="color: red">*</strong></label>
                                    <textarea class="form-control" name="contents" id="content"></textarea>
                                    <script>CKEDITOR.replace('contents');</script>
                                </div>
                                
                                <div class="form-group col-md-6">
                                    <button class="btn btn-save" type="submit">Lưu lại</button>
                                <a class="btn btn-cancel" onclick="window.location.href = 'listnews'">Hủy bỏ</a>
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
                  alert('Chỉ cho phép các tệp .png, .jpg và .jpeg');
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

            function normalizeTitle(name) {
                return name.trim().toLowerCase().replace(/\s+/g, ''); // Remove all whitespace between words
            }

            // Extract existing titles from JSP and normalize them
            var checkBlogsTitleExist = [];
            <c:forEach items="${requestScope.blog}" var="b">
            var blogTitleNormalized = normalizeTitle("${b.title}");
            checkBlogsTitleExist.push(blogTitleNormalized);
            </c:forEach>

            function checkDuplicateBlogTitle(blogsTitle) {
                var normalizedBlogTitle = normalizeTitle(blogsTitle);
                return checkBlogsTitleExist.includes(normalizedBlogTitle);
            }

            function validateForm() {
                var blogsTitle = document.forms["blogForm"]["title"].value.trim();
                var blogsType = document.forms["blogForm"]["btid"].value;
                var blogsContent = CKEDITOR.instances['content'].getData().trim();
                var image = document.forms["blogForm"]["image"].files[0];
                // Check if title is empty
                if (blogsTitle === "") {
                    alert("Tên tiêu đề không được để trống.");
                    return false;
                }                               

                // Check if title is duplicated
                if (checkDuplicateBlogTitle(blogsTitle)) {
                    alert("Tên tiêu đề đã tồn tại.");
                    return false;
                }

                // Check if blog type is selected
                if (blogsType === "" || blogsType === "0") {
                    alert("Loại tin tức không được để trống.");
                    return false;
                }
                
                if (!image) {
                    alert("Ảnh không được để trống.");
                    return false;
                }

                // Check if content is empty
                if (blogsContent === "") {
                    alert("Nội dung không được để trống.");
                    return false;
                }

                // Gán lại giá trị tên sản phẩm chuẩn hóa (loại bỏ khoảng trắng giữa các từ)
                document.forms["blogForm"]["title"].value = blogsTitle;

                return true;
            }
        </script>
    </body>

</html>

