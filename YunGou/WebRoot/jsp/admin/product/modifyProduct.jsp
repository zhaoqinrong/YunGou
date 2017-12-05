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
        <div class="main-page signup-page">
            <h3 class="title1">添加商品 </h3>
            <div class="sign-up-row widget-shadow">
                <form class="form-horizontal" id="tab" method="post" enctype="multipart/form-data"
                      action="${pageContext.request.contextPath}/product?action=addProduct">

                    <div class="sign-u">
                        <div class="sign-up1">
                            <h4>请选择分类 :</h4>
                        </div>
                        <div class="sign-up2">

                            <div class="form-group"><label for="one" style="margin: 1.6em 0.2em 1em 0.5em">一级</label>
                                <select name="categorygoryLevel1" id="one">
                                    <option selected>请选择</option>
                                    <c:forEach items="${category}" var="item">
                                        <option value="${item.id}">${item.name}</option>
                                    </c:forEach>
                                </select>

                                <label for="two" style="margin: 1.6em 0.2em 1em 0.5em">二级</label>
                                <select name="categorygoryLevel2" id="two">
                                    <option selected>请选择</option>

                                </select>

                                <label for="three" style="margin: 1.6em 0.2em 1em 0.5em">三级</label>
                                <select name="categorygoryLevel3" id="three">
                                    <option selected>请选择</option>

                                </select>


                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="sign-up1">
                            <h4>商品名称 :</h4>
                        </div>
                        <div class="sign-up2">

                            <input type="text" name="name"
                                   placeholder="请输入商品名称15字以内" required>

                        </div>
                        <div class="clearfix"></div>

                        <div class="sign-up1">
                            <h4>商品描述 :</h4>
                        </div>
                        <div class="sign-up2">
                            <input type="text" name="description"
                                   placeholder="请输入商品描述15字以内" required>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="sign-u">
                        <div class="sign-up1">
                            <h4>价格 :</h4>
                        </div>
                        <div class="sign-up2">

                            <input type="text" name="price"
                                   required>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="sign-u">
                        <div class="sign-up1">
                            <h4>库存 :</h4>
                        </div>
                        <div class="sign-up2">

                            <input type="number" name="stock" required>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="sign-u">
                        <div class="sign-up1">
                            <h4>商品主图 :</h4>
                        </div>
                        <div class="sign-up2">

                            <input type="file" name="fileName" required>

                        </div>
                        <div class="clearfix"></div>
                    </div>

                    <div class="sub_home">

                        <input type="submit" value="确定">
                        <input type="reset" value="重置">

                        <div class="clearfix"></div>
                    </div>


                </form>
            </div>
        </div>
    </div>


    <!-- main content start-->
    <!--footer-->
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

<script src="../js/classie.js"></script>
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
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(function () {
        /*  var $two=$("#two").val();
        var $three=$("$three").val();*/

        var $one=$("#one").empty().append("<option >请选择</option>");
            $.ajax({
                url:"${pageContext.request.contextPath}/category?action=getlevelParentId&parentId=0",
                type:"POST",
                success:function (data) {

                    $(data).each(function (index,item) {
                        $one.append($("<option value='"+item.id+"'>"+item.name+"</option>"))
                    })


                },
                dataType:"json"
            })
        })

    $(function () {
            /*  var $two=$("#two").val();
            var $three=$("$three").val();*/
            //获取二级分类
            $("#one").change(function () {
                var $two=$("#two").empty().append("<option >请选择</option>");
                var $three=$("#three").empty().append("<option >请选择</option>");
                var $one=$("#one").val();
                if($one==null){
                    return;
                }

                $.ajax({
                    url:"${pageContext.request.contextPath}/category?action=getlevelParentId&parentId="+$one,
                    type:"POST",
                    success:function (data) {

                        $(data).each(function (index,item) {
                            $two.append($("<option value='"+item.id+"'>"+item.name+"</option>"))
                        })


                    },
                    dataType:"json"
                })
            })
    })
    $(function () {
        $("#two").change(function () {
            var $three=$("#three").empty().append("<option >请选择</option>");
            var $two=$("#two").val();
            if($two==null){
                return;
            }

            $.ajax({
                url:"${pageContext.request.contextPath}/category?action=getlevelParentId&parentId="+$two,
                type:"POST",
                success:function (data) {

                    $(data).each(function (index,item) {
                        $three.append($("<option value='"+item.id+"'>"+item.name+"</option>"))
                    })


                },
                dataType:"json"
            })
        })
    })


    $(function(){
        $.validator.addMethod(
            "Fclass", function (value, element, param) {
                return value!="请选择";
            });
        $.validator.addMethod(
            "Fprice", function (value, element, param) {
                var reg=new RegExp(/^\d+\.?\d{0,2}$/)
                return reg.test(value);
            });
        $("#tab").validate({

            //验证规则
            rules: {
                categorygoryLevel1 : {
                    required: true,
                    Fclass:true
                },
                categorygoryLevel2 : {
                    required: true,
                    Fclass:true
                },
                categorygoryLevel3 : {
                    required: true,
                    Fclass:true
                },
                name: {
                    required: true,
                    minlength: 3,
                    maxlength:15
                },
                description:{
                    required: true,
                    minlength: 3,
                    maxlength:15
                },
                price: {
                    required: true,
                    Fprice:true
                },
                stock: {
                    required: true
                },
                fileName:{
                    required:true
                }
            },//rules end
            //不符合验证规则的提示信息
            messages: {
                categorygoryLevel1: {
                    required : "请选择二级分类",
                    Fclass: "请选择二级分类"
                },
                categorygoryLevel2: {
                    required : "请选择二级分类",
                    Fclass: "请选择二级分类"
                },
                categorygoryLevel3: {
                    required : "请选择三级分类",
                    Fclass: "请选择三级分类"
                },
                name: {
                    required: "请输入宝贝标题",
                    minlength: "长度不能小于3位",
                    maxlength: "长度不能大于15位"
                },
                description: {
                    required: "请输入宝贝描述",
                    minlength: "长度不能小于3位",
                    maxlength: "长度不能大于15位"
                },
                price: {
                    required: "请输入宝贝售价",
                    Fprice: "价格不合法"
                },
                stock: {
                    required: "请输入宝贝库存"
                },
                fileName:{
                    required: "请上传宝贝主图"
                }
            },//messages end
            onfocusout: function (element) {
                $(element).valid();
            }

        });
    });
</script>
</body>
</html>