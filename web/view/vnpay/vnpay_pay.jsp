<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Checkout</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="view/assets/css/base.css" rel="stylesheet"/>
        <script src="view/assets/js/huylq.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>
            .heading {
                font-size: 40px;
                margin-top: 35px;
                margin-bottom: 30px;
                padding-left: 20px
            }
            .card {
                margin-top: 60px;
                margin-bottom: 60px
            }
            .radio-group {
                position: relative;
                margin-bottom: 25px
            }
            .radio {
                display: inline-block;
                border-radius: 6px;
                box-sizing: border-box;
                border: 2px solid lightgrey;
                cursor: pointer;
                margin: 12px 25px 12px 0px;
                width: 150px;
            }
            .radio.selected {
                box-shadow: 0px 0px 0px 1px rgba(0, 0, 155, 0.4);
                border: 3px solid  #000000;
            }
            .label-radio {
                font-weight: bold;
                color: #000000
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <header class="header shop">
            <div class="middle-inner">
                <div class="container" >
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-12">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/images/logo.png" alt="logo"></a>
                            </div>
                            <!--/ End Logo -->
                            <!-- Search Form -->
                            <div class="search-top">
                                <div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
                                <!-- Search Form -->
                                <div class="search-top">
                                    <form class="search-form">
                                        <input type="text" placeholder="Search here..." name="search">
                                        <button value="search" type="submit"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                                <!--/ End Search Form -->
                            </div>
                            <!--/ End Search Form -->
                            <div class="mobile-nav"></div>
                        </div>
                        <div class="col-lg-8 col-md-7 col-12">
                            <div class="search-bar-top">
                                <div class="search-bar">
                                    <select id="categorySelect" onchange="redirectToCategory()">
                                        <option selected="selected">Danh mục</option>
                                        <c:forEach items="${listC}" var="o">
                                            <option value="${o.id}">${o.name}</option>
                                        </c:forEach>
                                    </select>
                                    <form id="main-search-form" onsubmit="redirectToProduct(event)">
                                        <input name="search" placeholder="Bạn cần tìm gì?" type="search">
                                        <button type="submit" class="btnn"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-3 col-12">
                            <div class="right-bar">
                                <!-- Search Form -->
                                <div class="sinlge-bar">
                                    <a href="#" class="single-icon"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
                                </div>
                                <div class="sinlge-bar">
                                    <div class="sinlge-bar dropdown">
                                        <a href="#" class="single-icon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                            <a class="dropdown-item" href="login.jsp">Đăng nhập</a>
                                            <a class="dropdown-item" href="register.html">Đăng ký</a>
                                        </div>
                                    </div>

                                </div>
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
                                                        <a href="#" class="remove-from-cart" title="Remove this item"><i class="fa fa-remove"></i></a>
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
                                            </c:if>
                                        </div>  
                                    </div>
                                </div>
                                <!--/ End Shopping Item -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header Inner -->
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class=" col-lg-6">
                    <div class="card p-3">
                        <h2 class=" text-center">Checkout</h2>
                        <form action="VNPay" id="frmCreateOrder" method="post">
                            <input type="hidden" value="${param.plan}" name="plan">
                            <div class="form-group ">
                                <h5 >Số tiền:</h5>
                                <span class="form-control" id="amount">${requestScope.totalPrice}</span>
                                <input type="hidden" class="form-control  " data-val="true"
                                       data-val-number="The field Amount must be a number."
                                       data-val-required="The Amount field is required." id="amount" max="100000000" min="1"
                                       name="amount" type="number" value="${requestScope.totalPrice}" />
                            </div>

                            <h4>Chọn phương thức thanh toán:</h4>
                            <div class="row justify-content-center radio-group">
                                <div class="col-5 row">
                                    <input class="d-none" type="radio" id="bankCode1"  name="bankCode" value="VNBANK">
                                    <label style="width:170px" for="bankCode1" class="radio mx-auto rounded" ><img style="width:150px; height:100px"
                                            src="https://vnpay.vn/s1/statics.vnpay.vn/2023/9/06ncktiwd6dc1694418196384.png"
                                            ><br>Thanh toán qua ngân hàng nội địa</label>
                                </div>
                                <div class="col-5 row" >
                                    <input class="d-none" type="radio" id="bankCode2" name="bankCode" value="INTCARD">
                                    <label style="padding-left: 10px;width:170px" class="radio mx-auto rounded"  for="bankCode2" ><img style="width:130px; height:100px"
                                            src="https://static.thenounproject.com/png/1878946-200.png" > Thanh toán qua thẻ quốc tế</label>
                                </div>
                            </div>
                            <div class=" form-group">
                                <h4>Chọn ngôn ngữ giao diện thanh toán:</h4>
                                <div class="col-12" style="padding-left: 235px;">
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="language_vn" name="language"
                                               value="vn" >
                                        <label for="language_vn" class="custom-control-label label-radio">Tiếng Việt</label>
                                    </div>
                                    <div  class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="language_en" name="language"
                                               value="en">
                                        <label for="language_en" class="custom-control-label label-radio">English</label>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button type="submit" style="background-color: #000000; border: none;" class="btn btn-primary rounded">Thanh toán</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
       <!-- Start Footer Area -->
        <footer class="footer">
            <!-- Footer Top -->
            <div class="footer-top section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer about">
                                <div class="logo">
                                    <a href="index.jsp"><img src="images/logo2.png" alt="#"></a>
                                </div>
                                <p class="text">Chào mừng đến với Tech Haven - Nơi cung cấp những sản phẩm công nghệ tốt nhất cho bạn!</p>
                                <p class="call">Mua hàng<span><a href="tel:123456789">+0123 456 789</a></span></p>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-2 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer links">
                                <h4>Thông tin</h4>
                                <!--								<ul>
                                                                                                        <li><a href="#">Tin tức</a></li>
                                                                                                        <li><a href="#">Giới thiệu</a></li>
                                                                                                        <li><a href="#">Điều khoản và điều kiện</a></li>
                                                                                                        <li><a href="#">Contact Us</a></li>
                                                                                                        <li><a href="#">Help</a></li>
                                                                                                </ul>-->
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-2 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer links">
                                <h4>Chính sách</h4>
                                <!--								<ul>
                                                                                                        <li><a href="#">Payment Methods</a></li>
                                                                                                        <li><a href="#">Money-back</a></li>
                                                                                                        <li><a href="#">Returns</a></li>
                                                                                                        <li><a href="#">Shipping</a></li>
                                                                                                        <li><a href="#">Privacy Policy</a></li>
                                                                                                </ul>-->
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-3 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer social">
                                <h4>Địa chỉ liên hệ</h4>
                                <!-- Single Widget -->
                                <div class="contact">
                                    <!--									<ul>
                                                                                                                    <li>NO. 342 - London Oxford Street.</li>
                                                                                                                    <li>012 United Kingdom.</li>
                                                                                                                    <li>info@eshop.com</li>
                                                                                                                    <li>+032 3456 7890</li>
                                                                                                            </ul>-->
                                </div>
                                <!-- End Single Widget -->
                                <ul>
                                    <li><a href="#"><i class="ti-facebook"></i></a></li>
                                    <li><a href="#"><i class="ti-twitter"></i></a></li>
                                    <li><a href="#"><i class="ti-flickr"></i></a></li>
                                    <li><a href="#"><i class="ti-instagram"></i></a></li>
                                </ul>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Footer Top -->
            <div class="copyright">
                <div class="container">
                    <div class="inner">
                        <div class="row">
                            <div class="col-lg-6 col-12">
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="right">
                                    <img src="images/payments.png" alt="#">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
            // Radio button
            $('.radio-group .radio').click(function () {
                $(this).parent().parent().find('.radio').removeClass('selected');
                $(this).addClass('selected');
            });
        </script>       
    </body>
</html>