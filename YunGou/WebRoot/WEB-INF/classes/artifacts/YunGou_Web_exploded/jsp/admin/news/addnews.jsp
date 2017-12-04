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
            <div class="forms">
                <h3 class="title1">新闻</h3>
                <div class="form-grids row widget-shadow" data-example-id="basic-forms">
                    <div class="form-title">
                        <h4>添加新闻 :</h4>
                    </div>
                    <div class="form-body">
                        <form action="${pageContext.request.contextPath}/news?action=addnews" method="post" enctype="multipart/form-data">

                            <div class="form-group">
                                <input type="text" class="form-control " name="title" placeholder="新闻标题" required>
                            </div>
                            <div  class="form-group">
                                <select name="classid" >
                                    <c:forEach items="${newsClass}" var="newclass" >
                                        <option value="${newclass.cid}">${newclass.className}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <textarea name="content"  cols="100%" rows="10" placeholder="新闻内容" required></textarea>
                            </div>

                            <div class="form-group"><label for="exampleInputFile">File input</label>
                                <input type="file" name="img" id="exampleInputFile">
                                <p class="help-block">Example block-level help text here.</p></div>
                            <div class="checkbox"><label> <input type="checkbox"> Check me out </label></div>
                            <button type="submit" class="btn btn-default">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">是否删除用户</h4>
            </div>
            <div class="modal-body">
                <div class="row-info">
                    <div class="col-md-6  col-md-offset-4">是否想要删除用户?</div>
                </div>
                <div class="row">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <input type="hidden" id="deluserid">
                <button type="button" class="btn btn-primary" id="sure2">确认</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="" id="exampleModalLabel">修改用户信息</h4>
            </div>
            <form id="tab" method="post" onsubmit="return false" action="##">
                <div class="modal-body">
                    <style>
                        td {
                            line-height: 22px;
                            padding-bottom: 13px;
                            padding-right: 5px;
                        }

                        tr {

                        }
                    </style>

                    <table class="col-md-offset-4">
                        <tr>
                            <td colspan="2"><input type="hidden" name="id"></td>
                        </tr>
                        <tr>
                            <td><label>类型</label></td>
                            <td>
                                <input type="radio" name="type" value="1" class="input-xlarge " id="pu">普通用户
                                <input type="radio" name="type" value="2" class="input-xlarge " id="vip"
                                       checked="checked">管理员
                            </td>
                        </tr>
                        <tr>
                            <td><label>用户名</label></td>
                            <td><input type="text" name="loginName" placeholder="jsmith" class="input-xlarge"></td>
                        </tr>
                        <tr>
                            <td><label>姓名</label></td>
                            <td><input type="text" name="userName" placeholder="John" class="input-xlarge"></td>
                        </tr>
                        <tr>
                            <td><label>性别</label></td>
                            <td><input type="radio" name="sex1" value="1" class="input-xlarge mail" checked="checked">男
                                <input type="radio" name="sex1" value="0" class="input-xlarge fmail">女
                            </td>
                        </tr>
                        <tr>
                            <td><label>身份证号</label></td>
                            <td><input type="text" name="identityCode" placeholder="413722192103254671"
                                       class="input-xlarge"></td>
                        </tr>
                        <tr>
                            <td><label>邮箱</label></td>
                            <td><input type="text" name="email" placeholder="jsmith@yourcompany.com"
                                       class="input-xlarge"></td>
                        </tr>
                        <tr>
                            <td><label>电话号码</label></td>
                            <td><input type="text" name="mobile" placeholder="18401468727" class="input-xlarge"></td>
                        </tr>
                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary" id="sure1" onclick="modify()">确认修改</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- main content start-->
<!--footer-->
<div class="footer">
    <p>Copyright &copy; 2016.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/"
                                                                                target="_blank"
                                                                                title="模板之家">模板之家</a> - Collect from
        <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
