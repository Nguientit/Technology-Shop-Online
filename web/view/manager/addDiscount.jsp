<%-- 
    Document   : addDiscount_1
    Created on : Jul 3, 2024, 10:06:41 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Thêm giá khuyến mãi</title>
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
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item">Danh sách sản phẩm khuyến mại</li>
                    <li class="breadcrumb-item"><a href="#">Thêm giá khuyến mại</a></li>
                </ul>
            </div>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Thêm giá khuyến mãi cho sản phẩm</h3>
                        <div class="tile-body">
                            <form method="post" action="adddiscount">
                                <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                                    <thead>
                                        <tr role="row">
                                            <th class="sorting" style="width: 6px;">
                                                <input type="checkbox" id="selectAll" onclick="toggleSelectAll(this)" style="width: 15px; height: 15px;">
                                            </th>
                                            <th class="sorting" style="width: 40.2px;">Ảnh
                                            </th>
                                            <th class="sorting" style="width: 120.2px;">Tên sản phẩm
                                            </th>
                                            <th class="sorting" style="width: 70.2px;">Màu sản phẩm
                                            </th>
                                            <th class="sorting" style="width: 70.2px;">Số lượng
                                            </th>
                                            <th class="sorting" style="width: 120.2px;">Giá niêm yết
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>   
                                        <c:forEach items="${requestScope.products}" var="p">
                                            <tr role="row" class="even">

                                                <td class="checkbox-cell">
                                                    <input type="checkbox" name="selectedProducts" value="${p.id}" style="width: 15px; height: 15px; border: 10px"/>
                                                </td>
                                                <td><img src="../images/${p.image[0]}" style="height: 50px; width: 50px; border-radius: 10px; margin: 0px 0;"></td>
                                                <td>${p.name}</td>
                                                <td>${p.color}</td>
                                                <td>${p.quantity}</td>
                                                <td><currency:formatCurrency value="${p.originalPrice}"/>đ</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <button class="btn btn-success " type="submit">Thêm</button>
                                <button class="btn btn-primary  " type="button" onclick="window.location.href = '/Technology_Store_SWP/manager/listdiscount'">Hủy bỏ</button>
                            </form>
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
        <script>
            function toggleSelectAll(selectAllCheckbox) {
                var checkboxes = document.getElementsByName('selectedProducts');
                for (var i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = selectAllCheckbox.checked;
                }
            }
        </script>
    </body>
</html>