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
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách tài khoản</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">

                                    <a class="btn btn-add btn-sm" href="${pageContext.request.contextPath}/admin/addaccount" title="Thêm"><i class="fas fa-plus"></i>
                                        Tạo mới tài khoản</a>
                                </div>
                            </div>
                            <div id="sampleTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                <div class="row">
                                    <div class="col-sm-12 col-md-6">
                                        <div class="dataTables_length" id="sampleTable_length">
                                            <form id="frmsearch" method="POST" action="listaccount" >
                                                <input type="hidden" name="action" value="Filter" />
                                                <label>   
                                                    Vai trò: <select name="role" class="form-control form-control-sm" style="width: 100px">
                                                        <option value="0">-Vai trò-</option>
                                                        <c:forEach items="${roles}" var="role">
                                                            <option value="${role.id}">${role.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                    Trạng thái: <select name="status" class="form-control form-control-sm" style="width: 150px">
                                                        <option value="-1">-Trạng thái-</option>
                                                        <option value="1">Hoạt động</option>
                                                        <option value="0">Dừng hoạt động</option>
                                                    </select>
                                                    <input type="submit" value="Lọc" class="btn btn-filter btn-sm"/>
                                                </label>
                                            </form>
                                        </div>
                                    </div>

                                    <!-- Search Form -->                                   
                                    <div class="col-sm-12 col-md-6">
                                        <form id="frmsearch" method="POST" action="listaccount" >
                                            <div id="sampleTable_filter" class="dataTables_filter">
                                                <label>Tìm kiếm:
                                                    <input type="hidden" name="action" value="Search" />
                                                    <input type="text" name="search" class="form-control form-control-sm" placeholder="Tìm kiếm tài khoản" value="${search}">
                                                </label>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                                            <thead>
                                                <tr role="row">s
                                                    <th class="sorting" style="width: 10px;">STT</th>
                                                    <th class="sorting" style="width: 150px;">Tên Tài Khoản</th>
                                                    <th class="sorting" style="width: 300px;">Email</th>
                                                    <th class="sorting" style="width: 100px;">Vai Trò</th>
                                                    <th class="sorting" style="width: 100px;">Trạng Thái</th>
                                                    <th class="sorting" style="width: 300px;">Chức Năng</th>
                                                </tr>
                                            </thead>
                                            <tbody>   
                                                <%int no = 1;%>
                                                <c:forEach items="${requestScope.accounts}" var="acc">
                                                    <tr role="row" class="even">

                                                        <td><%= no %><%no++;%>
                                                            <input type="hidden" name="userName" id="userName${acc.id}" value="${acc.user.name}"/>
                                                            <input type="hidden" name="userDob" id="userDob${acc.id}" value="${acc.user.dob}"/>
                                                            <input type="hidden" name="userGender" id="userGender${acc.id}" value="${acc.user.gender}"/>
                                                            <input type="hidden" name="userGmail" id="userGmail${acc.id}" value="${acc.user.email}"/>
                                                            <input type="hidden" name="userAddress" id="userAddress${acc.id}" value="${acc.user.address}"/>
                                                            <input type="hidden" name="userPhone" id="userPhone${acc.id}" value="${acc.user.phone}"/>
                                                            <form id="frmDelete${acc.id}" action="deleteaccount" method="GET">
                                                                <input type="hidden" name="accountID" value="${acc.id}"/>
                                                            </form>
                                                        </td>
                                                        <td>${acc.username}</td>
                                                        <td>${acc.user.email}</td>
                                                        <td>
                                                            <input type="hidden" id="roleID${acc.id}" name="roleID" value="${acc.role.id}"/>
                                                            <c:if test="${acc.role.name eq 'Customer'}">Khách hàng</c:if>
                                                            <c:if test="${acc.role.name eq 'Admin'}">Quản trị</c:if>
                                                            <c:if test="${acc.role.name eq 'Manager'}">Quản lý</c:if>
                                                            <c:if test="${acc.role.name eq 'Sale'}">Bán hàng</c:if>
                                                            <c:if test="${acc.role.name eq 'Deliver'}">Giao hàng</c:if>
                                                            </td>
                                                            <td>
                                                            <c:if test="${acc.status}">Hoạt động</c:if>
                                                            <c:if test="${!acc.status}">Dừng hoạt động</c:if>
                                                            </td>
                                                            <td>
                                                                <button class="btn btn-primary  btn-sm edit" type="button" title="Cập nhật" 
                                                                        data-id="${acc.id}" data-toggle="modal" data-target="#updateAccount">
                                                                <i class="fas fa-edit"></i>
                                                            </button>
                                                            <button class="btn btn-danger btn-sm trash" type="button" title="Xóa" data-id="${acc.id}">
                                                                <i class="fas fa-trash-alt"></i>
                                                            </button>
                                                            <button class="btn btn-info btn-sm eye" type="button" title="Chi tiết" 
                                                                    data-id="${acc.id}" data-toggle="modal"
                                                                    data-target="#viewAccount">
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


        //update account
        <div class="modal fade" id="updateAccount" tabindex="-1" role="dialog" aria-labelledby="updateDiscountModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group  col-md-12">
                                <span class="thong-tin-thanh-toan">
                                    <h5>Cập nhật tài khoản</h5>
                                </span>
                            </div>
                        </div>
                        <form id="updateAccountForm" action="updateaccount" method="POST">
                            <input type="hidden" name="accountID" id="accountID" value=""/>
                            <div class="form-group">
                                <label for="productId">Tên tài khoản</label>
                                <input type="text" class="form-control" id="username" name="username" readonly>
                            </div>
                            <div class="form-group">
                                <label for="productId">Email</label>
                                <input type="text" class="form-control" id="email" name="email" readonly>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="productName">Vai trò</label>
                                        <select class="form-control" id="roleID" name="roleID">
                                            <c:forEach items="${roles}" var="role">
                                                <option value="${role.id}" >
                                                    <c:if test="${role.name eq 'Customer'}">Khách hàng</c:if>
                                                    <c:if test="${role.name eq 'Admin'}">Quản trị</c:if>
                                                    <c:if test="${role.name eq 'Manager'}">Quản lý</c:if>
                                                    <c:if test="${role.name eq 'Sale'}">Bán hàng</c:if>
                                                    <c:if test="${role.name eq 'Deliver'}">Giao hàng</c:if>
                                                    </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="productName">Trạng thái</label>
                                        <select class="form-control" id="status" name="status" >
                                            <option value="active">Hoạt động</option>
                                            <option value="inactive">Dừng hoạt động</option>
                                        </select>
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

        //view account
        <div class="modal fade" id="viewAccount" tabindex="-1" role="dialog" aria-labelledby="updateDiscountModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group  col-md-12">
                                <span class="thong-tin-thanh-toan">
                                    <h5>Thông tin chi tiết tài khoản</h5>
                                </span>
                            </div>
                        </div>
                        <form id="viewAccountForm" action="viewaccount" method="POST">
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="productId">Tài khoản</label>
                                        <input type="text" class="form-control" id="usernameAccount" name="usernameAccount" readonly>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="productId">Trạng thái</label>
                                        <input type="text" class="form-control" id="statusAccount" name="statusAccount" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="productName">Tên người dùng</label>
                                        <input type="text" class="form-control" id="nameUser" name="nameUser" readonly>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="productName">Ngày sinh</label>
                                        <input type="text" class="form-control" id="dobUser" name="dobUser" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="productName">Giới tính</label>
                                        <input type="text" class="form-control" id="genderUser" name="genderUser" readonly>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="form-group">
                                        <label for="productName">Gmail</label>
                                        <input type="text" class="form-control" id="gmailUser" name="gmailUser" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="productName">Địa chỉ</label>
                                        <input type="text" class="form-control" id="addressUser" name="addressUser" readonly>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="productName">Số điện thoại</label>
                                        <input type="text" class="form-control" id="phoneUser" name="phoneUser" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-cancel" data-dismiss="modal">Đóng</button>
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
        <script type="text/javascript">
        </script>
        <script type="text/javascript">
            //update account
            document.querySelectorAll('.edit').forEach(button => {
                button.addEventListener('click', () => {
                    const id = button.getAttribute('data-id');
                    const row = button.closest('tr');
                    const username = row.querySelector('td:nth-child(2)').textContent.trim();
                    const email = row.querySelector('td:nth-child(3)').textContent.trim();
                    const roleID = document.getElementById('roleID' + id).value.trim();
                    const statusText = row.querySelector('td:nth-child(5)').textContent.trim();
                    const statusValue = statusText === 'Hoạt động' ? 'active' : 'inactive';

                    document.getElementById('accountID').value = id;
                    document.getElementById('username').value = username;
                    document.getElementById('email').value = email;
                    document.getElementById('roleID').value = roleID;
                    document.getElementById('status').value = statusValue;
                });
            });

            //view account
            document.querySelectorAll('.eye').forEach(button => {
                button.addEventListener('click', () => {
                    const id = button.getAttribute('data-id');
                    const row = button.closest('tr');
                    const username = row.querySelector('td:nth-child(2)').textContent.trim();
                    const status = row.querySelector('td:nth-child(5)').textContent.trim();
                    const userName = document.getElementById('userName' + id).value.trim();
                    const userDob = document.getElementById('userDob' + id).value.trim();
                    const userGender = document.getElementById('userGender' + id).value.trim();
                    const userGmail = document.getElementById('userGmail' + id).value.trim();
                    const userAddress = document.getElementById('userAddress' + id).value.trim();
                    const userPhone = document.getElementById('userPhone' + id).value.trim();

                    let userGenderText;
                    if (userGender === 'Male') {
                        userGenderText = 'Nam';
                    } else if (userGender === 'Female') {
                        userGenderText = 'Nữ';
                    } else if (userGender === 'Other') {
                        userGenderText = 'Khác';
                    }

                    document.getElementById('usernameAccount').value = username;
                    document.getElementById('statusAccount').value = status;
                    document.getElementById('nameUser').value = userName;
                    document.getElementById('dobUser').value = userDob;
                    document.getElementById('genderUser').value = userGenderText;
                    document.getElementById('gmailUser').value = userGmail;
                    document.getElementById('addressUser').value = userAddress;
                    document.getElementById('phoneUser').value = userPhone;
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
                        text: "Bạn có chắc chắn là muốn xóa tài khoản này?",
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
