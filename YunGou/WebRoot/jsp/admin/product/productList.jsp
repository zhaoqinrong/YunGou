<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Tables</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Novus Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>

    <%--    <link href="../css/base.css" rel="stylesheet">
        <link href="../css/home.css" rel="stylesheet">--%>
    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/jsp/admin/css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/jsp/admin/css/style.css" rel='stylesheet' type='text/css'/>
    <!-- font CSS -->
    <!-- font-awesome icons -->
    <link href="${pageContext.request.contextPath}/jsp/admin/css/font-awesome.css" rel="stylesheet">

    <!-- //font-awesome icons -->
    <!-- js-->

    <!--webfonts-->
    <link href='https://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic'
          rel='stylesheet' type='text/css'>
    <!--//webfonts-->
    <!--animate-->

    <link href="${pageContext.request.contextPath}/jsp/admin/css/custom.css" rel="stylesheet">
    <style type="text/css">
        .error {
            color: red;
            font-weight: normal;
        }
    </style>
    <!--//Metis Menu -->
</head>

<body class="cbp-spmenu-push">
<div class="main-content">
    <!--left-fixed -navigation-->
    <jsp:include page="../nav.jsp"/>

    <!--left-fixed -navigation-->
    <!-- header-starts -->
    <!-- //header-ends -->
    <jsp:include page="../header.jsp"/>
    <div id="page-wrapper">
        <div class="main-page">
            <div class="tables">
                <div class="table-responsive bs-example widget-shadow">
                    <h4>商品列表:</h4>
                    <div class="form-two">

                        <div class="form-body" style="padding: 10px;" data-example-id="simple-form-inline">
                            <form class="form-inline"
                                  action="${pageContext.request.contextPath}/product?action=getProductBy" method="post">
                                <div class="form-group"><label for="one">一级分类</label>
                                    <select name="categorygoryLevel1" id="one">
                                        <option selected value="0">请选择</option>
                                        <c:forEach items="${category}" var="item">
                                            <option value="${item.id}">${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group"><label for="two">二级分类</label>
                                    <select name="categorygoryLevel2" id="two">
                                        <option selected value="0">请选择</option>

                                    </select>
                                </div>
                                <div class="form-group"><label for="three">三级分类</label>
                                    <select name="categorygoryLevel3" id="three">
                                        <option selected value="0">请选择</option>

                                    </select>
                                </div>
                                <div class="form-group"><label for="serach">关键字</label>
                                    <input type="serach" id="serach" name="serachWords">
                                </div>
                            </form>
                        </div>
                    </div>

                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>商品id</th>
                            <th>商品名称</th>
                            <th>商品价格</th>
                            <th>商品库存</th>
                            <th>商品状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="tbody">

<%--商品--%>

                        </tbody>
                    </table>
                    <nav class="col-md-offset-4">
                        <ul class="pagination pagination-lg" id="nav">
                          <%--导航--%>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>

    <!-- main content start-->

    <!--//footer-->
</div>
<script src="${pageContext.request.contextPath}/jsp/admin/js/jquery-1.11.1.min.js"></script>
<script type="application/x-javascript"> addEventListener("load", function () {
    setTimeout(hideURLbar, 0);
}, false);

function hideURLbar() {
    window.scrollTo(0, 1);
} </script>

<script src="${pageContext.request.contextPath}/jsp/admin/js/modernizr.custom.js"></script>
<link href="${pageContext.request.contextPath}/jsp/admin/css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="${pageContext.request.contextPath}/jsp/admin/js/wow.min.js"></script>
<script>
    new WOW().init();
</script>
<!--//end-animate-->
<!-- Metis Menu -->
<script src="${pageContext.request.contextPath}/jsp/admin/js/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/admin/js/custom.js"></script>
<!-- Classie -->

<script src="${pageContext.request.contextPath}/jsp/admin/js/classie.js"></script>
<script>
    var menuLeft = document.getElementById('cbp-spmenu-s1'),
        showLeftPush = document.getElementById('showLeftPush'),
        body = document.body;

    showLeftPush.onclick = function () {
        classie.toggle(this, 'active');
        classie.toggle(body, 'cbp-spmenu-push-toright');
        classie.toggle(menuLeft, 'cbp-spmenu-open');
        disableOther('showLeftPush');
    };

    function disableOther(button) {
        if (button !== 'showLeftPush') {
            classie.toggle(showLeftPush, 'disabled');
        }
    }
</script>
<!--scrolling js-->
<script src="${pageContext.request.contextPath}/jsp/admin/js/jquery.nicescroll.js"></script>
<script src="${pageContext.request.contextPath}/jsp/admin/js/scripts.js"></script>
<!--//scrolling js-->
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/jsp/admin/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/jsp/admin/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(
        /*  var $two=$("#two").val();
          var $three=$("$three").val();*/
        //获取二级分类
        $("#one").change(function () {
            var $two = $("#two").empty().append("<option value='0' >请选择</option>");
            var $three = $("#three").empty().append("<option  value='0'>请选择</option>");
            var $one = $("#one").val();
            if ($one == null) {
                return;
            }

            $.ajax({
                url: "${pageContext.request.contextPath}/category?action=getlevelParentId&parentId=" + $one,
                type: "POST",
                success: function (data) {

                    $(data).each(function (index, item) {
                        $two.append($("<option value='" + item.id + "'>" + item.name + "</option>"))
                    })


                },
                dataType: "json"
            })

        })
    )
    $(function () {//获取三级分类
        $("#two").change(function () {
            var $three = $("#three").empty().append("<option  value='0'>请选择</option>");
            var $two = $("#two").val();
            if ($two == null) {
                return;
            }

            $.ajax({
                url: "${pageContext.request.contextPath}/category?action=getlevelParentId&parentId=" + $two,
                type: "POST",
                success: function (data) {

                    $(data).each(function (index, item) {
                        $three.append($("<option value='" + item.id + "'>" + item.name + "</option>"))
                    })


                },
                dataType: "json"
            })
        })
    })
    var currPage = parseInt($("li[class=active] input").val())//网页一刷新,获取一下当前页
    $(function () {//通过条件查找商品,发送ajax
        $("[name=categorygoryLevel1]").change(function () {
            getProductBy(1);
        })
        $("[name=categorygoryLevel2]").change(function () {
            getProductBy(1);
        })
        $("[name=categorygoryLevel3]").change(function () {
            getProductBy(1);
        })
        $("[name=serachWords]").keyup(function () {
            getProductBy(1);
        })
        $("#nav").delegate("li", "click", function () {
            var currPage = parseInt($(this).find("input").val());
            if (currPage > 1) {
                if ($(this).attr("id") == "pre") {
                    currPage -= 1;
                }
            }
            if (currPage < ($("#nav li").length - 2)) {
                if ($(this).attr("id") == "next") {
                    currPage += 1;
                }
            }
            $(this).find("input[value=" + currPage + "]").parent("li").addClass("active");
            $(this).siblings().removeClass("active");
            getProductBy(currPage);
        })
        getProductBy(1);
        function getProductBy(currPage) {
            var condition = new Array();
            condition.push($("#one").val());
            condition.push($("#two").val());
            condition.push($("#three").val());
            condition.push($("#serach").val());
            condition.push(currPage);

            $.ajax({
                url: "${pageContext.request.contextPath}/product?action=getProductBy",
                data: {
                    "categorygoryLevel1": condition[0],
                    "categorygoryLevel2": condition[1],
                    "categorygoryLevel3": condition[2],
                    "serachWords": condition[3],
                    "currPage": condition[4]
                },
                type: "post",
                success: function (data) {
                    var $tbody = $("tbody").empty();
                    var $ul = $("#nav").empty();
                    $(data.list).each(function (index, item) {
                        var isDelete = "已删除";
                        if (item.isDelete ==1) {
                            isDelete = "已删除";
                        }else if(item.isDelete ==2){
                            isDelete = "热卖商品";
                        } else  if(item.isDelete ==3){
                            isDelete = "限时抢购";
                        }else{
                            isDelete = "出售中";
                        }
                        $tbody.append("<tr>\n" +
                            "                    <th scope='row'>" + index + "</th>\n" +
                            "                        <td>" + item.id + "</td>\n" +
                            "                        <td>" + item.name + "</td>\n" +
                            "                        <td>" + item.price + "</td>\n" +
                            "                        <td>" + item.stock + "</td>\n" +
                            "                        <td>" + isDelete + "</td>\n" +
                            "                        <td>\n" +
                            "                        <a href='${pageContext.request.contextPath}/product?action=getProductByidView&id="+item.id+"' role='button'\n" +
                            "                    data-toggle='modal'><i class='glyphicon glyphicon-eye-open'></i></a>\n" +
                            "                    <a href='${pageContext.request.contextPath}/product?action=getProductByid&id="+item.id+"' role='button' data-toggle='modal'><i class='glyphicon glyphicon-pencil'></i></a>\n" +
                            "                    </td>\n" +
                            "                    </tr>")


                    })

                    if (data.pages > 0) {//说明有上下页


                        $ul.append($("<li id='pre'>" +
                            " <input type='hidden' name='currPage' value='" + data.currPage + "'>" +
                            "<a href='javascript:void(0);' aria-label='Previous'><span aria-hidden='true'>«</span></a></li>  "))
                        for (var i = 1; i <= data.pages; i++) {

                            if (i == data.currPage) {//当前页增加class属性
                                $ul.append("<li class='active'>" +
                                    " <input type='hidden' name='currPage' value='" + i + "'>" +
                                    "<a  href='javascript:void(0);'>" + i + "</a></li>");
                            } else {
                                $ul.append("<li >" +
                                    " <input type='hidden' name='currPage' value='" + i + "'>" +
                                    "<a  href='javascript:void(0);'>" + i + "</a></li>");
                            }

                        }

                        $ul.append("<li id='next' >" +
                            " <input type='hidden' name='currPage' value='" + data.currPage + "'>" +
                            "<a href='javascript:void(0);' aria-label='Previous'><span aria-hidden='true'>»</span></a></li>");

                    }


                },
                dataType: "json"
            })

        }


    })
</script>
</body>
</html>