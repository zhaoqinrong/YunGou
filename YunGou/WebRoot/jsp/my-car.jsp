<%@ page language="java" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <meta name="renderer" content="webkit">
    <title>我的购物车-云购物商城</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/img/icon/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/home.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/js/modernizr-custom-v2.7.1.min.js"></script>
    <style>
        .goods_prices{
            width: 148px;
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
            <form class="clearfix" action="${pageContext.request.contextPath}/product?action=searchPro">
                <input class="search-text" accesskey="" name="words" id="key" autocomplete="off" placeholder="洗衣机"
                       type="text" style="height: 36px">
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
</header>
<section id="pc-jie">
    <div class="center ">
        <ul class="pc-shopping-title clearfix">
            <li><a href="#" class="cu">全部商品(7)</a></li>
            <li><a href="#">限时优惠(7)</a></li>
            <li><a href="#">库存紧张(0)</a></li>
        </ul>
    </div>
    <div class="pc-shopping-cart center">
        <div class="pc-shopping-tab">
            <table>
                <thead>
                <tr class="tab-0">
                    <th class="tab-1">
                        <input type="checkbox" id="allCheckBox">
                        全选
                    </th>
                    <th class="tab-2" style="width: 330px">商品</th>
                    <th class="tab-3" style="margin-left: 20px">商品信息</th>
                    <th class="tab-4">单价</th>
                    <th class="tab-5">数量</th>
                    <th class="tab-6">小计</th>
                    <th class="tab-7">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td colspan="7">
                        <table>
                            <tr class="tab-0" style="padding-left:10px; background:#eee;">
                                <td colspan="7">
                                    <input type="checkbox" class="option all" name="cartCheckBox" value=""
                                           style="margin-left: 10px">
                                    <label>云购物自营</label>
                                    <a href="#" style="position:relative;padding-left:50px"><i
                                            class="icon-kefu"></i>联系客服</a>
                                    <ul class="clearfix fr" style="padding-right:20px">
                                        <li><i class="pc-shop-car-yun"></i>满109元减10</li>
                                        <li><i class="pc-shop-car-yun"></i>领取3种优惠券, 最高省30元</li>
                                    </ul>
                                </td>
                            </tr>


                            <tr class="on">
                                <th><input type="checkbox" class="option pro" name="cartCheckBox" value=""></th>
                                <th class="tab-th-1">
                                    <a href="#"><img
                                            src="${pageContext.request.contextPath}/static/images/shangpinxiangqing/X1.png"
                                            width="100%" alt=""></a>
                                    <a href="#" class="tab-title">赛亿（shinee)取暖器家用/取暖电器/电暖器/电暖气台式摇头暖风机HN2118PT </a>
                                </th>
                                <th>
                                    <p>颜色：黑色</p>
                                    <p>规格：落地款</p>
                                </th>
                                <th>
                                    <p class="aaa">399.99</p>
                                    <p class="goods_price">299.99</p>
                                </th>
                                <th class="tab-th-2">
                                    <img src="${pageContext.request.contextPath}/static/images/taobao_minus.jpg"
                                         alt="minus" class="minus"/>
                                    <span>0</span>
                                    <img src="${pageContext.request.contextPath}/static/images/taobao_adding.jpg"
                                         alt="add" class="plus"/>
                                </th>
                                <th class="goods_prices">299.99</th>
                                <th class="tab-th-3"><a href="javascript:void(0);">删除</a></th>


                            </tr>
                            <tr class="on">
                                <th><input type="checkbox" class="option pro" name="cartCheckBox" value=""></th>
                                <th class="tab-th-1">
                                    <a href="#"><img
                                            src="${pageContext.request.contextPath}/static/images/shangpinxiangqing/X1.png"
                                            width="100%" alt=""></a>
                                    <a href="#" class="tab-title">赛亿（shinee)取暖器家用/取暖电器/电暖器/电暖气台式摇头暖风机HN2118PT </a>
                                </th>
                                <th>
                                    <p>颜色：黑色</p>
                                    <p>规格：落地款</p>
                                </th>
                                <th>
                                    <p class="aaa">399.99</p>
                                    <p class="goods_price">299.99</p>
                                </th>
                                <th class="tab-th-2">
                                    <img src="${pageContext.request.contextPath}/static/images/taobao_minus.jpg"
                                         alt="minus" class="minus"/>
                                    <span>0</span>
                                    <img src="${pageContext.request.contextPath}/static/images/taobao_adding.jpg"
                                         alt="add" class="plus"/>
                                </th>
                                <th class="goods_prices">299.99</th>
                                <th class="tab-th-3"><a href="javascript:void(0);">删除</a></th>

                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="7">
                        <table>

                            <tr class="tab-0" style="padding-left:10px; background:#eee;">
                                <td colspan="7">
                                    <input type="checkbox" class="option all" name="cartCheckBox" value="">
                                    <label>云购物自营</label>
                                    <a href="#" style="position:relative;padding-left:50px"><i
                                            class="icon-kefu"></i>联系客服</a>
                                    <ul class="clearfix fr" style="padding-right:20px">
                                        <li><i class="pc-shop-car-yun"></i>满109元减10</li>
                                        <li><i class="pc-shop-car-yun"></i>领取3种优惠券, 最高省30元</li>
                                    </ul>
                                </td>
                            </tr>


                            <tr class="on">
                                <th><input type="checkbox" class="option pro" name="cartCheckBox" value="" checked></th>
                                <th class="tab-th-1">
                                    <a href="#"><img
                                            src="${pageContext.request.contextPath}/static/images/shangpinxiangqing/X1.png"
                                            width="100%" alt=""></a>
                                    <a href="#" class="tab-title">赛亿（shinee)取暖器家用/取暖电器/电暖器/电暖气台式摇头暖风机HN2118PT </a>
                                </th>
                                <th>
                                    <p>颜色：黑色</p>
                                    <p>规格：落地款</p>
                                </th>
                                <th>
                                    <p class="aaa">399.99</p>
                                    <p class="goods_price">299.99</p>
                                </th>
                                <th class="tab-th-2">
                                    <img src="${pageContext.request.contextPath}/static/images/taobao_minus.jpg"
                                         alt="minus" class="minus"/>
                                    <span>1</span>
                                    <img src="${pageContext.request.contextPath}/static/images/taobao_adding.jpg"
                                         alt="add" class="plus"/>
                                </th>
                                <th class="goods_prices">299.99</th>
                                <th class="tab-th-3"><a href="javascript:void(0);">删除</a></th>


                            </tr>
                            <tr class="on">
                                <th><input type="checkbox" class="option pro" name="cartCheckBox" value=""></th>
                                <th class="tab-th-1">
                                    <a href="#"><img
                                            src="${pageContext.request.contextPath}/static/images/shangpinxiangqing/X1.png"
                                            width="100%" alt=""></a>
                                    <a href="#" class="tab-title">赛亿（shinee)取暖器家用/取暖电器/电暖器/电暖气台式摇头暖风机HN2118PT </a>
                                </th>
                                <th>
                                    <p>颜色：黑色</p>
                                    <p>规格：落地款</p>
                                </th>
                                <th>
                                    <p class="aaa">399.99</p>
                                    <p class="goods_price">299.99</p>
                                </th>
                                <th class="tab-th-2">
                                    <img src="${pageContext.request.contextPath}/static/images/taobao_minus.jpg"
                                         alt="minus" class="minus"/>
                                    <span>0</span>
                                    <img src="${pageContext.request.contextPath}/static/images/taobao_adding.jpg"
                                         alt="add" class="plus"/>
                                </th>
                                <th class="goods_price goods_prices">299.99</th>
                                <th class="tab-th-3"><a href="javascript:void(0);">删除</a></th>

                            </tr>
                        </table>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>
    </div>
    <div style="height:10px"></div>
    <div class="center">
        <div class="clearfix pc-shop-go">
            <div class="fl pc-shop-fl">
                <a href="javascript:void(0);" id="checkboxx">删除全选</a>
                <a href="javascript:void(0);">清除失效商品</a>
            </div>
            <div class="fr pc-shop-fr">
                <p>共有 <em class="totalNum">0</em> 款商品，总计（不含运费）:</p>
                <p>¥<em class="totalPrice"> 0</em></p>
                <a href="my-add.html">结算</a>
            </div>
        </div>
    </div>
