<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  User: 赵钦荣
  Date: 2017/11/7 22:54
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>header</title>
</head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/img/icon/favicon.ico">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/base.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/home.css">

<style>
    .goods_prices{
        width: 148px;
    }
    /*   .yMenuListConin dl dt,dd{
             display: inline-block;
             float: left;
             margin-left: 10px;

         }
       .yMenuListConin dl a{
           color: #222;

       }
       .yMenuListConin dl {
           display: block;

       }

       .yMenuListConin dl dt{
           font-weight:bold;
       }*/
    .yMenuListConin{

    }
    .yMenuLCinList{
        padding-top: 0px;
        height: 80px;
    }
    .yListName{
        padding-top: 5px ;

    }
    .yMenuLCinList>h3{
        margin-top:5px;
    }
    .yMenuLCinList>p{
        margin-top:5px;
        margin-bottom: 6px;
    }
    #viewWords{
        width: 70%;
        height:150%;
        background-color: white;
        border: 1px solid red;

        position: absolute;
        top:55px;

        padding: 6px;
        z-index: 999;
    }
    #viewWords>p>a{
        line-height: 20px;
        color: black;
    }
</style>
<body>
<header id="pc-header">
    <div class="pc-header-nav">
        <div class="pc-header-con">

            <div class="fl pc-header-link">您好！，${user.loginName}欢迎来云购物

                <c:choose>
                    <c:when test="${empty user}">
                        <a href="${pageContext.request.contextPath}/user?action=loginUI" target="_self"> 请登录 </a>
                        <a href="${pageContext.request.contextPath}/user?action=registerUI" target="_self"> 用户注册 </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/user?action=logout" target="_self"> 退出系统 </a>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="fr pc-header-list top-nav">
                <ul>

                    <c:if test="${user.type==2}">
                        <li><a href="adminUser?action=indexUI">平台管理</a></li>
                    </c:if>

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
                    <li><a href="my-shoucang.jsp" >我的收藏</a></li>
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
        <div class="head-form fl" style="position: relative">
            <form class="clearfix" action="${pageContext.request.contextPath}/product?action=searchPro" method="post">
                <input class="search-text" accesskey="" name="words" id="key" autocomplete="off" placeholder="洗衣机" type="text" style="height: 36px">
                <button class="button" type="submit" id="search">搜索</button>

            </form>
            <div class="words-text clearfix">
                <a href="#">低至五折</a>
            </div>
            <div id="viewWords" hidden></div>


            <script type="text/javascript">
                $("#key").keyup(function () {
                    $("#viewWords").show()
                    var $val= $(this).val();
                    $.ajax({
                        url:"${pageContext.request.contextPath}/product",
                        data:{
                            "action":"search",
                            "words":$val
                        },
                        type:"post",
                        success:function(data){
                            $("#viewWords").empty();
                            $(data).each(function () {
                                $("#viewWords").append( "<a href='${pageContext.request.contextPath}/product?action=getProductByName&words="+this+"' ><p>"+this+"</p></a>");
                            })

                        },
                        dataType:"json"
                    })
                })
                $("#viewWords").mouseleave(function(){
                    $("#viewWords").hide();
                })


            </script>

        </div>
        <div class="fr pc-head-car">
            <i class="icon-car"></i>
            <a href="${pageContext.request.contextPath}/jsp/my-car.jsp" target="_blank">我的购物车</a>
            <em>0</em>
        </div>
    </div>>
    <!--  顶部    start-->
    <div class="yHeader">
        <!-- 导航   start  -->
        <div class="yNavIndex">
            <div class="pullDown">
                <%--       一级目录--%>

                <!-- 下拉详细列表具体分类 -->

                <jsp:include page="${pageContext.request.contextPath}/jsp/nav.jsp"></jsp:include>
                <!-- 导航   end  -->
            </div>
        </div></div></header>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
</body>
</html>
