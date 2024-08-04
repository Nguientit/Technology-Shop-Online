<%-- 
    Document   : listBlog
    Created on : Jul 16, 2024, 8:59:35 AM
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

    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <jsp:include page="Menu.jsp"/>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách tin tức</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="addblog" title="Thêm"><i class="fas fa-plus"></i>
                                        Thêm tin tức mới</a>
                                </div>

                            </div>
                            <div id="sampleTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                <div class="row">
                                    <div class="col-sm-12 col-md-2">
                                        <div class="dataTables" style="margin-right: 30px">
                                            <form id="frmsearch" action="listnews" method="POST">
                                                <select class="form-control" id="exampleSelect1" style="height: 30px" name="btid" onchange="document.getElementById('frmsearch').submit()">
                                                    <option value="0">Tất cả</option>
                                                    <c:forEach items="${blogtype}" var="n">
                                                        <option
                                                            <c:if test="${n.id eq param.btid}"> 
                                                                selected="selected"
                                                            </c:if>
                                                            value="${n.id}"
                                                            > ${n.type}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="col-sm-12 col-md-5"></div>
                                    <!-- Search Form -->                                   
                                    <div class="col-sm-12 col-md-5">
                                        <form id="frmsearch" method="post" action="listnews" >
                                            <div id="sampleTable_filter" class="dataTables_filter">
                                                <label>Tìm kiếm:
                                                    <input type="text" class="form-control" id="searchQuery" name="searchQuery" value="${param.searchQuery}" placeholder="tiêu đề, ngày(yyyy-mm-dd)">
                                                </label>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                                            <thead>
                                                <tr role="row">
                                                    <th class="sorting" style="width: 0.2px;">Mã Số
                                                    </th>
                                                    <th class="sorting" style="width: 0.2px;">Ảnh
                                                    </th>
                                                    <th class="sorting" style="width: 40.2px;">Loại tin tức
                                                    </th>
                                                    <th class="sorting" style="width: 120.2px;">Tiêu đề
                                                    </th>
                                                    <th class="sorting" style="width: 120.2px;">Nội dung
                                                    </th>
                                                    <th class="sorting" style="width: 40.2px;">Ngày tạo 
                                                    </th>
                                                    <th class="sorting" style="width: 20.2px;">Trạng thái
                                                    </th>
                                                    <th class="sorting" style="width: 0.2px;">Chức năng
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>   
                                                <c:forEach var="blog" items="${requestScope.blog}">
                                                    <tr role="row" class="even">
                                                        <td>${blog.id}
                                                            <form id="frmDelete${blog.id}" action="deleteblog" method="POST">
                                                                <input type="hidden" name="id" value="${blog.id}"/>
                                                            </form>
                                                        </td>
                                                        <td><img src="${pageContext.request.contextPath}/images/${blog.image}" style="height: 50px; width: 80%; border-radius: 10px; margin: 0px 0;"></td>
                                                        <td>${blog.newsType.type}</td>
                                                        <td>${blog.title}</td>
                                                        
                                                            <td class="truncate-text">${blog.content}</td>
                                                        
                                                        <td>${blog.createdDate}</td>
                                                        <td style="color: ${blog.status ? 'green' : 'red'};">${blog.status ? 'Hiện' : 'Ẩn'}</td>
                                                        <td>
                                                            <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="editor1" data-toggle="modal"
                                                                    onclick="window.location.href = 'updateblog?id=${blog.id}'"><i class="fas fa-edit"></i>
                                                            </button>
                                                            <button class="btn btn-danger btn-sm trash" type="button" title="Xóa" data-id="${blog.id}"><i class="fas fa-trash-alt"></i></button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12 col-md-5"></div>
                                    <div class="col-sm-12 col-md-7">
                                        <div class="dataTables_paginate paging_simple_numbers" id="sampleTable_paginate">
                                            <ul class="pagination">
                                                <c:if test="${tag > 1}">
                                                    <li class="paginate_button page-item previous" id="sampleTable_previous">
                                                        <a href="listnews?index=${tag-1}&searchQuery=${param.searchQuery}" aria-controls="sampleTable" data-dt-idx="0" tabindex="0" class="page-link" style="color: black">Lùi</a>
                                                    </li>
                                                </c:if>

                                                <!-- Always show the first page -->
                                                <li class="paginate_button page-item ${tag == 1 ? 'active' : ''}">
                                                    <a href="listnews?index=1&searchQuery=${param.searchQuery}" aria-controls="sampleTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>
                                                </li>

                                                <!-- Show ... if current page > 4 -->
                                                <c:if test="${tag > 4}">
                                                    <li class="paginate_button page-item disabled"><a href="#" class="page-link">...</a></li>
                                                    </c:if>

                                                <!-- Show 3 pages in the middle -->
                                                <c:forEach begin="${tag - 1}" end="${tag + 1}" var="i">
                                                    <c:if test="${i > 1 && i < endP}">
                                                        <li class="paginate_button page-item ${tag == i ? 'active' : ''}">
                                                            <a href="listnews?index=${i}&searchQuery=${param.searchQuery}" aria-controls="sampleTable" data-dt-idx="${i}" tabindex="0" class="page-link">${i}</a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>

                                                <!-- Show ... if current page < endP - 3 -->
                                                <c:if test="${tag < endP - 3}">
                                                    <li class="paginate_button page-item disabled"><a href="#" class="page-link">...</a></li>
                                                    </c:if>

                                                <!-- Always show the last page -->
                                                <li class="paginate_button page-item ${tag == endP ? 'active' : ''}">
                                                    <a href="listnews?index=${endP}&searchQuery=${param.searchQuery}" aria-controls="sampleTable" data-dt-idx="${endP}" tabindex="0" class="page-link">${endP}</a>
                                                </li>

                                                <c:if test="${tag < endP}">
                                                    <li class="paginate_button page-item next" id="sampleTable_next">
                                                        <a href="listnews?index=${tag+1}&searchQuery=${param.searchQuery}" aria-controls="sampleTable" data-dt-idx="2" tabindex="0" class="page-link" style="color: black">Tiếp</a>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </div>
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
                                                                        function deleteRow(row) {
                                                                            var id = row.getAttribute('data-id');
                                                                            document.getElementById("frmDelete" + id).submit();
                                                                        }

                                                                        jQuery(function () {
                                                                            jQuery(".trash").click(function () {
                                                                                var row = this;
                                                                                swal({
                                                                                    title: "Cảnh báo",
                                                                                    text: "Bạn có chắc chắn là muốn xóa tin tức này?",
                                                                                    buttons: ["Hủy bỏ", "Đồng ý"]
                                                                                })
                                                                                        .then((willDelete) => {
                                                                                            if (willDelete) {
                                                                                                deleteRow(row);
                                                                                                swal("Đã xóa thành công!", {
                                                                                                    icon: "success"
                                                                                                });
                                                                                            }
                                                                                        });
                                                                            });
                                                                        });

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

