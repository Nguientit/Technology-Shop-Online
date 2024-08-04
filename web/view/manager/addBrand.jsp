<%-- 
    Document   : addC
    Created on : Jun 10, 2024, 3:50:02 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Management</title>
        <link rel="icon" type="image/png" href="../images/favicon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="/Technology_Store_SWP/manager.html">Tech Haven
                    <a class="navbar-brand" href="/Technology_Store_SWP/manager/listproduct">Quay Lai</a>
                </a>
            </div>
        </nav>
        <div class="container py-4">
            <h1 class="text-center mb-4">Add Brand</h1>

            <!-- Create Brand Form -->
            <div class="card mb-4">
                <div class="card-header">
                    Insert New Brand
                </div>
                <div class="card-body">
                    <form name="brandForm" action="addBrand" method="POST" onsubmit="return validateForm()">
                        <div class="mb-3">
                            <label for="productName" class="form-label">Tên Brand</label>
                            <input type="text" name="name" class="form-control" id="productName" placeholder="Nhập thương hiệu sản phẩm">
                        </div>

                        <button type="submit" class="btn btn-primary">Insert</button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            function validateForm() {
                var checkBrandNameExist = [];
            <c:forEach items="${requestScope.brand}" var="brand">
                checkBrandNameExist.push("${brand.name}");
            </c:forEach>;

                var brandName = document.forms["brandForm"]["name"].value;

                brandName = brandName.trim().replace(/\s+/g, ' ');
                if (brandName === "") {
                    alert("Tên thương hiệu không được để trống");
                    return false;
                }
                if (checkBrandNameExist.includes(brandName)) {
                    alert("Tên thương hiệu đã tồn tại.");
                    return false;
                }
                
                document.forms["brandForm"]["name"].value = brandName;

                return true;
            }
        </script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </body>
</html>
