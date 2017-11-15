<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus®">
	<meta name="Author" content="">
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta name="renderer" content="webkit">
	<title>云购物商城-搜索无结果</title>
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
		<div class="containers">
			<div class="pc-no">抱歉，没有找到与“<em style="color:#ee4644">手机模型</em>”相关的商品</div>
			<div class="time-lists clearfix">
				<div class="time-list time-list-w fl" style="width:1156px">
					<div class="time-title time-clear"><h2>热卖区</h2><div class="pc-font fl"></div><a href="javascript:;" class="pc-spin fr">换一换</a> </div>
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