<%-- 
    Document   : Menu1.jsp
    Created on : Jul 2, 2024, 1:31:46 AM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<body>
    <!-- Navbar-->
    <header class="app-header">
        <!-- Sidebar toggle button-->
        <a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
        <!-- Navbar Right Menu-->
        <ul class="app-nav">
            <!-- User Menu-->
            <!--<li><a class="app-nav__item" href="/index.html"><i class='bx bx-log-out bx-rotate-180'></i> </a></li>-->
            <c:if test="${user eq null}">
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/login">Đăng nhập</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/register">Đăng ký</a></li>
                </c:if>
                <c:if test="${user ne null}">
                <li><a class="app-nav__item" href="${pageContext.request.contextPath}/viewprofile"><i class='bx bx-user'></i></a></li>
                <li><a class="app-nav__item" href="${pageContext.request.contextPath}/logout"><i class='bx bx-log-out bx-rotate-180'></i></a></li>
                    </c:if>
        </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar" id="sidebar">
        <div class="app-sidebar__user">
            <img class="app-sidebar__user-avatar" src="${pageContext.request.contextPath}/images/logo.png" width="50" alt="User Image">
            <div>
                <p class="app-sidebar__user-name"><b>${user.name}</b></p>
                <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
            </div>
        </div>
        <hr>
        <ul class="app-menu">
            <li>
                <a class="app-menu__item haha" href="${pageContext.request.contextPath}/view/admin/homePageAdmin.jsp">
                    <i class='app-menu__icon bx bx-cart-alt'></i>
                    <span class="app-menu__label">Trang Chủ</span>
                </a>
            </li>
            <li>
                <a class="app-menu__item " href="${pageContext.request.contextPath}/deliver/listorder">
                    <i class='app-menu__icon bx bx-id-card'></i> 
                    <span class="app-menu__label">Danh sách đơn hàng</span>
                </a>
            </li>
            <li>
                <a class="app-menu__item" href="${pageContext.request.contextPath}/deliver/listshipping">
                    <i class='app-menu__icon bx bx-purchase-tag-alt'></i>
                        <span class="app-menu__label">Danh sách vận chuyển</span>
                </a>
            </li>
            <li><a class="app-menu__item" href="${pageContext.request.contextPath}/deliver/listshiped"><i class='app-menu__icon bx bx-task'></i><span
                        class="app-menu__label">Đơn hàng đã vẫn chuyển</span></a></li>
        </ul>
    </aside>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const menuItems = document.querySelectorAll('.app-menu__item');
            const currentPath = window.location.pathname;

            menuItems.forEach(item => {
                // So sánh chỉ phần sau dấu "/"
                const href = item.getAttribute('href');
                if (currentPath.endsWith(href) || currentPath.includes(href)) {
                    item.classList.add('active');
                }

                item.addEventListener('click', function () {
                    menuItems.forEach(i => i.classList.remove('active'));
                    item.classList.add('active');
                });
            });
        });

    </script>
</body>
