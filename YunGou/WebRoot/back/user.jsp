<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Bootstrap Admin</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
    <link rel="shortcut icon" type="image/x-icon" href="img/icon/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/home.css">

    <script src="lib/jquery-1.8.1.min.js" type="text/javascript"></script>

    <!-- Demo page code -->

    <style type="text/css">
        #line-chart {
            height: 300px;
            width: 800px;
            margin: 0px auto;
            margin-top: 1em;
        }

        .brand {
            font-family: georgia, serif;
        }

        .brand .first {
            color: #ccc;
            font-style: italic;
        }

        .brand .second {
            color: #fff;
            font-weight: bold;
        }

        input[type=radio] {
            display: inline-block;
            height: 20px;
            margin-left: 60px;
            margin-bottom: 10px;
            font-size: 14px;
            line-height: 20px;
            color: #555555;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
</head>

<!--[if lt IE 7 ]>
<body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]>
<body class="ie ie7"> <![endif]-->
<!--[if IE 8 ]>
<body class="ie ie8"> <![endif]-->
<!--[if IE 9 ]>
<body class="ie ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body>
<!--<![endif]-->

<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <ul class="nav pull-right">

                <li id="fat-menu" class="dropdown">
                    <a href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="icon-user"></i> Jack Smith
                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="dropdown-menu">
                        <li><a tabindex="-1" href="#">Settings</a></li>
                        <li class="divider"></li>
                        <li><a tabindex="-1" href="sign-in.jsp">Logout</a></li>
                    </ul>
                </li>

            </ul>
            <a class="brand" href="index.jsp"><span class="first">Your</span> <span class="second">Company</span></a>
        </div>
    </div>
</div>


<div class="container-fluid">

    <div class="row-fluid">
        <div class="span3">
            <div class="sidebar-nav">
                <div class="nav-header" data-toggle="collapse" data-target="#dashboard-menu"><i
                        class="icon-dashboard"></i>Dashboard
                </div>
                <ul id="dashboard-menu" class="nav nav-list collapse in">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="users.jsp">Sample List</a></li>
                    <li class="active"><a href="user.jsp">Sample Item</a></li>
                    <li><a href="gallery.jsp">Gallery</a></li>
                    <li><a href="calendar.jsp">Calendar</a></li>
                    <li><a href="faq.jsp">Faq</a></li>
                    <li><a href="help.jsp">Help</a></li>

                </ul>
                <div class="nav-header" data-toggle="collapse" data-target="#accounts-menu"><i
                        class="icon-briefcase"></i>Account<span class="label label-info">+10</span></div>
                <ul id="accounts-menu" class="nav nav-list collapse in">
                    <li><a href="sign-in.jsp">Sign In</a></li>
                    <li><a href="sign-up.jsp">Sign Up</a></li>
                    <li><a href="reset-password.jsp">Reset Password</a></li>
                </ul>

                <div class="nav-header" data-toggle="collapse" data-target="#settings-menu"><i
                        class="icon-exclamation-sign"></i>Error Pages
                </div>
                <ul id="settings-menu" class="nav nav-list collapse in">
                    <li><a href="403.jsp">403 page</a></li>
                    <li><a href="404.jsp">404 page</a></li>
                    <li><a href="500.jsp">500 page</a></li>
                    <li><a href="503.jsp">503 page</a></li>
                </ul>

                <div class="nav-header" data-toggle="collapse" data-target="#legal-menu"><i class="icon-legal"></i>Legal
                </div>
                <ul id="legal-menu" class="nav nav-list collapse in">
                    <li><a href="privacy-policy.jsp">Privacy Policy</a></li>
                    <li><a href="terms-and-conditions.jsp">Terms and Conditions</a></li>
                </ul>
            </div>
        </div>
        <div class="span9">
            <h1 class="page-title">Edit User</h1>
            <div class="btn-toolbar">
                <button class="btn btn-primary" id="save"><i class="icon-save"></i> Save</button>
                <a href="#myModal" data-toggle="modal" class="btn">Delete</a>
                <div class="btn-group">
                </div>
            </div>
            <div class="well">
                <ul class="nav nav-tabs">

                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <form id="tab" method="post" action="../EasyBuyUser?action=add">
                            <label>类型</label>
                            <input type="radio" name="type" value="1" class="input-xlarge">普通用户 <input type="radio"
                                                                                                       name="type"
                                                                                                       value="2"
                                                                                                       class="input-xlarge"
                                                                                                       checked="checked">管理员
                            <label>用户名</label>
                            <input type="text" name="loginName" placeholder="jsmith" class="input-xlarge">
                            <label>姓名</label>
                            <input type="text" name="userName" placeholder="John" class="input-xlarge">
                            <label>密码</label>
                            <input type="text" name="password" placeholder="Smith" class="input-xlarge">
                            <label>性别</label>
                            <input type="radio" name="sex1" value="1" class="input-xlarge" checked="checked">男 <input
                                type="radio" name="sex1" value="0" class="input-xlarge">女
                            <%--<input type="text" name="sex" value="jsmith@yourcompany.com" class="input-xlarge">--%>
                            <label>身份证号</label>
                            <input type="text" name="identityCode" placeholder="413722192103254671"
                                   class="input-xlarge">
                            <label>邮箱</label>
                            <input type="text" name="email" placeholder="jsmith@yourcompany.com" class="input-xlarge">
                            <label>电话号码</label>
                            <input type="text" name="phone" placeholder="18401468727" class="input-xlarge">


                        </form>
                    </div>
                    <div class="tab-pane fade" id="profile">
                        <form id="tab2">
                            <label>New Password</label>
                            <input type="password" class="input-xlarge">
                            <div>
                                <button class="btn btn-primary">Update</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>

            <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">Delete Confirmation</h3>
                </div>
                <div class="modal-body">

                    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete
                        the user?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                    <button class="btn btn-danger" data-dismiss="modal" onclick="javascript:delete();">Delete</button>
                </div>
            </div>

        </div>
    </div>
</div>

<footer>
    <hr>

    <p class="pull-right">Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>


    <p>&copy; 2012 <a href="#">Portnine</a></p>
</footer>


<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript">


    var flag = false;





    $(function () {
        $.validator.addMethod(
            "Vphone", function (value, element, param) {


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
                                return $("[name=loginName]").val();
                            },
                            action: "findByLoginName"
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
                email: {
                    required: true,
                    email: true
                },
                phone: {
                    required: true,
                    Vphone: $("[name=phone]").val()

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
                phone: {
                    required: "请输入手机号",
                    Vphone: "电话号码格式不正确"
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


