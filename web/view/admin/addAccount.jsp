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
                    <li class="breadcrumb-item"><a href="#">Thêm tài khoản</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Tạo mới tài khoản</h3>
                        <div class="tile-body">
                            <form class="row" name="addAccountForm" id="addAccountForm" action="addaccount" method="POST">
                                <input type="hidden" value="add" name="action"/>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Tài khoản<span style="color: red">*</span></label>
                                    <input class="form-control" type="text" name="username" id="username" placeholder="Nhập tài khoản">
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="exampleSelect1" class="control-label">Mật khẩu</label>
                                    <input class="form-control" type="text" name="password" id="password" placeholder="Nhập mật khẩu">
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="exampleSelect1" class="control-label">Vai trò</label>
                                    <select class="form-control" name="roleid">
                                        <c:forEach items="${requestScope.roles}" var="role">
                                            <option value="${role.id}">${role.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="exampleSelect1" class="control-label">Trạng thái</label>
                                    <div class="form-group">
                                        <input class="form-check-input" type="radio" name="status" value="Inactive" placeholder="Nhập mật khẩu"> Dừng hoạt động<br/>
                                        <input class="form-check-input" type="radio" name="status" value="Active" placeholder="Nhập mật khẩu"> Hoạt động
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <span class="error-message col-md-12" id="error" style="color: red">${sessionScope.error}</span><br/>
                                    <button class="btn btn-primary btn-sm edit" type="submit" title="Thêm" id="editor1" data-toggle="modal" style="color: black">Thêm tài khoản
                                    </button>
                                </div>
                            </form>
                        </div>
                        <c:if test="${sessionScope.tempAccounts ne null}">
                            <div class="row">
                                <div class="col-sm-12">
                                    <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                                        <thead>
                                            <tr role="row">
                                                <th class="sorting" style="width: 150px;">Tên Tài Khoản</th>
                                                <th class="sorting" style="width: 100px;">Mật khẩu</th>
                                                <th class="sorting" style="width: 100px;">Vai Trò</th>
                                                <th class="sorting" style="width: 100px;">Trạng Thái</th>
                                                <!--<th class="sorting" style="width: 300px;">Chức Năng</th>-->
                                            </tr>
                                        </thead>
                                        <tbody>   
                                            <c:forEach items="${sessionScope.tempAccounts}" var="acc">
                                                <tr role="row" class="even">
                                            <form id="frmDelete${acc.id}" action="deleteaccount" method="GET">
                                                <input type="hidden" name="account" value="a"/>
                                            </form>
                                            <td>${acc.username}</td>
                                            <td>${acc.password}</td>
                                            <td>
                                                <c:forEach items="${roles}" var="role">
                                                    <c:if test="${role.id eq acc.role.id}">${role.name}</c:if>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <c:if test="${acc.status}">Hoạt động</c:if>
                                                <c:if test="${!acc.status}">Dừng hoạt động</c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-sm-12">
                                    <form class="row" name="productForm" action="addaccount" method="POST">
                                        <input type="hidden" value="save" name="action"/>
                                        <button class="btn btn-save" type="submit" onclick="if (validateForm())
                                        document.productForm.submit();">Lưu lại</button>
                                        <a class="btn btn-cancel" href="${pageContext.request.contextPath}/admin/listaccount">Hủy bỏ</a>
                                    </form>
                                </div>
                            </div>
                        </c:if>


                    </div>
                </div>
            </div>
        </main>

        <div class="modal fade" id="updateDiscountModal" tabindex="-1" role="dialog" aria-labelledby="updateDiscountModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group  col-md-12">
                                <span class="thong-tin-thanh-toan">
                                    <h5>Chỉnh sửa giá ưu đãi cho sản phẩm sản phẩm</h5>
                                </span>
                            </div>
                        </div>
                        <form id="updateDiscountForm" action="updatediscount" method="post" onsubmit="return validateForm()">
                            <input type="hidden" name="id" id="discountId"/>
                            <div class="form-group">
                                <label for="productId">Mã Số</label>
                                <input type="text" class="form-control" id="productId" name="productId" readonly>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="productName">Tên sản phẩm</label>
                                        <input type="text" class="form-control" id="productName" name="productName" readonly>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="productColor">Màu sản phẩm</label>
                                        <input type="text" class="form-control" id="productColor" name="productColor" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="currentDiscountPrice">Giá gốc</label>
                                <input type="text" class="form-control" id="currentDiscountPrice" name="originalPrice" readonly>
                            </div>
                            <div class="form-group">
                                <label for="discountPrice">Giá ưu đãi<span style="color: red">*</span></label>
                                <input type="text" class="form-control" id="discountPrice" name="price" style="background-color: #FFCCBA">
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-save">Chỉnh sửa</button>
                                <button type="button" class="btn btn-cancel" data-dismiss="modal">Hủy bỏ</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>
        <script>
                            document.addEventListener('DOMContentLoaded', function () {
                                var form = document.getElementById('addAccountForm');
                                var username = document.getElementById('username');
                                var password = document.getElementById('password');
                                var error = document.getElementById('error');

                                function validateNoSpaces(input, errorElement) {
                                    if (input && errorElement) {
                                        if (/\s/.test(input.value)) {
                                            errorElement.textContent = "Không được chứa khoảng trắng.";
                                            return false;
                                        } else {
                                            errorElement.textContent = "";
                                            return true;
                                        }
                                    }
                                    return true;
                                }

                                function isValidPassword(input, errorElement) {
                                    const hasLowerCase = /[a-z]/.test(input.value);
                                    const hasUpperCase = /[A-Z]/.test(input.value);
                                    const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(input.value);
                                    const hasDigit = /\d/.test(input.value);

                                    if (hasLowerCase && hasUpperCase && hasSpecialChar && hasDigit) {
                                        errorElement.textContent = "";
                                        return true;
                                    } else {
                                        errorElement.textContent = "Mật khẩu phải bao gồm ít nhất một ký tự đặc biệt, một ký tự thường, một ký tự in hoa và một chữ số!";
                                        return false;
                                    }
                                }

                                function validateNoSpacesAndPasswordIsValid(input, errorElement) {
                                    if (input && errorElement) {
                                        if (!validateNoSpaces(input, errorElement)) {
                                            return false;
                                        }
                                        return isValidPassword(input, errorElement);
                                    }
                                    return true;
                                }



                                username.addEventListener('input', function () {
                                    validateNoSpaces(username, error);
                                });

                                password.addEventListener('input', function () {
                                    validateNoSpacesAndPasswordIsValid(password, error);
                                });


                                //Check if the fields in the form are not error will can submit the form
                                function validateForm() {
                                    var isUsernameValid = validateNoSpaces(username, error);
                                    var isPasswordValid = validateNoSpacesAndPasswordIsValid(password, error);

                                    return isUsernameValid && isPasswordValid;
                                }

                                form.addEventListener('submit', function (event) {
                                    if (!validateForm()) {
                                        event.preventDefault();
                                    }
                                });
                            });
        </script>
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
