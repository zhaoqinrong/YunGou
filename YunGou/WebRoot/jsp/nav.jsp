<%--
  User: 赵钦荣
  Date: 2017/11/27 20:17
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #viewWords{
            width: 70%;
            height:150%;
            background-color: white;
            border: 1px solid red;

            position: absolute;
            top:55px;

            padding: 6px;
            z-index: 999;
        }
        #viewWords>p>a{
            line-height: 20px;
            color: black;
        }
    </style>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<body>
</div>
<ul class="yMenuIndex" id="menuId">
    <li><a href="${pageContext.request.contextPath}/index" target="_blank" >首页</a></li>
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
    $("#key").keyup(function () {
        $("#viewWords").show()
        var $val= $(this).val();
        $.ajax({
            url:"${pageContext.request.contextPath}/product",
            data:{
                "action":"search",
                "words":$val
            },
            type:"post",
            success:function(data){
                $("#viewWords").empty();
                $(data).each(function () {
                    $("#viewWords").append( "<a href='${pageContext.request.contextPath}/product?action=getProductByName&words="+this+"' ><p>"+this+"</p></a>");
                })

            },
            dataType:"json"
        })
    })

    $("#viewWords").mouseleave(function(){
        $("#viewWords").hide();
    })
</script>

</body>
</html>
