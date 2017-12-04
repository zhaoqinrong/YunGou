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
    <link href="../css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <!-- Custom CSS -->
    <link href="../css/style.css" rel='stylesheet' type='text/css'/>
    <!-- font CSS -->
    <!-- font-awesome icons -->
    <link href="../css/font-awesome.css" rel="stylesheet">

    <!-- //font-awesome icons -->
    <!-- js-->

    <!--webfonts-->
    <link href='https://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic'
          rel='stylesheet' type='text/css'>
    <!--//webfonts-->
    <!--animate-->

    <link href="../css/custom.css" rel="stylesheet">
    <style type="text/css">
        .error {
            color: red;
            font-weight: normal;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
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
            <h3 class="title1">添加用户 </h3>
            <p class="creating">请认真填写信息</p>
            <div class="sign-up-row widget-shadow">
                <form class="form-horizontal" id="tab" method="post" action="${pageContext.request.contextPath}/user?action=regist">
                    <h5>个人信息 :</h5>


                    <div class="sign-u">
                        <div class="sign-up1">
                            <h4>真实姓名 :</h4>
                        </div>
                        <div class="sign-up2">

                                <input type="text" name="userName"
                                       placeholder="请输入真实姓名" required>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="sign-u">
                        <div class="sign-up1">
                            <h4>性别 :</h4>
                        </div>
                        <div class="sign-up2">
                            <label>
                                <input type="radio"  name="sex1"
                                       value="1"  checked required>
                                男
                            </label>
                            <label>
                                <input type="radio"  value="0"
                                       name="sex1" required>
                                女
                            </label>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="sign-u">
                        <div class="sign-up1">
                            <h4>身份证号 :</h4>
                        </div>
                        <div class="sign-up2">

                            <input type="text" name="identityCode"
                                   placeholder="请输入身份证号" required>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="sign-u">
                        <div class="sign-up1">
                            <h4>电子邮箱 :</h4>
                        </div>
                        <div class="sign-up2">

                            <input type="text" name="email"
                                   placeholder="请输入电子邮箱" required>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="sign-u">
                        <div class="sign-up1">
                            <h4>电话号码 :</h4>
                        </div>
                        <div class="sign-up2">

                            <input type="text" name="mobile"
                                   placeholder="请输入电话号码" required>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <h6>登录信息 :</h6>
                    <%--用户类型--%>
                    <div class="sign-u ">
                        <div class="sign-up1">
                            <h4>用户类型:</h4>
                        </div>
                        <div class="sign-up2">
                            <label>
                                <input type="radio" name="type" value="1" checked required>
                                普通用户
                            </label>
                            <label>
                                <input type="radio" name="type" value="2" checked required>
                                管理员
                            </label>
                        </div>
                    </div>
                    <%--用户信息--%>
                    <div class="sign-u">
                        <div class="sign-up1">
                            <h4>用户昵称 :</h4>
                        </div>
                        <div class="sign-up2">

                            <input  type="text" name="loginName" required>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <%--登录密码--%>

                    <div class="sign-u">
                        <div class="sign-up1">
                            <h4>登录密码 :</h4>
                        </div>
                        <div class="sign-up2">

                            <input  type="password" id="pwd" name="password" required>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <%--确认密码--%>
                    <div class="sign-u">
                        <div class="sign-up1">
                            <h4>确认密码 :</h4>
                        </div>
                        <div class="sign-up2">

                            <input type="password" name="reppassword" placeholder="请再次输入密码" required>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="sub_home">

                        <input type="submit" value="确定">
                        <input type="reset"   value="重置">

                        <div class="clearfix"></div>
                    </div>


                </form>
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
                                <td><input type="text" name="loginName" placeholder="请输入用户名" class="input-xlarge"></td>
                            </tr>
                            <tr>
                                <td><label>姓名</label></td>
                                <td><input type="text" name="userName" placeholder="请输入真实姓名" class="input-xlarge"></td>
                            </tr>
                            <tr>
                                <td><label>性别</label></td>
                                <td><input type="radio" name="sex1" value="1" class="input-xlarge mail"
                                           checked="checked">男
                                    <input type="radio" name="sex1" value="0" class="input-xlarge fmail">女
                                </td>
                            </tr>
                            <tr>
                                <td><label>身份证号</label></td>
                                <td><input type="text" name="identityCode" placeholder="请输入身份证号"
                                           class="input-xlarge"></td>
                            </tr>
                            <tr>
                                <td><label>邮箱</label></td>
                                <td><input type="text" name="email" placeholder="请输入邮箱" class="input-xlarge"></td>
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
                                                                                        title="模板之家">模板之家</a> - Collect
                from
                <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
        </div>
        <!--//footer-->
    </div>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    }
    </script>

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
    <script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
    <script type="text/javascript">


        var flag = false;


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
                            url: "${pageContext.request.contextPath}/user",//servlet的url
                            data: {//发送的数据
                                loginName: function () {
                                    return $("[name=loginName]").val();
                                },
                                action: "valida"
                            },
                            dataType: "html",
                            dataFilter: function (data, type) {//只能返回true,false

                                if (data == "true") {
                                    return true;
                                }
                                return false;

                            }


                        }
                    },
                    userName:{
                        required:true
                    },
                    identityCode:{
                      required:true
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
                    userName:{
                        required:"请输入真实姓名"
                    },
                    identityCode:{
                      required:"请输入身份证号"
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
        $("#save").click(function () {

            if (flag) {
                $("#tab").submit();
            }

        })

    </script>
</body>
</html>