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
                            <form class="form-inline" action="${pageContext.request.contextPath}/product?action=getProductBy" method="post">
                                <div class="form-group"><label for="one">一级分类</label>
                                    <select name="one" id="one">
                                        <option selected>请选择</option>
                                        <c:forEach items="${category}" var="item" >
                                            <option value="${item.id}">${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group"><label for="two">二级分类</label>
                                    <select name="" id="two">
                                        <option selected>请选择</option>

                                    </select>
                                </div>
                                <div class="form-group"><label for="three">三级分类</label>
                                    <select name="" id="three">
                                        <option selected>请选择</option>

                                    </select>
                                </div>
                                <div class="form-group"><label for="serach">关键字</label>
                                    <input type="serach" id="serach" name="serach">
                                </div>
                                <button type="button" class="btn btn-default">搜索</button>
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
                        <c:if test="${not empty products}">
                            <c:forEach varStatus="item" var="product" items="${products.list}">
                                <tr>
                                    <th scope="row">${item.index}</th>
                                    <td>${product.id}</td>
                                    <td>${product.name}</td>
                                    <td>${product.price}</td>
                                    <td>${product.stock}</td>
                                    <c:if test="${product.isDelete==0}">
                                        <td>出售中</td>
                                    </c:if>
                                    <c:if test="${product.isDelete !=0}">
                                        <td>已删除</td>
                                    </c:if>

                                    <td>
                                        <a href="${pageContext.request.contextPath}/news?action=getNewsBuyId&id=${newsPage.id}" role="button" data-toggle="modal" ><i class=" glyphicon glyphicon-eye-open" ></i></a>
                                        <a href="#myModal1" role="button" data-toggle="modal"><i class="glyphicon glyphicon-pencil"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>




                        </tbody>
                    </table>
                    <nav class="col-md-offset-4">
                        <ul class="pagination pagination-lg">
                            <c:if test="${products.currPage==1}">
                                <li class="disabled"><a href="javascript:void(0);" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                            </c:if>
                            <c:if test="${products.currPage !=1}">
                                <li ><a href="${pageContext.request.contextPath}/product?action=getAllByPage&currPage=${products.currPage-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                            </c:if>
                            <c:forEach begin="1" end="${products.pages}" var="page">
                                <c:if test="${products.currPage==page}">
                                    <li class="active"><a href="${pageContext.request.contextPath}/product?action=getAllByPage&currPage=${page}">${page}</a></li>
                                </c:if>
                                <c:if test="${products.currPage !=page}">
                                    <li><a href="${pageContext.request.contextPath}/product?action=getAllByPage&currPage=${page}">${page}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${products.currPage== products.pages}">
                                <li class="disabled"><a href="javascript:void(0)" aria-label="Previous"><span aria-hidden="true">»</span></a></li>
                            </c:if>
                            <c:if test="${products.currPage != products.pages}">
                                <li ><a href="${pageContext.request.contextPath}/product?action=getAllByPage&currPage=${products.currPage+1}" aria-label="Previous"><span aria-hidden="true">»</span></a></li>
                            </c:if>
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

    )
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
</script>
</body>
</html>