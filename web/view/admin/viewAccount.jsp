<%-- 
    Document   : viewAccount
    Created on : Jun 21, 2024, 9:36:27 PM
    Author     : Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- index.html -->
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Account</title>
        <link rel="icon" type="image/png" href="../images/favicon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .container {
                max-width: 800px; /* adjust the width as needed */
                margin: 0 auto; /* center the container */
                padding: 150px; /* as per the inline style */
            }

            .text-center {
                text-align: center;
            }

            .mb-4 {
                margin-bottom: 1.5rem;
            }

            .card {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                padding: 20px;
            }

            .card-header {
                background-color: #f0f0f0;
                padding: 10px;
                border-bottom: 1px solid #ddd;
            }

            .card-body {
                padding: 20px;
            }

            .form-label {
                font-weight: bold;
                margin-bottom: 10px;
            }

            .form-select {
                width: 100%;
                height: 50px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .btn.btn-primary {
                background-color: #337ab7;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .btn.btn-primary:hover {
                background-color: #23527c;
            }
        </style>
    </head>
    <body>
        <div class="container py-4" style="padding: 150px">
            <h1 class="text-center mb-4">Thông Tin Tài Khoản</h1>
            <div class="card mb-4">
                <div class="text-center card-header">
                    Thông Tin Tài Khoản
                </div>
                <div class="card-body">
                    <form action="updateaccount" method="POST" >
                        <div class="mb-3">
                            <table class="table form-label" border = "1px">
                                <tr>
                                    <td>Tên Tài Khoản</td>
                                    <td>${account.username}</td>
                                </tr>
                                <tr>
                                    <td>Trạng Thái</td>
                                    <td>
                                        <c:if test="${account.status}">Hoạt động</c:if>
                                        <c:if test="${!account.status}">Dừng hoạt động</c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tên Người Dùng</td>
                                        <td>${account.user.name}</td>
                                </tr>
                                <tr>
                                    <td>Ngày Sinh</td>
                                    <td>${account.user.dob}</td>
                                </tr>
                                <tr>
                                    <td>Giới Tính</td>
                                    <td>
                                        <c:if test="${account.user.gender}">Nam</c:if>
                                        <c:if test="${!account.user.gender}">Nữ</c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Gmail</td>
                                        <td>${account.user.email}</td>
                                </tr>
                                <tr>
                                    <td>Địa Chỉ</td>
                                    <td>${account.user.address}</td>
                                </tr>
                                <tr>
                                    <td>Số Điện Thoại</td>
                                    <td>${account.user.phone}</td>
                                </tr>

                            </table>

                            <input type="hidden" name="accountID" value="${account.id}"/>
                        </div>




                    </form>
                </div>
            </div>
        </div>
    </body>
</html>