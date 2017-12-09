<%@ page language="java"  pageEncoding="UTF-8"%>
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
	<link rel="shortcut icon" type="image/x-icon" href="img/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/home.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/modernizr-custom-v2.7.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.SuperSlide.js"></script>
	<script type="text/javascript">

        var intDiff = parseInt(90000);//倒计时总秒数量

        function timer(intDiff){
            window.setInterval(function(){
                var day=0,
                    hour=0,
                    minute=0,
                    second=0;//时间默认值
                if(intDiff > 0){
                    day = Math.floor(intDiff / (60 * 60 * 24));
                    hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                    minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                    second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
                }
                if (minute <= 9) minute = '0' + minute;
                if (second <= 9) second = '0' + second;
                $('#day_show').html(day+"天");
                $('#hour_show').html('<s id="h"></s>'+hour+'时');
                $('#minute_show').html('<s></s>'+minute+'分');
                $('#second_show').html('<s></s>'+second+'秒');
                intDiff--;
            }, 1000);
        }

        $(function(){
            timer(intDiff);
        });//倒计时结束

        $(function(){
	        /*======右按钮======*/
            $(".you").click(function(){
                nextscroll();
            });
            function nextscroll(){
                var vcon = $(".v_cont");
                var offset = ($(".v_cont li").width())*-1;
                vcon.stop().animate({marginLeft:offset},"slow",function(){
                    var firstItem = $(".v_cont ul li").first();
                    vcon.find(".flder").append(firstItem);
                    $(this).css("margin-left","0px");
                });
            };
	        /*========左按钮=========*/
            $(".zuo").click(function(){
                var vcon = $(".v_cont");
                var offset = ($(".v_cont li").width()*-1);
                var lastItem = $(".v_cont ul li").last();
                vcon.find(".flder").prepend(lastItem);
                vcon.css("margin-left",offset);
                vcon.animate({marginLeft:"0px"},"slow")
            });
        });

	</script>
	<script type="text/javascript">
        $(document).ready(function(){
            var $miaobian=$('.Xcontent08>div');
            var $huantu=$('.Xcontent06>img');
            var $miaobian1=$('.Xcontent26>div');
            $miaobian.mousemove(function(){miaobian(this);});
            $miaobian1.click(function(){miaobian1(this);});
            function miaobian(thisMb){
                for(var i=0; i<$miaobian.length; i++){
                    $miaobian[i].style.borderColor = '#dedede';
                }
                thisMb.style.borderColor = '#cd2426';

                $huantu[0].src = thisMb.children[0].src;
            }
            function miaobian1(thisMb1){
                for(var i=0; i<$miaobian1.length; i++){
                    $miaobian1[i].style.borderColor = '#dedede';
                }
//		thisMb.style.borderColor = '#cd2426';
                $miaobian.css('border-color','#dedede');
                thisMb1.style.borderColor = '#cd2426';
                $huantu[0].src = thisMb1.children[0].src;
            }
            $(".Xcontent33").click(function(){
                var value=parseInt($('.input').val())+1;
                $('.input').val(value);
            })

            $(".Xcontent32").click(function(){
                var num = $(".input").val()
                if(num>0){
                    $(".input").val(num-1);
                }

            })

        })
	</script>
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
</header>

