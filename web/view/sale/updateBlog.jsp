<%-- 
    Document   : updateBlog
    Created on : Jul 16, 2024, 9:44:25 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
                    <li class="breadcrumb-item"><a href="#">Chỉnh sửa tin tức</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Chỉnh sửa tin tức</h3>
                        <div class="tile-body">
                            <form class="row" name="blogForm" id="blogForm" action="updateblog" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
                                <div class="form-group col-md-2">
                                    <label class="control-label">Mã số</label>
                                    <input class="form-control" name="id" value="${requestScope.blog.id}" readonly/>
                                </div>
                                
                                <div class="form-group col-md-4">
                                    <label class="control-label">Tiêu đề<strong style="color: red">*</strong></label>
                                    <input class="form-control" type="text" name="title" value="${requestScope.blog.title}"/>
                                </div>
                                
                                <div class="form-group col-md-4">
                                    <label class="control-label">Loại tin tức</label>
                                    <select class="form-control" name="btid">
                                        <c:forEach items="${requestScope.blogType}" var="bt">
                                            <option
                                                <c:if test="${bt.id eq requestScope.blog.newsType.id}">
                                                    selected="selected"
                                                </c:if>
                                                value="${bt.id}">${bt.type}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <div class="form-group col-md-2">
                                    <label class="control-label">Trạng thái</label><br> 
                                    <div class="d-flex align-items-center mt-1">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="status" value="true" id="statusShow"
                                                   <c:if test="${requestScope.blog.status}"> checked="checked"</c:if>>
                                                   <label class="form-check-label" for="statusShow">Hiện</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="status" value="false" id="statusHide"
                                                <c:if test="${!requestScope.blog.status}"> checked="checked"</c:if>>
                                                <label class="form-check-label" for="statusHide">Ẩn</label>
                                            </div>
                                        </div>
                                </div>
                                                
                                <div class="form-group col-md-12">
                                        <label class="control-label">Hình Ảnh</label>
                                        <div id="myfileupload">
                                            <input type="file" id="uploadfile" name="currentImage" accept=".png, .jpg, .jpeg" onchange="chooseFile(this)"/>
                                        </div>
                                        <div id="thumbbox">
                                            <img src="${pageContext.request.contextPath}/images/${requestScope.blog.image}" alt="${requestScope.blog.image}" id="image1" style="display: block; height: 90px; width: 90px; border-radius: 8px; margin: 10px 0px;" />
                                    </div>
                                    <div id="boxchoice">
                                        <a href="javascript:" class="Choicefile" onclick="document.getElementById('uploadfile').click();"><i class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
                                    </div>
                                    <!-- Thêm trường ẩn để giữ thông tin về ảnh hiện tại -->
                                    <input type="hidden" name="currentImageHidden" value="${requestScope.blog.image}" />
                                </div>
                                
                                <div class="form-group col-md-12">
                                    <label class="control-label">Nội dung tin tức<strong style="color: red">*</strong></label>
                                    <textarea class="form-control" name="contents" id="content">${requestScope.blog.content}</textarea>
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
                  alert('Only .png, .jpg, and .jpeg files are allowed');
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
            var currentBlogId = "${requestScope.blog.id}";
            var checkBlogsTitleExist = [];
            <c:forEach items="${requestScope.blogs}" var="b">
            if ("${b.id}" !== currentBlogId) {
                var blogTitleNormalized = normalizeTitle("${b.title}");
                checkBlogsTitleExist.push(blogTitleNormalized);
            }
            </c:forEach>

            function checkDuplicateBlogTitle(blogsTitle) {
                var normalizedBlogTitle = normalizeTitle(blogsTitle);
                return checkBlogsTitleExist.includes(normalizedBlogTitle);
            }

            function validateForm() {
                var blogsTitle = document.forms["blogForm"]["title"].value.trim();
                var blogsType = document.forms["blogForm"]["btid"].value;
                var blogsContent = CKEDITOR.instances['content'].getData().trim();
                var image = document.forms["blogForm"]["currentImageHidden"].value;

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
                    alert("Tên loại không được để trống.");
                    return false;
                }

                // Check if content is empty
                if (blogsContent === "") {
                    alert("Nội dung không được để trống.");
                    return false;
                }
                
                //Check if img is empty
                if(image === ""){
                    alert("Ảnh không được để trống.");
                    return false;
                }

                // Gán lại giá trị tên sản phẩm chuẩn hóa (loại bỏ khoảng trắng giữa các từ)
                document.forms["blogForm"]["title"].value = blogsTitle;

                return true;
            }
        </script>
    </body>
</html>
