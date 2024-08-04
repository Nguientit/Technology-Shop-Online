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
        <title>Thêm sản phẩm | Quản trị Admin</title>
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

        <style>
        </style>
    </head>

    <body class="app sidebar-mini rtl">

        <jsp:include page="Menu.jsp"/>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item">Danh sách tài khoản</li>
                    <li class="breadcrumb-item"><a href="#">Cập nhật tài khoản</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Cập nhật tài khoản</h3>
                        <div class="tile-body">
                            <form class="row" name="updateForm" action="updateaccount" method="POST">
                                <input type="hidden" value="add" name="action"/>
                                <div class="row form-group col-md-12">
                                    <div class="form-group col-md-2">
                                        <label class="control-label">Tên tài khoản</label>
                                        <input class="form-control" type="text" name="orderId" value="${account.username}" readonly>
                                        <input type="hidden" name="accountID" value="${account.id}"/>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="exampleSelect1" class="control-label">Email</label>
                                        <input class="form-control" type="text" name="orderAddress" value="${account.user.email}" readonly>
                                    </div>
                                </div>

                                <div class="row form-group col-md-12">
                                    <div class="form-group col-md-2">
                                        <label for="exampleSelect1" class="control-label">Vai trò</label>
                                        <select class="form-control" name="roleID">
                                            <c:forEach items="${roles}" var="role">
                                                <option value="${role.id}" <c:if test="${role.id eq account.role.id}">selected</c:if>>
                                                    <c:if test="${role.name eq 'Customer'}">Khách hàng</c:if>
                                                    <c:if test="${role.name eq 'Admin'}">Quản trị</c:if>
                                                    <c:if test="${role.name eq 'Manager'}">Quản lý</c:if>
                                                    <c:if test="${role.name eq 'Sale'}">Bán hàng</c:if>
                                                    <c:if test="${role.name eq 'Deliver'}">Giao hàng</c:if>
                                                    </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label for="exampleSelect1" class="control-label">Trạng thái</label>
                                        <select class="form-control" name="status" >
                                            <option value="active" <c:if test="${account.status}">selected</c:if>>Hoạt động</option>
                                            <option value="inactive" <c:if test="${!account.status}">selected</c:if>>Dừng hoạt động</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="row form-group col-md-12">
                                        <div class="form-group col-md-12">
                                            <button class="btn btn-save" type="submit">Lưu lại</button>
                                        </div>
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
            // Function to populate the modal with data
            document.querySelectorAll('.edit').forEach(button => {
                button.addEventListener('click', () => {
                    const id = button.getAttribute('data-id');
                    const row = button.closest('tr');
                    const productId = row.querySelector('td:nth-child(1)').textContent.trim();
                    const productName = row.querySelector('td:nth-child(2)').textContent.trim();
                    const productColor = row.querySelector('td:nth-child(4)').textContent.trim();
                    const originalPrice = row.querySelector('td:nth-child(6)').textContent.trim();
                    const discountPrice = row.querySelector('td:nth-child(7)').textContent.trim();

                    document.getElementById('discountId').value = id;
                    document.getElementById('productId').value = productId;
                    document.getElementById('productName').value = productName;
                    document.getElementById('productColor').value = productColor;
                    document.getElementById('currentDiscountPrice').value = originalPrice;
                    document.getElementById('discountPrice').value = discountPrice;
                });
            });

            document.addEventListener('DOMContentLoaded', function () {
                var cell = document.getElementById('email-cell');
                var text = cell.innerText;
                if (text.length > 5) {
                    cell.innerText = text.substring(0, 5) + '...';
                }
            });
        </script>
    </body>

</html>
