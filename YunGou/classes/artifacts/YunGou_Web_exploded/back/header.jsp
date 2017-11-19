<%--
  User: 赵钦荣
  Date: 2017/11/17 20:59
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>header-nav</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
</head>
<body>
<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <ul class="nav pull-right">

                <li id="fat-menu" class="dropdown">
                    <a href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="icon-user"></i>${user.loginName}
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

</body>
</html>
