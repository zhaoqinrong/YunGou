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
    <c:forEach items="${clist}" var="cate" varStatus="item" >
        <c:if test="${item.index<7}">



        </c:if>
    </c:forEach>
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
                        $("#menuId").append($("<li><a href='' target='_blank'>"+this.name+" </a></li>"));
                    }

                })
            },
            dataType:"json"
        })
    })

</script>

</body>
</html>
