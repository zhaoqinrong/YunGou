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
	<title>我的购物车-云购物商城</title>
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
							全选</th>
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
							<input type="checkbox" class="option" name="cartCheckBox" value="">
							<label>云购物自营</label>
							<a href="#" style="position:relative;padding-left:50px"><i class="icon-kefu"></i>联系客服</a>
							<ul class="clearfix fr" style="padding-right:20px">
								<li><i class="pc-shop-car-yun"></i>满109元减10</li>
								<li><i class="pc-shop-car-yun"></i>领取3种优惠券, 最高省30元</li>
							</ul>
						</td>
					</tr>
					<tr class="on">
						<th><input type="checkbox" class="option" name="cartCheckBox" value=""></th>
						<th class="tab-th-1">
							<a href="#"><img src="images/shangpinxiangqing/X1.png" width="100%" alt=""></a>
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
							<img src="images/taobao_minus.jpg" alt="minus" class="minus"/>
							<span>0</span>
							<img src="images/taobao_adding.jpg" alt="add" class="plus"/>
						</th>
						<th class="goods_price">299.99</th>
						<th class="tab-th-3"><a href="javascript:void(0);">删除</a></th>
					</tr>
					<tr class="on">
						<th><input type="checkbox" class="option" name="cartCheckBox" value=""></th>
						<th class="tab-th-1">
							<a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%" alt=""></a>
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
							<img src="images/taobao_minus.jpg" alt="minus" class="minus"/>
							<span>0</span>
							<img src="images/taobao_adding.jpg" alt="add" class="plus"/>
						</th>
						<th class="goods_price">299.99</th>
						<th class="tab-th-3"><a href="javascript:void(0);">删除</a></th>
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
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
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
	$(function(){
		//全选
		isChecked = false;
		$("#allCheckBox").click(function(){
			isChecked = !isChecked;
			if(isChecked){
				$(".option").prop("checked",true);
			}else{
				$(".option").removeProp("checked");
			}
		});
		//删除
		$("table").on("click","a",function(){
			$(this).parents("tr").remove();
		})
       //删除全选
			$("#checkboxx").click(function() {
				$("input[name='cartCheckBox']:checked").each(function() { // 遍历选中的checkbox
					n = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
					$("table").find("tr:eq("+n+")").remove();
				});
			});
		//点击增加按钮触发事件
		$(".plus").click(function(){
			var num = $(this).parent().children("span");
//单品数量增加
			num.text(parseInt(num.text())+1);
//商品总数增加
			var totalNum = parseInt($(".totalNum").text());
			totalNum++;
			$(".totalNum").text(totalNum);
//计算总价
			var goods_price = parseInt($(this).parent().parent().children(".goods_price").text());
			$(".totalPrice").text(parseInt($(".totalPrice").text())+goods_price);
		});
//点击减少按钮触发事件
		$(".minus").click(function(){
			var num = $(this).parent().children("span");
			num.text(parseInt(num.text())-1);
			if(parseInt(num.text())){
				var totalNum = parseInt($(".totalNum").text());
				totalNum--;
				$(".totalNum").text(totalNum);
				var goods_price = parseInt($(this).parent().parent().children(".goods_price").text());
				$(".totalPrice").text(parseInt($(".totalPrice").text())-goods_price);
			} else{
				num.text("0");
			}
		});
	})
</script>
</body>
</html>