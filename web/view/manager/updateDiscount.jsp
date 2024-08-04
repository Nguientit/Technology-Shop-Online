<%-- 
    Document   : updateDiscount
    Created on : Jun 23, 2024, 5:38:34 PM
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
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
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
                    <li class="breadcrumb-item"><a href="#">Chỉnh sửa giá khuyến mại</a></li>
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
                            <form method="post" action="updatediscount">
                                <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                                    <thead>
                                        <tr role="row">
                                            <th class="sorting" style="width: 6px;">
                                                <input type="checkbox" id="selectAll" onclick="toggleSelectAll(this)" style="width: 15px; height: 15px;">
                                            </th>
                                            <th class="sorting" style="width: 0.2px;">Mã</th>
                                            <th class="sorting" style="width: 40.2px;">Ảnh</th>
                                            <th class="sorting" style="width: 120.2px;">Tên sản phẩm</th>
                                            <th class="sorting" style="width: 70.2px;">Màu sản phẩm</th>
                                            <th class="sorting" style="width: 70.2px;">Số lượng</th>
                                            <th class="sorting" style="width: 120.2px;">Giá niêm yết</th>
                                            <th class="sorting" style="width: 120.2px;">Giá bán</th>
                                        </tr>
                                    </thead>
                                    <tbody>   
                                        <c:forEach items="${requestScope.discount}" var="p">
                                            <tr role="row" class="even">
                                                <td class="checkbox-cell">
                                                    <input type="checkbox" name="selectedDiscounts" value="${p.id}" style="width: 15px; height: 15px; border: 10px"/>
                                                </td>
                                                <td>${p.pd.id}</td>
                                                <td><img src="../images/${p.pd.image[0]}" style="height: 50px; width: 50px; border-radius: 10px; margin: 0px 0;"></td>
                                                <td>${p.pd.name}</td>
                                                <td>${p.pd.color}</td>
                                                <td>${p.pd.quantity}</td>
                                                <td><currency:formatCurrency value="${p.pd.originalPrice}"/>đ</td>
                                                <td><currency:formatCurrency value="${p.priceDiscount}"/>đ</td>
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
        <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <script>
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
                                        dd = checkTime(dd);
                                        mm = checkTime(mm);
                                        h = checkTime(h);
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
                                        tmp = '<span class="date">' + today + ' - ' + nowTime + '</span>';
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
            function toggleSelectAll(selectAllCheckbox) {
                var checkboxes = document.getElementsByName('selectedDiscounts');
                for (var i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = selectAllCheckbox.checked;
                }
            }
        </script>
    </body>

</html>
