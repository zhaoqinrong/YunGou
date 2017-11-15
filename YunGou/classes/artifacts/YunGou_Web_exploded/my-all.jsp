<%@ page language="java" pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus®">
	<meta name="Author" content="">
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta name="renderer" content="webkit">
	<title>云购物商城-所有分类</title>
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

<jsp:include page="util/header.jsp"/>


<div class="center" style="background:#fff;">
	<div style="padding:20px">
		<div class="containers clearfix"><div class="pc-nav-item fl"><a href="#" class="pc-title">首页</a> &gt;<a href="#"> 所有货架</a></div> <div class="fr" style="padding-top:20px;"><a href="#" class="reds">所有品牌&gt;</a></div></div>
		<div class="containers">
			<div class="pc-nav-rack clearfix">
				<ul>
					<li><a href="#">家用电器</a></li>
					<li><a href="#">手机数码</a></li>
					<li><a href="#">电脑办公</a></li>
					<li><a href="#">家居家装</a></li>
					<li><a href="#">男装女装</a></li>
					<li><a href="#">个护化妆</a></li>
					<li><a href="#">运动户外</a></li>
					<li><a href="#">箱包钟表</a></li>
					<li><a href="#">汽车用品</a></li>
					<li><a href="#">玩具乐器</a></li>
					<li><a href="#">食品酒类</a></li>
					<li><a href="#">玩具乐器</a></li>
					<li><a href="#">营养保健</a></li>
					<li><a href="#">图书音像</a></li>
					<li><a href="#">充值票务</a></li>
				</ul>
			</div>
			<div>
				<div class="pc-nav-title"><h3>手机数码</h3></div>
				<div class="pc-nav-digit clearfix">
					<ul>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
					</ul>
				</div>
			</div>
			<div>
				<div class="pc-nav-title"><h3>摄影</h3></div>
				<div class="pc-nav-digit clearfix">
					<ul>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
						<li>
							<div class="digit1"><a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%"></a></div>
							<div class="digit2"><a href="#">家用电器</a></div>
						</li>
					</ul>
				</div>
			</div>
			<div style="padding-top:30px;">
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
                        <input type="text" placeholder="1" class="pc-search-j">
                        <em>页</em>
                        <a class="confirm" href="#">确定</a>
                    </span>

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