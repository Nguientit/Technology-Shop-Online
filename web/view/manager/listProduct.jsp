<%-- 
    Document   : addProduct
    Created on : Jul 2, 2024, 1:41:07 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Danh sách sản phẩm</title>
        <meta charset="utf-8">
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
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách sản phẩm</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">

                                    <a class="btn btn-add btn-sm" href="${pageContext.request.contextPath}/manager/addproduct" title="Thêm"><i class="fas fa-plus"></i>
                                        Tạo mới sản phẩm</a>
                                </div>
                            </div>
                            <div id="sampleTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                <div class="row">
                                    <div class="col-sm-12 col-md-6"></div>

                                    <!-- Search Form -->                                   
                                    <div class="col-sm-12 col-md-6">
                                        <form name="productFor" id="frmsearch" method="post" action="listproduct" onsubmit="return validateForm()" >
                                            <div id="sampleTable_filter" class="dataTables_filter">
                                                <label>Tìm kiếm:
                                                    <input type="hidden" name="currentSearch" value="${param.search}" />
                                                    <input type="text" name="search" class="form-control form-control-sm" placeholder="Tên sản phẩm" aria-controls="sampleTable" value="${param.search}">
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
                                                    <th class="sorting" style="width: 30.2px;">Mã số
                                                    </th>
                                                    <th class="sorting" style="width: 210.2px;">Tên sản phẩm
                                                    </th>
                                                    <th class="sorting" style="width: 50.2px;">Ảnh
                                                    </th>
                                                    <th class="sorting" style="width: 120.2px;">Loại sản phẩm
                                                    </th>
                                                    <th class="sorting" style="width: 120.2px;">Tên thương hiệu
                                                    </th>
                                                    <th class="sorting" style="width: 100.2px;">Ngày đăng
                                                    </th>
                                                    <th class="sorting" style="width: 78px;">Chức năng
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>   
                                                <c:forEach items="${requestScope.products}" var="p">
                                                    <tr role="row" class="even">
                                                        <td>${p.id}
                                                            <form id="frmDelete${p.id}" action="deleteproduct" method="POST">
                                                                <input type="hidden" name="id" value="${p.id}"/>
                                                            </form>
                                                        </td>
                                                        <td>${p.name}</td>
                                                        <td><img src="../images/${p.image}" style="height: 50px; width: 50px; border-radius: 10px; margin: 0px 0;"></td>
                                                        <td>${p.category.name}</td>
                                                        <td>${p.brand.name}</td>
                                                        <td>${p.dateUpdate}</td>
                                                        <td>
                                                            <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="editor1" data-toggle="modal"
                                                                    onclick="window.location.href = 'updateproduct?id=${p.id}'"><i class="fas fa-edit"></i>
                                                            </button>
                                                            <button class="btn btn-danger btn-sm trash" type="button" title="Xóa" data-id="${p.id}"><i class="fas fa-trash-alt"></i></button>
                                                            <button class="btn btn-info btn-sm eye" type="button" title="Chi tiết" id="show-emp" data-toggle="modal"
                                                                    onclick="window.location.href = 'listproductdetails?id=${p.id}'"><i class="fas fa-eye"></i>
                                                            </button>
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
                                                        <a href="listproduct?index=${tag-1}&search=${param.search}" aria-controls="sampleTable" data-dt-idx="0" tabindex="0" class="page-link" style="color: black">Lùi</a>
                                                    </li>
                                                </c:if>

                                                <!-- Always show the first page -->
                                                <li class="paginate_button page-item ${tag == 1 ? 'active' : ''}">
                                                    <a href="listproduct?index=1&search=${param.search}" aria-controls="sampleTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>
                                                </li>

                                                <!-- Show ... if current page > 4 -->
                                                <c:if test="${tag > 4}">
                                                    <li class="paginate_button page-item disabled"><a href="#" class="page-link">...</a></li>
                                                    </c:if>

                                                <!-- Show 3 pages in the middle -->
                                                <c:forEach begin="${tag - 1}" end="${tag + 1}" var="i">
                                                    <c:if test="${i > 1 && i < endP}">
                                                        <li class="paginate_button page-item ${tag == i ? 'active' : ''}">
                                                            <a href="listproduct?index=${i}&search=${param.search}" aria-controls="sampleTable" data-dt-idx="${i}" tabindex="0" class="page-link">${i}</a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>

                                                <!-- Show ... if current page < endP - 3 -->
                                                <c:if test="${tag < endP - 3}">
                                                    <li class="paginate_button page-item disabled"><a href="#" class="page-link">...</a></li>
                                                    </c:if>

                                                <!-- Always show the last page -->
                                                <li class="paginate_button page-item ${tag == endP ? 'active' : ''}">
                                                    <a href="listproduct?index=${endP}&search=${param.search}" aria-controls="sampleTable" data-dt-idx="${endP}" tabindex="0" class="page-link">${endP}</a>
                                                </li>

                                                <c:if test="${tag < endP}">
                                                    <li class="paginate_button page-item next" id="sampleTable_next">
                                                        <a href="listproduct?index=${tag+1}&search=${param.search}" aria-controls="sampleTable" data-dt-idx="2" tabindex="0" class="page-link" style="color: black">Tiếp</a>
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

        <!-- Essential javascripts for application to work-->
        <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">
            $('#sampleTable').DataTable();
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
                        tmp = '<span class="date"> ' + today + ' - ' + nowTime +'</span>';
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
        <script>
            function validateForm() {
                var searchInput = document.forms["productForm"]["search"];
                var searchValue = searchInput.value.trim();
                searchValue = searchValue.replace(/\s+/g, ' ');

                searchInput.value = searchValue;
                return true;
            }

            function deleteRow(row) {
                var id = row.getAttribute('data-id');
                document.getElementById("frmDelete" + id).submit();
            }

            jQuery(function () {
                jQuery(".trash").click(function () {
                    var row = this;
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
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
        </script>
    </body>

</html>
