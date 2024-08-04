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
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
        <!-- Sidebar toggle button-->
        <a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
        <!-- Navbar Right Menu-->
        <ul class="app-nav">
            <!-- User Menu-->
            <!--<li><a class="app-nav__item" href="/Technology_Store_SWP/home"><i class='bx bx-log-out bx-rotate-180'></i> </a></li>-->
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
                <p class="app-sidebar__user-name"><b>Quản trị Sale</b></p>
                <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
            </div>
        </div>
        <hr>
        <ul class="app-menu">
            <li><a class="app-menu__item haha" href="${pageContext.request.contextPath}/hompagesale"><i class='app-menu__icon bx bx-home'></i>
                    <span class="app-menu__label">Trang chủ</span></a></li>
            <li><a class="app-menu__item" href="${pageContext.request.contextPath}/listnews"><i class='app-menu__icon bx bx-box'></i><span class="app-menu__label">Quản lý tin tức</span></a>
            </li>
<!--            <li><a class="app-menu__item" href="${pageContext.request.contextPath}/top10blogs"><i class='app-menu__icon bx bx-purchase-tag'></i><span
                        class="app-menu__label">Top 10 bài tin tức</span></a></li>-->
            
<!--            <li><a class="app-menu__item" href="#"><i
                        class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo doanh thu</span></a>
            </li>
            <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-calendar-check'></i><span
                        class="app-menu__label">Lịch công tác </span></a></li>
            <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-cog'></i><span class="app-menu__label">Cài
                        đặt hệ thống</span></a></li>-->
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