</section>
<div style="height:100px"></div>
<jsp:include page="util/footer.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script>
    $(function () {
        $.ajax({

        })
    })
</script>
<%--计算--%>
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
    $(function () {
        //初始化单品小计
        singlePrice("span");
//        初始化总价
        total()

        //计算单品价格
        function singlePrice(elemt) {
            $(elemt).each(function () {
                var num = $(this).parent().children("span");
                var goods_price = (parseFloat($(this).parents(".on").find(".goods_price").text()).toFixed(2));
                $(this).parents(".on").find(".goods_prices").html((goods_price * parseInt(num.text())).toFixed(2));
            })




        }

        //计算总价和总数

        function total() {
            var totalprice=0;
            var totalnum=0;
            $(".on").each(function () {

                var $checkbox = $(this).find(".pro");
                if($checkbox.is(":checked")){

                    totalnum =totalnum+parseInt($(this).find("span").html());

                    totalprice = (totalprice + parseFloat($(this).find(".goods_prices").html()));

                }



            })
            $(".totalPrice").html(totalprice.toFixed(2));
            $(".totalNum").html(totalnum);
        }


        //选择某个店铺的所有
        $(".all").change(function () {

            if($(this).is(":checked")){
                $(this).parents("table").eq(0).find(".pro").each(function () {
                        $(this).prop("checked",true)
                })
            }else{
                $(this).parents("table").eq(0).find(".pro").each(function () {
                    $(this).removeAttr("checked");
                })
            }

            total()
        })

        //取消或者选择单个商品
            $(".pro").click(function () {
                singlePrice(".on");
                total()

            })

        //全选
        isChecked = false;
        $("#allCheckBox").click(function () {
            isChecked = !isChecked;
            if (isChecked) {
                $(".option").prop("checked", true);
            } else {
                $(".option").removeProp("checked");
            }
            total()

        });

        //删除
        $("table").on("click", "a", function () {

           $(this).parents("tr").remove();
            total()
            /*  var totalNum = parseInt($(".totalNum").text());
             totalNum++;
             $(".totalNum").text(totalNum);
 //计算总价
             var goods_price = parseFloat($(this).parent().parent().children(".goods_price").text());
             $(".totalPrice").text((parseFloat($(".totalPrice").text()) + goods_price).toFixed(2));*/
        })
        //删除全选
        $("#checkboxx").click(function () {
            $("input[name='cartCheckBox']:checked").each(function () { // 遍历选中的checkbox

              n = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
                $("table").find("tr:eq(" + n + ")").remove();
            });
            total()
            /*
                        var totalNum = parseInt($(".totalNum").text());
                        totalNum++;
                        $(".totalNum").text(totalNum);
            //计算总价
                        var goods_price = parseFloat($(this).parent().parent().children(".goods_price").eq(0).text());
                        $(".totalPrice").text((parseFloat($(".totalPrice").text()) + goods_price).toFixed(2));*/
        });


        $(".plus").click(function () {
            //数量加1
            var num = $(this).parent().children("span");
            num.text(parseInt(num.text()) + 1);
            singlePrice(this);
//商品总数增加
            /*var totalNum = parseInt($(".totalNum").text());
            totalNum++;
            $(".totalNum").text(totalNum);
            singlePrice(this)*/
//计算总价
           total()
        });
//点击减少按钮触发事件
        $(".minus").click(function () {
            var num = $(this).parent().children("span");
            if (parseInt(num.text()) >= 1) {
                num.text(parseInt(num.text()) - 1);

           /*     var totalNum = parseInt($(".totalNum").text());
                totalNum--;
                $(".totalNum").text(totalNum);
                var goods_price = parseFloat($(this).parent().parent().children(".goods_price").text());
                $(".totalPrice").text((parseFloat($(".totalPrice").text()) - goods_price).toFixed(2));*/
            } else {
                return;
            }
            singlePrice(this);
            total();
            /* var totalNum = parseInt($(".totalNum").text());
//                totalNum++;
             $(".totalNum").text(totalNum);
//计算总价
             var goods_price = parseInt($(this).parent().parent().children(".goods_price").text());
             $(".totalPrice").text(parseInt($(".totalPrice").text()) + goods_price);*/


        });


    })
</script>
</body>
</html>