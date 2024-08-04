<%-- 
    Document   : accountList
    Created on : Jul 10, 2024, 2:04:43 PM
    Author     : Hoang
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
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách vận chuyển</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div id="sampleTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                <div class="row">
                                    <div class="col-sm-12 col-md-6">
                                        <div class="dataTables_length" id="sampleTable_length">
                                            <form id="frmsearch" method="POST" action="listshipping" >
                                                <input type="hidden" name="action" value="Filter" />
                                                <label>   
                                                    Trạng thái: <select name="status" class="form-control form-control-sm" style="width: 100px">
                                                        <option value="0">-Trạng thái-</option>
                                                        <c:forEach items="${listStatus}" var="status">
                                                            <option value="${status.id}">${status.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <input type="submit" value="Lọc" class="btn btn-filter btn-sm"/>
                                                </label>
                                            </form>
                                        </div>
                                    </div>

                                    <!-- Search Form -->                                   
                                    <div class="col-sm-12 col-md-6">
                                        <form id="frmsearch" method="POST" action="listshipping" >
                                            <div id="sampleTable_filter" class="dataTables_filter">
                                                <label>Tìm kiếm:
                                                    <input type="hidden" name="action" value="Search" />
                                                    <input type="number" name="search" class="form-control form-control-sm" placeholder="Tìm kiếm đơn hàng" value="${search}">
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
                                                    <th class="sorting" style="width: 10px;">Mã số</th>
                                                    <th class="sorting" style="width: 100px;">Trạng thái</th>
                                                    <th class="sorting" style="width: 200px;">Địa chỉ giao hàng</th>
                                                    <th class="sorting" style="width: 110px;">Số điện thoại giao hàng</th>
                                                    <th class="sorting" style="width: 100px;">Tên người nhận</th>
                                                    <th class="sorting" style="width: 110px;">Phương thức thanh toán</th>
                                                    <th class="sorting" style="width: 300px;">Chức năng</th>
                                                </tr>
                                            </thead>
                                            <tbody>   
                                                <c:forEach items="${orders}" var="ord">
                                                    <tr role="row" class="even">

                                                        <td>${ord.id}
                                                            <form id="frmDelete${ord.id}" action="deleteorder" method="GET">
                                                                <input type="hidden" name="orderid" value="${ord.id}"/>
                                                            </form>
                                                        </td>
                                                        <td>
                                                            <c:forEach items="${listStatus}" var="sta">
                                                                <c:if test="${sta.id eq ord.status.id}">${sta.name}</c:if>
                                                            </c:forEach>
                                                        </td>
                                                        <td>${ord.deliveryAddress}</td>
                                                        <td>${ord.deliveryPhone}</td>
                                                        <td>${ord.recipientName}</td>
                                                        <td>${ord.payment}</td>
                                                        <td>
<!--                                                            <button class="btn btn-primary btn-sm" type="button" title="Sửa" id="editor1" data-toggle="modal"
                                                                    onclick="window.location.href = 'updateorder?orderId=${ord.id}'">
                                                                <i class="fas fa-edit"></i>
                                                            </button>-->
                                                            <button class="btn btn-danger btn-sm trash" type="button" title="Xóa" data-id="${ord.id}">
                                                                <i class="fas fa-trash-alt"></i>
                                                            </button>
                                                            <button class="btn btn-info  btn-sm edit" type="button" title="Xem" data-id="${ord.id}" data-toggle="modal" data-target="#updateDiscountModal">
                                                                <i class="fas fa-eye"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <c:forEach begin="1" end="${endPage}" var="i">
                                            <button class="btn btn-primary btn-sm eye">
                                                <a href="listaccount?index=${i}&search=${search}">${i}</a>
                                            </button>
                                        </c:forEach>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <div class="modal fade" id="updateDiscountModal" tabindex="-1" role="dialog" aria-labelledby="updateDiscountModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <!--                    <div class="modal-header">
                                            <h5 class="modal-title" id="updateDiscountModalLabel">Update Discount</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>-->
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group  col-md-12">
                                <span class="thong-tin-thanh-toan">
                                    <h5>Thông tin chi tiết đơn hàng</h5>
                                </span>
                            </div>
                        </div>
                        <form id="updateDiscountForm" action="updateorder" method="POST" onsubmit="return validateForm()">
                            <input type="hidden" name="action" id="action" value="view"/>
                            <div class="form-group">
                                <label for="productId">Mã Số</label>
                                <input type="text" class="form-control" id="orderId" name="orderId" readonly>
                            </div>
                            <div class="form-group">
                                <label for="productId">Địa chỉ giao hàng</label>
                                <input type="text" class="form-control" id="orderAddress" name="orderAddress" readonly>
                            </div>
                            <div class="form-group">
                                <label for="productId">Số điện thoại giao hàng</label>
                                <input type="text" class="form-control" id="orderPhone" name="orderPhone" readonly>
                            </div>
                            <div class="form-group">
                                <label for="currentDiscountPrice">Tên người nhận</label>
                                <input type="text" class="form-control" id="orderName" name="orderName" readonly>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="productName">Trạng thái</label>
                                        <select class="form-control" id="orderStatus" name="orderStatus">
                                            <c:forEach items="${listStatus}" var="status">
                                                <option value="${status.name}" >${status.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="productColor">Phương thức thanh toán</label>
                                        <input type="text" class="form-control" id="orderPayment" name="orderPayment" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-save">Cập nhật</button>
                                <button type="button" class="btn btn-cancel" data-dismiss="modal">Hủy bỏ</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

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
        <script>
                            // Function to populate the modal with data
                            document.querySelectorAll('.edit').forEach(button => {
                                button.addEventListener('click', () => {
                                    const id = button.getAttribute('data-id');
                                    const row = button.closest('tr');
                                    const orderId = row.querySelector('td:nth-child(1)').textContent.trim();
                                    const orderStatus = row.querySelector('td:nth-child(2)').textContent.trim();
                                    const orderAddress = row.querySelector('td:nth-child(3)').textContent.trim();
                                    const orderPhone = row.querySelector('td:nth-child(4)').textContent.trim();
                                    const orderName = row.querySelector('td:nth-child(5)').textContent.trim();
                                    const orderPayment = row.querySelector('td:nth-child(6)').textContent.trim();

                                    document.getElementById('orderId').value = orderId;
                                    document.getElementById('orderAddress').value = orderAddress;
                                    document.getElementById('orderPhone').value = orderPhone;
                                    document.getElementById('orderName').value = orderName;
                                    document.getElementById('orderStatus').value = orderStatus;
                                    document.getElementById('orderPayment').value = orderPayment;
                                });
                            });

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
                                tmp = '<span class="date"> ' + today + ' - ' + nowTime + '</span>';
                                document.getElementById("clock").innerHTML = tmp;
                                clocktime = setTimeout("time()", "1000", "Javascript");

                                function checkTime(i) {
                                    if (i < 10) {
                                        i = "0" + i;
                                    }
                                    return i;
                                }
                            }

                            function toggleSelectAll(selectAllCheckbox) {
                                var checkboxes = document.getElementsByName('selectedProducts');
                                for (var i = 0; i < checkboxes.length; i++) {
                                    checkboxes[i].checked = selectAllCheckbox.checked;
                                }
                            }
        </script>
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
                        text: "Bạn có chắc chắn là muốn xóa đơn hàng này?",
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
