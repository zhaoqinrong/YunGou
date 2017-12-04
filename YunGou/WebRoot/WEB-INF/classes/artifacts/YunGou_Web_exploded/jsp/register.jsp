<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus®">
	<meta name="Author" content="">
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta name="renderer" content="webkit">
	<title>登录.云购物商城</title>
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/img/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/base.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/home.css">
</head>
<body>
<header id="pc-header">
	<div class="center">
		<div class="pc-fl-logo">
			<h1>
				<a href="index.jsp"></a>
			</h1>
		</div>
	</div>
</header>
<section>
	<div class="pc-login-bj">
		<div class="center clearfix">
			<div class="fl"></div>
			<div class="fr pc-login-box">
				<div class="pc-login-title"><h2>用户注册</h2></div>
				<form action="user?action=regist" id="myForm" method="post">
					<div class="pc-sign">
						<input name="loginName" placeholder="用户名" style="display: block">

					</div>
					<div class="pc-sign">
						<input name="email" placeholder="邮箱"style="display: block">
					</div>
					<div class="pc-sign">
						<input name="mobile" placeholder="手机号" style="display: block">
					</div>
					<div class="pc-sign">
						<input name="password" type="password" id="pwd" placeholder="请输入您的密码" style="display: block">
					</div>
					<div class="pc-sign">
						<input name="reppassword" type="password" placeholder="请确认您的密码" style="display: block">
					</div>
					<div>
						<input type="checkbox" name="context">点击表示您同意商城《服务协议》
					</div>
					<div class="pc-submit-ss">
                        <input type="text" value="1" name="type" style="display: none">
						<input type="submit" value="立即注册">
					</div>
					<div class="pc-item-san clearfix">
						<a href="#"><img src="${pageContext.request.contextPath}/static/img/icon/weixin.png" alt="">微信登录</a>
						<a href="#"><img src="${pageContext.request.contextPath}/static/img/icon/weibo.png" alt="">微博登录</a>
						<a href="#" style="margin-right:0"><${pageContext.request.contextPath}/static/img src="img/icon/tengxun.png" alt="">QQ登录</a>
					</div>
					<div class="pc-reg">
						<a href="user?action=loginUI" class="red">已有账号 请登录</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<footer>
	<div class="center">
		<div class="pc-footer-login">
			<p>关于我们 招聘信息 联系我们 商家入驻 商家后台 商家社区 ©2017 Yungouwu.com 北京云购物网络有限公司</p>
			<p style="color:#999">营业执照注册号：990106000129004 | 网络文化经营许可证：北网文（2016）0349-219号 | 增值电信业务经营许可证：京2-20110349 | 安全责任书 | 京公网安备 99010602002329号 </p>
		</div>
	</div>
</footer>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/register.js"></script>
    <script type="text/javascript">
//ajax验证用户名是否已被注册
   /*     $(function(){
            $("[name=userName]").change(function(){
                //清空提示信息,以免其他验证受影响
                $("#userName").html("");
                //获取用户名
               var username= $("[name=userName]").val();
               //验证用户名的长度.用户名长度小于6时交给validate验证,长度符合才查询数据库做验证
                if(username.length>=6){
                    $("#userName-error").html("");
                    var xhr=null;
                    var sendDate=$("[name=userName]").val();
                    if(window.XMLHttpRequest){
                        xhr=new XMLHttpRequest();
                    }else{
                        xhr=new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    xhr.open("get","EasyBuyUser?action=findByLoginName&userName="+sendDate,true);
                    xhr.onreadystatechange=function(){
                        if (xhr.readyState==4&&xhr.status==200){
                            var data=xhr.responseText;
                            if(data=="false"){
                                $("#userName").html("用户名已被注册");
                            }else{
                                $("#userName").html("用户名可以注册");
                            }
                        }
                    }
                    xhr.send(null);
                }

            })
        })*/


var flag = false;


$(function () {
    $.validator.addMethod(
        "Vmobile", function (value, element, param) {


            var regExp = new RegExp(/^1[3|5|6|8][0-9]{9}$/);

            return regExp.test(value);
        });

    flag = $("#myForm").validate({

        //验证规则
        rules: {
            loginName: {
                required: true,
                minlength: 6,
                /*向后台发送ajax请求验证姓名是否被使用*/
                remote: {
                    type: "post",
                    url: "user",//servlet的url
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



	</script>


</body>
</html>