<%-- 
    Document   : top10Blogs
    Created on : Jul 16, 2024, 10:50:09 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản trị Sale </title>
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

    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <jsp:include page="Menu.jsp"/>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>10 bài tin tức mới nhất</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                            </div>
                            <div id="sampleTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                                            <thead>
                                                <tr role="row">
                                                    <th class="sorting" style="width: 0.2px;">Mã Số
                                                    </th>
                                                    <th class="sorting" style="width: 0.2px;">Ảnh
                                                    </th>
                                                    <th class="sorting" style="width: 50.2px;">Loại tin tức
                                                    </th>
                                                    <th class="sorting" style="width: 90.2px;">Tiêu đề
                                                    </th>
                                                    <th class="sorting" style="width: 120.2px;">Nội dung
                                                    </th>
                                                    <th class="sorting" style="width: 50.2px;">Ngày tạo 
                                                    </th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>   
                                                <c:forEach var="blog" items="${requestScope.top10Blogs}">
                                                    <tr role="row" class="even">
                                                        <td>${blog.id}</td>
                                                        <td><img src="${pageContext.request.contextPath}/images/${blog.image}" style="height: 50px; width: 80%; border-radius: 10px; margin: 0px 0;"></td>
                                                        <td>${blog.newsType.type}</td>
                                                        <td>${blog.title}</td>
                                                        <td>
                                                            <span id="email-cell" class="blog-content" data-content="${blog.content}"></span>
                                                        </td>
                                                        <td>${blog.createdDate}</td>
                                                        
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        
        <script>

            // Thêm một sự kiện chạy khi DOM được tải
            document.addEventListener("DOMContentLoaded", function () {
                // Truy xuất lấy toàn bộ nội dung
                var contentElements = document.querySelectorAll(".blog-content");
                contentElements.forEach(function (el) {
                    var fullContent = el.getAttribute("data-content");
                    // Tạo thẻ div .innerHTML loại bỏ các thẻ html 
                    var tempDiv = document.createElement("div");
                    tempDiv.innerHTML = fullContent;
                    // Trích xuất nội dung bằng tempDiv or innerText
                    var textContent = tempDiv.textContent || tempDiv.innerText || "";
                    // Chia nội dung bằng các ký tự dòng mới và lấy dòng đầu tiên của nội dung 
                    var firstLine = textContent.split('\n')[0];
                    // Giới hạn hiển thị chỉ 50 ký tự
                    if (firstLine.length > 50) {
                        firstLine = firstLine.substring(0, 50) + '...';
                    }
                    el.textContent = firstLine;
                });
            });
        </script>
        <script type="text/javascript">
            //Thời Gian
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
                tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                        '</span>';
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


