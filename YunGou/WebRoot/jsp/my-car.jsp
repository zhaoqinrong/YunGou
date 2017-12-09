<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .goods_prices {
            width: 148px;
        }

        .on th {
            text-align: center;
        }

        .tab-th-1 * {
            line-height: 100px;
        }
    </style>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/jsp/util/header.jsp"></jsp:include>
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
                    <th class="tab-1" style="width: 70px">
                        <input type="checkbox" id="allCheckBox">
                        全选
                    </th>
                    <th class="tab-2" style="width: 330px;text-align: center">商品</th>
                    <th class="tab-4">单价</th>
                    <th class="tab-5">数量</th>
                    <th class="tab-6">小计</th>
                    <th class="tab-7">操作</th>
                    <th class="tab-7">状态</th>
                </tr>
                </thead>
                <tbody id="cart">

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
</body>
</html>


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
        getAllCar();
    })

    /*//检查用户的产品哪些失效,并将失效的产品的id进行返回
    function valide() {
        $.ajax({
            url: "${pageContext.request.contextPath}/cart?action=valide",
            type: "get",
            success: function (data) {
                $(data).each(function () {
                 var id=   this.id;
                    $("[name=cartDetailId]").each(function () {
                        if($(this).val()==id){
                                $(this).parents("tr").find("#status").html("已失效");
                        }
                    })

                })
            },
            dataType: "json"
        })
    }*/

    function getAllCar() {

        $.ajax({
            url: "${pageContext.request.contextPath}/cart?action=getMyAllCar",
            type: "post",
            success: function (data) {
                $(data.carDetailList).each(function () {
                    var status = "正常";
                    if (this.status != 0) {
                        status = "已失效"
                    }
                    $("#cart").append("  <tr class='on'>" +
                        "                                <th><input type='hidden'  name='cartDetailId' value='" + this.id + "' >" +
                        "<input type='checkbox' class='option pro' name='cartCheckBox' value='' ></th>" +
                        "                                <th class='tab-th-1'>\n" +
                        "                                    <a href='${pageContext.request.contextPath}/product?action=getProductByidView&id=" + this.pid + "'><img\n" +
                        "                                            src='${pageContext.request.contextPath}/productImg/" + this.product.fileName + "'" +
                        "                                            width='100%' alt=''></a>\n" +
                        "                                    <a href='${pageContext.request.contextPath}/product?action=getProductByidView&id=" + this.pid + "' class='tab-title'>" + this.product.name + "</a>\n" +
                        "                                </th>\n" +
                        "                                <th>\n" +
                        "                                    <p class='goods_price'>" + this.product.price + "</p>\n" +
                        "                                </th>\n" +
                        "                                <th class='tab-th-2'>\n" +
                        "                                    <img src='${pageContext.request.contextPath}/static/images/taobao_minus.jpg'\n" +
                        "                                         alt='minus' class='minus'/>\n" +
                        "                                    <span class='pnum'>" + this.pnum + "</span>\n" +
                        "                                    <img src='${pageContext.request.contextPath}/static/images/taobao_adding.jpg'\n" +
                        "                                         alt='add' class='plus'/>\n" +
                        "                                </th>\n" +
                        "                                <th class='goods_price goods_prices'>" + this.product.price * this.pnum + "</th>\n" +
                        "                                <th class='tab-th-3'><a href='javascript:void(0);'class='del'>删除</a></th>\n" +
                        "                                <th class='tab-th-3'><a href='javascript:void(0);' id='status'>" + status + "</a></th>\n" +
                        "\n" +
                        "                            </tr>")
                })

            },
            dataType: "json"
        })
    }

    //选择
    $("table").on("click", ".pro", function () {

        singlePrice(this)
        total()

    })

    //计算单品价格
    function singlePrice(elemnt) {
        $(".goods_prices").each(function () {
            var pnum = parseInt($(elemnt).parents("tr").find(".pnum").html());
            var price = parseFloat($(elemnt).parents("tr").find(".goods_price").html())
            $(elemnt).parents("tr").find(".goods_prices").empty().html((pnum * price).toFixed(2))

        })
    }

    //计算总价和总数

    function total() {
        var totalprice = 0;
        var totalnum = 0;
        $(".on").each(function () {

            var $checkbox = $(this).find(".pro");
            if ($checkbox.is(":checked")) {
                totalnum = totalnum + parseInt($(this).find(".pnum").html());

                totalprice = (totalprice + parseFloat($(this).find(".goods_prices").html()));

            }


        })
        $(".totalPrice").empty().html(totalprice.toFixed(2));
        $(".totalNum").empty().html(totalnum);
    }


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
    $("table").on("click", ".del", function () {
        var $a = $(this);
        var id = $a.parents("tr").find("[name='cartDetailId']").val();
        $.ajax({
            url: "${pageContext.request.contextPath}/cart",
            type: "post",
            data: {
                "action": "delCartDetailById",
                "id": id
            },
            success: function (data) {
                if (data == "true") {
                    $a.parents("tr").remove();
                    singlePrice(this)
                    total()
                } else {
                    alert("删除失败")
                }
            }
        })


    })


    //删除全选
    $("#checkboxx").click(function () {
        var arr = new Array();
        $(".pro:checked").each(function () {
            id = $(this).parents("tr").find("[name='cartDetailId']").val();
            arr.push(id);
        })
        var s = arr.join("-");
        $.ajax({
            url: "${pageContext.request.contextPath}/cart",
            data: {
                "action": "delAllCarDetail",
                "ids": s
            },
            success: function (data) {
                if (data == "true") {
                    $(".pro:checked").each(function () { // 遍历选中的checkbox
                        n = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
                        $("tbody").find("tr:eq(" + n + ")").remove();
                    });
                    singlePrice(this)
                    total()
                } else {
                    alert("删除失败")
                }
            }
        })


    });

    $("table").on("click", ".plus", function () {
        //数量加1
        var num = $(this).prev();
        num.text(parseInt(num.text()) + 1);
        singlePrice(this)
        total()
    });
    //点击减少按钮触发事件
    $("table").on("click", ".minus", function () {
        var num = $(this).next();
        if (parseInt(num.text()) > 1) {
            num.text(parseInt(num.text()) - 1);
        } else {
            return;
        }
        singlePrice(this)
        total()


    });

</script>
