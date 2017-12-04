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
    <!--//Metis Menu -->
</head>

<body class="cbp-spmenu-push">
<jsp:include page="../nav.jsp"/>

<!--left-fixed -navigation-->
<!-- header-starts -->
<!-- //header-ends -->
<jsp:include page="../header.jsp"/>
<div id="page-wrapper">
    <div class="main-page signup-page">
        <h3 class="title1">用户登录 </h3>
        <div class="sign-up-row widget-shadow">
            <form class="form-horizontal" id="tab" method="post" action="${pageContext.request.contextPath}/user?action=login">


                <div class="sign-u">
                    <div class="sign-up1">
                        <h4>用户名 :</h4>
                    </div>
                    <div class="sign-up2">

                        <input type="text" name="userName"
                               placeholder="请输入用户名" required>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="sign-u">
                    <div class="sign-up1">
                        <h4>登录密码 :</h4>
                    </div>
                    <div class="sign-up2">

                        <input type="password" id="pwd" name="password" required>

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

<script src="../js/jquery-1.11.1.min.js"></script>
<script type="application/x-javascript"> addEventListener("load", function () {
    setTimeout(hideURLbar, 0);
}, false);

function hideURLbar() {
    window.scrollTo(0, 1);
} </script>

<script src="../js/modernizr.custom.js"></script>
<link href="../css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="../js/wow.min.js"></script>
<script>
    new WOW().init();
</script>
<!--//end-animate-->
<!-- Metis Menu -->
<script src="../js/metisMenu.min.js"></script>
<script src="../js/custom.js"></script>
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
<script src="../js/jquery.nicescroll.js"></script>
<script src="../js/scripts.js"></script>
<!--//scrolling js-->
<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.js"></script>
<script src="../js/jquery.validate.min.js"></script>
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
                        window.location.href = "usersList.jsp"
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
                    window.location.href = "usersList.jsp"
                }
                $("#deluserid").val("");
            });
        })


    })

</script>
</body>
</html>