<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .app-menu .active {
                background-color: #FFCCBA;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <!-- 
        <c:forEach var="category" items="${requestScope.type}">
            <li style="margin-bottom: 10px;">
                <a href="${pageContext.request.contextPath}/homenews?categoryId=${category.id}" style="display: flex; align-items: center; padding: 10px 15px; text-decoration: none; color: #333; background-color: #f8f9fa; border-radius: 8px; transition: background-color 0.3s, transform 0.3s;">
                    <i class="fas fa-folder" style="font-size: 1.5rem; margin-right: 15px; color: #333;"></i>
                    <h5 style="margin: 0; font-size: 1rem;">${category.type}</h5>
                </a>
            </li>
        </c:forEach>
        -->
        <div class="col-3" style="margin-top: 70px; display: flex; justify-content: flex-start">
            <ul id="menuContainer" class="app-menu" style="list-style: none; padding: 0; margin: 0;">
                <li style="margin-bottom: 10px;">
                    <a href="${pageContext.request.contextPath}/news" style="display: flex; align-items: center; padding: 10px 15px; text-decoration: none; color: #333; border-radius: 8px; transition: background-color 0.3s, transform 0.3s;">
                        <i class="fas fa-home" style="font-size: 1.5rem; margin-right: 15px; color: #333;"></i>
                        <h5 style="margin: 0; font-size: 1rem;">Trang chủ</h5>
                    </a>
                </li>
                <li style="margin-bottom: 10px;">
                    <a href="${pageContext.request.contextPath}/homenews?categoryId=1" style="display: flex; align-items: center; padding: 10px 15px; text-decoration: none; color: #333; border-radius: 8px; transition: background-color 0.3s, transform 0.3s;">
                        <i class="fab fa-apple" style="font-size: 1.5rem; margin-right: 15px; color: #333;"></i>
                        <h5 style="margin: 0; font-size: 1rem;">Tin tức Apple</h5>
                    </a>
                </li>
                <li style="margin-bottom: 10px;">
                    <a href="${pageContext.request.contextPath}/homenews?categoryId=2" style="display: flex; align-items: center; padding: 10px 15px; text-decoration: none; color: #333; border-radius: 8px; transition: background-color 0.3s, transform 0.3s;">
                        <i class="fas fa-edit" style="font-size: 1.5rem; margin-right: 15px; color: #333;"></i>
                        <h5 style="margin: 0; font-size: 1rem;">Bài viết review</h5>
                    </a>
                </li>
                <li style="margin-bottom: 10px;">
                    <a href="${pageContext.request.contextPath}/homenews?categoryId=3" style="display: flex; align-items: center; padding: 10px 15px; text-decoration: none; color: #333; border-radius: 8px; transition: background-color 0.3s, transform 0.3s;">
                        <i class="fas fa-compass" style="font-size: 1.5rem; margin-right: 15px; color: #333;"></i>
                        <h5 style="margin: 0; font-size: 1rem;">Khám phá</h5>
                    </a>
                </li>
                <li style="margin-bottom: 10px;">
                    <a href="${pageContext.request.contextPath}/homenews?categoryId=4" style="display: flex; align-items: center; padding: 10px 15px; text-decoration: none; color: #333; border-radius: 8px; transition: background-color 0.3s, transform 0.3s;">
                        <i class="fas fa-cogs" style="font-size: 1.5rem; margin-right: 15px; color: #333;"></i>
                        <h5 style="margin: 0; font-size: 1rem;">Thủ thuật</h5>
                    </a>
                </li>
                <li style="margin-bottom: 10px;">
                    <a href="${pageContext.request.contextPath}/homenews?categoryId=5" style="display: flex; align-items: center; padding: 10px 15px; text-decoration: none; color: #333; border-radius: 8px; transition: background-color 0.3s, transform 0.3s;">
                        <i class="fas fa-gift" style="font-size: 1.5rem; margin-right: 15px; color: #333;"></i>
                        <h5 style="margin: 0; font-size: 1rem;">Khuyến mại</h5>
                    </a>
                </li>
                <li style="margin-bottom: 10px;">
                    <a href="${pageContext.request.contextPath}/homenews?categoryId=6" style="display: flex; align-items: center; padding: 10px 15px; text-decoration: none; color: #333; border-radius: 8px; transition: background-color 0.3s, transform 0.3s;">
                        <i class="fas fa-adjust" style="font-size: 1.5rem; margin-right: 15px; color: #333;"></i>
                        <h5 style="margin: 0; font-size: 1rem;">Tin khác</h5>
                    </a>
                </li>
            </ul>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const menuItems = document.querySelectorAll('.app-menu a');
                menuItems.forEach(item => {
                    item.addEventListener('click', function () {
                        menuItems.forEach(i => i.classList.remove('active'));
                        this.classList.add('active');
                    });
                });

                const currentUrl = window.location.href;
                menuItems.forEach(item => {
                    if (item.href === currentUrl) {
                        item.classList.add('active');
                    }
                });
            });
        </script>
    </body>
</html>
