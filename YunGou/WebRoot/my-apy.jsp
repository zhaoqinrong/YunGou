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
	<title>支付方式-云购物商城</title>
	<link rel="shortcut icon" type="image/x-icon" href="img/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/home.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/modernizr-custom-v2.7.1.min.js"></script>

</head>
<body>

<jsp:include page="util/header.jsp"/>

<section id="pc-jie">
	<div class="center ">
		<ul class="pc-shopping-title clearfix">
			<li><a href="#" class="cu">全部商品(10)</a></li>
			<li><a href="#">限时优惠(7)</a></li>
			<li><a href="#">库存紧张(0)</a></li>
		</ul>
	</div>
	<div class="pc-shopping-cart center">
		<div class="pc-shopping-tab">
			<table>
				<thead>
					<tr class="tab-0">
						<th class="tab-1"><input type="checkbox" name="s_all" class="s_all tr_checkmr" id="s_all_h"><label for=""> 全选</label></th>
						<th class="tab-2">商品</th>
						<th class="tab-3">商品信息</th>
						<th class="tab-4">单价</th>
						<th class="tab-5">数量</th>
						<th class="tab-6">小计</th>
						<th class="tab-7">操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="7" style="padding-left:10px; background:#eee">
							<input type="checkbox" checked >
							<label for="">云购物自营</label>
							<a href="#" style="position:relative;padding-left:50px"><i class="icon-kefu"></i>联系客服</a>
							<ul class="clearfix fr" style="padding-right:20px">
								<li><i class="pc-shop-car-yun"></i>满109元减10</li>
								<li><i class="pc-shop-car-yun"></i>领取3种优惠券, 最高省30元</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th><input type="checkbox"  style="margin-left:10px; float:left"></th>
						<th class="tab-th-1">
							<a href="#"><img src="images/shangpinxiangqing/X1.png" width="100%" alt=""></a>
							<a href="#" class="tab-title">赛亿（shinee)取暖器家用/取暖电器/电暖器/电暖气台式摇头暖风机HN2118PT </a>
						</th>
						<th>
							<p>颜色：黑色</p>
							<p>规格：落地款</p>
						</th>
						<th>
							<p>399.99</p>
							<p class="red">299.99</p>
						</th>
						<th class="tab-th-2">
							<span>-</span>
							<input type="text" value="1" maxlength="3" placeholder="" class="shul">
							<span>+</span>
						</th>
						<th class="red">299.99</th>
						<th><a href="#">删除</a></th>
					</tr>
					<tr>
						<th><input type="checkbox"  style="margin-left:10px; float:left"></th>
						<th class="tab-th-1">
							<a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%" alt=""></a>
							<a href="#" class="tab-title">赛亿（shinee)取暖器家用/取暖电器/电暖器/电暖气台式摇头暖风机HN2118PT </a>
						</th>
						<th>
							<p>颜色：黑色</p>
							<p>规格：落地款</p>
						</th>
						<th>
							<p>399.99</p>
							<p class="red">299.99</p>
						</th>
						<th class="tab-th-2">
							<span>-</span>
							<input type="text" value="1" maxlength="3" placeholder="" class="shul">
							<span>+</span>
						</th>
						<th class="red">299.99</th>
						<th><a href="#">删除</a></th>
					</tr>
				</tbody>
			</table>

		</div>
	</div>
	<div style="height:10px"></div>
	<div class="center">
		<div class="clearfix pc-shop-go">
			<div class="fl pc-shop-fl">
				<input type="checkbox" placeholder="">
				<label for="">全选</label>
				<a href="#">删除</a>
				<a href="#">清楚失效商品</a>
			</div>
			<div class="fr pc-shop-fr">
				<p>共有 <em class="red pc-shop-shu">2</em> 款商品，总计（不含运费）</p>
				<span>¥ 699.00</span>
				<a href="my-add.html">去付款</a>
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