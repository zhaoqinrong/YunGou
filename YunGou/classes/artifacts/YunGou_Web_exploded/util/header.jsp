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

<link rel="shortcut icon" type="image/x-icon" href="img/icon/favicon.ico">
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/home.css">


<body>
<header id="pc-header">
    <div class="pc-header-nav">
        <div class="pc-header-con">

            <div class="fl pc-header-link">您好！，${username}欢迎来云购物

                <%
                    if (session.getAttribute("username") == null) {
                %>
                <a href="login.jsp" target="_self"> 请登录 </a>
               <%--<a href="register.jsp" target="_blank"></a>--%>
                <a  data-toggle="modal" data-target="#myModal">
                    免费注册
                </a>
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">
                                    模态框（Modal）标题
                                </h4>
                            </div>
                            <div class="modal-body">
                                在这里添加一些文本
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                </button>
                                <button type="button" class="btn btn-primary">
                                    提交更改
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
             <%--   <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                    免费注册
                </button>
                <div class="modal fade" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Modal title</h4>
                            </div>
                            <div class="modal-body">
                                <p>One fine body&hellip;</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->--%>
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
            <form class="clearfix">
                <input class="search-text" accesskey="" id="key" height="36" autocomplete="off" placeholder="洗衣机" type="text">
                <button class="button" onclick="search('key');return false;">搜索</button>
            </form>
            <div class="words-text clearfix">
                <a href="#" class="red">1元秒爆</a>
                <a href="#">低至五折</a>
                <a href="#">农用物资</a>
                <a href="#">佳能相机</a>
                <a href="#">服装城</a>
                <a href="#">买4免1</a>
                <a href="#">家电秒杀</a>
                <a href="#">农耕机械</a>
                <a href="#">手机新品季</a>
            </div>
        </div>
        <div class="fr pc-head-car">
            <i class="icon-car"></i>
            <a href="my-car.jsp">我的购物车</a>
            <em>10</em>
        </div>
    </div>
    <!--  顶部    start-->
    <div class="yHeader">
        <!-- 导航   start  -->
        <div class="yNavIndex">
            <ul class="yMenuIndex" style="margin-left:0">
                <li style="background:#d1201e"><a href="" target="_blank">云购首页</a></li>
                <li><a href="" target="_blank">女士护肤 </a></li>
                <li><a href="" target="_blank">男士护肤</a></li>
                <li><a href="" target="_blank">洗护染发</a></li>
                <li><a href="" target="_blank">染发</a></li>
                <li><a href="" target="_blank">彩妆</a></li>
                <li><a href="" target="_blank">品牌故事</a></li>
            </ul>
        </div>
        <!-- 导航   end  -->
    </div>

</header>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</body>
</html>
