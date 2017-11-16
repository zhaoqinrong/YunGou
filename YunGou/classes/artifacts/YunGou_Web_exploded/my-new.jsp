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
	<title>云购物商城-商城资讯</title>
	<link rel="shortcut icon" type="image/x-icon" href="img/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/home.css">
	<link rel="stylesheet" type="text/css" href="css/member.css">
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
            <form class="clearfix">
                <input class="search-text" accesskey="" id="key" autocomplete="off" placeholder="洗衣机" style="height: 37px;" type="text">
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
</header>

<div class="containers center"><div class="pc-nav-item"><a href="#">首页</a> &gt; <a href="#">会员中心 </a> &gt; <a href="#">商城快讯</a></div></div>
<section id="member">
	<div class="member-center clearfix">
		<div class="member-left fl">
			<div class="member-apart clearfix">
				<div class="fl"><a href="#"><img src="img/mem.png"></a></div>
				<div class="fl">
					<p>用户名：</p>
					<p><a href="#">亚里士多德</a></p>
					<p>搜悦号：</p>
					<p>389323080</p>
				</div>
			</div>
			<div class="member-lists">
				<dl>
					<dt>我的商城</dt>
					<dd><a href="#">我的订单</a></dd>
					<dd><a href="#">我的收藏</a></dd>
					<dd><a href="#">账户安全</a></dd>
					<dd><a href="#">我的评价</a></dd>
					<dd><a href="#">地址管理</a></dd>
				</dl>
				<dl>
					<dt>客户服务</dt>
					<dd><a href="#">退货申请</a></dd>
					<dd><a href="#">退货/退款记录</a></dd>
				</dl>
				<dl>
					<dt>我的消息</dt>
					<dd class="cur"><a href="#">商城快讯</a></dd>
					<dd><a href="#">帮助中心</a></dd>
				</dl>
			</div>
		</div>
		<div class="member-right fr">
			<div class="member-head">
				<div class="member-heels fl"><h2>商城快讯</h2></div>
			</div>
			<div class="member-border">
				<div class="member-form clearfix">
					<form>
						<input class="text-news" placeholder="商城快讯关键字" type="text">
						<input class="button-btn" value="搜索" type="button">
					</form>
				</div>
				<div class="member-entry">
					<div class="member-issue clearfix">
						<span>标题</span>
						<span>发布时间</span>
					</div>
					<ul>
						<li class="clearfix"><div><a href="#">不做女汉字换季护肤保卫战</a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">买JBL耳机送上古世纪游戏炫酷时装礼包 </a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">日韩美妆爆品低至1折起,不做女汉字换季护肤保卫战</a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">愚人节整蛊玩具低至19</a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">文艺蓝牙音箱 火热众筹中 </a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">金秋献礼，热销投影送激光笔，指定机型送安装！ </a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">男装跨店满299减60,赶快行动吧～！～～～</a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">愚人节整蛊玩具低至19</a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">文艺蓝牙音箱 火热众筹中 </a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">金秋献礼，热销投影送激光笔，指定机型送安装！ </a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">男装跨店满299减60,赶快行动吧～！～～～</a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">无线立式吸尘器仅￥399 ！</a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">无线立式吸尘器仅￥399 ！</a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">赏春盛宴 大牌春装1折起 </a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">放价旅游 红包免费领，点到你手软！</a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">1元加价购台湾高粱美酒热销中 ！</a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">1元加价购台湾高粱美酒热销中</a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">愚人节整蛊玩具低至19</a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">文艺蓝牙音箱 火热众筹中 </a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">金秋献礼，热销投影送激光笔，指定机型送安装！ </a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">男装跨店满299减60,赶快行动吧～！～～～</a></div><div>2015-03-31 17:23:20</div></li>
						<li class="clearfix"><div><a href="#">无线立式吸尘器仅￥399 ！</a></div><div>2015-03-31 17:23:20</div></li>
					</ul>
				</div>
				<div class="member-pages clearfix">
					<div class="fr pc-search-g">
						<a href="#" class="fl pc-search-f">上一页</a>
						<a class="current" href="#">1</a>
						<a href="javascript:;">2</a>
						<a href="javascript:;">3</a>
						<a href="javascript:;">4</a>
						<a href="javascript:;">5</a>
						<a href="javascript:;">6</a>
						<a href="javascript:;">7</a>
						<span class="pc-search-di">…</span>
						<a onclick="SEARCH.page(3, true)" href="javascript:;" class="pc-search-n" title="使用方向键右键也可翻到下一页哦！">下一页</a>
						<span class="pc-search-y">
                        <em>  共20页    到第</em>
                        <input placeholder="1" class="pc-search-j" type="text">
                        <em>页</em>
                        <a class="confirm" href="#">确定</a>
                    </span>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>


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