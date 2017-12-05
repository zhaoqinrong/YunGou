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
    <title>云购物商城</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/img/icon/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/home.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>

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
            <form class="clearfix">
                <input class="search-text" accesskey="" id="key" autocomplete="off" placeholder="洗衣机"
                       style="height: 37px;" type="text">
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
            <a href="my-car.jsp" target="_blank">我的购物车</a>
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
<div class="center pc-top-20">
    <div class="pc-center-he " style="margin-top: 20px">
        <div class="pc-list-goods" style="height:auto;margin-top:40px">
            <div class="xsq_deal_wrapper pc-deal-list clearfix" style="height: auto">

                    <c:forEach items="${products}"   var="pro">

                        <a class="saleDeal" style="height: 320px; margin-top: 40px;" href="${pageContext.request.contextPath}/product?action=getProductByidView&id=${pro.id}" target="_blank">
                            <div class="dealCon"><img class="dealImg"
                                                      src="${pageContext.request.contextPath}/productImg/${pro.fileName}"
                                                      alt="${pro.name}"></div>
                            <div class="title_new"><p class="word" title="${pro.name}">${pro.name}</p></div>
                            <div class="dealInfo"><span class="price">¥<em>${pro.price}</em></span></div>
                        </a>
                    </c:forEach>


            </div>
        </div>
    </div>
</div>


<div class="center" style="background:#fff;">
    <div style="padding:20px">
        <div class="containers">
            <div class="time-lists clearfix">
                <div class="time-list time-list-w fl" style="width:1156px">
                    <div class="time-title time-clear"><h2>热卖区</h2>
                        <div class="pc-font fl"></div>
                        <a href="javascript:;" class="pc-spin fr">换一换</a></div>
                    <div class="time-border">
                        <div class="yScrollList">
                            <div class="yScrollListIn">
                                <div class="yScrollListInList yScrollListInList1" style="display:block;">
                                    <ul style="width: 1464px;">
                                        <li>
                                            <a href="">
                                                <img src="images/shangpinxiangqing/X-1.png">
                                                <p class="head-name pc-pa10">TP-LINK TL-WN725N 微型150M无线USB网卡</p>
                                                <p class="label-default">3.45折</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <img src="images/shangpinxiangqing/X-1.png">
                                                <p class="head-name pc-pa10">TP-LINK TL-WN725N 微型150M无线USB网卡</p>
                                                <p class="label-default">3.45折</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <img src="images/shangpinxiangqing/X-1.png">
                                                <p class="head-name pc-pa10">TP-LINK TL-WN725N 微型150M无线USB网卡</p>
                                                <p class="label-default">3.45折</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <img src="images/shangpinxiangqing/X-1.png">
                                                <p class="head-name pc-pa10">TP-LINK TL-WN725N 微型150M无线USB网卡</p>
                                                <p class="label-default">3.45折</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <img src="images/shangpinxiangqing/X-1.png">
                                                <p class="head-name pc-pa10">TP-LINK TL-WN725N 微型150M无线USB网卡</p>
                                                <p class="label-default">3.45折</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <img src="images/shangpinxiangqing/X-1.png">
                                                <p class="head-name pc-pa10">TP-LINK TL-WN725N 微型150M无线USB网卡</p>
                                                <p class="label-default">3.45折</p>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<div style="height:100px"></div>

<jsp:include page="util/footer.jsp"/>
<script type="text/javascript">
    //hover 触发两个事件，鼠标移上去和移走
    //mousehover 只触发移上去事件
    $(".top-nav ul li").hover(function () {
        $(this).addClass("hover").siblings().removeClass("hover");
        $(this).find("li .nav a").addClass("hover");
        $(this).find(".con").show();
    }, function () {
        //$(this).css("background-color","#f5f5f5");
        $(this).find(".con").hide();
        //$(this).find(".nav a").removeClass("hover");
        $(this).removeClass("hover");
        $(this).find(".nav a").removeClass("hover");
    })
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/js/modernizr-custom-v2.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.SuperSlide.js"></script>
<script type="text/javascript">

    var intDiff = parseInt(90000);//倒计时总秒数量

    function timer(intDiff) {
        window.setInterval(function () {
            var day = 0,
                hour = 0,
                minute = 0,
                second = 0;//时间默认值
            if (intDiff > 0) {
                day = Math.floor(intDiff / (60 * 60 * 24));
                hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
            }
            if (minute <= 9) minute = '0' + minute;
            if (second <= 9) second = '0' + second;
            $('#day_show').html(day + "天");
            $('#hour_show').html('<s id="h"></s>' + hour + '时');
            $('#minute_show').html('<s></s>' + minute + '分');
            $('#second_show').html('<s></s>' + second + '秒');
            intDiff--;
        }, 1000);
    }

    $(function () {
        timer(intDiff);
    });//倒计时结束

    $(function () {
        /*======右按钮======*/
        $(".you").click(function () {
            nextscroll();
        });

        function nextscroll() {
            var vcon = $(".v_cont");
            var offset = ($(".v_cont li").width()) * -1;
            vcon.stop().animate({marginLeft: offset}, "slow", function () {
                var firstItem = $(".v_cont ul li").first();
                vcon.find(".flder").append(firstItem);
                $(this).css("margin-left", "0px");
            });
        };
        /*========左按钮=========*/
        $(".zuo").click(function () {
            var vcon = $(".v_cont");
            var offset = ($(".v_cont li").width() * -1);
            var lastItem = $(".v_cont ul li").last();
            vcon.find(".flder").prepend(lastItem);
            vcon.css("margin-left", offset);
            vcon.animate({marginLeft: "0px"}, "slow")
        });
    });

</script>
<script type="text/javascript">
    $(document).ready(function () {
        var $miaobian = $('.Xcontent08>div');
        var $huantu = $('.Xcontent06>img');
        var $miaobian1 = $('.Xcontent26>div');
        $miaobian.mousemove(function () {
            miaobian(this);
        });
        $miaobian1.click(function () {
            miaobian1(this);
        });

        function miaobian(thisMb) {
            for (var i = 0; i < $miaobian.length; i++) {
                $miaobian[i].style.borderColor = '#dedede';
            }
            thisMb.style.borderColor = '#cd2426';

            $huantu[0].src = thisMb.children[0].src;
        }

        function miaobian1(thisMb1) {
            for (var i = 0; i < $miaobian1.length; i++) {
                $miaobian1[i].style.borderColor = '#dedede';
            }
//		thisMb.style.borderColor = '#cd2426';
            $miaobian.css('border-color', '#dedede');
            thisMb1.style.borderColor = '#cd2426';
            $huantu[0].src = thisMb1.children[0].src;
        }

        $(".Xcontent33").click(function () {
            var value = parseInt($('.input').val()) + 1;
            $('.input').val(value);
        })

        $(".Xcontent32").click(function () {
            var num = $(".input").val()
            if (num > 0) {
                $(".input").val(num - 1);
            }

        })

    })
</script>
</body>
</html>