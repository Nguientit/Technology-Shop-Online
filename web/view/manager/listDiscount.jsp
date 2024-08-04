<%-- 
    Document   : listDiscount
    Created on : Jul 16, 2024, 8:59:35 AM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Danh sách khuyến mại</title>
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
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách sản phẩm khuyến mại</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="${pageContext.request.contextPath}/manager/adddiscount" title="Thêm"><i class="fas fa-plus"></i>
                                        Thêm sản phẩm khuyến mại</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-primary btn-sm edit" href="${pageContext.request.contextPath}/manager/updatediscount" title="Sửa"><i class="fas fa-edit"></i>
                                        Chỉnh sửa sản phẩm khuyến mại</a>
                                </div>        
                            </div>
                            <div id="sampleTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                <div class="row">
                                    <div class="col-sm-12 col-md-6">

                                    </div>

                                    <!-- Search Form -->                                   
                                    <div class="col-sm-12 col-md-6">
                                        <form id="frmsearch" method="post" action="listdiscount" >
                                            <div id="sampleTable_filter" class="dataTables_filter">
                                                <label>Tìm kiếm:
                                                    <input type="hidden" name="currentSearch" value="${param.search}" />
                                                    <input type="text" name="search" class="form-control form-control-sm" placeholder="tên sản phẩm" aria-controls="sampleTable" value="${param.search}">
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
                                                    <th class="sorting" style="width: 80.2px;">Màu sản phẩm
                                                    </th>
                                                    <th class="sorting" style="width: 50.2px;">Số lượng
                                                    </th>
                                                    <th class="sorting" style="width: 120.2px;">Giá niêm yết 
                                                    </th>
                                                    <th class="sorting" style="width: 120.2px;">Giá bán 
                                                    </th>
                                                    <th class="sorting" style="width: 50px;">Chức năng
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>   
                                                <c:forEach items="${requestScope.discount}" var="d">
                                                    <tr role="row" class="even">
                                                        <td>${d.pd.id}
                                                            <form id="frmDelete${d.id}" action="deletediscount" method="POST">
                                                                <input type="hidden" name="id" value="${d.id}"/>
                                                            </form>
                                                        </td>
                                                        <td>${d.pd.name}</td>
                                                        <td><img src="../images/${d.pd.image[0]}" style="height: 50px; width: 50px; border-radius: 10px; margin: 0px 0;"></td>
                                                        <td>${d.pd.color}</td>
                                                        <td>${d.pd.quantity}</td>
                                                        <td><currency:formatCurrency value="${d.pd.originalPrice}"/></td>
                                                        <td><currency:formatCurrency value="${d.priceDiscount}"/></td>
                                                        <td>
                                                            <!--<button class="btn btn-primary btn-sm edit" type="button" title="Sửa" data-id="${d.id}" data-toggle="modal" data-target="#updateDiscountModal"><i class="fas fa-edit"></i></button>-->
                                                            <button class="btn btn-danger btn-sm trash" type="button" title="Xóa" data-id="${d.id}"><i class="fas fa-trash-alt"></i></button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12 col-md-5"></div>

<!--                                    <div class="col-sm-12 col-md-7">
                                        <div class="dataTables_paginate paging_simple_numbers" id="sampleTable_paginate">
                                            <ul class="pagination">
                                                <c:if test="${tag > 1}">
                                                    <li class="paginate_button page-item previous" id="sampleTable_previous">
                                                        <a href="listdiscount?index=${tag-1}&search=${param.search}" aria-controls="sampleTable" data-dt-idx="0" tabindex="0" class="page-link">Lùi</a>
                                                    </li>
                                                </c:if>
                                                <li class="paginate_button page-item active">
                                                    <a href="#" aria-controls="sampleTable" data-dt-idx="${tag}" tabindex="0" class="page-link">${tag}</a>
                                                </li>
                                                <c:if test="${tag < endP}">
                                                    <li class="paginate_button page-item next" id="sampleTable_next">
                                                        <a href="listdiscount?index=${tag+1}&search=${param.search}" aria-controls="sampleTable" data-dt-idx="2" tabindex="0" class="page-link">Tiếp</a>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </div>
                                    </div>-->
                                    <div class="col-sm-12 col-md-7">
                                        <div class="dataTables_paginate paging_simple_numbers" id="sampleTable_paginate">
                                            <ul class="pagination">
                                                <c:if test="${tag > 1}">
                                                    <li class="paginate_button page-item previous" id="sampleTable_previous">
                                                        <a href="listdiscount?index=${tag-1}&search=${param.search}" aria-controls="sampleTable" data-dt-idx="0" tabindex="0" class="page-link" style="color: black">Lùi</a>
                                                    </li>
                                                </c:if>

                                                <!-- Always show the first page -->
                                                <li class="paginate_button page-item ${tag == 1 ? 'active' : ''}">
                                                    <a href="listdiscount?index=1&search=${param.search}" aria-controls="sampleTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>
                                                </li>

                                                <!-- Show ... if current page > 4 -->
                                                <c:if test="${tag > 4}">
                                                    <li class="paginate_button page-item disabled"><a href="#" class="page-link">...</a></li>
                                                    </c:if>

                                                <!-- Show 3 pages in the middle -->
                                                <c:forEach begin="${tag - 1}" end="${tag + 1}" var="i">
                                                    <c:if test="${i > 1 && i < endP}">
                                                        <li class="paginate_button page-item ${tag == i ? 'active' : ''}">
                                                            <a href="listdiscount?index=${i}&search=${param.search}" aria-controls="sampleTable" data-dt-idx="${i}" tabindex="0" class="page-link">${i}</a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>

                                                <!-- Show ... if current page < endP - 3 -->
                                                <c:if test="${tag < endP - 3}">
                                                    <li class="paginate_button page-item disabled"><a href="#" class="page-link">...</a></li>
                                                    </c:if>

                                                <!-- Always show the last page -->
                                                <li class="paginate_button page-item ${tag == endP ? 'active' : ''}">
                                                    <a href="listdiscount?index=${endP}&search=${param.search}" aria-controls="sampleTable" data-dt-idx="${endP}" tabindex="0" class="page-link">${endP}</a>
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
        </main>

        <!-- Modal for Updating Discount -->
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
                                    <h5>Chỉnh sửa giá ưu đãi cho sản phẩm</h5>
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