<div class="center" style="background:#fff;">
	<div style="padding:20px">
		<div class="containers"><div class="pc-nav-item"><a href="#">全部分类 </a> &gt; <a href="#">黑糖</a></div></div>
		<div class="containers clearfix">
			<div class="fl">
				<div id="firstpane" class="menu_list">
					<h2>所有类目</h2>
					<h3 class="menu_head current">进口食品</h3>
					<div style="display:block" class="menu_body">
						<a href="#">冲调饮品</a>
						<a href="#">糖果/巧克力</a>
					</div>
					<h3 class="menu_head">营养健康</h3>
					<div style="display:none" class="menu_body">
						<a href="#">营养健康</a>
						<a href="#">营养健康</a>
						<a href="#">营养健康</a>
					</div>

					<h3 class="menu_head">粮油调味</h3>
					<div style="display:none" class="menu_body">
						<a href="#">粮油调味</a>
						<a href="#">粮油调味</a>
						<a href="#">粮油调味</a>
						<a href="#">粮油调味</a>
					</div>
				</div>
			</div>
			<div class="pc-info fr" style="width:955px">
				<div class="pc-term">
					<dl class="pc-term-dl clearfix">
						<dt>品牌：</dt>
						<dd><a href="#">三星（SAMSUNG）</a></dd>
						<dd><a href="#">华为（HUAWEI）</a></dd>
						<dd><a href="#">联想（lenovo）</a></dd>
						<dd><a href="#">索尼（SONY）</a></dd>
						<dd><a href="#">飞利浦（Philips）</a></dd>
						<dd><a href="#">Apple</a></dd>
						<dd><a href="#">小米（MI）</a></dd>
						<dd><a href="#">HTC</a></dd>
						<dd><a href="#">酷派（Coolpad）</a></dd>
						<dd><a href="#">诺基亚（NOKIA）</a></dd>
						<dd><a href="#">中兴（ZTE）</a></dd>
					</dl>
					<dl class="pc-term-dl clearfix">
						<dt>尺寸：</dt>
						<dd><a href="#">4.5英寸</a></dd>
						<dd><a href="#">4.7英寸</a></dd>
						<dd><a href="#">5.0英寸</a></dd>
						<dd><a href="#">5.5英寸</a></dd>
						<dd><a href="#">5.3英寸</a></dd>
						<dd><a href="#">7.0英寸</a></dd>
						<dd><a href="#">6.0英寸</a></dd>
						<dd><a href="#">3.5英寸</a></dd>
					</dl>
					<dl class="pc-term-dl clearfix">
						<dt>系统：</dt>
						<dd><a href="#">iOS</a></dd>
						<dd><a href="#">Android/安卓</a></dd>
						<dd><a href="#">Windows Phone</a></dd>
						<dd><a href="#">无操作系统</a></dd>
						<dd><a href="#">YunOS</a></dd>
						<dd><a href="#">FLyme</a></dd>
						<dd><a href="#">MIUI</a></dd>
						<dd><a href="#">MTK</a></dd>
						<dd><a href="#">iOS</a></dd>
					</dl>
					<div>
						<a href="#">更多</a>
					</div>

					<div class="pc-line"></div>
					<div class="pc-search clearfix">
						<div class="fl pc-search-in">
							<input class="pc-search-w" type="text">
							<input class="pc-search-s" placeholder="￥" type="text">
							<input class="pc-search-s" placeholder="￥" type="text">
							<a href="#" class="pc-search-a">搜索</a>
						</div>
						<div class="fr pc-with">
							相关搜索： <a href="#">黑糖</a><em>|</em><a href="#">姜茶</a><em>|</em><a href="#">红印黑糖</a><em>|</em><a href="#">黑糖话梅</a><em>|</em><a href="#">黑糖姜母</a><em>|</em><a href="#">茶黑糖饼</a><em>|</em><a href="#">干黑糖</a><em>|</em><a href="#">沙琪玛</a>
						</div>
					</div>
				</div>
				<div class="pc-term">
					<div class="clearfix pc-search-p">
						<div class="fl pc-search-e"><a href="#" class="cur">销量</a><a href="#">价格</a><a href="#">评价</a><a href="#">上架时间</a></div>
						<div class="fr pc-search-v">
							<ul>
								<li><input type="checkbox"><a href="#">有货</a> </li>
								<li><input type="checkbox"><a href="#">限时抢购</a> </li>
								<li><input type="checkbox"><a href="#">满减大促</a> </li>
							</ul>
						</div>
					</div>
					<div class="pc-search-i">
						<div class="fr">
							<span class="pc-search-t"><b>1</b><em>/</em><i>32</i></span>
							<a href="#" class="pc-search-d">上一页</a>
							<a href="#">下一页</a>
						</div>
					</div>
				</div>
				<div class="time-border-list pc-search-list clearfix">
					<ul class="clearfix">
						<li>
							<a href="#"> <img src="images/shangpinxiangqing/X-1.png" width=100%></a>
							<p class="head-name"><a href="#">小米 4 2GB内存版 白色 移动4G手机不锈钢金属边框</a> </p>
							<p><span class="price">￥138.00</span></p>
							<p class="head-futi clearfix"><span class="fl">好评度：90% </span> <span class="fr">100人购买</span></p>
							<p class="clearfix"><span class="label-default fl">抢购</span> <a href="#" class="fr pc-search-c">收藏</a> </p>
						</li>
						<li>
							<a href="#"> <img src="images/shangpinxiangqing/X-1.png" width=100%></a>
							<p class="head-name"><a href="#">小米 4 2GB内存版 白色 移动4G手机不锈钢金属边框</a> </p>
							<p><span class="price">￥138.00</span></p>
							<p class="head-futi clearfix"><span class="fl">好评度：90% </span> <span class="fr">100人购买</span></p>
							<p class="clearfix"><span class="label-default fl">抢购</span> <a href="#" class="fr pc-search-c">收藏</a> </p>
						</li>
						<li>
							<a href="#"> <img src="images/shangpinxiangqing/X-1.png" width=100%></a>
							<p class="head-name"><a href="#">小米 4 2GB内存版 白色 移动4G手机不锈钢金属边框</a> </p>
							<p><span class="price">￥138.00</span></p>
							<p class="head-futi clearfix"><span class="fl">好评度：90% </span> <span class="fr">100人购买</span></p>
							<p class="clearfix"><span class="label-default fl">抢购</span> <a href="#" class="fr pc-search-c">收藏</a> </p>
						</li>
						<li>
							<a href="#"> <img src="images/shangpinxiangqing/X-1.png" width=100%></a>
							<p class="head-name"><a href="#">小米 4 2GB内存版 白色 移动4G手机不锈钢金属边框</a> </p>
							<p><span class="price">￥138.00</span></p>
							<p class="head-futi clearfix"><span class="fl">好评度：90% </span> <span class="fr">100人购买</span></p>
							<p class="clearfix"><span class="label-default fl">抢购</span> <a href="#" class="fr pc-search-c">收藏</a> </p>
						</li>

					</ul>
					<div class="clearfix">
						<div class="fr pc-search-g">
							<a class="fl pc-search-f" href="#">上一页</a>
							<a href="#" class="current">1</a>
							<a href="javascript:;">2</a>
							<a href="javascript:;">3</a>
							<a href="javascript:;">4</a>
							<a href="javascript:;">5</a>
							<a href="javascript:;">6</a>
							<a href="javascript:;">7</a>
							<span class="pc-search-di">…</span>
							<a title="使用方向键右键也可翻到下一页哦！" class="pc-search-n" href="javascript:;" onclick="SEARCH.page(3, true)">下一页</a>
							<span class="pc-search-y">
                        <em>  共20页    到第</em>
                        <input class="pc-search-j" placeholder="1" type="text">
                        <em>页</em>
                        <a href="#" class="confirm">确定</a>
                    </span>

						</div>
					</div>
				</div>
				<div class="pc-search-re clearfix">
					<dl>
						<dt>重新搜索</dt>
						<dd>
							<input value="三星" id="key-re-search" class="text" type="text">
							<input value="搜&nbsp;索" id="btn-re-search" class="button" type="button">
						</dd>
					</dl>
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
    $(".top-nav ul li").hover(function(){
        $(this).addClass("hover").siblings().removeClass("hover");
        $(this).find("li .nav a").addClass("hover");
        $(this).find(".con").show();
    },function(){
        //$(this).css("background-color","#f5f5f5");
        $(this).find(".con").hide();
        //$(this).find(".nav a").removeClass("hover");
        $(this).removeClass("hover");
        $(this).find(".nav a").removeClass("hover");
    })
</script>
</body>
</html>