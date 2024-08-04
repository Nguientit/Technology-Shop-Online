<%-- 
    Document   : listProductDetail_1
    Created on : Jul 4, 2024, 8:58:04 PM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Danh sách sản phẩm chi tiết</title>
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
                    <li class="breadcrumb-item">Danh sách sản phẩm</li>
                    <li class="breadcrumb-item"><a href="#">Chi tiết sản phẩm</a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="addproductdetail?id=${param.id}" title="Thêm">
                                        <i class="fas fa-plus"></i> Thêm mới sản phẩm chi tiết
                                    </a>
                                </div>
                                
                            </div>
                            <div id="sampleTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                                            <c:set var="productId" value="${param.id}" />
                                            <thead>
                                                <tr role="row">
                                                    <th class="sorting" style="width: 50.2px;">Ảnh
                                                    </th>
                                                    <th class="sorting" style="width: 210.2px;">Tên sản phẩm
                                                    </th>
                                                    <th class="sorting" style="width: 80.2px;">Màu sản phẩm
                                                    </th>
                                                    <th class="sorting" style="width: 50.2px;">Số lượng
                                                    </th>
                                                    <th class="sorting" style="width: 120.2px;">Giá niêm yết 
                                                    </th>
                                                    <th class="sorting" style="width: 60.2px;">Trạng thái
                                                    </th>
                                                    <th class="sorting" style="width: 0px;">Chức năng
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>   
                                                <c:forEach items="${requestScope.productDetail}" var="p">
                                                    <c:if test="${p.product.id == productId}">
                                                        <tr role="row" class="even">
                                                            <td><img src="../images/${p.image[0]}" style="height: 50px; width: 50px; border-radius: 10px; margin: 0px 0;"></td>
                                                            <td>${p.name}</td>
                                                            <td>${p.color}</td>
                                                            <td>${p.quantity}</td>
                                                            <td><currency:formatCurrency value="${p.originalPrice}" />đ</td>
                                                            <td>
                                                                <c:if test="${p.status}">
                                                                    <p class="badge bg-success">Hiện</p>
                                                                </c:if>
                                                                <c:if test="${!p.status}">
                                                                    <p class="badge bg-danger">Ẩn</p>
                                                                </c:if>
                                                            </td>

                                                            <td>
                                                                <button class="btn btn-primary btn-sm edit" type="button" title="Xóa" onclick="window.location.href = 'updateproductdetail?id=${p.id}'"><i class="fas fa-edit"></i></button>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <a class="btn btn-warning " data-dismiss="modal" href="listproduct">◀Quay lại</a>
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

                                                                    // Form validation function
                                                                    function validateForm() {
                                                                        var price = document.forms["updateDiscountForm"]["price"].value;
                                                                        var originalPrice = document.forms["updateDiscountForm"]["originalPrice"].value;

                                                                        // Remove dots from the price values
                                                                        price = price.replace(/[^\d]/g, '');  // Loại bỏ tất cả ký tự không phải số
                                                                        originalPrice = originalPrice.replace(/[^\d]/g, '');

                                                                        if (isNaN(price) || parseFloat(price) <= 0) {
                                                                            alert("Giá sản phẩm không hợp lệ và lớn hơn 0");
                                                                            return false;
                                                                        }

                                                                        if (parseFloat(price) > parseFloat(originalPrice)) {
                                                                            alert("Giá ưu đãi không được lớn hơn giá gốc");
                                                                            return false;
                                                                        }

                                                                        // Update form values without dots
                                                                        document.forms["updateDiscountForm"]["price"].value = price;
                                                                        return true;
                                                                    }
        </script>
    </body>
</html>

