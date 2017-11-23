<%--
  User: 赵钦荣
  Date: 2017/11/17 23:37
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>nav</title>
</head>
<body>
<div class=" sidebar" role="navigation">
    <div class="navbar-collapse">
        <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
            <ul class="nav" id="side-menu">
                <li>
                    <a href="usersList.jsp" class="active"><i class="fa fa-home nav_icon"></i>平台管理中心</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-cogs nav_icon"></i>商品管理
                        <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li>
                            <a href="productList.jsp">商品列表</a>
                        </li>
                        <li>
                            <a href="addProduct.jsp">添加商品</a>
                        </li>
                        <li>
                            <a href="productClass.jsp">商品分类</a>
                        </li>
                        <li>
                            <a href="productStock.jsp">库存管理</a>
                        </li>
                    </ul>
                    <!-- /nav-second-level -->
                </li>
                <li class="">
                    <a href="#"><i class="fa fa-book nav_icon"></i>订单管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li>
                            <a href="orderList.jsp">订单列表<span class="nav-badge-btm">08</span></a>
                        </li>

                    </ul>
                    <!-- /nav-second-level -->
                </li>
                <li>
                    <a href="widgets.html"><i class="fa fa-th-large nav_icon"></i>会员管理 <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li>
                            <a href="../EasyBuyUser?action=gtAllUser">会员列表 <span class="nav-badge-btm">05</span></a>
                        </li>
                        <li>
                            <a href="adduser.jsp">添加会员</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-envelope nav_icon"></i>新闻管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li>
                            <a href="newsClass.jsp">新闻分类 <span class="nav-badge-btm">05</span></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/EasyBuyNews?action=getAllNewsAndClass">新闻列表</a>
                        </li>
                        <li>
                            <a href="addnews.jsp">添加新闻</a>
                        </li>
                    </ul>
                    <!-- //nav-second-level -->
                </li>

                <li>
                    <a href="#"><i class="fa fa-check-square-o nav_icon"></i>个人中心<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li>
                            <a href="login.jsp">登录</a>
                        </li>
                        <li>
                            <a href="signup.jsp">注册</a>
                        </li>
                        <li>
                            <a href="resetPassword.jsp">修改密码</a>
                        </li>
                    </ul>
                    <!-- //nav-second-level -->
                </li>

            </ul>
            <!-- //sidebar-collapse -->
        </nav>
    </div>
</div>

</body>
</html>
