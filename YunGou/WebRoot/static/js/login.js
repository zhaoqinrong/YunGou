$(function(){


    $("#myForm").validate({
        //验证规则
        rules:{
            userName:{
                required:true,
                minlength:6

            },

            password:{
                required:true,
                minlength:6,
                maxlength:10
            }

        },//rules end
        //不符合验证规则的提示信息
        messages: {
            userName: {
                required: "请输入用户名",
                minlength:"长度不能小于6位",

            },
            password:{
                required:"请输入密码",
                minlength:"长度不能小于6位",
                maxlength:"长度不能大于10位"
            }
        },//messages end
        onfocusout:function(element){
            $(element).valid();
        }
    });
});