</div>
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
<script src="../js/scripts.js"></script>
<!--//scrolling js-->
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/jsp/admin/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/jsp/admin/js/jquery.validate.min.js"></script>
<script type="text/javascript">

    /* $(window).beforeunload(function () {
           window.location.href="../EasyBuyUser?action=gtAllUser";

       })*/
    /*修改用户信息*/


    function modify() {

        if (flag.form()) {
            $.post("../EasyBuyUser?action=modify",
                {
                    "userid": $("input[name=id]").val(),
                    "type": $("input[name=type]").val(),
                    "loginName": $("input[name=loginName]").val(),
                    "userName": $("input[name=userName]").val(),
                    "sex1": $("input[name=sex1]").val(),
                    "identityCode": $("input[name=identityCode]").val(),
                    "email": $("input[name=email]").val(),
                    "mobile": $("input[name=mobile]").val(),

                },
                function (data) {
                    if (data == "true") {
                        window.location.href = "../user/usersList.jsp"
                    }
                }
            )
        }

    }

    /*模态窗口获取数据*/
    $("a[href=#myModal1]").click(function () {
        //获取用户id
        var id = $(this).parents("tr").children("td[name=id]").html()
        $("input[name=id]").val(id);

        //获取用户类型
        var type = $(this).parents("tr").children("td[name=type]").html()


        if (type == 2) {
            $("#pu").removeAttr("checked");
            $("#vip").attr("checked", "checked");


        } else {
            $("#pu").attr("checked", "checked");
            $("#vip").removeAttr("checked");


        }

        //获取姓名
        var userName = $(this).parents("tr").children("td[name=userName]").html()
        $("input[name=userName]").val(userName);
        //获取用户名
        var loginName = $(this).parents("tr").children("td[name=loginName]").html()
        $("input[name=loginName]").val(loginName);
        //获取性别
        var sex = $(this).parents("tr").children("td[name=sex]").html()

        if (sex == 1) {
            $(".fmail").attr("checked", "checked");
            $(".mail").removeAttr("checked");
        } else {

            $(".fmail").removeAttr("checked");
            $(".mail").attr("checked", "checked");
        }
//            身份证号
        var identityCode = $(this).parents("tr").children("td[name=identityCode]").html();
        $("input[name=identityCode]").val(identityCode);
        //邮箱
        var email = $(this).parents("tr").children("td[name=email]").html()
        $("input[name=email]").val(email);
        //电话号码
        var mobile = $(this).parents("tr").children("td[name=mobile]").html()
        $("input[name=mobile]").val(mobile);


    })
    /*对模态窗口中的数据进行验证*/
    $(function () {
        $.validator.addMethod(
            "Vmobile", function (value, element, param) {


                var regExp = new RegExp(/^1[3|5|6|8][0-9]{9}$/);

                return regExp.test(value);
            });

        flag = $("#tab").validate({

            //验证规则
            rules: {
                loginName: {
                    required: true,
                    minlength: 6,
                    /*向后台发送ajax请求验证姓名是否被使用*/
                    remote: {
                        type: "post",
                        url: "../EasyBuyUser",//servlet的url
                        data: {//发送的数据
                            loginName: function () {
                                return $("input[name=loginName]").val();

                            },
                            userid: function () {
                                return $("input[name=id]").val()
                            },
                            action: "valida"
                        },
                        dataType: "html",
                        dataFilter: function (data, type) {//只能返回true,false

                            if (data == "true") {
//                                history.go(0);

                                return true;
                            }
                            return false;

                        }


                    }
                },
                email: {
                    required: true,
                    email: true
                },
                mobile: {
                    required: true,
                    Vmobile: $("[name=mobile]").val()

                },
                password: {
                    required: true,
                    minlength: 6,
                    maxlength: 10
                },
                reppassword: {
                    required: true,
                    minlength: 6,
                    maxlength: 10,
                    equalTo: "#pwd"
                },
                context: {
                    required: true
                }
            },//rules end
            //不符合验证规则的提示信息
            messages: {
                loginName: {
                    required: "请输入用户名",
                    minlength: "长度不能小于6位",
                    remote: "用户名已被注册"
                },
                password: {
                    required: "请输入密码",
                    minlength: "长度不能小于6位",
                    maxlength: "长度不能大于10位"
                },
                reppassword: {
                    required: "请再次输入密码",
                    minlength: "长度不能小于6位",
                    maxlength: "长度不能大于10位",
                    equalTo: "两次密码输入不一致"
                },
                email: {
                    required: "请输入邮箱",
                    email: "邮箱格式不正确"
                },
                mobile: {
                    required: "请输入手机号",
                    Vmobile: "电话号码格式不正确"
                },
                context: {
                    required: "您没有同意此协议"
                }
            },//messages end
            onfocusout: function (element) {
                $(element).valid();
            }

        });
    });

    //进行修改后用户提交的操作
    $("#tab").submit(function () {
//        提交成功后加这个属性data-dismiss="modal"
//       $("#sure1").attr("data-dismiss","modal");
    })

    //进行删除用户操作
    $(function () {
        $("a[href=#myModal]").click(function () {

            var userId = $(this).parents("tr").children("td[name=id]").html()
            /*被删除的用户id*/


            $("#deluserid").val(userId);

        })
        $("#sure2").click(function () {
            var userid = $("#deluserid").val();

            $.get("${pageContext.request.contextPath}/EasyBuyUser?action=delById&userid=" + userid, function (data) {
                if (data == "true") {
//                    history.go(0);
                    window.location.href = "../user/usersList.jsp"
                }
                $("#deluserid").val("");
            });
        })


    })

</script>
</body>
</html>