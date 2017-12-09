<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <meta name="renderer" content="webkit">
    <title>云购物商城-巴黎欧莱雅官方旗舰店</title>
    <link rel="shortcut icon" type="${pageContext.request.contextPath}/static/image/x-icon" href="img/icon/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/home.css">

    <style>
        .li-ul-ss l {
            width: 200px;
        }
    </style>
</head>
<body>
<header id="pc-header">
    <div class="pc-header-nav">
        <div class="pc-header-con">

            <div class="fl pc-header-link">您好！，${username}欢迎来云购物

                <%
                    if (session.getAttribute("username") == null) {
                %>
                <a href="login.jsp" target="_self"> 请登录 </a>
                <a href="register.jsp" target="_self"> 用户注册 </a>

                <%
                    }
                %>
            </div>
            <div class="fr pc-header-list top-nav">
                <ul>
                    <li>
                        <div class="nav"><i class="pc-top-icon"></i><a href="my-dingdan.jsp">我的订单</a></div>
                        <div class="con">
                            <dl>
                                <dt><a href="">批发进货</a></dt>
                                <dd><a href="">已买到货品</a></dd>
                                <dd><a href="">优惠券</a></dd>
                                <dd><a href="">店铺动态</a></dd>
                            </dl>
                        </div>
                    </li>
                    <li>
                        <div class="nav"><i class="pc-top-icon"></i><a href="#">我的商城</a></div>
                        <div class="con">
                            <dl>
                                <dt><a href="">批发进货</a></dt>
                                <dd><a href="">已买到货品</a></dd>
                                <dd><a href="">优惠券</a></dd>
                                <dd><a href="">店铺动态</a></dd>
                            </dl>
                        </div>
                    </li>
                    <li><a href="#">我的云购</a></li>
                    <li><a href="my-shoucang.jsp">我的收藏</a></li>
                    <li><a href="my-user.jsp">会员中心</a></li>
                    <li><a href="#">客户服务</a></li>
                    <li><a href="#">帮助中心</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="pc-header-logo clearfix">
        <div class="pc-fl-logo fl">
            <h1>
                <a href="index.jsp"></a>
            </h1>
        </div>
        <div class="head-form fl">
            <form class="clearfix" action="${pageContext.request.contextPath}/product?action=searchPro" id="searchForm">
                <input class="search-text" accesskey="" name="words" id="key" autocomplete="off" placeholder="洗衣机" type="text" style="height: 36px">
                <button class="button" type="submit" id="search">搜索</button>

            </form>
            <div class="words-text clearfix">
                <a href="#">低至五折</a>
            </div>
            <div id="viewWords" hidden></div>
        </div>
        <div class="fr pc-head-car">
            <i class="icon-car"></i>
            <a href="${pageContext.request.contextPath}/jsp/my-car.jsp" target="_blank">我的购物车</a>
            <em>0</em>
        </div>
    </div>
    <div class="yHeader">
        <!-- 导航   start  -->
        <div class="yNavIndex">
            <div class="pullDown">

                <%--       一级目录--%>


                <!-- 下拉详细列表具体分类 -->

                <jsp:include page="nav.jsp"></jsp:include>
                <!-- 导航   end  -->
            </div>

        </div>
    </div>
</header>





<div style="height:100px"></div>

<jsp:include page="util/footer.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/modernizr-custom-v2.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/page.js">


</script>
</body>
</html>