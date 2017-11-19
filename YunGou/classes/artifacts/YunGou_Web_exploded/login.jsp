<%@ page import="cn.yungou.user.servlet.EasyBuyUserControllerWay"%>
<%@ page import="cn.yungou.commons.entity.EasybuyUser"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<%
	String path = request.getContextPath();
%>

<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<meta name="renderer" content="webkit">
<title>登录.云购物商城</title>
<link rel="shortcut icon" type="image/x-icon"
	href="img/icon/favicon.ico">
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
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
					<div class="pc-login-title">
						<h2>用户登录</h2>
						<%
							String username = null;
							String password = null;
							Cookie[] cookies = request.getCookies();
							for (Cookie cookie : cookies) {
								
								if ("username".equals(cookie.getName())) {
									username = cookie.getValue();
								}
								if ("password".equals(cookie.getName())) {
									password = cookie.getValue();
								}
							}
							request.setAttribute("username", username);
							request.setAttribute("password", password);
						%>
				
					</div>
					<form action="EasyBuyUser" id="myForm" method="post">
						<div class="pc-sign">
							<input type="text" name="loginName" placeholder="用户名"
								value="${username}" style="display: block">
                            <input type="hidden" name="action" value="login" >
							<div id="user_prompt"></div>
						</div>
						<div class="pc-sign">
							<input type="password" name="password" placeholder="请输入您的密码"
								value="${password}" style="display: block">
							<div id="pass_prompt"></div>
						</div>
						<div>
							<input type="checkbox" name="cookie" value="y">&nbsp;&nbsp;记住密码
						</div>
                        <div>

                            <div id="captcha2">
                                <p id="wait2" class="show">正在加载验证码......</p>
                            </div>
                        </div>
						<div class="pc-submit-ss" style="margin: 10px 0px">
							<input type="submit"id="submit2" value="登录" placeholder="">
						</div>

						<div class="pc-item-san clearfix">
							<a href="https://wx.qq.com/"><img src="img/icon/weixin.png"
								alt="">微信登录</a> <a href="https://weibo.com/"><img
								src="img/icon/weibo.png" alt="">微博登录</a> <a
								href="http://w.qq.com/" style="margin-right:0"><img
								src="img/icon/tengxun.png" alt="">QQ登录</a>
						</div>
						<div class="pc-reg">
							<a href="#">忘记密码</a> <a href="register.jsp" class="red">免费注册</a>
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
				<p style="color:#999">营业执照注册号：990106000129004 |
					网络文化经营许可证：北网文（2016）0349-219号 | 增值电信业务经营许可证：京2-20110349 | 安全责任书 |
					京公网安备 99010602002329号</p>
			</div>
		</div>
	</footer>
	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="../../js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/login.js"></script>
    <script src="js/gt.js"></script>
    <script src="js/loginValidate.js"></script>

</body>
</html>