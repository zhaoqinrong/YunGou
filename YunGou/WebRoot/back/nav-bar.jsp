<%--
  User: 赵钦荣
  Date: 2017/11/17 16:46
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
</head>
<body>
<div class="sidebar-nav">
    <a href="#products-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-dashboard"></i>商品管理
        <i class="icon-chevron-up"></i></a>
    <ul id="products-menu" class="nav nav-list collapse">
        <li><a href="sign-in.jsp">商品列表</a></li>
        <li><a href="sign-up.jsp">添加商品</a></li>
        <li><a href="sign-up.jsp">商品分类</a></li>
        <li><a href="sign-up.jsp">库存管理</a></li>
    </ul>
    <a href="#order-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-dashboard"></i>订单管理
        <i class="icon-chevron-up"></i></a>
    <ul id="order-menu" class="nav nav-list collapse">
        <li><a href="sign-in.jsp">订单列表</a></li>

    </ul>
    <a href="#users-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-user"></i>会员管理
        <i class="label icon-chevron-up"></i></a>
    <ul id="users-menu" class="nav nav-list collapse in">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="../EasyBuyUser?action=gtAllUser">会员列表</a></li>
        <li><a href="user.jsp">添加会员</a></li>
    </ul>
    <a href="#news-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-envelope"></i>新闻管理
        <i class="icon-chevron-up"></i></a>
    <ul id="news-menu" class="nav nav-list collapse in">
        <li><a href="user.jsp">新闻分类</a></li>
        <li><a href="index.jsp">新闻列表</a></li>
        <li><a href="../EasyBuyUser?action=gtAllUser">添加新闻</a></li>
    </ul>



    <a href="#accounts-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-briefcase"></i>个人中心<i class="icon-chevron-up"></i></a>
    <ul id="accounts-menu" class="nav nav-list collapse">
        <li><a href="sign-in.jsp">登录</a></li>
        <li><a href="sign-up.jsp">注册</a></li>
        <li><a href="reset-password.jsp">修改密码</a></li>
    </ul>


    <a href="#error-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-exclamation-sign"></i>错误页面 <i class="icon-chevron-up"></i></a>
    <ul id="error-menu" class="nav nav-list collapse">
        <li><a href="403.jsp">403 page</a></li>
        <li><a href="404.jsp">404 page</a></li>
        <li><a href="500.jsp">500 page</a></li>
        <li><a href="503.jsp">503 page</a></li>
    </ul>

    <a href="#legal-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-legal"></i>法律声明
        <i class="icon-chevron-up"></i></a>
    <ul id="legal-menu" class="nav nav-list collapse">
        <li><a href="privacy-policy.jsp">Privacy Policy</a></li>
        <li><a href="terms-and-conditions.jsp">Terms and Conditions</a></li>
    </ul>

    <a href="help.jsp" class="nav-header"><i class="icon-question-sign"></i>帮助中心</a>
    <a href="faq.jsp" class="nav-header"><i class="icon-comment"></i>常见问题</a>
</div>
</body>
</html>
