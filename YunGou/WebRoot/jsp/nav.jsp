<%--
  User: 赵钦荣
  Date: 2017/11/27 20:17
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<body>
</div>
<ul class="yMenuIndex" id="menuId">
    <li><a href="" target="_blank" >首页</a></li>
</ul>
</div>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/category?action=findAllCategory&parentId=0",
            type:"GET",
            success:function (data) {

                $(data).each(function (index) {
                    if(index<7){
                        $("#menuId").append($("<li><a href='${pageContext.request.contextPath}/product?action=getProBycate1&id="+this.id+"' target='_blank'>"+this.name+" </a></li>"));
                    }

                })
            },
            dataType:"json"
        })
    })

</script>

</body>
</html>
