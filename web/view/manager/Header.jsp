<%-- 
    Document   : Header
    Created on : Jul 12, 2024, 3:25:33 PM
    Author     : Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <header class="header shop">
            <div class="middle-inner">
                <div class="container" >
                    <div class="row">
                        <div class="col-lg-3 col-md-2 col-12">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/images/logo.png" alt="logo"></a>
                            </div>
                            <!--/ End Logo -->
                        </div>
                        <div class="col-lg-4 col-md-7 col-12">
                            <div class="search-bar-top">
                                <div class="search-bar">
                                    <form id="main-search-form" onsubmit="redirectToProduct(event)">
                                        <input name="search" placeholder="Bạn cần tìm gì?" type="search">
                                        <button type="submit" class="btnn"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-3 col-12">

                            <div class="right-bar">
                                <div class="sinlge-bar">
                                    <a href="${pageContext.request.contextPath}/listnew" class="single-icon">Tin tức</a>
                                </div>
                                <div class="sinlge-bar">
                                    <div class="sinlge-bar dropdown">
                                        <a href="#" class="single-icon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                            <c:if test="${user eq null}">
                                                <a class="dropdown-item" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                                                <a class="dropdown-item" href="${pageContext.request.contextPath}/register">Đăng ký</a>
                                            </c:if>
                                            <c:if test="${user ne null}">
                                                <a class="dropdown-item" href="${pageContext.request.contextPath}/viewprofile">Hồ sơ</a>
                                                <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                                            </c:if>
                                        </div>
                                    </div>

                                </div>
                                <c:if test="${user ne null}">
                                    <div class="sinlge-bar shopping">
                                        <c:if test="${sessionScope.cart != null && sessionScope.cartSize != 0}">
                                            <a href="cart" class="single-icon"><i class="ti-bag"></i> <span class="total-count">${sessionScope.cartSize}</span></a>
                                            </c:if>
                                            <c:if test="${sessionScope.cart == null || sessionScope.cartSize == 0}">
                                            <a href="cart" class="single-icon"><i class="ti-bag"></i> <span class="total-count">0</span></a>
                                        </c:if>
                                        <!-- Shopping Item -->
                                        <div class="shopping-item">
                                            <div class="dropdown-cart-header">
                                                <c:if test="${sessionScope.cartSize != null && sessionScope.cartSize != 0}">
                                                    <span>${sessionScope.cartSize} Items</span>
                                                </c:if>
                                                <c:if test="${sessionScope.cartSize == null || sessionScope.cartSize == 0}">
                                                    <span>0 Items</span>
                                                </c:if>
                                                <a href="${pageContext.request.contextPath}/cart">Xem giỏ hàng</a>
                                            </div>
                                            <ul class="shopping-list">
                                                <c:if test="${sessionScope.cart != null && sessionScope.cartSize != 0}">
                                                    <c:forEach items="${sessionScope.listItemsInCart}" var="item">
                                                        <li>
                                                            <a href="${pageContext.request.contextPath}/cart?rid=${item.pd.id}"><i class="fa fa-remove"></i></a>
                                                            <a class="cart-img" href="#"><img src="${pageContext.request.contextPath}/images/${item.pd.image[0]}" alt="#"></a>
                                                            <h4><a href="#">${item.pd.name}</a></h4>
                                                            <p class="product-details">Màu sắc: ${item.pd.color}</p>
                                                            <p class="product-details">Dung lượng: ${item.pd.criteria}</p>
                                                            <div class="cart-price">
                                                                <p class="quantity">${item.quantity}x - </p>
                                                                <p class="product-price"><currency:formatCurrency value="${cart.getPriceDiscount(discounts, item.pd.id)}" /></p>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${sessionScope.cart == null || sessionScope.cartSize == 0}">
                                                    <span class="header__cart-list--no-cart-msg">Không có sản phẩm nào trong giỏ!</span>
                                                    <img src="images/emptycart.png" alt="Emptycart" style="width: 60%;">
                                                </c:if>
                                            </ul>
                                            <div class="bottom">
                                                <c:if test="${sessionScope.cart != null && sessionScope.cartSize != 0}">
                                                    <div class="total">
                                                        <span>Tạm tính</span>
                                                        <span class="total-amount"><currency:formatCurrency value="${sessionScope.cart.getTotalMoney(listDC)}"/></span>
                                                    </div>
                                                    <a href="${sessionScope.account == null ? 'login' : 'checkout'}" class="btn animate">Mua ngay</a>
                                                </c:if>
                                            </div>  
                                        </div>
                                        <!--/ End Shopping Item -->
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <script>
            function redirectToProduct(event) {
                event.preventDefault();
                var searchValue = event.target.querySelector('input[name="search"]').value;
                if (searchValue) {
                    var newURL = "${pageContext.request.contextPath}/product?search=" + encodeURIComponent(searchValue);
                    window.location.href = newURL;
                } else {
                    alert('Vui lòng nhập từ khóa tìm kiếm.');
                }
            }
        </script>
    </body>
</html>